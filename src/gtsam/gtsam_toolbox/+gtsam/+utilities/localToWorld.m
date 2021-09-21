function varargout = localToWorld(varargin)
      if length(varargin) == 2 && isa(varargin{1},'gtsam.Values') && isa(varargin{2},'gtsam.Pose2')
        varargout{1} = gtsam_wrapper(2475, varargin{:});
      elseif length(varargin) == 3 && isa(varargin{1},'gtsam.Values') && isa(varargin{2},'gtsam.Pose2') && isa(varargin{3},'gtsam.KeyVector')
        varargout{1} = gtsam_wrapper(2476, varargin{:});
      else
        error('Arguments do not match any overload of function gtsam.utilities.localToWorld');
      end
