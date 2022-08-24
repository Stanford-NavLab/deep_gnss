import os, sys
import numpy as np
import pandas as pd
from tqdm import tqdm

parent_directory = os.path.split(os.getcwd())[0]
src_directory = os.path.join(parent_directory, 'src')
data_directory = os.path.join('/scratch/groups/gracegao', 'Google_GNSS_data')
ephemeris_data_directory = os.path.join(data_directory, 'ephemeris')
sys.path.insert(0, src_directory)

from dataset.extraction import parse_directories, android_data

android_full_folder = 'train_new'
android_batch_folder = android_full_folder + '_batch'

android_root = os.path.join(data_directory, android_full_folder)
android_save = os.path.join(data_directory, android_batch_folder)


parent_directory = os.path.split(os.getcwd())[0]
src_directory = os.path.join(parent_directory, 'src')
data_directory = os.path.join('/scratch/groups/gracegao', 'Google_GNSS_data')
sys.path.insert(0, src_directory)

file_paths = parse_directories(android_root, verbose=True)
android_data(file_paths, android_save, verbose=True)