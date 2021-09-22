########################################################################
# Author(s):    Shubh Gupta, Ashwin Kanhere
# Date:         21 September 2021
# Desc:         Create PyTorch DataLoader for simulated measurements
########################################################################
import sys, os, csv
import matplotlib.pyplot as plt # plotting
import numpy as np # linear algebra
import pandas as pd # data processing, CSV file I/O (e.g. pd.read_csv)
import torch
from torch.utils.data import Dataset, DataLoader
import torch.nn.functional as F
import random
from numpy.random import default_rng

from gnss_lib.sim_gnss import expected_measures
from gnss_lib.utils import datetime_to_tow 
from gnss_lib import coordinates as coord

def load_datasets(config, transforms=None):
    # Different kinds of simulated datasets each of which has its own folder
    # Dataset loader to handle differnt folders. For a heirarchy where we have different files with different entries (different measurement and ephemeris files I think)
    root = config['root']
    dirs = [os.path.join(root, name) for name in os.listdir(root)]
    random.shuffle(dirs)
    for new_root in dirs:
        _conf = config.copy()
        _conf['root'] = new_root
        yield Sim_GNSS_Dataset(_conf)
        
def list_datasets(config, transforms=None):
    # Same as the previous but with files
    root = config['root']
    dirs = [os.path.join(root, name) for name in os.listdir(root)]
    ret = []
    for new_root in dirs:
        _conf = config.copy()
        _conf['root'] = new_root
        ret.append(Sim_GNSS_Dataset(_conf))
    return ret

class Sim_GNSS_Dataset_Snap(Dataset):
    def __init__(self, config, transforms=None):
        self.root = config['root']
        data_dir = config['measurement_dir']
        # init_dir = config['initialization_dir']
        # info_path = config['info_path']
        self.max_open_files = config['max_open_files'] #cache size
        self.guess_range = config['guess_range']
        self.transform = transforms
        # Save number of entries in each file
        # self.info = pd.read_csv(os.path.join(self.root, info_path))
        # self.timestep_counts = {row['id'] : row['len'] for row in self.info.iterrows()}
        self.timestep_counts = {}
        self.use_biases = bool(config['use_biases'])
        
        # Save file paths
        file_paths = {}
        seed_values = {}
        for file_path in os.listdir(os.path.join(self.root, data_dir)):
            tmp_name = os.path.split(file_path)[1].split(".")[0]
            traj_id, seed_id = tmp_name.split("_")
            traj_id = int(traj_id)
            if traj_id not in file_paths.keys():
                file_paths[traj_id] = []
                seed_values[traj_id] = []
            file_paths[traj_id].append(os.path.join(self.root, data_dir, file_path))    # Done this way to add paths from multiple directories later
            seed_values[traj_id].append(int(seed_id))
            data = pd.read_csv(os.path.join(self.root, data_dir, file_path))
            self.timestep_counts[traj_id] = len(data['t_idx'].unique())
        self.meas_file_paths = file_paths
        self.seed_values = seed_values

        # file_paths = {key : [] for key in self.meas_file_paths.keys()}
        # for file_path in os.listdir(os.path.join(self.root, init_dir)):
        #     tmp_idx = os.path.split(file_path).split(".")[0]
        #     traj_id, seed_id = tmp_idx.split("_")
        #     traj_id = int(traj_id)
        #     file_paths[traj_id].append(file_path)    # Done this way to add paths from multiple directories later
        # self.init_file_paths = file_paths
        
        # Save number of seeds for each trajectory
        self.seed_counts = {key : len(value) for (key, value) in self.meas_file_paths.items()}
        self.full_counts = {key: self.seed_counts[key]*self.timestep_counts[key] for key in self.seed_counts.keys()}
        self.N_total = sum(self.full_counts.values())

        # Precompute indices (mapping from index to where that information is stored. index 899 -> file identifiers)
        indices = []
        keyList=sorted(self.full_counts.keys())
        traj_idx = 0
        seed_idx = 0
        timestep = 0
        for i in range(self.N_total):
            key = keyList[traj_idx]
            seed = self.seed_values[key][seed_idx]
            indices.append((key, seed, timestep))
            timestep += 1
            if timestep>=self.timestep_counts[key]:
                timestep = 0
                seed_idx += 1
            if seed_idx >= self.seed_counts[key]:
                seed_idx = 0
                traj_idx += 1 
        self.indices = indices
        
        # Initialize biases
        if self.use_biases:
            self.biases = {}

    def get_files(self, key, seed):
        # Cache based manager of data files
        if not hasattr(self, 'cache_traj'):
            self.cache_traj = dict()
            self.cache_times = dict()
        
        # Load Trajectory file
        seed_hash = str(key)+"_"+str(seed)
        if seed_hash in self.cache_traj.keys():
            seed_file = self.cache_traj[seed_hash]
            times = self.cache_times[seed_hash]
        else:
            seed_file = pd.read_csv(self.meas_file_paths[key][self.seed_values[key].index(seed)])
            times = seed_file['t_idx'].unique()
            if len(self.cache_traj) >= self.max_open_files:
                pop_key = list(self.cache_traj.keys())[0]
                self.cache_traj.pop(pop_key)
                self.cache_times.pop(pop_key)
            self.cache_traj[seed_hash] = seed_file
            self.cache_times[seed_hash] = times
        
        # # Repeat for Seed file
        # seed_hash = str(key)+"_"+str(seed_idx)
        # if seed_hash in self.cache_seed.keys():
        #     seed_file = self.cache_seed[seed_hash]
        # else:
        #     seed_file = pd.read_csv(self.init_file_paths[key][seed_idx])
        #     if len(self.cache_traj) + len(self.cache_seed) >= self.max_open_files:
        #         self.cache_seed.pop(list(self.cache_seed.keys())[0])
        #     self.cache_seed[seed_hash] = seed_file

        return seed_file, times

    def add_guess_noise(self, true_XYZb):
        rng = default_rng()
        guess_noise = np.array([rng.uniform(-self.guess_range[0], self.guess_range[0]), 
                                rng.uniform(-self.guess_range[1], self.guess_range[1]), 
                                rng.uniform(-self.guess_range[2], self.guess_range[2]),   # x, y, z
                                rng.uniform(0, self.guess_range[3]),   # cdt
                                rng.uniform(-self.guess_range[4], self.guess_range[4]), 
                                rng.uniform(-self.guess_range[5], self.guess_range[5]), 
                                rng.uniform(-self.guess_range[6], self.guess_range[6]),    # vx, vy, vz
                                rng.uniform(-self.guess_range[7], self.guess_range[7])  # cdt_dot
                                ])
        return true_XYZb + guess_noise
    
    def __getitem__(self, idx):
        key, seed_idx, timestep = self.indices[idx]
        seed_file, times = self.get_files(key, seed_idx)
        data = seed_file[seed_file['t_idx']==times[timestep]]
        gpsweek, tow = datetime_to_tow(pd.to_datetime(times[timestep]))
        ephem = data.set_index('sv')
        _data0 = data.iloc[0]

        # Select random initialization
        true_XYZb = np.array([_data0['Rxx'], _data0['Rxy'], _data0['Rxz'], _data0['b'], _data0['Rxvx'], _data0['Rxvy'], _data0['Rxvz'], _data0['b_dot']])
        guess_XYZb = self.add_guess_noise(true_XYZb)    # Generate guess by adding noise to groundtruth
