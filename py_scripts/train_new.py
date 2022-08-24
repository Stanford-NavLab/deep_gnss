########################################################################
# Author(s):    Shubh Gupta, Ashwin Kanhere
# Date:         22 August 2022
# Desc:         Train a DNN to output position corrections for Android
#               measurements
########################################################################
import sys, os, csv, datetime
from typing import Dict
parent_directory = os.path.split(os.getcwd())[0]
src_directory = os.path.join(parent_directory, 'src')
data_directory = os.path.join('/scratch/groups/gracegao', 'Google_GNSS_data')
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

import xarray as xr

import gnss_lib.coordinates as coord
import gnss_lib.sim_gnss as sg 
import gnss_lib.read_nmea as nmea
import gnss_lib.utils as utils 
import gnss_lib.solve_pos as solve_pos

from gnss_lib.constants import gpsconsts
from gnss_lib.coordinates import ecef2geodetic

from utils import *

from dataset.sim_dataset_seq import Sim_GNSS_Dataset_Seq as GNSS_Dataset_Seq
from correction_network.set_transformer_reduction import *
from correction_network.architectures import *

def test_eval(test_num, history, val_loader, net, loss_func):
    # VALIDATION EVALUATION
    stats_val = []
    loss_val = 0
    time_window = history + 1
    generator = iter(val_loader)
    for i in range(test_num):
        try:
            sample_batched = next(generator)
        except StopIteration:
            generator = iter(val_loader)
            sample_batched = next(generator)
        _sample_batched, pad_mask = sample_batched
        x = _sample_batched['sv_features'].float().cuda()
        y = _sample_batched['true_corrections'].float().cuda()
        dxt_feat = _sample_batched['pose_features'].float().cuda()
        mask_times = _sample_batched['mask_times'].cuda()
        pad_mask = pad_mask.cuda()
        pred_correction = net(x, dxt_feat, pad_mask=pad_mask, mask_times=mask_times)
        pred_correction = pred_correction.detach().cpu()
        y = y.detach().cpu()
#         for t in range(time_window):
#             if mask_times[0, t]:
#                 out_pred[t].append(pred_correction[0, :, t])
#                 out_true[t].append(y[0, :, t])
        loss = loss_func(pred_correction, y)
        stats_val.append((y-pred_correction).cpu().detach().numpy())
        loss_val += (loss * torch.unsqueeze(mask_times.float(), 1)).sum()
    return np.squeeze(np.mean(np.abs(np.array(stats_val)), axis=0)), loss_val/test_num


