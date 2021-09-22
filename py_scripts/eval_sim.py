########################################################################
# Author(s):    Shubh Gupta
# Date:         22 September 2021
# Desc:         Evaluate DNN to output position corrections for simulated
#               measurements
########################################################################
import sys, os, csv, datetime
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
import gnss_lib.coordinates as coord
import gnss_lib.read_nmea as nmea
import gnss_lib.utils as utils 
import torch
from torch.utils.data import DataLoader
import torch.nn.functional as F
import torch.nn as nn
import scipy.stats as st
import gnss_lib.solve_pos as solve_pos
from gnss_lib.utils import datetime_to_tow
from correction_network.dataset import Sim_GNSS_Dataset_Snap as Sim_GNSS_Dataset
from tqdm import tqdm
from correction_network.networks import Net_Snapshot

weight_dict = {
    '15': "sim_transformer_15m_bias2021-09-15_14-45-40",
    '30': "sim_transformer_30m_bias2021-09-15_14-53-18",
}

key_wt = 15   # initialization range (from training) to use

config = {
    "root": os.path.join(data_directory, "matlab_simulated"),
    "measurement_dir" : "gnss_measurements",
    "guess_range": [key_wt, key_wt, key_wt, 1e-5, 1e-5, 1e-5, 1e-5, 1e-5],
    "max_open_files": 10,
    "use_biases": 0
}

dataset = Sim_GNSS_Dataset(config)

net = Net_Snapshot(dataset[0]['features'].size()[1], 1, len(dataset[0]['true_correction']))
net.load_state_dict(torch.load(os.path.join(data_directory, 'weights', weight_dict[str(key_wt)])))
net.cuda()

# Create empty dicts and lists
ls_rand = {}

ls_rand_net = {}

y_ls = []
y_hat_ls = []

ls_gt = {}
ls_gt_corr = {}

val_idx_list = [0, 99]
for b_t_sel in range(len(val_idx_list)-1):
    b_t_idx = val_idx_list[b_t_sel]
    b_key, seed_idx, timestep = dataset.indices[b_t_idx]
    seed_file, times = dataset.get_files(b_key, seed_idx)
    data = seed_file[seed_file['t_idx']==times[timestep]]
    gpsweek, tow = datetime_to_tow(pd.to_datetime(times[timestep]))
    ephem = data.set_index('sv')
    _gt_data = data.iloc[0]
    true_XYZb = np.array([_gt_data['Rxx'], _gt_data['Rxy'], _gt_data['Rxz'], _gt_data['b']])
    base_frame = coord.LocalCoord.from_ecef(true_XYZb[:3])

    print(b_key, b_t_idx)

    for _ in tqdm(range(val_idx_list[b_t_sel], val_idx_list[b_t_sel+1])):
        key, seed_idx, t_idx = dataset.indices[b_t_idx]
        seed_file, times = dataset.get_files(key, seed_idx)
        data = seed_file[seed_file['t_idx']==times[t_idx]]
        gpsweek, tow = datetime_to_tow(pd.to_datetime(times[timestep]))
        ephem = data.set_index('sv')
        _gt_data = data.iloc[0]
        true_XYZb = np.array([_gt_data['Rxx'], _gt_data['Rxy'], _gt_data['Rxz'], _gt_data['b']])
        if not b_key == key:
            break
       
        #     RANDOM
        _data = dataset.__getitem__(b_t_idx)
        _ecef0 = _data['guess']
        ref_local = coord.LocalCoord.from_ecef(_ecef0[:3])
        ls_rand[times[t_idx]] = _ecef0[:3]
        x = _data['features'].float().cuda()
        y = _data['true_correction']
        _y = net(x.unsqueeze(1)).cpu().detach().numpy()
        _ecef_net_rand = ref_local.ned2ecef(_y[0, :])[:, 0]
        ls_rand_net[times[t_idx]] = _ecef_net_rand
        ls_gt_corr[times[t_idx]] = ref_local.ned2ecef(y)[:, 0]
        y_ls.append(y)
        y_hat_ls.append(_y)

        ls_gt[times[t_idx]] = true_XYZb[:3]


        b_t_idx += 1

y_diff = (np.array(y_ls) - np.squeeze(np.array(y_hat_ls), axis=1))
y_og = np.array(y_ls)

print("Mean positioning error along NED in initial positions (m): ", np.mean(np.abs(y_og), axis=0))
print("Mean positioning error std along NED in initial positions (m): ", np.std(np.abs(y_og), axis=0))
print("Mean positioning error along NED in DNN corrected positions (m): ", np.mean(np.abs(y_diff), axis=0))
print("Mean positioning error std along NED in DNN corrected positions (m): ", np.std(np.abs(y_diff), axis=0))
