function varargout = createKeyVector(varargin)
      if length(varargin) == 1 && isa(varargin{1},'double')
        varargout{1} = gtsam_wrapper(2459, varargin{:});
      elseif length(varargin) == 2 && isa(varargin{1},'char') && isa(varargin{2},'double')
        varargout{1} = gtsam_wrapper(2460, varargin{:});
      else
        error('Arguments do not match any overload of function gtsam.utilities.createKeyVector');
      end
