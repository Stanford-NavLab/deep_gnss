%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Author(s):    Shreyas Kousik
% Date:         21 September 2021
% Desc:         Dynamic model for kinematic unicycle
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
function x_new = dyn_kinematic_unicycle(t_s,x_cur,u_cur)
% x_new = dyn_kinematic_unicycle(t_s,x_cur,u_cur)
%
% Discrete-time nonlinear kinematic unicycle model. The control inputs are
% the acceleration a = [a_long ; a_lat] and yaw rate om
%
% Authors: Shreyas Kousik
% Created: 20 Apr 2021
% Updated: 22 Apr 2021

    % get current states
    p = x_cur(1:2) ;
    v = x_cur(3:4) ;
    h = x_cur(5) ;

    % get current inputs
    a = u_cur(1:2) ;
    om = u_cur(3) ;
    
    % get rotation matrix
    R = [cos(h), -sin(h) ; sin(h) cos(h)] ;

    % update states
    p_new = p + t_s .* v ;
    v_new = v + t_s .* R * a ;
    h_new = h + t_s .* om ;

    % create output
    x_new = [p_new ; v_new ; h_new] ;
end