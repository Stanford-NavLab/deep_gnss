########################################################################
# Author(s):    Shubh Gupta, Ashwin Kanhere
# Date:         21 September 2021
# Desc:         Train a DNN to output position corrections for simulated
#               measurements
########################################################################
import sys, os, csv, datetime
from typing import Dict
parent_directory = os.path.split(os.getcwd())[0]
src_directory = os.path.join(parent_directory, 'src')
data_directory = os.path.join(parent_directory, 'data')
ephemeris_data_directory = os.path.join(data_directory, 'ephemeris')
sys.path.insert(0, src_directory)
from mpl_toolkits.mplot3d import Axes3D
from sklearn.preprocessing import StandardScaler
import matplotlib.pyplot as plt # plotting
import numpy as np # linear algebra
import pandas as pd # data processing, CSV file I/O (e.g. pd.read_csv)
import torch
from torch.utils.data import DataLoader
import torch.nn.functional as F
import torch.nn as nn
from tqdm import tqdm
from torch.utils.tensorboard import SummaryWriter
import hydra
from omegaconf import DictConfig, OmegaConf

import gnss_lib.coordinates as coord
import gnss_lib.read_nmea as nmea
import gnss_lib.utils as utils 
import gnss_lib.solve_pos as solve_pos
from correction_network.dataset import Sim_GNSS_Dataset_Snap as Sim_GNSS_Dataset

from correction_network.networks import Net_Snapshot, DeepSetModel


def collate_feat(batch):
    sorted_batch = sorted(batch, key=lambda x: x['features'].shape[0], reverse=True)
    features = [x['features'] for x in sorted_batch]
    features_padded = torch.nn.utils.rnn.pad_sequence(features)
    L, N, dim = features_padded.size()
    pad_mask = np.zeros((N, L))
    for i, x in enumerate(features):
        pad_mask[i, len(x):] = 1 #TODO: Change len(x) to last non-zero entry
    pad_mask = torch.Tensor(pad_mask).bool()
    correction = torch.Tensor([x['true_correction'] for x in sorted_batch])
    guess = torch.Tensor([x['guess'] for x in sorted_batch])
    retval = {
            'features': features_padded,
            'true_correction': correction,
            'guess': guess
        }
    return retval, pad_mask

def test_eval(val_loader, net, loss_func):
    # VALIDATION EVALUATION
    stats_val = []
    loss_val = 0
    generator = iter(val_loader)
    for i in tqdm(range(100), desc='test', leave=False):
        try:
            sample_batched = next(generator)
        except StopIteration:
            generator = iter(val_loader)
            sample_batched = next(generator)
        _sample_batched, pad_mask = sample_batched
    #         feat_pack = torch.nn.utils.rnn.pack_padded_sequence(_sample_batched['features'], x_lengths)
        x = _sample_batched['features'].float().cuda()
        y = _sample_batched['true_correction'].float().cuda()
        pad_mask = pad_mask.cuda()
        pred_correction = net(x, pad_mask=pad_mask)
        loss = loss_func(pred_correction, y)
        loss_val += loss
        stats_val.append((y-pred_correction).cpu().detach().numpy())
    return np.mean(np.abs(np.array(stats_val)), axis=0), loss_val/len(stats_val)

@hydra.main(config_path="../config", config_name="train_conf")
def main(config: DictConfig) -> None:
    # TODO: Use config for data_config with same parameters
    data_config = {
    "root": os.path.join(data_directory, config.data_path),
    "measurement_dir" : "gnss_measurements",
    # "initialization_dir" : "initialization_data",
    "use_biases": config.use_biases,
    "max_open_files": 32,
    "guess_range": [config.pos_range_xy, config.pos_range_xy, config.pos_range_z, config.clk_range, config.vel_range_xy, config.vel_range_xy, config.vel_range_z, config.clkd_range],
    "use_biases": config.use_biases
    }

    dataset = Sim_GNSS_Dataset(data_config)


    train_set, val_set = torch.utils.data.random_split(dataset, [int(config.frac*len(dataset)), len(dataset) - int(config.frac*len(dataset))])
    dataloader = DataLoader(train_set, batch_size=config.batch_size,
                            shuffle=True, num_workers=config.num_workers, collate_fn=collate_feat)
    val_loader = DataLoader(val_set, batch_size=1, 
                            shuffle=False, num_workers=0, collate_fn=collate_feat)

    print('Initializing network: ', config.model_name)
    if config.model_name == "set_transformer":
        net = Net_Snapshot(train_set[0]['features'].size()[1], 1, len(train_set[0]['true_correction']))     # define the network
    elif config.model_name == "deepsets":
        net = DeepSetModel(train_set[0]['features'].size()[1], len(train_set[0]['true_correction']))
    else:
        raise ValueError('This model is not supported yet!')
    net.cuda()

    optimizer = torch.optim.Adam(net.parameters(), config.learning_rate)
    loss_func = torch.nn.MSELoss()
    count = 0
    fname = config.prefix + datetime.datetime.now().strftime('%Y-%m-%d_%H-%M-%S')
    writer = SummaryWriter(os.path.join(data_directory, 'runs', fname))


    min_acc = 1000000
    for epoch in range(config.N_train_epochs):
        # TRAIN Phase
        net.train()
        for i, sample_batched in enumerate(dataloader):
            _sample_batched, pad_mask = sample_batched
            
            x = _sample_batched['features'].float().cuda()
            y = _sample_batched['true_correction'].float().cuda()
            pad_mask = pad_mask.cuda()
            pred_correction = net(x, pad_mask=pad_mask)
            loss = loss_func(pred_correction, y)

            writer.add_scalar("Loss/train", loss, count)
                
            count += 1    
            
            optimizer.zero_grad()   # clear gradients for next train
            loss.backward()         # backpropagation, compute gradients
            optimizer.step()        # apply gradients
        # TEST Phase
        net.eval()
        mean_acc, test_loss = test_eval(val_loader, net, loss_func)
        writer.add_scalar("Loss/test", test_loss, epoch)
        for j in range(len(mean_acc[0])):
            writer.add_scalar("Metrics/Acc_"+str(j), mean_acc[0, j], epoch)
        if np.sum(mean_acc) < min_acc:
            min_acc = np.sum(mean_acc)
            torch.save(net.state_dict(), os.path.join(data_directory, 'weights', fname))
        print('Training done for ', epoch)

if __name__=="__main__":
    main()
