%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Author(s):    Shreyas Kousik
% Date:         21 September 2021
% Desc:         Splinic interpolation
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
function S = make_spline(T_in,p_0,v_0,a_0,a,b,c)
    % position:
    P = (a/120).*T_in.^5 + (b/24).*T_in.^4 + (c/6).*T_in.^3 + (a_0/2).*T_in.^2 + v_0.*T_in + p_0 ;
    
    % speed:
    V = (a/24).*T_in.^4 + (b/6).*T_in.^3 + (c/2).*T_in.^2 + (a_0(1)).*T_in + v_0 ;
    
    % acceleration:
    A = (a/6).*T_in.^3 + (b/2).*T_in.^2 + (c).*T_in + a_0 ;
    
    % create output spline
    S = [P ; V ; A] ;
end