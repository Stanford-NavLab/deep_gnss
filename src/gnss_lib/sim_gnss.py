import numpy as np
import pandas as pd
from numpy.random import default_rng

from gnss_lib.constants import gpsconsts
from gnss_lib.coordinates import ecef2geodetic


def _extract_pos_vel_arr(satXYZV):
    prns = [int(prn[1:]) for prn in satXYZV.index]
    satXYZ = satXYZV.filter(['x', 'y', 'z'])
    satV = satXYZV.filter(['vx', 'vy', 'vz'])
    satXYZ = satXYZ.to_numpy()
    satV = satV.to_numpy()
    return prns, satXYZ, satV
    #TODO: Remove prns from function output if not needed


#TODO: Add a function to simulate noisy measurements (the entire workflow)
def simulate_measures(gpsweek, gpstime, ephem, pos, bias, b_dot, vel, prange_sigma = 6, doppler_sigma=0.1, satXYZV=None):
    ephem = _find_visible_sats(gpsweek, gpstime, pos, ephem) 
    measurements, satXYZV = expected_measures(gpsweek, gpstime, ephem, pos, bias, b_dot, vel, satXYZV)
    M = len(measurements.index)
    rng = default_rng()
    measurements['prange'] = measurements['prange'] + prange_sigma*rng.standard_normal(M)
    measurements['doppler'] = measurements['doppler'] + doppler_sigma*rng.standard_normal(M)
    return measurements, satXYZV


def precompute_prange_satpos(gpsweek, gpstime, ephem, pos, bias, b_dot, vel, satXYZV=None):
    pos = np.reshape(pos, [1, 3])
    vel = np.reshape(vel, [1, 3])
    GPSconstants = gpsconsts()
    satXYZV, delXYZ, true_range = find_sat_location(gpsweek, gpstime, ephem, pos, satXYZV)
    _, satXYZ, satV = _extract_pos_vel_arr(satXYZV)
    # satXYZ, satV, delXYZ are both Nx3
    # Obtain corrected pseudoranges and add receiver clock bias to them
    prange_correction = correct_pseudorange(gpstime, gpsweek, ephem, true_range, np.reshape(pos, [-1, 3])) - true_range
    return prange_correction, satXYZV

def expected_measures(gpsweek, gpstime, ephem, pos, bias, b_dot, vel, satXYZV=None):
    #NOTE: When using saved data, pass saved DataFrame with ephemeris in ephem and satellite positions in satXYZV
    """
    Return elevation/azimuth, closest ephemeris and prns of visible satellites.
    
    Parameters:
    gpsweek:
    gpstime:
    ephem: 
    pos: 1x3 position vector in ECEF (m)
    bias:  
    b_dot:
    vel: 1x3 vector for receiver velocity (m)
    Returns:
    prange:
    prange_rate:
    """
    pos = np.reshape(pos, [1, 3])
    vel = np.reshape(vel, [1, 3])
    GPSconstants = gpsconsts()
    satXYZV, delXYZ, true_range = find_sat_location(gpsweek, gpstime, ephem, pos, satXYZV)
    _, satXYZ, satV = _extract_pos_vel_arr(satXYZV)
    # satXYZ, satV, delXYZ are both Nx3
    # Obtain corrected pseudoranges and add receiver clock bias to them
    prange = correct_pseudorange(gpstime, gpsweek, ephem, true_range, np.reshape(pos, [-1, 3])) + bias
    # Obtain difference of velocity between satellite and receiver
    delV = satV - np.tile(np.reshape(vel, 3), [len(ephem), 1])
    prange_rate = np.sum(delV*delXYZ, axis=1)/true_range + b_dot
    doppler = -(GPSconstants.f1/GPSconstants.c) * (prange_rate)
    # doppler = pd.DataFrame(doppler, index=prange.index.copy())
    measurements = pd.DataFrame(np.column_stack((prange, doppler)), index=satXYZV.index, columns=['prange', 'doppler'])
    return measurements, satXYZV