@hydra.main(config_path="../config", config_name="train_new")
def main(config: DictConfig) -> None:
    data_config = {
    "root": os.path.join(data_directory, config.data_dir),
    "measurement_dir" : "",
    # "initialization_dir" : "initialization_data",
    # "info_path": "data_info.csv",
    "max_open_files": config.max_open_files,
    "guess_range": [config.guess_pos]*4 + [config.guess_vel]*4, #TODO: Generalize to better cases
    "history": config.history,
    "seed": config.seed,
    "max_sats": config.max_sats,
    }
    
    print('Initializing datasets')
    
    dataset = GNSS_Dataset_Seq(data_config)


    train_set, val_set = torch.utils.data.random_split(dataset, [int(config.frac*len(dataset)), len(dataset) - int(config.frac*len(dataset))])
    dataloader = DataLoader(train_set, batch_size=config.batch_size,
                            shuffle=True, num_workers=config.num_workers, collate_fn=collate_feat_sequential)
    val_loader = DataLoader(val_set, batch_size=1, 
                            shuffle=False, num_workers=config.num_workers, collate_fn=collate_feat_sequential)
    
    ################### Initializing network #############################
    print(f'Initializing network: {config.model_type} with embedding {config.embedding}')
    
    if config.embedding=="FCN":
        embedding = FullyConnectedNetwork(dim_input=4, max_sats=config.max_sats, dim_output=16, batch_first=True)
    elif config.embedding=="HDWLS":
        embedding = LearnedWLSEmbeddings(output_dim=16, batch_first=True, output_residual=False)
    elif config.embedding=="set_transformer":
        embedding = SetTransformerPointOutput(4, 4, 16, batch_first=True)
    else:
        raise ValueError('This embedding network is not supported yet!')
        
    if config.model_type=="RNN":
        net = LearnedEmbeddingsRNN(embedding, batch_first=True, time_last=True)
    elif config.model_type=="snapshot":
        net = LearnedEmbeddingsSnapshot(embedding, batch_first=True, time_last=True)
    else:
        raise ValueError('This network is not supported yet!')
        
    
    if not config.resume==0:
        net.load_state_dict(torch.load(os.path.join(data_directory, 'weights', config.resume)))
        print("Resumed: ", config.resume)
    
    net.cuda()
    
    ################### Initializing optimizer and saving names #############################
    print("Initializing optimizer and Tensorboard writer")
    optimizer = torch.optim.Adam(net.parameters(), config.learning_rate)
    loss_func = torch.nn.MSELoss()
    count = 0
    fname = config.prefix + '_' + config.embedding + "_" + config.model_type + "_"+ datetime.now().strftime('%Y-%m-%d_%H-%M-%S')
    if config.writer:
        writer = SummaryWriter(os.path.join(data_directory, 'runs', fname))

    print("Beginning training")
    min_acc = 1000000
    for epoch in range(config.N_train_epochs):
    # TRAIN Phase
        net.train()
        for i, sample_batched in tqdm(enumerate(dataloader)):
            _sample_batched, pad_mask = sample_batched

    #         x = _sample_batched['sv_features'][:, :, 0, :].float().cuda()
    #         y = _sample_batched['true_corrections'][:, :, 0].float().cuda()

            x = _sample_batched['sv_features'].float().cuda()    # (B, SVs, timesteps, feat_dim)
            y = _sample_batched['true_corrections'].float().cuda()       # (B, output_dim, timesteps)
            dxt_feat = _sample_batched['pose_features'].float().cuda()    # (B, guess_pose_feat_dim, timesteps)
            mask_times = _sample_batched['mask_times'].cuda()    # (B, timesteps)

    #         pad_mask = pad_mask[:, :, 0].cuda()
            pad_mask = pad_mask.cuda()   # (B, SVs, timesteps)
            pred_correction = net(x, dxt_feat, pad_mask=pad_mask, mask_times=mask_times)    # (B, output_dim, timesteps)
            loss = loss_func(pred_correction, y)
            loss = (loss * torch.unsqueeze(mask_times.float(), 1)).sum()
#             loss_arr.append(loss.item())
            #TODO: Look into integrating xarray here, if needed
            
            if config.writer:
                writer.add_scalar("Loss/train", loss, count)
                
            count += 1

            optimizer.zero_grad()   # clear gradients for next train
            loss.backward()         # backpropagation, compute gradients
            optimizer.step()        # apply gradients
        # TEST Phase
        net.eval()
        mean_acc, test_loss = test_eval(config.N_test_batches, config.history, val_loader, net, loss_func)
        if config.writer:
            writer.add_scalar("Loss/test", test_loss, epoch)
        for j in range(np.shape(mean_acc)[0]):
            if config.writer:
                writer.add_scalar("Metrics/Acc_"+str(j), np.mean(mean_acc[j, :]), epoch)
        if np.sum(mean_acc) < min_acc:
            min_acc = np.sum(mean_acc)
            checkpoint = {
                            'embedding': net.embedding.state_dict(),
                            'lstm': net.lstm.state_dict(),
                            'fc': net.fc.state_dict(),
                            'fc_dxt': net.fc_dxt.state_dict(),
                            'net': net.state_dict(),
                            'optimizer': optimizer.state_dict(),
                        }

            torch.save(checkpoint, os.path.join(data_directory, 'weights', fname))
        print("Training done for epoch ", epoch)

if __name__=="__main__":
    main()