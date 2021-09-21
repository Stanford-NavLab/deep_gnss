%class ProjectionFactorPPPCal3DS2, see Doxygen page for details
%at http://research.cc.gatech.edu/borg/sites/edu.borg/html/index.html
%
%-------Constructors-------
%ProjectionFactorPPPCal3DS2(Point2 measured, Base noiseModel, size_t poseKey, size_t transformKey, size_t pointKey, Cal3DS2 k)
%ProjectionFactorPPPCal3DS2(Point2 measured, Base noiseModel, size_t poseKey, size_t transformKey, size_t pointKey, Cal3DS2 k, bool throwCheirality, bool verboseCheirality)
%
%-------Methods-------
%calibration() : returns gtsam::Cal3DS2
%measured() : returns gtsam::Point2
%throwCheirality() : returns bool
%verboseCheirality() : returns bool
%
classdef ProjectionFactorPPPCal3DS2 < gtsam.NoiseModelFactor
  properties
    ptr_gtsamProjectionFactorPPPCal3DS2 = 0
  end
  methods
    function obj = ProjectionFactorPPPCal3DS2(varargin)
      if (nargin == 2 || (nargin == 3 && strcmp(varargin{3}, 'void'))) && isa(varargin{1}, 'uint64') && varargin{1} == uint64(5139824614673773682)
        if nargin == 2
          my_ptr = varargin{2};
        else
          my_ptr = gtsam_unstable_wrapper(376, varargin{2});
        end
        base_ptr = gtsam_unstable_wrapper(375, my_ptr);
      elseif nargin == 6 && isa(varargin{1},'gtsam.Point2') && isa(varargin{2},'gtsam.noiseModel.Base') && isa(varargin{3},'numeric') && isa(varargin{4},'numeric') && isa(varargin{5},'numeric') && isa(varargin{6},'gtsam.Cal3DS2')
        [ my_ptr, base_ptr ] = gtsam_unstable_wrapper(377, varargin{1}, varargin{2}, varargin{3}, varargin{4}, varargin{5}, varargin{6});
      elseif nargin == 8 && isa(varargin{1},'gtsam.Point2') && isa(varargin{2},'gtsam.noiseModel.Base') && isa(varargin{3},'numeric') && isa(varargin{4},'numeric') && isa(varargin{5},'numeric') && isa(varargin{6},'gtsam.Cal3DS2') && isa(varargin{7},'logical') && isa(varargin{8},'logical')
        [ my_ptr, base_ptr ] = gtsam_unstable_wrapper(378, varargin{1}, varargin{2}, varargin{3}, varargin{4}, varargin{5}, varargin{6}, varargin{7}, varargin{8});
      else
        error('Arguments do not match any overload of gtsam.ProjectionFactorPPPCal3DS2 constructor');
      end
      obj = obj@gtsam.NoiseModelFactor(uint64(5139824614673773682), base_ptr);
      obj.ptr_gtsamProjectionFactorPPPCal3DS2 = my_ptr;
    end

    function delete(obj)
      gtsam_unstable_wrapper(379, obj.ptr_gtsamProjectionFactorPPPCal3DS2);
    end

    function display(obj), obj.print(''); end
    %DISPLAY Calls print on the object
    function disp(obj), obj.display; end
    %DISP Calls print on the object
    function varargout = calibration(this, varargin)
      % CALIBRATION usage: calibration() : returns gtsam::Cal3DS2
      % Doxygen can be found at http://research.cc.gatech.edu/borg/sites/edu.borg/html/index.html
      varargout{1} = gtsam_unstable_wrapper(380, this, varargin{:});
    end

    function varargout = measured(this, varargin)
      % MEASURED usage: measured() : returns gtsam::Point2
      % Doxygen can be found at http://research.cc.gatech.edu/borg/sites/edu.borg/html/index.html
      varargout{1} = gtsam_unstable_wrapper(381, this, varargin{:});
    end

    function varargout = throwCheirality(this, varargin)
      % THROWCHEIRALITY usage: throwCheirality() : returns bool
      % Doxygen can be found at http://research.cc.gatech.edu/borg/sites/edu.borg/html/index.html
      varargout{1} = gtsam_unstable_wrapper(382, this, varargin{:});
    end

    function varargout = verboseCheirality(this, varargin)
      % VERBOSECHEIRALITY usage: verboseCheirality() : returns bool
      % Doxygen can be found at http://research.cc.gatech.edu/borg/sites/edu.borg/html/index.html
      varargout{1} = gtsam_unstable_wrapper(383, this, varargin{:});
    end

  end

  methods(Static = true)
  end
end