def expected_measures_minimal(pos, bias, b_dot, vel, satXYZ, satV, prange_corr):
    #NOTE: When using saved data, pass saved DataFrame with ephemeris in ephem and satellite positions in satXYZV
    """
    Return elevation/azimuth, closest ephemeris and prns of visible satellites.
    
    Parameters:
    gpsweek:
    gpstime:
    ephem: 
    pos: 1x3 position vector in ECEF (m)
    bias:  
    b_dot:
    vel: 1x3 vector for receiver velocity (m)
    Returns:
    prange:
    prange_rate:
    """
    pos = np.reshape(pos, [1, 3])
    vel = np.reshape(vel, [1, 3])
    GPSconstants = gpsconsts()
    delXYZ, true_range = _find_delxyz_range_np(satXYZ, pos, len(satXYZ))
    
    prange = true_range + prange_corr + bias
    # satXYZ, satV, delXYZ are both Nx3
    # Obtain corrected pseudoranges and add receiver clock bias to them
    # Obtain difference of velocity between satellite and receiver
    delV = satV - np.tile(np.reshape(vel, 3), [len(satV), 1])
    prange_rate = np.sum(delV*delXYZ, axis=1)/true_range + b_dot
    doppler = -(GPSconstants.f1/GPSconstants.c) * (prange_rate)
    
    return prange, doppler


def _find_visible_sats(gpsweek, gpstime, Rx_ECEF, ephem, el_mask=5):
    """
    Return elevation/azimuth, closest ephemeris and prns of visible satellites.
    
    Parameters:
    gpsweek:
    gpstime:
    Rx_ECEF: 1x3 position vector in ECEF (m)
    ephem: Pandas DataFrame containing all ephemerides for all possible satellites in 33 x N
    el_mask: Elevation mask for visible satellites. Set to 5 by default

    Returns:
    eph: Pandas DataFrame containing only visible satellites
    """
    GPSconstants = gpsconsts()
    # Find positions of all satellites
    approx_XYZV = FindSat(ephem, gpstime - GPSconstants.t_trans, gpsweek) # Also contains satellite velocities
    # Find elevation and azimuth angles for all satellites
    _, approx_XYZ, _ = _extract_pos_vel_arr(approx_XYZV)
    approx_elaz = find_elaz(np.reshape(Rx_ECEF, [1, 3]), approx_XYZ) 
    # Keep attributes of only those satellites which are visible
    keep_ind = approx_elaz[:,0] > el_mask
    prns = approx_XYZV.index.to_numpy()[keep_ind] 
    eph = ephem.loc[keep_ind, :] #TODO: Check that a copy of the ephemeris is being generated, also if it is needed
    return eph


def find_sat_location(gpsweek, gpstime, ephem, pos, satXYZV=None):
    """
    Find satellite locations and velocities with time correction based on transmit time
    """
    GPSconstants = gpsconsts()
    pos = np.reshape(pos, [1, 3])
    if satXYZV is None:
        satellites = len(ephem.index)
        satXYZV = FindSat(ephem, gpstime - GPSconstants.t_trans, gpsweek)
        delXYZ, true_range = _find_delxyz_range(satXYZV, pos, satellites)
        tcorr = true_range/GPSconstants.c
        # Find satellite locations at (a more accurate) time of transmission
        satXYZV = FindSat(ephem, gpstime-tcorr, gpsweek)
        # Corrections for the rotation of the Earth during transmission
        _, satXYZ, satV = _extract_pos_vel_arr(satXYZV)
        delX = GPSconstants.OmegaEDot*satXYZV['x'] * tcorr
        delY = GPSconstants.OmegaEDot*satXYZV['y'] * tcorr 
        satXYZV['x'] = satXYZV['x'] + delX
        satXYZV['y'] = satXYZV['y'] + delY
    else:
        satellites = len(satXYZV.index)
    delXYZ, true_range = _find_delxyz_range(satXYZV, pos, satellites)
    
    return satXYZV, delXYZ, true_range

def _find_delxyz_range_np(satXYZ, pos, satellites):
    # Repeating computation in find_sat_location
    #NOTE: Input is from satellite finding in AE 456 code
    pos = np.reshape(pos, [1, 3])
    if np.size(pos)!=3:
        raise ValueError('Position is not in XYZ')
    delXYZ = satXYZ - np.tile(np.reshape(pos, [-1, 3]), (satellites, 1))
    true_range = np.linalg.norm(delXYZ, axis=1)
    return delXYZ, true_range

def _find_delxyz_range(satXYZV, pos, satellites):
    # Repeating computation in find_sat_location
    #NOTE: Input is from satellite finding in AE 456 code
    _, satXYZ, _ = _extract_pos_vel_arr(satXYZV)
    delXYZ, true_range = _find_delxyz_range_np(satXYZ, pos, satellites)
    return delXYZ, true_range


