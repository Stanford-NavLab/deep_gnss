import torch
from torch.utils.data import DataLoader
import torch.nn.functional as F
import torch.nn as nn

"""
Pooling via Multi-headed Attention Block
(elements, batch, dim_in) -> (1, batch, dim_out) [Flip elements and batch if batch_first = True]
"""
class PMA(nn.Module):
    def __init__(self, dim, num_heads, num_seeds, batch_first=False):
        super(PMA, self).__init__()
        if batch_first:
            self.S = nn.Parameter(torch.Tensor(1, num_seeds, dim))
        else:
            self.S = nn.Parameter(torch.Tensor(num_seeds, 1, dim))
        nn.init.xavier_uniform_(self.S)
        self.mab = nn.MultiheadAttention(dim, num_heads, batch_first=batch_first)
        self.batch_first = batch_first

    def forward(self, X, pad_mask=None):
        if self.batch_first:
            Q = self.S.repeat(X.size(0), 1, 1)
        else:
            Q = self.S.repeat(1, X.size(1), 1)
        out, _ = self.mab(Q, X, X, key_padding_mask=pad_mask)
        return out
    
