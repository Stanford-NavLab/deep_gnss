function varargout = readG2o(varargin)
      if length(varargin) == 1 && isa(varargin{1},'char')
        [ varargout{1} varargout{2} ] = gtsam_wrapper(2490, varargin{:});
      else
        error('Arguments do not match any overload of function gtsam.readG2o');
      end