def FindSat(ephem, times, gpsweek):
    # Satloc contains both positions and velocities.
    # TODO: Look into combining this method with the ones in read_rinex.py
    """
    # Original in ECE456_orbitutils.py. #NOTE: Ask Ashwin for original source
    # Function to coarse calculate satellite positions given the GPS almanac.
    # The calculation can be performed for multiple satellites with a corresponding time for each satellite
    #
    # Inputs:
    #       ephem - Pandas DataFrame with ephemeris information   
    #               See ECE456_fileutils.py for a description of the structure format.
    #       times_all - the GPS time for each satellite to compute the satellite position(s) for
    #
    # Outputs:
    #       satLoc - a (N x 8) 
    #               satLoc = [GPStime PRN ECEFx ECEFy ECEFz Vx, Vy, Vz;
    #                          . . . . .
    #                         GPStime PRN ECEFx ECEFy ECEFz, Vx, Vy, Vz];
    #
    # Revision history:
    #       7-15-2015: Written by J. Makela based on MATLAB code
    #       9-14-2020: Modified by Ashwin Kanhere to output velocities as well
    #                  Based on MATLAB code by Sriramya Bhamidipati
    """
    # Load in GPS constants
    gpsconst = gpsconsts()
    
    # if np.size(times_all)==1:
    #     times_all = times_all*np.ones(len(ephem))
    # else:
    #     times_all = np.reshape(times_all, len(ephem))
    # times = times_all
    satXYZV = pd.DataFrame()
    satXYZV['sv'] = ephem.index
    satXYZV.set_index('sv', inplace=True)
    #TODO: Check if 'dt' or 'times' should be stored in the final DataFrame
    satXYZV['times'] = times 
    dt = (times - ephem['t_oe']) + (np.mod(gpsweek, 1024) - np.mod(ephem['GPSWeek'],1024))*604800.0
    # Calculate the mean anomaly with corrections
    Mcorr = ephem['deltaN'] * dt
    M = ephem['M_0'] + (np.sqrt(gpsconst.muearth) * ephem['sqrtA']**-3) * dt + Mcorr
        
    # Compute the eccentric anomaly from mean anomaly using the Newton-Raphson method
    # to solve for E in:
    #  f(E) = M - E + e * sin(E) = 0
    E = M
    for i in np.arange(0,10):
        f = M - E + ephem['e'] * np.sin(E)
        dfdE = ephem['e']*np.cos(E) - 1.
        dE = -f / dfdE
        E = E + dE
            
    # Calculate the true anomaly from the eccentric anomaly
    sinnu = np.sqrt(1-ephem['e']**2)*np.sin(E)/(1-ephem['e']*np.cos(E))
    cosnu = (np.cos(E)-ephem['e'])/(1-ephem['e']*np.cos(E))
    nu = np.arctan2(sinnu,cosnu)
        
    # Calcualte the argument of latitude iteratively
    phi0 = nu + ephem['omega']
    phi = phi0
    for i in range(5):
        cos2phi = np.cos(2.*phi)
        sin2phi = np.sin(2.*phi)
        phiCorr = ephem['C_uc'] * cos2phi + ephem['C_us'] * sin2phi
        phi = phi0 + phiCorr
            
    # Calculate the longitude of ascending node with correction
    OmegaCorr = ephem['OmegaDot'] * dt
    
    # Also correct for the rotation since the beginning of the GPS week for which the Omega0 is
    # defined.  Correct for GPS week rollovers.
    Omega = ephem['Omega_0'] - gpsconst.OmegaEDot*(times+(np.mod(gpsweek,1024)-np.mod(ephem['GPSWeek'],1024))*604800.) + OmegaCorr

        
    # Calculate orbital radius with correction
    rCorr = ephem['C_rc'] * cos2phi + ephem['C_rs'] * sin2phi
    r = (ephem['sqrtA']**2)*(1-ephem['e']*np.cos(E)) + rCorr

    ############################################
    ######  Lines added for velocity (1)  ######
    ############################################
    dE = (np.sqrt(gpsconst.muearth) * (ephem['sqrtA']**(-3)) + ephem['deltaN'])/(1 - ephem['e'] * np.cos(E)) 
    dphi = np.sqrt(1 - ephem['e']**2)*dE/(1 - ephem['e'] * np.cos(E))
    dr = ephem['sqrtA']**2 * ephem['e'] * dE * np.sin(E) + 2 * (ephem['C_rs']*cos2phi - ephem['C_rc']*sin2phi)*dphi # Changed from the paper


    # Calculate the inclination with correction
    iCorr = ephem['C_ic'] * cos2phi + ephem['C_is'] * sin2phi + ephem['IDOT'] * dt
    i = ephem['i_0'] + iCorr

    ############################################
    ######  Lines added for velocity (2)  ######
    ############################################
    di = 2*(ephem['C_is']*cos2phi - ephem['C_ic']*sin2phi)*dphi + ephem['IDOT']

    # Find the position in the orbital plane
    xp = r*np.cos(phi)
    yp = r*np.sin(phi)

    ############################################
    ######  Lines added for velocity (3)  ######
    ############################################
    du = (1 + 2*(ephem['C_us'] * cos2phi - ephem['C_uc']*sin2phi))*dphi 
    dxp = dr*np.cos(phi) - r*np.sin(phi)*du
    dyp = dr*np.sin(phi) + r*np.cos(phi)*du
    # Find satellite position in ECEF coordinates
    satXYZV['x'] = xp*np.cos(Omega) - yp*np.cos(i)*np.sin(Omega)
    satXYZV['y'] = xp*np.sin(Omega) + yp*np.cos(i)*np.cos(Omega)
    satXYZV['z'] = yp*np.sin(i)

    ############################################
    ######  Lines added for velocity (4)  ######
    ############################################
    dOmega = ephem['OmegaDot'] - gpsconst.OmegaEDot
    satXYZV['vx'] = dxp*np.cos(Omega) - dyp*np.cos(i)*np.sin(Omega) + yp*np.sin(Omega)*np.sin(i)*di - (xp*np.sin(Omega) + yp*np.cos(i)*np.cos(Omega))*dOmega
    satXYZV['vy'] = dxp*np.sin(Omega) + dyp*np.cos(i)*np.cos(Omega) - yp*np.sin(i)*np.cos(Omega)*di + (xp*np.cos(Omega) - yp*np.cos(i)*np.sin(Omega))*dOmega
    satXYZV['vz'] = dyp*np.sin(i) + yp*np.cos(i)*di
    
    return satXYZV


