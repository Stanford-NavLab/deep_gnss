function varargout = perturbPose2(varargin)
      if length(varargin) == 4 && isa(varargin{1},'gtsam.Values') && isa(varargin{2},'double') && isa(varargin{3},'double') && isa(varargin{4},'numeric')
        gtsam_wrapper(2483, varargin{:});
      else
        error('Arguments do not match any overload of function gtsam.utilities.perturbPose2');
      end