#         guess_XYZb = np.copy(true_XYZb)         # 0 noise for debugging 
        
        # Transform to NED frame
        ref_local = coord.LocalCoord.from_ecef(guess_XYZb[:3])
        guess_NEDb = np.copy(guess_XYZb)
        guess_NEDb[:3] = ref_local.ecef2ned(guess_XYZb[:3, None])[:, 0]   # position
        guess_NEDb[4:7] = ref_local.ecef2nedv(guess_XYZb[4:7, None])[:, 0]    # velocity
        
        true_NEDb = np.copy(true_XYZb)
        true_NEDb[:3] = ref_local.ecef2ned(true_XYZb[:3, None])[:, 0]   # position
        true_NEDb[4:7] = ref_local.ecef2nedv(true_XYZb[4:7, None])[:, 0]    # velocity
        
        # Generate expected measures and satellite positions/velocities
        measurements, satXYZV = expected_measures(gpsweek, tow, ephem, guess_XYZb[:3], guess_XYZb[3], guess_XYZb[7], guess_XYZb[4:7])
        
#         print(measurements, satXYZV, ephem)
        
        
        # Primary feature extraction
        residuals = (ephem[['prange', 'doppler']] - measurements).to_numpy()
        los_vector = (satXYZV[['x', 'y', 'z']] - guess_XYZb[:3])
        los_vector = los_vector.div(np.sqrt(np.square(los_vector).sum(axis=1)), axis='rows').to_numpy()
        los_vector = ref_local.ecef2nedv(los_vector)
        
        # vel_sat = (satXYZV[['vx', 'vy', 'vz']]).to_numpy()
        # vel_sat = ref_local.ecef2nedv(vel_sat)/2750.0       # Normalizing sat velocity     
        # vel_veh = np.repeat(guess_XYZb[4:7][None, :], len(vel_sat), axis=0)
        
        # Add biases
        if self.use_biases:
            if idx not in self.biases.keys():
                num_sats = len(residuals)
                num_biased = min(np.random.poisson(1), num_sats)
                sat_indices = np.arange(num_sats)
                np.random.shuffle(sat_indices)
                bias_vec = np.zeros(num_sats)
                for sat_idx in sat_indices[:num_biased]:
                    bias_vec[sat_idx] = np.random.uniform(50, 200)
                self.biases[idx] = bias_vec

            _residuals = residuals[:, 0] + self.biases[idx]
        else:
            _residuals = residuals[:, 0]

        # Replace with some fancier feature extraction or input to permutation invariant layer
        features = np.concatenate((_residuals[:, None], los_vector), axis=1)
        
        sample = {
            'features': torch.Tensor(features),
            'true_correction': (true_NEDb-guess_NEDb)[:3],
            # 'satpos': satXYZV.to_numpy(),
            # 'measurements': measurements.to_numpy(),
            'guess': guess_XYZb
        }

        if self.transform is not None:
            sample = self.transform(sample)

        return sample
        
    def __len__(self):
        return int(self.N_total)