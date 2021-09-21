%class ProjectionFactorPPPCCal3_S2, see Doxygen page for details
%at http://research.cc.gatech.edu/borg/sites/edu.borg/html/index.html
%
%-------Constructors-------
%ProjectionFactorPPPCCal3_S2(Point2 measured, Base noiseModel, size_t poseKey, size_t transformKey, size_t pointKey, size_t calibKey)
%ProjectionFactorPPPCCal3_S2(Point2 measured, Base noiseModel, size_t poseKey, size_t transformKey, size_t pointKey, size_t calibKey, bool throwCheirality, bool verboseCheirality)
%
%-------Methods-------
%measured() : returns gtsam::Point2
%throwCheirality() : returns bool
%verboseCheirality() : returns bool
%
classdef ProjectionFactorPPPCCal3_S2 < gtsam.NoiseModelFactor
  properties
    ptr_gtsamProjectionFactorPPPCCal3_S2 = 0
  end
  methods
    function obj = ProjectionFactorPPPCCal3_S2(varargin)
      if (nargin == 2 || (nargin == 3 && strcmp(varargin{3}, 'void'))) && isa(varargin{1}, 'uint64') && varargin{1} == uint64(5139824614673773682)
        if nargin == 2
          my_ptr = varargin{2};
        else
          my_ptr = gtsam_unstable_wrapper(385, varargin{2});
        end
        base_ptr = gtsam_unstable_wrapper(384, my_ptr);
      elseif nargin == 6 && isa(varargin{1},'gtsam.Point2') && isa(varargin{2},'gtsam.noiseModel.Base') && isa(varargin{3},'numeric') && isa(varargin{4},'numeric') && isa(varargin{5},'numeric') && isa(varargin{6},'numeric')
        [ my_ptr, base_ptr ] = gtsam_unstable_wrapper(386, varargin{1}, varargin{2}, varargin{3}, varargin{4}, varargin{5}, varargin{6});
      elseif nargin == 8 && isa(varargin{1},'gtsam.Point2') && isa(varargin{2},'gtsam.noiseModel.Base') && isa(varargin{3},'numeric') && isa(varargin{4},'numeric') && isa(varargin{5},'numeric') && isa(varargin{6},'numeric') && isa(varargin{7},'logical') && isa(varargin{8},'logical')
        [ my_ptr, base_ptr ] = gtsam_unstable_wrapper(387, varargin{1}, varargin{2}, varargin{3}, varargin{4}, varargin{5}, varargin{6}, varargin{7}, varargin{8});
      else
        error('Arguments do not match any overload of gtsam.ProjectionFactorPPPCCal3_S2 constructor');
      end
      obj = obj@gtsam.NoiseModelFactor(uint64(5139824614673773682), base_ptr);
      obj.ptr_gtsamProjectionFactorPPPCCal3_S2 = my_ptr;
    end

    function delete(obj)
      gtsam_unstable_wrapper(388, obj.ptr_gtsamProjectionFactorPPPCCal3_S2);
    end

    function display(obj), obj.print(''); end
    %DISPLAY Calls print on the object
    function disp(obj), obj.display; end
    %DISP Calls print on the object
    function varargout = measured(this, varargin)
      % MEASURED usage: measured() : returns gtsam::Point2
      % Doxygen can be found at http://research.cc.gatech.edu/borg/sites/edu.borg/html/index.html
      varargout{1} = gtsam_unstable_wrapper(389, this, varargin{:});
    end

    function varargout = throwCheirality(this, varargin)
      % THROWCHEIRALITY usage: throwCheirality() : returns bool
      % Doxygen can be found at http://research.cc.gatech.edu/borg/sites/edu.borg/html/index.html
      varargout{1} = gtsam_unstable_wrapper(390, this, varargin{:});
    end

    function varargout = verboseCheirality(this, varargin)
      % VERBOSECHEIRALITY usage: verboseCheirality() : returns bool
      % Doxygen can be found at http://research.cc.gatech.edu/borg/sites/edu.borg/html/index.html
      varargout{1} = gtsam_unstable_wrapper(391, this, varargin{:});
    end

  end

  methods(Static = true)
  end
end
