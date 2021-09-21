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
# Set Transformer (modified implementation)

class SAB(nn.Module):
    def __init__(self, dim_in, dim_out, num_heads, ln=False):
        super(SAB, self).__init__()
        self.mab = nn.MultiheadAttention(dim_out, num_heads)
        self.fc_q = nn.Linear(dim_in, dim_out)
        self.fc_k = nn.Linear(dim_in, dim_out)
        self.fc_v = nn.Linear(dim_in, dim_out)

    def forward(self, X):
        Q = self.fc_q(X)
        K, V = self.fc_k(X), self.fc_v(X)
        out, wts = self.mab(Q, K, V)
        return out

# class ISAB(nn.Module):
#     def __init__(self, dim_in, dim_out, num_heads, num_inds, ln=False):
#         super(ISAB, self).__init__()
#         self.I = nn.Parameter(torch.Tensor(1, num_inds, dim_out))
#         nn.init.xavier_uniform_(self.I)
#         self.mab0 = nn.MultiheadAttention(dim_out, num_heads, kdim=dim_in, vdim=dim_out)
#         self.mab1 = nn.MultiheadAttention(dim_in, num_heads, kdim=dim_out, vdim=dim_out)

#     def forward(self, X):
#         H, _ = self.mab0(self.I.repeat(X.size(0), 1, 1), X, X)
#         out, _ = self.mab1(X, H, H)
#         return out

class PMA(nn.Module):
    def __init__(self, dim, num_heads, num_seeds, ln=False):
        super(PMA, self).__init__()
        self.S = nn.Parameter(torch.Tensor(num_seeds, 1, dim))
        nn.init.xavier_uniform_(self.S)
        self.mab = nn.MultiheadAttention(dim, num_heads)

    def forward(self, X, src_key_padding_mask=None):
        Q = self.S.repeat(1, X.size(1), 1)
        out, _ = self.mab(Q, X, X, key_padding_mask=src_key_padding_mask)
        return out

class Net_Snapshot(torch.nn.Module):
    def __init__(self, dim_input, num_outputs, dim_output, dim_hidden=64, num_heads=4):
        super(Net_Snapshot, self).__init__()
#         self.enc = nn.Sequential(
#                 SAB(dim_input, dim_hidden, num_heads),
#                 SAB(dim_hidden, dim_hidden, num_heads))
        encoder_layer = nn.TransformerEncoderLayer(dim_hidden, nhead=4, dim_feedforward=2*dim_hidden, dropout=0.0)
        decoder_layer = nn.TransformerEncoderLayer(dim_hidden, nhead=4, dim_feedforward=2*dim_hidden, dropout=0.0)
        self.feat_in = nn.Sequential(
                        nn.Linear(dim_input, dim_hidden),
                    )
        self.enc = nn.TransformerEncoder(encoder_layer, num_layers=2)
#         self.dec = nn.Sequential(
#                 PMA(dim_hidden, num_heads, num_outputs),
#                 SAB(dim_hidden, dim_hidden, num_heads),
#                 SAB(dim_hidden, dim_hidden, num_heads),
#                 nn.Linear(dim_hidden, dim_output))
        self.pool = PMA(dim_hidden, num_heads, num_outputs)
        self.dec = nn.TransformerEncoder(decoder_layer, num_layers=2)
        self.feat_out = nn.Sequential(
                    nn.Linear(dim_hidden, dim_output)
                    )

    def forward(self, x, pad_mask=None):
        x = self.feat_in(x)
        x = self.enc(x, src_key_padding_mask=pad_mask)
        x = self.pool(x, src_key_padding_mask=pad_mask)
        x = self.dec(x)
        out = self.feat_out(x)
        return torch.squeeze(out, dim=0)


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