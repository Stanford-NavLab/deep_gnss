%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Author(s):    Ashwin Kanhere
% Date:         21st May, 2021
% Desc:         Generate and save random 2D trajectories. Core functions taken from the
%               Chimera stochastic reachability project, written by Shreyas Kousik and
%               using Mark Mueller's paper
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

clc;
clear;
close all;
%% user parameters
% sample time
save = true;
plot = false;
t_end = 30*60; %Length of trajectory in minutes
trajects = 10; %Number of trajectories to be generated
seg_time = 60; % Set to constant for now
segments = (t_end/seg_time);
t_s = 0.1 ; % [s]

% initial conditions
p_0 = zeros(2,1) ;
v_0 = zeros(2,1) ;
h_0 = 0 ;
a_0 = 0 ;
om_0 = 0 ;


v_bound = 32; % The maximum velocity of a car on a freeway (70 mph)
deltav_bound = 5; % The maximum deviation between two times
h_bound = pi;
deltah_bound = pi/10; % The maximum angular deviation between two times
%% Initialize parameters to store data
init_LLA = zeros(segments, 3);
trajectories = cell(trajects, 1);
%% Creating trajectories using random V and H parameters
for num=1:trajects
    init_LLA = [37.427112, -122.1764146, 16]
    T = linspace(0, t_end, segments) ; % [s]
    V = zeros(1, segments) ; % [m/s]
    H = zeros(1, segments) ; % [rad]
    for part=2:segments
        V(part) = V(part-1) + deltav_bound*(2*rand(1)-1); 
        if abs(V(part))>v_bound, V(part)=sign(V(part))*v_bound; end % ensure bound not exceeded
        H(part) = H(part-1) + deltah_bound*(2*rand(1)-1);
        if abs(H(part))>h_bound, H(part)=sign(H(part))*h_bound; end 
    end

    % initial conditions
    p_0 = zeros(2,1) ;
    v_0 = zeros(2,1) ;
    h_0 = 0 ;
    a_0 = 0 ;
    om_0 = 0 ;
    %% Generate trajectories
    % make initial condition
    x_0 = [p_0 ; v_0 ; h_0] ;

    % create le spline
    [X,A,Om,T_out] = make_traj_kinematic_unicycle(T,V,H,t_s,x_0,a_0,om_0) ;
    trajectories{num}.X = X(1:2, :);
    trajectories{num}.T = T_out;
    if save
        save_data = [T_out; X(1:2,:)];
        writematrix(save_data, '../../../data/training/POC/matlab_trajectories/traject_'+string(num-1)+'.csv');
    end
end

%% plotting
if plot
    for num=1:trajects
            figure;
            hold on; axis equal; grid on
            X = trajectories{num}.X;
            plot_path(X(1:2,:),'r-')
            plot_path(X(1:2,1),'ro') % start
            plot_path(X(1:2,end),'rx') % end
    end
    xlabel('p_1 [m]')
    ylabel('p_2 [m]')
    title('position trajectory number')
    set(gca,'fontsize',15)
    
    % set all linewidths to be thicc
    h = findall(gcf,'Type','Line') ;
    for idx = 1:length(h)
        h(idx).LineWidth = 1.25 ;
    end
end
