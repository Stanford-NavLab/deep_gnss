########################################################################
# Author(s):    Ashwin Kanhere
# Date:         21 September 2021
# Desc:         Code to generate ECEF states from 2D trajectories
########################################################################
import os
import numpy as np
import pandas as pd
from numpy.random import default_rng
from datetime import datetime, timedelta

from gnss_lib.coordinates import LocalCoord


def traject_gen_zigzag(start_time, start_pos_ECEF, steps):
    time_vec = []
    trajectory = []
    b_dot = []
    vel = []
    assert np.size(start_pos_ECEF) == 3, "Pass a 3D vector for position"
    start_pos_ECEF = np.vstack((np.reshape(start_pos_ECEF, [3, 1]), np.array([[0.]])))
    time_vec.append(start_time)
    trajectory.append(start_pos_ECEF)
    vel.append(np.zeros([3,1]))
    b_dot.append(0)
    for t_idx in range(steps):
        time_step = 1.
        if np.mod(t_idx, 2) == 0:
            step = np.array([[10.], [0.], [0.], [0.]])
        else:
            step = np.array([[0.], [10.], [0.], [0.]])
        time_vec.append(time_vec[-1] + timedelta(seconds=time_step))
        trajectory.append(trajectory[-1] + step)
        vel.append(step[:3, :])
        b_dot.append(0)
    trajectory = np.array(trajectory)
    time_vec = np.array(time_vec)
    b_dot = np.array(b_dot)
    vel = np.array(vel)
    ECEF_traject = pd.DataFrame()
    ECEF_traject['Rxx'] = trajectory[:, 0, 0]
    ECEF_traject['Rxy'] = trajectory[:, 1, 0]
    ECEF_traject['Rxz'] = trajectory[:, 2, 0]
    ECEF_traject['Rxvx'] = vel[:, 0, 0]
    ECEF_traject['Rxvy'] = vel[:, 1, 0]
    ECEF_traject['Rxvz'] = vel[:, 2, 0]
    ECEF_traject['b'] = trajectory[:, 3, 0]
    ECEF_traject['b_dot'] = b_dot
    return time_vec, ECEF_traject


def traject_load_matlab(load_dir, traject_idx, start_time, ECEF_origin, horiz_sigma=1000, vert_sigma=2):
    rng = default_rng()
    column_mapper = {'index': 't', 0:'x', 1:'y'}
    # Read saved 2D NED trajectory
    NED_traject = pd.read_csv(os.path.join(load_dir, 'traject_'+str(traject_idx)+'.csv'))
    NED_traject = NED_traject.transpose().reset_index()
    NED_traject.rename(columns=column_mapper, inplace=True)

    # Extract velocities from the generated positions
    NED_traject['vx'] = np.zeros_like(NED_traject['x'])
    NED_traject['vy'] = np.zeros_like(NED_traject['y'])
    delta_t = np.asarray(NED_traject['t'][1:], dtype=float) - np.asarray(NED_traject['t'][:-1], dtype=float)
    NED_traject.loc[1:, 'vx'] = (np.asarray(NED_traject['x'][1:],dtype=float) - np.asarray(NED_traject['x'][:-1], dtype=float))/delta_t
    NED_traject.loc[1:, 'vy'] = (np.asarray(NED_traject['y'][1:],dtype=float) - np.asarray(NED_traject['y'][:-1], dtype=float))/delta_t

    # Set motion along z-axis to 0
    NED_traject['z'] = np.zeros_like(NED_traject['x'])
    NED_traject['vz'] = np.zeros_like(NED_traject['vx'])
    ECEF_origin = ECEF_origin + [horiz_sigma, horiz_sigma, vert_sigma]*rng.random(np.shape(ECEF_origin))

    # Convert NED positions and velocities to ECEF positions and velocities
    NED = LocalCoord.from_ecef(ECEF_origin[0])
    ned_pos = np.column_stack((np.asarray(NED_traject['x'],dtype=float), np.asarray(NED_traject['y'],dtype=float), np.asarray(NED_traject['z'],dtype=float))).T

    ecef_pos = NED.ned2ecef(ned_pos)
    
    ned_vel = np.column_stack((np.asarray(NED_traject['vx'],dtype=float), np.asarray(NED_traject['vy'],dtype=float), np.asarray(NED_traject['vz'],dtype=float))).T
    ecef_vel = np.matmul(NED.ned2ecef_matrix, ned_vel)

    # Save extracted positions and velocities in a dataframe
    ECEF_traject = pd.DataFrame()
    ECEF_traject['Rxx'] = ecef_pos[0, :]
    ECEF_traject['Rxy'] = ecef_pos[1, :]
    ECEF_traject['Rxz'] = ecef_pos[2, :]
    ECEF_traject['Rxvx'] = ecef_vel[0, :]
    ECEF_traject['Rxvy'] = ecef_vel[1, :]
    ECEF_traject['Rxvz'] = ecef_vel[2, :]

    # Store time vector as datetime object
    nt = np.size(NED_traject['x'])
    time_vec = [start_time]
    for idx in range(1, nt):
        time_vec.append(start_time + timedelta(seconds=float(NED_traject.loc[idx, 't'])))
    # Simulate clock bias and clock drift states
    ECEF_traject['b'] = np.zeros_like(NED_traject['x'])
    ECEF_traject['b_dot'] = np.zeros_like(NED_traject['x'])
    Q_clk = np.array([[0.0114, 0.0019], [0.0019, 0.0039]])
    for idx in range(1,nt):
        clk_noise = rng.multivariate_normal(np.zeros(2), Q_clk)
        ECEF_traject.loc[idx, 'b'] = ECEF_traject.loc[idx-1, 'b'] + delta_t[idx-1]*ECEF_traject.loc[idx-1, 'b_dot'] + clk_noise[0]
        ECEF_traject.loc[idx, 'b_dot'] = ECEF_traject.loc[idx-1, 'b_dot'] + clk_noise[1]
    return time_vec, ECEF_traject
        
        



