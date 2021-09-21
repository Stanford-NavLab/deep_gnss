%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Author(s):    Shreyas Kousik
% Date:         21 September, 2021
% Desc:         Spline parameters for desired position
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

function [a,b,c] = spline_params_desired_position(p_delta,v_delta,a_delta,t_delta)
    M = [720, -360*t_delta, 60*t_delta^2 ;
         -360*t_delta, 168*t_delta^2, -24*t_delta^3 ;
         60*t_delta^2, -24*t_delta^3, 3*t_delta^4] ;
         
    out = (1/t_delta^5)*M*[p_delta;v_delta;a_delta] ;
    a = out(1) ; b = out(2) ; c = out(3) ;
end