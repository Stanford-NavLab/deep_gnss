%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Author(s):    Shreyas Kousik, Ashwin Kanhere
% Date:         21 September 2021
% Desc:         Simulate trajectory for kinematic unicycle
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
function [X,A,Om,T_out] = make_traj_kinematic_unicycle(T,V,H,t_s,x_0,a_0,om_0)
% [X,A,Om] = make_traj_kinematic_unicycle(T,V,H,t_s,x_0,a_0,om_0)
%
% Given a time vector T, a velocity vector V, and a heading vector H,
% create a state trajectory X that achieves the desired velocity and
% heading profile and are sampled at a rate of t_s.
%
% The second output is the true angular velocity. The third output is the
% true longitudinal acceleration.
%
% The optional inputs are the sampling time t_s, the initial longitudinal
% acceleration a_0, and the initial yaw rate om_0.
%
% To do this, we leverage the analytical splines from [1].
%
% [1] Mueller, M., et al., "A Computationally Efficient Motion Primitive
%     for Quadrocopter Trajectory Generation," T-RO 2015
%
% Authors: Shreyas Kousik
% Created: 19 Apr 2021
% Updated: 11 May 2021 (Ashwin Kanhere, added length assertion statement)

    %% setup
    % check that length of input time, heading and velocity is same
    assert(length(T)==length(V) && length(T)==length(H), 'Inconsistent length of inputs')
    % default initial acceleration
    if nargin < 6
        a_0 = 0 ;
    end

    % default initial yaw rate
    if nargin < 7
        om_0 = 0 ;
    end
    
    % take a (pretty good) guess at the initial speed ASSUMING IT IS
    % POSITIVE
    v_0 = vecnorm(x_0(3:4),2) ;

    % initialize yaw rate, long velocity, and long acceleration profiles
    Om = om_0 ; % yaw rate
    V_long = v_0 ; % longitudinal velocity
    A_long = a_0 ; % longitudinal (body frame) acceleration
    
    %% sanity check the input
    v_check = abs(V(1) - vecnorm(x_0(3:4),2)) < 1e-6 ;
    if ~v_check
        warning(['The initial state is different from the specified initial',...
            'velocity in the velocity spec V.'])
    end

    %% build yaw rate and accel profiles
    % iterate through times, generate each time-varying trajectory, and stitch
    % together the output
    n_segments = length(T) ;
    for idx = 1:(n_segments-1)
        %% time
        t_start = T(idx) ;
        t_end = T(idx+1) ;
        t_delta = t_end - t_start ;
        T_s = 0:t_s:t_delta ;

        %% angular velocity
        % set up heading profile (NOTE! WE'RE NOT DOING ANYTHING CLEVER ABOUT
        % WRAPPING THINGS AROUND TO [0,2*pi))
        h_start = H(idx) ;
        h_end = H(idx+1) ;

        % set up yaw rate profile
        if idx == 1
            om_start = om_0 ;
        else
            om_start = om_end ;
        end
        om_end = 0 ; % we assume 0 yaw rate/acceleration at each heading
        
        % ccmpute deltas (yaw accelerations are assumed to be 0 initially)
        h_delta = h_end - h_start - om_start*t_delta ;
        om_delta = om_end - om_start ;

        % compute angular velocity spline
        [a_w,b_w,c_w] = spline_params_desired_position(h_delta,om_delta,0,t_delta) ;
        S_ang = make_spline(T_s,h_start,om_start,0,a_w,b_w,c_w) ;

        %% longitudinal acceleration
        % setup velocity profile
        v_start = V(idx) ;
        v_end = V(idx+1) ;

        % setup acceleration profile
        if idx == 1
            a_start = a_0 ;
        else
            a_start = 0 ;
        end
        a_end = 0 ; % by default we assume the acceleration is 0
        
        % compute deltas
        v_delta = v_end - v_start - a_start*t_delta ;
        a_delta = a_end - a_start ;

        % compute longitudinal position/velocity/acceleration spline
        [a_v,b_v,c_v] = spline_params_peak_speed(v_delta,a_delta,t_delta) ;
        p_0 = 0 ; % default
        S_long = make_spline(T_s,p_0,v_start,a_start,a_v,b_v,c_v) ;

        %% update the ang vel and accel arrays
        % get the splinez
        Om_idx = S_ang(2,:) ; % yaw rate
        V_long_idx = S_long(2,:) ; % velocity
        A_long_idx = S_long(3,:) ; % acceleration

        % append 'em
        Om = [Om, Om_idx(2:end)] ;
        V_long = [V_long, V_long_idx(2:end)] ;
        A_long = [A_long, A_long_idx(2:end)] ;
    end
    
    %% back out lateral acceleration
    % this uses a kinematic unicycle assumption; check it out here
    % https://www.sciencedirect.com/topics/engineering/lateral-acceleration
    %
    % basically, a_lat = omega * v_long
    A_lat = Om.*V_long ;
    A = [A_long ; A_lat] ; % body-frame acceleration profile

    %% forward integrate the splines
    % NOTE! this currently uses the nominal model in the paper, but we
    % could generalize it to a different model

    % total number of time steps
    n_T = length(Om) ;
    T_out = T(1) + t_s.*(0:(n_T-1)) ; % output (optional) time vec

    % initialize state trajectory
    X = [x_0, nan(5, n_T - 1)] ;

    % initial input trajectory
    U = [A ; Om] ; % NOTE the order here is long accel then ang vel

    for t_idx = 2:n_T
        X(:,t_idx) = dyn_kinematic_unicycle(t_s,X(:,t_idx-1),U(:,t_idx-1)) ;
    end
end