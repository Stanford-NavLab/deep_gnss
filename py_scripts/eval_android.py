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
from correction_network.android_dataset import Android_GNSS_Dataset, expected_measurements
from tqdm import tqdm
from correction_network.networks import Net_Snapshot

weight_dict = {
    '15': "android_transformer_1000ep_2021-08-25_16-53-59",
    '30': "android_transformer_1000ep_pos30_2021-08-28_11-23-06",
}

key_wt = 15   # initialization range (from training) to use

config = {
    "root": os.path.join(data_directory),
    "raw_data_dir" : "val",
    "data_dir": "android_val_processed",
    "guess_range": [key_wt, key_wt, key_wt, 1e-5, 1e-5, 1e-5, 1e-5, 1e-5],
    "history": 1,
    "seed": 1,
    "chunk_size": 100,
    "max_sats": 13,
    "max_open_files": 10,
    "bias_fname": 0,
    "baselines": "baselines"
}

dataset = Android_GNSS_Dataset(config)

net = Net_Snapshot(dataset[0]['features'].size()[1], 1, len(dataset[0]['true_correction']))
net.load_state_dict(torch.load(os.path.join(data_directory, 'weights', weight_dict[str(key_wt)])))
net.cuda()

# Create empty dicts and lists
ls_rand = {}
ls_wls1 = {}

ls_rand_net = {}
ls_wls1_net = {}

y_ls = []
y_hat_ls = []
y_wls_ls = []

ls_gt = {}
ls_gt_corr = {}

# val_idx_list = [2888, 2988]
val_idx_list = [1, 100]
for b_t_sel in range(len(val_idx_list)-1):
    b_t_idx = val_idx_list[b_t_sel]
    b_key, t_idx = dataset.indices[b_t_idx]
    key_file, times = dataset.get_files(b_key)
    f1, f2 = dataset.meas_file_paths[b_key].split("/")[-3:-1]
    dirname = os.path.join(config["root"], config["baselines"], f1, "output", f2)
    all_data = key_file[key_file['millisSinceGpsEpoch']==times[t_idx]]
    _gt_data = all_data.iloc[0]
    true_XYZb = np.array([_gt_data['ecefX'], _gt_data['ecefY'], _gt_data['ecefZ'], _gt_data['b']])
    base_frame = coord.LocalCoord.from_ecef(true_XYZb[:3])

    in1 = pd.read_csv(os.path.join(dirname, 'goGPS_WLS.csv'))
    b_key = b_key[0]

    print(b_key, b_t_idx)

    for _ in tqdm(range(val_idx_list[b_t_sel], val_idx_list[b_t_sel+1])):
        key, t_idx = dataset.indices[b_t_idx]
        key_file, times = dataset.get_files(key)
        all_data = key_file[key_file['millisSinceGpsEpoch']==times[t_idx]]
        _gt_data = all_data.iloc[0]
        true_XYZb = np.array([_gt_data['ecefX'], _gt_data['ecefY'], _gt_data['ecefZ'], _gt_data['b']])
        times = (times/1000).astype(np.int32)
        if not b_key == key[0]:
            break
        f1, f2 = dataset.meas_file_paths[key].split("/")[-3:-1]
        dirname = os.path.join(config["root"], config["baselines"], f1, "output", f2)

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

    #     WLS1
        _int1 = in1[in1['GPS Time[s]']==times[t_idx]]
        _ecef1 = np.array([_int1['ECEF X[m]'].to_numpy()[0], _int1['ECEF Y[m]'].to_numpy()[0], _int1['ECEF Z[m]'].to_numpy()[0], _int1['Clock Bias[s]'].to_numpy()[0]*3e8])
        ls_wls1[times[t_idx]] = _ecef1[:3]
        y_wls_ls.append(ref_local.ecef2ned(_ecef1[:3, None])[:, 0])

        ls_gt[times[t_idx]] = true_XYZb[:3]


        b_t_idx += 1

y_diff = (np.array(y_ls) - np.squeeze(np.array(y_hat_ls), axis=1))
y_og = np.array(y_ls)
y_wls = np.array(y_ls) - np.array(y_wls_ls)

print("Mean positioning error along NED in initial positions (m): ", np.mean(np.abs(y_og), axis=0))
print("Mean positioning error along NED in DNN corrected positions (m): ", np.mean(np.abs(y_diff), axis=0))
print("Mean positioning error along NED in WLS positions (m): ", np.nanmean(np.abs(y_wls), axis=0))
