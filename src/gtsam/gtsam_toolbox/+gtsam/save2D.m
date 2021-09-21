function varargout = save2D(varargin)
      if length(varargin) == 4 && isa(varargin{1},'gtsam.NonlinearFactorGraph') && isa(varargin{2},'gtsam.Values') && isa(varargin{3},'gtsam.noiseModel.Diagonal') && isa(varargin{4},'char')
        gtsam_wrapper(2492, varargin{:});
      else
        error('Arguments do not match any overload of function gtsam.save2D');
      end
