import sys, os, csv
import matplotlib.pyplot as plt # plotting
import numpy as np # linear algebra
import pandas as pd # data processing, CSV file I/O (e.g. pd.read_csv)
import torch
from torch.utils.data import Dataset, DataLoader
import torch.nn.functional as F
import random
from numpy.random import default_rng

from gnss_lib.sim_gnss import expected_measures_minimal
from gnss_lib.utils import datetime_to_tow 
from gnss_lib import coordinates as coord
from utils import *

import xarray as xr

class Sim_GNSS_Dataset_Seq(Dataset):
    def __init__(self, config, transforms=None, verbose=False):
        #TODO: Add a limit on how many trajectories to use, if training on a subset of data is desired
        #TODO: Integrate window of past measurements 
        self.root = config['root']
        data_dir = config['measurement_dir']
        # init_dir = config['initialization_dir']
        # info_path = config['info_path']
        self.max_open_files = config['max_open_files'] #cache size
        self.guess_range = config['guess_range']
        self.history = config['history'] # Number of past measurements for current estimation
        self.rng = default_rng()
        self.transform = transforms
        self.max_sats = 0
        self.sv_feature_dim = 4
        
        file_paths, indices = parse_filepaths_batched(os.path.join(self.root, data_dir), verbose=verbose)
        
        self.file_paths = file_paths
        
        self.N_total = int((~file_paths.isnull()).sum())
        
        self.indices = indices
        
        
    def __len__(self):
        return int(self.N_total)
    
    # Caching for efficiency
    def get_data(self, traj_idx, chunk_idx, seed_idx, t_idx):
        # Cache based manager of data files
        if not hasattr(self, 'cache_data'):
            self.cache_data = dict()
        key = hash((traj_idx, chunk_idx, seed_idx, t_idx))
        # Load Trajectory file
        if key in self.cache_data.keys():
            data = self.cache_data[key]
        else:
            filepath = self.file_paths.loc[traj_idx, chunk_idx, seed_idx, t_idx]
            data = pd.read_hdf(filepath.item(), 'new_data')
            
            if len(self.cache_data) >= self.max_open_files:
                pop_key = list(self.cache_data.keys())[0]
                self.cache_data.pop(pop_key)
            self.cache_data[key] = data
        
        return data
    
    def __getitem__(self, idx):
        traj_idx, chunk_idx, seed_idx, t_idx = self.indices[idx]
        
        data = self.get_data(traj_idx, chunk_idx, seed_idx, t_idx)

        sv_features, guess_XYZb_base, ref_local_base, true_delta, tow_base = self.process_sample(data)
        
        all_sv_features = [sv_features]
        pose_delta = np.zeros(5 + 3*2)
        pose_delta[5] = 1.0
        pose_delta[9] = 1.0
        all_pose_features = [pose_delta]
        all_true_deltas = [true_delta[:4]]
        all_guess_pose = [guess_XYZb_base[:4]]
        all_lengths = [len(sv_features)]
        all_mask_time = [True]
        
        for timestep in range(t_idx-1, t_idx - self.history-1, -1):
            if timestep<0:
                sv_features = np.zeros((1, self.sv_feature_dim))
                guess_XYZb = np.zeros(8)
                ref_local = None
                pose_delta = np.zeros(5 + 3*2)
                true_delta = np.zeros(8)
                length = 0
                mask_time = False
            else:
                data = self.get_data(traj_idx, chunk_idx, seed_idx, timestep)

                sv_features, guess_XYZb, ref_local, true_delta, tow = self.process_sample(data)
                pose_delta = np.zeros(5 + 3*2)
                
                # Relative pose in the original NED frame
                pose_delta[:3] = (guess_XYZb[:3] - guess_XYZb_base[:3]) @ ref_local_base.ned2ecef_matrix
                pose_delta[3] = guess_XYZb[3] - guess_XYZb_base[3]
                
                # Relative time from original frame
                pose_delta[4] = tow - tow_base
                
                # Relative rotation between the frames
                A0_A1 = ref_local_base.ned2ecef_matrix.T @ ref_local.ned2ecef_matrix
                pose_delta[5:8] = A0_A1[:, 0]
                pose_delta[8:11] = A0_A1[:, 1]
                
                length = len(sv_features)
                mask_time = True
                
            all_sv_features.append(sv_features)
            all_pose_features.append(pose_delta)
            all_true_deltas.append(true_delta[:4])
            all_guess_pose.append(guess_XYZb[:4])
            all_lengths.append(length)
            all_mask_time.append(mask_time)
            
        samples = {
            'sv_features': all_sv_features,
            'true_corrections': all_true_deltas,
            'guesses': all_guess_pose,
            'pose_features': all_pose_features,
            'length': all_lengths,
            'mask_times': all_mask_time
            }
        
        samples = {key: [torch.tensor(a) for a in samples[key]] for key in samples}
        
        if self.transform is not None:
            samples = self.transform(samples)
        
        return samples
    
    def process_sample(self, data):
        _data0 = data.iloc[0]
        gpsweek, tow = datetime_to_tow(pd.to_datetime(_data0['timestamp']))
        
        true_XYZb = np.array([_data0['gt_x'], _data0['gt_y'], _data0['gt_z'], _data0['gt_b'], _data0['gt_vx'], _data0['gt_vy'], _data0['gt_vz'], _data0['gt_vb']])
        
        guess_XYZb = add_noise(true_XYZb, self.guess_range, self.rng, ntype='uniform')
        
        ref_local, guess_NEDb, true_NEDb = data_ecef2ned(guess_XYZb, true_XYZb)
        
        satXYZ = data[['sv_x', 'sv_y', 'sv_z']].to_numpy()
        satV = data[['sv_vx', 'sv_vy', 'sv_vz']].to_numpy()
        prange_corr = data['prange_corr'].to_numpy()
        
        expected_prange, expected_doppler = expected_measures_minimal(guess_XYZb[:3], guess_XYZb[3], guess_XYZb[7], guess_XYZb[4:7], satXYZ, satV, prange_corr)
        
        prange = data['prange'].to_numpy()
        doppler = data['doppler'].to_numpy()
        
        features = res_los_features(prange, expected_prange, satXYZ, guess_XYZb, ref_local)
        
        return features, guess_XYZb, ref_local, true_NEDb - guess_NEDb, tow
        
        
