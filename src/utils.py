import sys, os, csv
import matplotlib.pyplot as plt # plotting
import numpy as np # linear algebra
import pandas as pd # data processing, CSV file I/O (e.g. pd.read_csv)
import torch
import torch.nn.functional as F
from tqdm import tqdm
import random
import time
from numpy.random import default_rng
from datetime import datetime, timedelta, timezone

from functools import lru_cache

import gnss_lib.coordinates as coord

import xarray as xr

################################################################################################################################
# Dataset handling
################################################################################################################################

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

def filepath_to_idx(file_path):
    tmp_name = os.path.split(file_path)[1].split(".")[0]

    return tmp_name.split("_")

def create_coords(files, batched=False):
    traj_coord = []
    chunk_coord = []
    seed_coord = []
    if batched:
        time_coord = []

    for file_path in tqdm(files):

        if batched:
            traj_id, chunk_id, seed_id, time_id = filepath_to_idx(file_path)
        else:
            traj_id, chunk_id, seed_id = filepath_to_idx(file_path)

        traj_coord.append(traj_id)
        chunk_coord.append(chunk_id)
        seed_coord.append(seed_id)
        if batched:
            time_coord.append(int(time_id))
    traj_coord = unique_sort(traj_coord)
    chunk_coord = unique_sort(chunk_coord)
    seed_coord = unique_sort(seed_coord)
    if batched:
        time_coord = unique_sort(time_coord)
        return traj_coord, chunk_coord, seed_coord, time_coord

    return traj_coord, chunk_coord, seed_coord

def parse_filepaths(root, verbose=False):
    # Save file paths
    # TODO: Consider removing duplicate temporary variables for smaller storage footprint

    files = np.sort(os.listdir(root))

    if verbose:
        print("Creating coordinates...")

    traj_idx, chunk_idx, seed_idx = create_coords(files)

    file_paths = xr.DataArray(
        data=gen_array((len(traj_idx), len(chunk_idx), len(seed_idx))),
        dims=("traj_idx", "chunk_idx", "seed_idx"),
        coords=dict(
            traj_idx=traj_idx,
            chunk_idx=chunk_idx,
            seed_idx=seed_idx
        )
    )

    if verbose:
        print("Saving filenames...")

    for file_path in tqdm(files):
        traj_id, chunk_id, seed_id = filepath_to_idx(file_path)
        file_paths.loc[traj_id, chunk_id, seed_id] = os.path.join(root, file_path)

    if verbose:
        print("Calculating timecounts and indexing...")

    timestep_counts = xr.DataArray(
        data=np.zeros((len(traj_idx), len(chunk_idx), len(seed_idx))),
        dims=("traj_idx", "chunk_idx", "seed_idx"),
        coords=dict(
            traj_idx=traj_idx,
            chunk_idx=chunk_idx,
            seed_idx=seed_idx
        )
    )

    indices = []

    for file_path in tqdm(files):
        traj_id, chunk_id, seed_id = filepath_to_idx(file_path)

        data = pd.read_csv(os.path.join(root, file_path))

        t_count = data['t_idx'].unique()

        timestep_counts.loc[traj_id, chunk_id, seed_id] = len(t_count)

        new_indices = [(traj_id, chunk_id, seed_id, t) for t in t_count]

        indices.extend(new_indices)

    return file_paths, timestep_counts, indices

def parse_filepaths_batched(root, verbose=False):
    # Save file paths
    # TODO: Consider removing duplicate temporary variables for smaller storage footprint

    files = np.sort(os.listdir(root))

    if verbose:
        print("Creating coordinates...")

    traj_idx, chunk_idx, seed_idx, time_idx = create_coords(files, batched=True)

    file_paths = xr.DataArray(
        data=gen_array((len(traj_idx), len(chunk_idx), len(seed_idx), len(time_idx))),
        dims=("traj_idx", "chunk_idx", "seed_idx", "t"),
        coords=dict(
            traj_idx=traj_idx,
            chunk_idx=chunk_idx,
            seed_idx=seed_idx,
            t=time_idx
        )
    )

    if verbose:
        print("Saving filenames and indexing...")

    indices = []

    for file_path in tqdm(files):
        traj_id, chunk_id, seed_id, time_id = filepath_to_idx(file_path)
        time_id = int(time_id)
        file_paths.loc[traj_id, chunk_id, seed_id, time_id] = os.path.join(root, file_path)
        new_index = (traj_id, chunk_id, seed_id, time_id)

        indices.append(new_index)

    return file_paths, indices

