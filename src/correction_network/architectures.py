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

    def forward(self, x, pad_mask, mask_batches=None):
        x = torch.cat((x, torch.unsqueeze( torch.bitwise_not(pad_mask).float(), -1)), -1)
        
        if not self.batch_first:
            x = x.transpose(1, 0, 2)
        B, M, dim = x.shape
        
        x = F.pad(x, (0, 0, 0, self.max_sats-M), "constant", 0)
        x = x.reshape(B, -1)
        
        
        x = self.feat_in(x)
        x = self.enc(x)
        out = self.feat_out(x)
        if mask_batches is not None:
            out[torch.bitwise_not(mask_batches), :] = 0.0
        return out
   
    
"""
RNN w/ Learned GNSS Embeddinbgs
(elements, batch, time, dim_in) -> (batch, time, dim_out) [Flip elements and batch if batch_first = True]
"""
class LearnedEmbeddingsRNN(torch.nn.Module):
    def __init__(self, embedding, timestep_dim=16, batch_first=False, lstm_layers=4, lstm_hidden_dim=16, time_last=False, **kwargs):
        super().__init__()
        
        self.embedding = embedding
        
        self.lstm_layers = lstm_layers
        self.lstm_hidden_dim = lstm_hidden_dim
        
        self.fc_dxt = make_fc(timestep_dim+5+3*2, [timestep_dim, timestep_dim], timestep_dim)
        
        self.lstm = nn.LSTM(input_size=timestep_dim, hidden_size=lstm_hidden_dim,
                            num_layers=lstm_layers, batch_first=True)
        
        self.fc = make_fc(lstm_hidden_dim, [lstm_hidden_dim, lstm_hidden_dim//2], 4)
        
        self.batch_first = batch_first
        self.time_last = time_last
    
    def init_hidden(self, batch_size):
        # the weights are of the form (nb_layers, batch_size, nb_lstm_units)
        hidden_a = torch.randn(self.lstm_layers, batch_size, self.lstm_hidden_dim).cuda()
        hidden_b = torch.randn(self.lstm_layers, batch_size, self.lstm_hidden_dim).cuda()

        hidden_a = torch.autograd.Variable(hidden_a)
        hidden_b = torch.autograd.Variable(hidden_b)

        return (hidden_a, hidden_b)
    
    def forward(self, x, dxt_feat, pad_mask, mask_times):
        if not self.batch_first:
            x = x.transpose(0, 1).transpose(1, 2)
        else:
            x = x.transpose(1, 2)
        B, T, M, dim = x.shape
        dxt_dim = dxt_feat.shape[1]
        
        x = self.embedding(x.reshape(-1, M, dim), pad_mask.transpose(2, 1).reshape(-1, M), mask_batches=mask_times.reshape(-1)).reshape(B, T, -1)
        x = torch.cat((x, dxt_feat.transpose(1, 2)), -1)
        out = self.fc_dxt(x)
        
        # Propagate input through LSTM
        self.hidden = self.init_hidden(B)
        out, self.hidden = self.lstm(out, self.hidden)
        
        out = self.fc(out) + x[:, :, :4]
        if self.time_last:
            out = out.transpose(2, 1)
        return out
    
"""
Fully Connected embeddings w/ RNN
(elements, batch, time, dim_in) -> (batch, time, dim_out) [Flip elements and batch if batch_first = True]
"""
class FullyConnectedEmbeddingsRNN(torch.nn.Module):
    def __init__(self, timestep_dim=16, batch_first=False, lstm_layers=4, lstm_hidden_dim=16, time_last=False, **kwargs):
        super().__init__()
        
        self.embedding = FullyConnectedNetwork(dim_input=4, max_sats=10, dim_output=timestep_dim, batch_first=batch_first, **kwargs)
        
        self.lstm_layers = lstm_layers
        self.lstm_hidden_dim = lstm_hidden_dim
        
        self.fc_dxt = make_fc(timestep_dim+5+3*2, [timestep_dim, timestep_dim], timestep_dim)
        
        self.lstm = nn.LSTM(input_size=timestep_dim, hidden_size=lstm_hidden_dim,
                            num_layers=lstm_layers, batch_first=True)
        
        self.fc = make_fc(lstm_hidden_dim, [lstm_hidden_dim, lstm_hidden_dim//2], 4)
        
        self.batch_first = batch_first
        self.time_last = time_last
    
    def init_hidden(self, batch_size):
        # the weights are of the form (nb_layers, batch_size, nb_lstm_units)
        hidden_a = torch.randn(self.lstm_layers, batch_size, self.lstm_hidden_dim).cuda()
        hidden_b = torch.randn(self.lstm_layers, batch_size, self.lstm_hidden_dim).cuda()

        hidden_a = torch.autograd.Variable(hidden_a)
        hidden_b = torch.autograd.Variable(hidden_b)

        return (hidden_a, hidden_b)
    
    def forward(self, x, dxt_feat, pad_mask, mask_times):
        if not self.batch_first:
            x = x.transpose(0, 1).transpose(1, 2)
        else:
            x = x.transpose(1, 2)
        B, T, M, dim = x.shape
        dxt_dim = dxt_feat.shape[1]
        
        x = self.embedding(x.reshape(-1, M, dim), pad_mask.transpose(2, 1).reshape(-1, M), mask_batches=mask_times.reshape(-1)).reshape(B, T, -1)
        x = torch.cat((x, dxt_feat.transpose(1, 2)), -1)
        out = self.fc_dxt(x)
        
        # Propagate input through LSTM
        self.hidden = self.init_hidden(B)
        out, self.hidden = self.lstm(out, self.hidden)
        
        out = self.fc(out) + x[:, :, :4]
        if self.time_last:
            out = out.transpose(2, 1)
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
    def __init__(self, input_dim=4+1, A_hidden_dims=[4, 4, 4], b_hidden_dims=[4, 4, 4], decoder_hidden_dims=[16, 16, 4], embedding_dim=64, output_dim=4, batch_first=False, output_residual=False):
        super().__init__()
        
        self.output_residual = output_residual
        
        self.output_dim = output_dim
        if not output_residual:
            output_dim -= 4
        
        self.input_dim = input_dim
        
        # Satellite A matrix
        self.A_Net = make_fc(input_dim, A_hidden_dims, embedding_dim)
        
        # Measurement b vector
        self.b_Net = make_fc(input_dim, b_hidden_dims, 1)
        
        # Inducing points
        self.Z = nn.Parameter(torch.Tensor(1, embedding_dim))
        nn.init.xavier_uniform_(self.Z)
        
        # Decoder
        self.dec = make_fc(embedding_dim+4, decoder_hidden_dims, output_dim)
        
        self.batch_first = batch_first
        
    def forward(self, x, pad_mask, mask_batches=None):
        x = torch.cat((x, torch.unsqueeze( torch.bitwise_not(pad_mask).float(), -1)), -1)
        
        if not self.batch_first:
            x = x.transpose(1, 0, 2)
        B, M, dim = x.shape
        
        if mask_batches is None:
            mask_batches = torch.ones(B, dtype=torch.bool)
        
        out_all = torch.zeros(B, self.output_dim).cuda()
        
        x = x[mask_batches, :, :]
        B_new = x.shape[0]
        
        A_base = torch.cat((-1*x[:, :, 1:4], torch.ones(B_new, M, 1).cuda()), -1)
        r_base = x[:, :, 0].unsqueeze(-1)
        
        A_net = self.A_Net(x)
        r_net = self.b_Net(x)
        
        A_base_T = torch.transpose(A_base, 1, 2)
        A_net_T = torch.transpose(A_net, 1, 2)
        
        
        A_11_inv = torch.inverse(A_base_T @ A_base)
            
        A_12 = A_base_T @ A_net
        A_21 = A_net_T @ A_base
        
        Z = torch.diag_embed(self.Z.repeat(B_new, 1))   # Learned inducing points
#         Z = torch.inverse(torch.diag_embed(self.Z.repeat(B_new, 1)) + (A_net_T @ A_net - A_21 @ A_11_inv @ A_12).detach())    # Analytical term
        
        term1 = (A_11_inv + A_11_inv @ A_12 @ Z @ A_21 @ A_11_inv) @ A_base_T - A_11_inv @ A_12 @ Z @ A_net_T
        term2 = -Z @ A_21 @ A_11_inv @ A_base_T + Z @ A_net_T
        
        A_inv = torch.cat((term1, term2), 1)
        r = r_base + r_net
        
        out = torch.bmm(A_inv, r).squeeze(-1)
        
        if self.output_residual:
            out = out[:, :4] + self.dec(out)
        else:
            out = torch.cat((out[:, :4], self.dec(out)), -1)
        
        out_all[mask_batches, :] = out
        
        return out_all
    
"""
Learned WLS embeddings w/ RNN
(elements, batch, time, dim_in) -> (batch, time, dim_out) [Flip elements and batch if batch_first = True]
"""
class LearnedWLSEmbeddingsRNN(torch.nn.Module):
    def __init__(self, timestep_dim=16, batch_first=False, lstm_layers=4, lstm_hidden_dim=16, time_last=False, **kwargs):
        super().__init__()
        
        self.embedding = LearnedWLSEmbeddings(output_dim=timestep_dim, batch_first=batch_first, output_residual=False, **kwargs)
        
        self.lstm_layers = lstm_layers
        self.lstm_hidden_dim = lstm_hidden_dim
        
        self.fc_dxt = make_fc(timestep_dim+5+3*2, [timestep_dim, timestep_dim], timestep_dim)
        
        self.lstm = nn.LSTM(input_size=timestep_dim, hidden_size=lstm_hidden_dim,
                            num_layers=lstm_layers, batch_first=True)
        
        self.fc = make_fc(lstm_hidden_dim, [lstm_hidden_dim, lstm_hidden_dim//2], 4)
        
        self.batch_first = batch_first
        self.time_last = time_last
    
    def init_hidden(self, batch_size):
        # the weights are of the form (nb_layers, batch_size, nb_lstm_units)
        hidden_a = torch.randn(self.lstm_layers, batch_size, self.lstm_hidden_dim).cuda()
        hidden_b = torch.randn(self.lstm_layers, batch_size, self.lstm_hidden_dim).cuda()

        hidden_a = torch.autograd.Variable(hidden_a)
        hidden_b = torch.autograd.Variable(hidden_b)

        return (hidden_a, hidden_b)
    
    def forward(self, x, dxt_feat, pad_mask, mask_times):
        if not self.batch_first:
            x = x.transpose(0, 1).transpose(1, 2)
        else:
            x = x.transpose(1, 2)
        B, T, M, dim = x.shape
        dxt_dim = dxt_feat.shape[1]
        
        x = self.embedding(x.reshape(-1, M, dim), pad_mask.transpose(2, 1).reshape(-1, M), mask_batches=mask_times.reshape(-1)).reshape(B, T, -1)
        x = torch.cat((x, dxt_feat.transpose(1, 2)), -1)
        out = self.fc_dxt(x)
        
        # Propagate input through LSTM
        self.hidden = self.init_hidden(B)
        out, self.hidden = self.lstm(out, self.hidden)
        
        out = self.fc(out) + x[:, :, :4]
        if self.time_last:
            out = out.transpose(2, 1)
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