%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Author(s):    Shreyas Kousik
% Date:         21 September, 2021
% Desc:         Spline parameters for peak velocity
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

function [a,b,c] = spline_params_peak_speed(v_delta,a_delta,t_delta)
    M = [0 0 ;
         -12 6*t_delta ;
         6*t_delta -2*t_delta^2] ;
         
    out = (1/t_delta^3)*M*[v_delta;a_delta] ;
    a = out(1) ; b = out(2) ; c = out(3) ;
end