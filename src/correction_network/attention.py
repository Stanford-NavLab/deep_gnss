import torch
from torch.utils.data import DataLoader
import torch.nn.functional as F
import torch.nn as nn

"""
Set Attention Block
(elements, batch, dim_in) -> (elements, batch, dim_out) [Flip elements and batch if batch_first = True]
"""
class SAB(nn.Module):
    def __init__(self, dim_in, dim_out, num_heads, batch_first=False):
        super().__init__()
        self.mab = nn.MultiheadAttention(dim_out, num_heads, batch_first=batch_first)
        self.fc_q = nn.Linear(dim_in, dim_out)
        self.fc_k = nn.Linear(dim_in, dim_out)
        self.fc_v = nn.Linear(dim_in, dim_out)

    def forward(self, X, pad_mask=None):
        Q = self.fc_q(X)
        K, V = self.fc_k(X), self.fc_v(X)
        out, wts = self.mab(Q, K, V, key_padding_mask=pad_mask)
        return out
    
"""
Induced Set Attention Block, more efficient than set-attention
(time, batch, dim_in) -> (time, batch, dim_out) [Flip time and batch if batch_first = True]
"""    
class ISAB(nn.Module):
    def __init__(self, dim_in, dim_out, num_heads, num_inds, batch_first=False):
        super().__init__()
        self.I = nn.Parameter(torch.Tensor(1, num_inds, dim_out))
        nn.init.xavier_uniform_(self.I)
        self.mab0 = nn.MultiheadAttention(dim_out, num_heads, kdim=dim_in, vdim=dim_out, batch_first=batch_first)
        self.mab1 = nn.MultiheadAttention(dim_in, num_heads, kdim=dim_out, vdim=dim_out, batch_first=batch_first)

    def forward(self, X, pad_mask=None):
        # Fix batch_first case
        H, _ = self.mab0(self.I.repeat(X.size(0), 1, 1), X, X, key_padding_mask=pad_mask)
        out, _ = self.mab1(X, H, H, key_padding_mask=pad_mask)
        return out

    
"""
Transformer Encoder block
(time, batch, dim_in) -> (time, batch, dim_out) [Flip time and batch if batch_first = True]
"""
    
class TEB(nn.Module):
    def __init__(self, dim, num_heads, num_layers=1, batch_first=False):
        super().__init__()
        base_layer = nn.TransformerEncoderLayer(dim, nhead=num_heads, dim_feedforward=2*dim, dropout=0.0, batch_first=batch_first)
        self.enc = nn.TransformerEncoder(base_layer, num_layers)

    def forward(self, X, pad_mask=None):
        out = self.enc(X, src_key_padding_mask=pad_mask)
        return out
