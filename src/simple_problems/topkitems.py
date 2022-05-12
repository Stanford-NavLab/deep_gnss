import torch
import torch.nn.functional as F
import torch.nn as nn
import numpy as np
from torch.utils.data import Dataset

# Define top k items problem
class KTopItemsDataset(Dataset):
    def __init__(self, k=1):
        self.max_items = 10
        self.dim_feat = 5
        self.max_bag_size = 5
        self.N_dataset = 100
        
        self.items = torch.rand(self.max_items, self.dim_feat)
        self.value_items = torch.tensor(np.arange(self.max_items))
        
        self.inputs = torch.zeros(self.N_dataset, self.max_bag_size, self.dim_feat)
        self.labels = torch.zeros(self.N_dataset, self.max_bag_size)
        self.pad_mask = torch.ones(self.N_dataset, self.max_bag_size, dtype=torch.bool)
        
        for i in range(self.N_dataset):
            perm = torch.randperm(self.max_items)
            i_items = np.random.randint(self.max_bag_size-2) + 3
#             i_items = self.max_bag_size
            idx = perm[:i_items]
            
            sub_items = self.items[idx]
            sub_vals = self.value_items[idx]
            topk_idx = sub_vals.topk(k)[1]
            
            
            self.inputs[i, :i_items, :] = sub_items
            self.pad_mask[i, :i_items] = False
            self.labels[i, topk_idx] = 1.0
    
    def __len__(self):
        return self.N_dataset
    
    def __getitem__(self, idx):
        return self.inputs[idx, ...], self.labels[idx, :], self.pad_mask[idx, :]