def correct_pseudorange(gpstime, gpsweek, ephem, prMes, rx):
    """
    Ask Ashwin for original code
    """
    # Load gpsconstants
    gpsconst = gpsconsts()
    
    # Make sure things are arrays
    if type(gpstime) != np.ndarray:
        gpstime = np.array(gpstime)
    if type(gpsweek) != np.ndarray:
        gpsweek = np.array(gpsweek)
        
    # Initialize the correction array
    prCorr = np.zeros_like(prMes)
    dt = gpstime - ephem['t_oe']
    if np.abs(dt).any() > 302400:
        dt = dt-np.sign(dt)*604800
    
    # Calculate the mean anomaly with corrections
    Mcorr = ephem['deltaN'] * dt
    M = ephem['M_0'] + (np.sqrt(gpsconst.muearth) * ephem['sqrtA']**-3) * dt + Mcorr

    # Compute the eccentric anomaly from mean anomaly using the Newton-Raphson method
    # to solve for E in:
    #  f(E) = M - E + e * sin(E) = 0
    E = M
    for i in np.arange(0,10):
        f = M - E + ephem['e'] * np.sin(E)
        dfdE = ephem['e']*np.cos(E) - 1.
        dE = -f / dfdE
        E = E + dE

    # Determine pseudorange corrections due to satellite clock corrections.
    # Calculate time offset from satellite reference time
    timeOffset = gpstime - ephem['t_oc']
    if np.abs(timeOffset).any() > 302400:
        timeOffset = timeOffset-np.sign(timeOffset)*604800
        
    # Calculate clock corrections from the polynomial
    # corrPolynomial = ephem.af0 + ephem.af1*timeOffset + ephem.af2*timeOffset**2
    corrPolynomial = ephem['SVclockBias'] + ephem['SVclockDrift']*timeOffset + ephem['SVclockDriftRate']*timeOffset**2

    # Calcualte the relativistic clock correction
    corrRelativistic = gpsconst.F*ephem['e']*ephem['sqrtA']*np.sin(E)
    
    # Calculate the total clock correction including the Tgd term
    clockCorr = (corrPolynomial - ephem['TGD'] + corrRelativistic)

    #NOTE: Removed ionospheric delay calculation here

    # Calculate the tropospheric delays
    tropoDelay = calculate_tropo_delay(gpstime,gpsweek,ephem,rx) 
    # Calculate total pseudorange correction
    prCorr = prMes + clockCorr*gpsconst.c - tropoDelay*gpsconst.c        
        
    if isinstance(prCorr, pd.Series):
        prCorr = prCorr.to_numpy(dtype=float)

    return prCorr


