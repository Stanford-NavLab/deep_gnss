########################################################################
# Author(s):    Shubh Gupta
# Date:         21 September 2021
# Desc:         Network models for GNSS-based position corrections
########################################################################
import torch
from torch.utils.data import DataLoader
import torch.nn.functional as F
import torch.nn as nn


########################################################
# DeepSets (src: https://github.com/yassersouri/pytorch-deep-sets)       
class InvariantModel(nn.Module):
    def __init__(self, phi: nn.Module, rho: nn.Module):
        super().__init__()
        self.phi = phi
        self.rho = rho

    def forward(self, x):
        # compute the representation for each data point
        x = self.phi.forward(x)
        # sum up the representations
        x = torch.sum(x, dim=0, keepdim=False)
        # compute the output
        out = self.rho.forward(x)
        return out

class SmallPhi(nn.Module):
    def __init__(self, input_size: int, output_size: int = 1, hidden_size: int = 10):
        super().__init__()
        self.input_size = input_size
        self.output_size = output_size

        self.fc1 = nn.Linear(self.input_size, hidden_size)
        self.fc2 = nn.Linear(hidden_size, self.output_size)

    def forward(self, x):
        x = F.relu(self.fc1(x))
        x = self.fc2(x)
        return x


class SmallRho(nn.Module):
    def __init__(self, input_size: int, output_size: int = 1, hidden_size: int = 10):
        super().__init__()
        self.input_size = input_size
        self.output_size = output_size

        self.fc1 = nn.Linear(self.input_size, hidden_size)
        self.fc2 = nn.Linear(hidden_size, self.output_size)

    def forward(self, x):
        x = F.relu(self.fc1(x))
        x = self.fc2(x)
        return x
        
class DeepSetModel(nn.Module):
    def __init__(self, input_size: int, output_size: int = 1, hidden_size: int = 10):
        super().__init__()
        self.input_size = input_size
        self.output_size = output_size
        self.hidden_size = hidden_size
        
        phi = SmallPhi(self.input_size, self.hidden_size)
        rho = SmallPhi(self.hidden_size, self.output_size)
        self.net = InvariantModel(phi, rho)
    
    def forward(self, x, pad_mask=None):
        out = self.net.forward(x)
        return out