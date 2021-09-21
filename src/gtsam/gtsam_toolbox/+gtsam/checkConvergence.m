function varargout = checkConvergence(varargin)
      if length(varargin) == 5 && isa(varargin{1},'double') && isa(varargin{2},'double') && isa(varargin{3},'double') && isa(varargin{4},'double') && isa(varargin{5},'double')
        varargout{1} = gtsam_wrapper(2454, varargin{:});
      else
        error('Arguments do not match any overload of function gtsam.checkConvergence');
      end
