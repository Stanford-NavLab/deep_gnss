%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Author(s):    Shreyas Kousik
% Date:         21 September 2021
% Desc:         Plot 2D path for general state vector with position
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
function h = plot_path(P,varargin)
% plot_path(P,'property1',value1,'property2',value2,...)
% handle = plot_path(...)
%
% Plot a 2-by-N or 3-by-N array P, where each column of P is a point on a
% path. If the input has more than 3 rows, it is assumed that the first two
% rows contain the path, and the resulting plot is 2-D
%
% Author: Shreyas Kousik
% Created: 2019
% Updated: 24 Mar 2020

    if size(P,1) == 3
        h = plot3(P(1,:),P(2,:),P(3,:),varargin{:}) ;
    else
        h = plot(P(1,:),P(2,:),varargin{:}) ;
    end
    
    if nargout < 1
        clear h
    end
end
