import torch
from torch.utils.data import DataLoader
import torch.nn.functional as F
import torch.nn as nn
from .set_transformer_reduction import *

"""
Fully Connected Network
(elements, batch, dim_in) -> (batch, dim_out) [Flip elements and batch if batch_first = True]
"""
class FullyConnectedNetwork(torch.nn.Module):
    def __init__(self, dim_input, max_sats, dim_output, dim_hidden=64, num_layers=4, batch_first=False):
        super().__init__()
 
        stacked_dim_input = (dim_input+1)*max_sats
        self.feat_in = nn.Sequential(
                        nn.Linear(stacked_dim_input, dim_hidden),
                        nn.PReLU()
                    )
        
        layers = []
        for i in range(num_layers):
            layers += [nn.Linear(dim_hidden, dim_hidden)]
            layers += [nn.PReLU()]
        
        self.enc = nn.Sequential(*layers)

        self.feat_out = nn.Sequential(
                    nn.Linear(dim_hidden, dim_output)
                    )
        
        self.batch_first = batch_first
        self.max_sats = max_sats

    def forward(self, x, pad_mask):
        x = torch.cat((x, torch.unsqueeze( torch.bitwise_not(pad_mask).float(), -1)), -1)
        
        if not self.batch_first:
            x = x.transpose(1, 0, 2)
        B, M, dim = x.shape
        
        x = F.pad(x, (0, 0, 0, self.max_sats-M), "constant", 0)
        x = x.reshape(B, -1)
        
        
        x = self.feat_in(x)
        x = self.enc(x)
        out = self.feat_out(x)
        return out
   

"""
Basic Least Squares
(elements, batch, dim_in) -> (batch, dim_out) [Flip elements and batch if batch_first = True]
"""
class BasicLS(torch.nn.Module):
    def __init__(self, batch_first=False):
        super().__init__()
        
        self.batch_first = batch_first
        
    def forward(self, x, pad_mask):
        if not self.batch_first:
            x = x.transpose(1, 0, 2)
        B, M, dim = x.shape
        
        W = torch.ones(B, M).cuda()
        
        W = torch.diag_embed(W)
        
        A = torch.cat((-x[:, :, 1:4], torch.ones(B, M, 1).cuda()), -1)
        r = x[:, :, 0].unsqueeze(-1)
        
        WA = torch.bmm(W, A)
        Wr = torch.bmm(W, r)
        WA_inv = torch.pinverse(WA)
        out = torch.bmm(WA_inv, Wr).squeeze(-1)
        
        return out

"""
Learned WLS
(elements, batch, dim_in) -> (batch, dim_out) [Flip elements and batch if batch_first = True]
"""
class LearnedWLS(torch.nn.Module):
    def __init__(self, max_sats, batch_first=False):
        super().__init__()
        self.WNet = FullyConnectedNetwork(4, max_sats, max_sats, batch_first=batch_first)
        
        self.batch_first = batch_first
        self.max_sats = max_sats
        
    def forward(self, x, pad_mask):
        W = self.WNet(x, pad_mask)
        W = torch.diag_embed(W)
        
        if not self.batch_first:
            x = x.transpose(1, 0, 2)
        B, M, dim = x.shape
        
        x = F.pad(x, (0, 0, 0, self.max_sats-M), "constant", 0)
        A = torch.cat((-1*x[:, :, 1:4], torch.ones(B, self.max_sats, 1).cuda()), -1)
        r = x[:, :, 0].unsqueeze(-1)
        
        WA = torch.bmm(W, A)
        Wr = torch.bmm(W, r)
        WA_inv = torch.pinverse(WA)
        out = torch.bmm(WA_inv, Wr).squeeze(-1)
        
        return out

"""
Learned WLS embeddings
(elements, batch, dim_in) -> (batch, dim_out) [Flip elements and batch if batch_first = True]
"""
class LearnedWLSEmbeddings(torch.nn.Module):
    def __init__(self, A_hidden_dims=[4, 4, 4], b_hidden_dims=[4, 4, 4], decoder_hidden_dims=[16, 16, 4], embedding_dim=64, output_dim=4, batch_first=False):
        super().__init__()
        
        # Satellite A matrix
        self.A_Net = make_fc(4, A_hidden_dims, embedding_dim)
        
        # Measurement b vector
        self.b_Net = make_fc(4, b_hidden_dims, 1)
        
        # Inducing points
        self.Z = nn.Parameter(torch.Tensor(1, embedding_dim))
        nn.init.xavier_uniform_(self.Z)
        
        # Decoder
        self.dec = make_fc(embedding_dim+4, decoder_hidden_dims, output_dim)
        
        self.batch_first = batch_first
        
    def forward(self, x, pad_mask):
        if not self.batch_first:
            x = x.transpose(1, 0, 2)
        B, M, dim = x.shape
        
        A_base = torch.cat((-1*x[:, :, 1:4], torch.ones(B, M, 1).cuda()), -1)
        r_base = x[:, :, 0].unsqueeze(-1)
        
        A_net = self.A_Net(x)
        r_net = self.b_Net(x)
        
        A_base_T = torch.transpose(A_base, 1, 2)
        A_net_T = torch.transpose(A_net, 1, 2)
        
        A_11_inv = torch.inverse(A_base_T @ A_base)
        A_12 = A_base_T @ A_net
        A_21 = A_net_T @ A_base
        
        # Z = torch.diag_embed(self.Z.repeat(B, 1))   # Learned inducing points
        Z = torch.inverse(torch.diag_embed(self.Z.repeat(B, 1)) + (A_net_T @ A_net - A_21 @ A_11_inv @ A_12).detach())    # Analytical term
        
        term1 = (A_11_inv + A_11_inv @ A_12 @ Z @ A_21 @ A_11_inv) @ A_base_T - A_11_inv @ A_12 @ Z @ A_net_T
        term2 = -Z @ A_21 @ A_11_inv @ A_base_T + Z @ A_net_T
        
        A_inv = torch.cat((term1, term2), 1)
        r = r_base + r_net
        
        embedding = torch.bmm(A_inv, r).squeeze(-1)
        out = self.dec(embedding) + embedding[:, :4]
        
        return out    
    