def calculate_tropo_delay(gpstime, gpsweek, ephem, rx_loc):
    # Load gpsconstants
    gpsconst = gpsconsts()

    # Make sure things are arrays
    if type(gpstime) != np.ndarray:
        gpstime = np.array(gpstime)
    if type(gpsweek) != np.ndarray:
        gpsweek = np.array(gpsweek)
    
    # Determine the satellite locations
    satXYZV = FindSat(ephem, gpstime, gpsweek)
    _, satXYZ, _ = _extract_pos_vel_arr(satXYZV) 
    el_az = find_elaz(rx_loc, satXYZ)
    el_r = np.deg2rad(el_az[:,0])
    
    # Calculate the WGS-84 latitude/longitude of the receiver
    WGS = ecef2geodetic(rx_loc)
    height = WGS[:,2]

    # Force height to be positive
    ind = np.argwhere(height < 0).flatten()
    if len(ind) > 0:
        height[ind] = 0
    
    # Calculate the delay
    tropoDelay = 2.47/(np.sin(el_r)+0.0121) * np.exp(-height*1.33e-4)/gpsconst.c

    return tropoDelay


##########################################################
### Code taken from Makela's Python code as is follows ###
##########################################################


def find_elaz(Rx, Sats):
    """
    Function: elaz(Rx, Sats)
    ---------------------
    Calculate the elevation and azimuth from a single receiver to multiple satellites.

    Inputs:
    -------
        Rx   : 1x3 vector containing [X, Y, Z] coordinate of receiver
        Sats : Nx3 array  containing [X, Y, Z] coordinates of satellites
        

    Outputs:
    --------
        elaz : Nx2 array containing the elevation and azimuth from the
               receiver to the requested satellites. Elevation and azimuth are
               given in decimal degrees.   

    Notes:
    ------
        Based from Jonathan Makela's GPS_elaz.m script

    History:
    --------
        7/15/15 Created, Jonathan Makela (jmakela@illinois.edu)

    """
    
    # check for 1D case:
    dim = len(Rx.shape)
    if dim == 1:
        Rx = np.reshape(Rx,(1,3))
        
    dim = len(Sats.shape)
    if dim == 1:
        Sats = np.reshape(Sats,(1,3))
    
    # Convert the receiver location to WGS84
    lla = ecef2geodetic(Rx)
    assert np.shape(lla)==(1,3)

    # Create variables with the latitude and longitude in radians
    lat = np.deg2rad(lla[0,0])
    lon = np.deg2rad(lla[0,1])

    # Create the 3 x 3 transform matrix from ECEF to VEN
    VEN = np.array([[ np.cos(lat)*np.cos(lon), np.cos(lat)*np.sin(lon), np.sin(lat)],
                    [-np.sin(lon), np.cos(lon), 0.],
                    [-np.sin(lat)*np.cos(lon), -np.sin(lat)*np.sin(lon), np.cos(lat)]])

    # Replicate the Rx array to be the same size as the satellite array
    Rx_array = np.ones_like(Sats) * Rx

    # Calculate the pseudorange for each satellite
    p = Sats - Rx_array
    
    # Calculate the length of this vector
    n = np.array([np.sqrt(p[:,0]**2 + p[:,1]**2 + p[:,2]**2)])
    
    # Create the normalized unit vector
    p = p / (np.ones_like(p) * n.T)
    
    # Perform the transform of the normalized psueodrange from ECEF to VEN
    p_VEN = np.dot(VEN, p.T)
    
    # Calculate elevation and azimuth in degrees
    ea = np.zeros([Sats.shape[0],2])
    ea[:,0] = np.rad2deg((np.pi/2. - np.arccos(p_VEN[0,:])))
    ea[:,1] = np.rad2deg(np.arctan2(p_VEN[1,:],p_VEN[2,:]))
    
    return ea