def precache_corrections(file_paths, timestep_counts, indices, func, max_t=100):
    corrected_prange = xr.DataArray(
        data=[[[[None]*max_t]*file_paths.shape[0]]*file_paths.shape[1]]*file_paths.shape[2],
        dims=("t", "traj_idx", "chunk_idx", "seed_idx"),
        coords=dict(
            traj_idx=file_paths.coords['traj_idx'],
            chunk_idx=file_paths.coords['chunk_idx'],
            seed_idx=file_paths.coords['seed_idx'],
            t=np.arange(max_t)
        )
    )
    corrected_satpos = corrected_prange.copy()

    for idx in tqdm(range(len(indices))):
        traj_idx, chunk_idx, seed_idx, timestep = self.indices[idx]
        filepath = file_paths.loc[traj_id, chunk_id, seed_id]
        data = pd.read_csv(filepath)
        _prange, _satpos = func(data, timestep)
        corrected_prange.loc[timestep, traj_idx, chunk_idx, seed_idx] = _prange
        corrected_satpos.loc[timestep, traj_idx, chunk_idx, seed_idx] = _satpos
    return corrected_prange, corrected_satpos


def data_ecef2ned(guess_XYZb, true_XYZb):
    ref_local = coord.LocalCoord.from_ecef(guess_XYZb[:3])
    guess_NEDb = np.copy(guess_XYZb)
    guess_NEDb[:3] = ref_local.ecef2ned(guess_XYZb[:3, None])[:, 0]   # position
    guess_NEDb[4:7] = ref_local.ecef2nedv(guess_XYZb[4:7, None])[:, 0]    # velocity

    true_NEDb = np.copy(true_XYZb)
    true_NEDb[:3] = ref_local.ecef2ned(true_XYZb[:3, None])[:, 0]   # position
    true_NEDb[4:7] = ref_local.ecef2nedv(true_XYZb[4:7, None])[:, 0]    # velocity

    return ref_local, guess_NEDb, true_NEDb

################################################################################################################################
# Collate features
################################################################################################################################

def collate_feat_sequential(batch):
    """
    Order: (batch X sv_dim X time X feat_dim)
    Note: This order ensures correct functioning of `torch.nn.utils.rnn.pad_sequence`, which pads the first or last dimension
    """
    retval = {}
    for key in batch[0]:
        if len(batch[0][key][0].shape) > 0:
            key_data = [torch.nn.utils.rnn.pad_sequence(item[key]) for item in batch]
            key_data = torch.nn.utils.rnn.pad_sequence(key_data, batch_first=True)
        else:    # dim-0 tensor
            key_data = [torch.stack(item[key], dim=0) for item in batch]
            key_data = torch.stack(key_data, dim=0)
        retval[key] = key_data
    pad_mask = torch.zeros(*retval['sv_features'].shape[:-1], dtype=torch.bool)
    for b in range(pad_mask.shape[0]):
        for t in range(pad_mask.shape[2]):
            pad_mask[b, retval['length'][b, t]:, t] = True
    return retval, pad_mask

################################################################################################################################
# Feature design
################################################################################################################################

def res_los_features(prange, expected_prange, satXYZ, guess_XYZb, ref_local):
    residual = prange - expected_prange

    los_vector = (satXYZ - guess_XYZb[None, :3])
    norm = np.fmax(1.0, np.linalg.norm(los_vector, axis=1))
    los_vector = los_vector / norm[:, None]

    los_vector = los_vector @ ref_local.ned2ecef_matrix

    retval = np.zeros((len(residual), 4))
    retval[:, 0] = residual
    retval[:, 1:] = los_vector
    return retval

################################################################################################################################
# Misc
################################################################################################################################

