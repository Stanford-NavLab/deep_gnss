########################################################################
# Author(s):    Ashwin Kanhere
# Date:         21 September 2021
# Desc:         Create PyTorch DataLoader for Android measurements
########################################################################
import os
import numpy as np
import pandas as pd
from tqdm import tqdm

from gnss_lib.coordinates import geodetic2ecef
from utils import initialize_dirs, android_find_gt, solve_gt_b, millis_to_datetime, get_rename_func


def parse_directories(root_path, verbose=False):

    file_paths = {}
    trace_paths = [trace for trace in os.scandir(root_path) if trace.is_dir()]
    for trace in trace_paths:
        if verbose:
            print('Scanning trace', trace)
        phone_paths = [phone for phone in os.scandir(trace) if phone.is_dir()]
        for phone_type in phone_paths:
            temp_file_paths = {}
            for meas_file in os.scandir(phone_type):
                if not meas_file.is_dir():
                    # Naming convention for Android 2022 dataset
                    if meas_file.name.endswith('_gnss.csv'):
                        temp_file_paths['measures'] = meas_file.path
                    elif meas_file.name.endswith('_imu.csv'):
                        temp_file_paths['imu'] = meas_file.path
                    # Naming convention for Android 2021 dataset
                    elif meas_file.name.endswith('_derived.csv'):
                        temp_file_paths['measures'] = meas_file.path
                    # Android 2021 and 2022 dataset follow same GT naming
                    elif meas_file.name.endswith('ground_truth.csv'):
                        temp_file_paths['ground_truth'] = meas_file.path
            file_paths[trace.name + '_' + phone_type.name] = temp_file_paths
    return file_paths

def simulated_data(load_path, save_path):
    pass

def android_data(file_paths, save_root):
    # Determine dataset type
    rename_func, gps = get_rename_func(file_paths)
    for trace_key, paths in file_paths.items():
        save_path = os.path.join(save_root, trace_key)
        initialize_dirs(save_path)
        measures = pd.read_csv(paths['measures'])
        #TODO: Change the following function call
        gt = pd.read_csv(paths['ground_truth'])
        measures, gt = rename_func(measures, gt)
        # print(measures.columns)
        # print(gt.columns)
        file_idx = 0
        #TODO: Replace these as terms that change based on datasets
        for utc_time, time_measure in tqdm(measures.groupby('utcTimeMillis'), position=1):
            gt_slice = android_find_gt(gt, 'time_millis', utc_time)
            gt_lla = gt_slice[['lat', 'long', 'alt']].to_numpy()
            gt_ecef = geodetic2ecef(gt_lla)
            time_measure['gt_x'] = gt_ecef[0, 0]*len(time_measure)
            time_measure['gt_y'] = gt_ecef[0, 1]*len(time_measure)
            time_measure['gt_z'] = gt_ecef[0, 2]*len(time_measure)
            time_measure['timestamp'] = millis_to_datetime(utc_time, gps)
            time_measure['prange'] = time_measure["rawPrM"] \
                                + time_measure["satClkBiasM"] \
                                - time_measure["isrbM"] \
                                - time_measure["ionoDelayM"] \
                                - time_measure["tropoDelayM"]

            time_measure["SvName"] = time_measure["constellationType"].replace(
                                    [1,3,4,5,6],["G","R","Q","B","E"]) \
                                + time_measure["svid"].astype(str)
            time_measure['gt_b'] = np.squeeze(solve_gt_b(time_measure))
            time_measure.to_csv(os.path.join(save_path, f"{file_idx:04}" + ".csv"))