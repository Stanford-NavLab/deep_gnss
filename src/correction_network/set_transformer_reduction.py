import torch
from torch.utils.data import DataLoader
import torch.nn.functional as F
import torch.nn as nn
from .attention import *
from .pooling import *

"""
Modified Set Transformer to reduce a set of features to a fixed-dim output
(elements, batch, dim_in) -> (1, batch, dim_out) [Flip elements and batch if batch_first = True]
"""
class SetTransformerPointOutput(torch.nn.Module):
    def __init__(self, dim_input, num_outputs, dim_output, dim_hidden=16, num_layers=[2, 2, 2, 2], num_heads=4, batch_first=False):
        super().__init__()
 
        activation = nn.LayerNorm(dim_hidden)
#         activation = nn.ReLU()
    
    
        self.feat_in = nn.Sequential(
                        nn.Linear(dim_input, dim_hidden),
                        activation
                    )
    
        layers = []
        for i in range(num_layers[0]):
            layers += [nn.Linear(dim_hidden, dim_hidden)]
            activation = nn.LayerNorm(dim_hidden)
            layers += [activation]
        
        self.enc_feat = nn.Sequential(*layers)
        
        self.enc = TEB(dim_hidden, num_heads, num_layers=num_layers[1], batch_first=batch_first)

        self.pool = PMA(dim_hidden, num_heads, num_outputs, batch_first=batch_first)
        
        self.dec = TEB(dim_hidden, num_heads, num_layers=num_layers[2], batch_first=batch_first)
        
        layers = []
        for i in range(num_layers[3]):
            layers += [nn.Linear(dim_hidden*num_outputs, dim_hidden*num_outputs)]
            activation = nn.LayerNorm(dim_hidden)
            layers += [activation]
        
        self.dec_feat = nn.Sequential(*layers)
        
        self.feat_out = nn.Sequential(
                    nn.Linear(dim_hidden*num_outputs, dim_output)
                    )
        self.dim_output = dim_output
        self.batch_first = batch_first

    def forward(self, x, pad_mask=None, mask_batches=None):
        if self.batch_first:
            B = x.shape[0]
        else:
            B = x.shape[1]
        
        out_all = torch.zeros(B, self.dim_output).cuda()
        
        if mask_batches is None:
            mask_batches = torch.ones(B, dtype=torch.bool)
        
        if self.batch_first:
            x = x[mask_batches, :, :]           
        else:
            x = x[:, mask_batches, :]
            
        pad_mask = pad_mask[mask_batches, :]
        
        x = self.feat_in(x)
        x = self.enc_feat(x)
        x = self.enc(x, pad_mask=pad_mask)
        x = self.pool(x, pad_mask=pad_mask)
        x = self.dec(x)
        if self.batch_first:
            x = x.reshape(x.shape[0], -1)
        else:
            x = x.transpose(1, 0, 2)
            x = x.reshape(x.shape[0], -1)
        x = self.dec_feat(x)
        out = self.feat_out(x)
        
        out_all[mask_batches, :] = out
        
        return out_all