def add_noise(base_value, value_ranges, rng=np.random.default_rng(), ntype='uniform'):
    if ntype=='uniform':
        return base_value + np.array([rng.uniform(-r_val, r_val) for r_val in value_ranges])
    elif ntype=='corner':
        return base_value + np.array([  r_val*rng.choice([-1, 1]) for r_val in value_ranges])
    else:
        return base_value

def initialize_dirs(filepath):
    retval = os.path.exists(filepath)
    if not retval:
        os.mkdir(filepath)
    return retval

def gen_array(shape, item=None):
    retval = np.empty(shape, dtype=type(item))
    retval[...] = item
    return retval

def setup_dir(dirpath, folder_list):
    if not os.path.exists(dirpath):
        raise "Directory does not exist!"

    all_paths = []
    for folder in folder_list:
        tmp_path = os.path.join(dirpath, folder)
        all_paths.append(tmp_path)
        initialize_dirs(tmp_path)
    return all_paths

def sorted_list(dirpath):
    return [os.path.join(dirpath, fpath) for fpath in np.sort(os.listdir(dirpath))]

def unique_sort(obj):
    return np.sort(list(set(obj)))

def series2args(arr, idx_list):
    """
    Convert a pandas series containing numbers to a tuple of arguments based on indices
    """
    ret = []
    for idx in idx_list:
        dim = (1, 1)
        if type(idx)==list:
            if len(idx)==1 and type(idx[0])==list:
                dim = (1, len(idx[0]))
                idx = idx[0]
            else:
                dim = (len(idx), 1)
        val = arr[idx]
        if dim[0] > 1 or dim[1] > 1:
            val = val.to_numpy().astype(np.float64)
            if dim[1] > 1:
                val = np.reshape(val, dim)
        ret.append(val)
    return tuple(ret)

################################################################################################################################
# Android dataset handling
################################################################################################################################


def android_find_gt(gt, gt_time_label, measure_time):
    gt_row = gt[gt_time_label]==measure_time
    gt_slice = gt.loc[gt_row]

    # In case gt_slice is empty, find closest ground truth
    if len(gt_slice)==0:
        low_gt_half = gt.loc[gt[gt_time_label]<=measure_time]
        try:
            low_diff = np.abs(low_gt_half.iloc[-1][gt_time_label] - measure_time)
        except IndexError:
            low_diff = 10000
        high_gt_half = gt.loc[gt[gt_time_label]>=measure_time]
        try:
            high_diff = np.abs(high_gt_half.iloc[0][gt_time_label] - measure_time)
        except IndexError:
            high_diff = 10000
        if low_diff < high_diff:
            gt_slice = low_gt_half.iloc[[-1]]
        else:
            gt_slice = high_gt_half.iloc[[0]]
    return gt_slice


def solve_gt_b(dframe, max_iter=20, tol=1e-3):
    dframe = dframe.reset_index(drop=True)
    gt_ecef = np.zeros([1,3])
    gt_ecef[0,0] = dframe.loc[0, "gt_x"]
    gt_ecef[0,1] = dframe.loc[0, "gt_y"]
    gt_ecef[0,2] = dframe.loc[0, "gt_z"]

    sat_pos = np.hstack((dframe["sv_x"].to_numpy().reshape(-1,1),
                         dframe["sv_y"].to_numpy().reshape(-1,1),
                         dframe["sv_z"].to_numpy().reshape(-1,1)))
    gt_pos = np.tile(gt_ecef,(sat_pos.shape[0],1))

    gt_ranges = np.linalg.norm(gt_pos - sat_pos, axis = 1)


    G = np.ones((sat_pos.shape[0],1))
#     G[:,:3] = np.divide(gt_pos - sat_pos,gt_ranges.reshape(-1,1))

    W = np.diag(1./dframe["prange_sigma"]**2)
    rb = 0.
    for _ in range(max_iter):
        rho_diff = dframe["prange"].to_numpy() \
                 - gt_ranges \
                 - rb

        rho_diff = rho_diff.reshape(-1,1)

        delta = np.linalg.pinv(W.dot(G)).dot(W).dot(rho_diff)
        rb_new = rb + delta
        rb = rb_new
        if np.abs(delta)<tol:
            break
    return rb_new