"""
Learned WLS Set Transformer
(elements, batch, dim_in) -> (batch, dim_out) [Flip elements and batch if batch_first = True]
"""
class LearnedWLSSetTransformer(torch.nn.Module):
    def __init__(self, set_embedding_dim=64, batch_first=False):
        super().__init__()
        self.WNet_global = SetTransformerPointOutput(4, 4, set_embedding_dim, batch_first=batch_first)
        self.WNet_local = nn.Sequential(
                        nn.Linear(set_embedding_dim+4, 1),
                        nn.PReLU()
                    )
        
        self.batch_first = batch_first
        self.set_embedding_dim = set_embedding_dim
        
    def forward(self, x, pad_mask):
        allsv_feat = self.WNet_global(x, pad_mask)
        if not self.batch_first:
            x = x.transpose(1, 0, 2)
        B, M, dim = x.shape
        
        x_W = x.reshape(-1, dim)
        allsv_feat = allsv_feat.unsqueeze(1).expand(B, M, self.set_embedding_dim).reshape(-1, self.set_embedding_dim)
        x_W = torch.cat((x_W, allsv_feat), -1)
        
        W = self.WNet_local(x_W)
        W = W.reshape(B, M).masked_fill_(pad_mask, 0.0)

        W = torch.diag_embed(W)
        
        A = torch.cat((-x[:, :, 1:4], torch.ones(B, M, 1).cuda()), -1)
        r = x[:, :, 0].unsqueeze(-1)
        
        WA = torch.bmm(W, A)
        Wr = torch.bmm(W, r)
        WA_inv = torch.pinverse(WA)
        out = torch.bmm(WA_inv, Wr).squeeze(-1)
        
        return out
    
"""
Learned WLS Set Transformer w/ corrections
(elements, batch, dim_in) -> (batch, dim_out) [Flip elements and batch if batch_first = True]
"""
class LearnedWLSSetTransformerCorrection(torch.nn.Module):
    def __init__(self, set_embedding_dim=64, batch_first=False):
        super().__init__()
        self.WNet_global = SetTransformerPointOutput(4, 4, set_embedding_dim, batch_first=batch_first)
        self.WNet_local = nn.Sequential(
                        nn.Linear(set_embedding_dim + 4, 1),
                        nn.PReLU()
                    )
        
        self.batch_first = batch_first
        self.set_embedding_dim = set_embedding_dim
        self.correction_net = nn.Sequential(
                        nn.PReLU(),
                        nn.Linear(set_embedding_dim, 4),
                    )
        
    def forward(self, x, pad_mask):
        allsv_feat = self.WNet_global(x, pad_mask)
        
        if not self.batch_first:
            x = x.transpose(1, 0, 2)
        B, M, dim = x.shape
        
        x_W = x.reshape(-1, dim)
        allsv_feat_reshaped = allsv_feat.unsqueeze(1).expand(B, M, self.set_embedding_dim).reshape(-1, self.set_embedding_dim)
        x_W = torch.cat((x_W, allsv_feat_reshaped), -1)
        
        W = self.WNet_local(x_W)
        W = W.reshape(B, M).masked_fill_(pad_mask, 0.0)

        W = torch.diag_embed(W)
        
        A = torch.cat((-x[:, :, 1:4], torch.ones(B, M, 1).cuda()), -1)
        r = x[:, :, 0].unsqueeze(-1)
        
        WA = torch.bmm(W, A)
        Wr = torch.bmm(W, r)
        WA_inv = torch.pinverse(WA)
        out = torch.bmm(WA_inv, Wr).squeeze(-1)
        
        # Add Set transformer corrections to WLS output
        corrections = self.correction_net(allsv_feat)
        out += corrections
        
        return out
    
###########################################################################################################################
# Utility functions
###########################################################################################################################

def make_fc(input_dim, hidden_dims, output_dim, activation=nn.ReLU()):
    layers = [nn.Linear(input_dim, hidden_dims[0]), activation]

    for i in range(1, len(hidden_dims)):
        layers += [nn.Linear(hidden_dims[i-1], hidden_dims[i]), activation]

    layers += [nn.Linear(hidden_dims[-1], output_dim)]

    return nn.Sequential(*layers)