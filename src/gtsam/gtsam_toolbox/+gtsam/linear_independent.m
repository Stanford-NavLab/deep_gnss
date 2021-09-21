function varargout = linear_independent(varargin)
      if length(varargin) == 3 && isa(varargin{1},'double') && isa(varargin{2},'double') && isa(varargin{3},'double')
        varargout{1} = gtsam_wrapper(2468, varargin{:});
      else
        error('Arguments do not match any overload of function gtsam.linear_independent');
      end