def millis_to_datetime(millis, gps):
    if gps:
        UNIX_EPOCH_0 = datetime(1970, 1, 1, 0, 0, tzinfo=timezone.utc)
        t_datetime = UNIX_EPOCH_0 + timedelta(milliseconds=millis)
    else:
        GPS_EPOCH_0 = datetime(1980, 1, 6, 0, 0, 0, 0, tzinfo=timezone.utc)
        t_datetime = GPS_EPOCH_0 + timedelta(milliseconds=millis) \
                    + timedelta(seconds=18)
        # NOTE: LEapseconds hard coded for now
    t_datetime = t_datetime.replace(tzinfo=timezone.utc)
    return t_datetime


def get_rename_func(file_paths):
    first_file_name = list(file_paths.items())[0][1]['measures']
    if first_file_name.endswith('_derived.csv'):
        function_name = rename_android_2021
        gps = True
    elif first_file_name.endswith('_gnss.csv'):
        function_name = rename_android_2022
        gps = False
    return function_name, gps

def rename_android_2022(measures, gt):
    measure_rename_dict = {'PseudorangeRateMetersPerSecond': 'prange_rate',
                'PseudorangeRateUncertaintyMetersPerSecond': 'prange_rate_sigma',
                'RawPseudorangeMeters': 'rawPrM',
                'RawPseudorangeUncertaintyMeters': 'prange_sigma',
                'SvPositionXEcefMeters': 'sv_x',
                'SvPositionYEcefMeters': 'sv_y',
                'SvPositionZEcefMeters': 'sv_z',
                'SvElevationDegrees' : 'el',
                'SvAzimuthDegrees' : 'az',
                'SvVelocityXEcefMetersPerSecond' : 'sv_vx',
                'SvVelocityYEcefMetersPerSecond' : 'sv_vy',
                'SvVelocityZEcefMetersPerSecond' : 'sv_vz',
                'SvClockBiasMeters': 'satClkBiasM',
                'IsrbMeters': 'isrbM',
                'IonosphericDelayMeters': 'ionoDelayM',
                'TroposphericDelayMeters': 'tropoDelayM',
                'WlsPositionXEcefMeters': 'wls_x',
                'WlsPositionYEcefMeters': 'wls_y',
                'WlsPositionZEcefMeters': 'wls_z',
                'ConstellationType' : 'constellationType',
                'Svid': 'svid'
                }
    measures_renamed = measures.rename(columns=measure_rename_dict)

    gt_rename_dict = {'UnixTimeMillis': 'time_millis',
                    'LatitudeDegrees': 'lat',
                    'LongitudeDegrees': 'long',
                    'AltitudeMeters': 'alt'
                    }

    gt_renamed = gt.rename(columns=gt_rename_dict)
    return measures_renamed, gt_renamed

def rename_android_2021(measures, gt):
    measure_rename_dict = {'rawPrM': 'rawPrM',
            'rawPrUncM': 'prange_sigma',
            'xSatPosM': 'sv_x',
            'ySatPosM': 'sv_y',
            'zSatPosM': 'sv_z',
            'SvElevationDegrees' : 'el',
            'SvAzimuthDegrees' : 'az',
            'xSatVelMps' : 'sv_vx',
            'ySatVelMps' : 'sv_vy',
            'zSatVelMps' : 'sv_vz',
            'satClkBiasM': 'satClkBiasM',
            'isrbM': 'isrbM',
            'ionoDelayM': 'ionoDelayM',
            'tropoDelayM': 'tropoDelayM'
            }
    measures_renamed = measures.rename(columns=measure_rename_dict)

    gt_rename_dict = {'millisSinceGpsEpoch': 'time_millis',
                    'latDeg': 'lat',
                    'lngDeg': 'long',
                    'heightAboveWgs84EllipsoidM': 'alt'
                    }

    gt_renamed = gt.rename(columns=gt_rename_dict)

    return measures_renamed, gt_renamed