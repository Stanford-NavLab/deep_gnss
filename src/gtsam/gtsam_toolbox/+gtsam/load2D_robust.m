function varargout = load2D_robust(varargin)
      if length(varargin) == 2 && isa(varargin{1},'char') && isa(varargin{2},'gtsam.noiseModel.Base')
        [ varargout{1} varargout{2} ] = gtsam_wrapper(2474, varargin{:});
      else
        error('Arguments do not match any overload of function gtsam.load2D_robust');
      end
