%class StereoCamera, see Doxygen page for details
%at http://research.cc.gatech.edu/borg/sites/edu.borg/html/index.html
%
%-------Constructors-------
%StereoCamera()
%StereoCamera(Pose3 pose, Cal3_S2Stereo K)
%
%-------Methods-------
%backproject(StereoPoint2 p) : returns gtsam::Point3
%baseline() : returns double
%calibration() : returns gtsam::Cal3_S2Stereo
%dim() : returns size_t
%equals(StereoCamera camera, double tol) : returns bool
%localCoordinates(StereoCamera T2) : returns Vector
%pose() : returns gtsam::Pose3
%print(string s) : returns void
%project(Point3 point) : returns gtsam::StereoPoint2
%retract(Vector d) : returns gtsam::StereoCamera
%
%-------Static Methods-------
%Dim() : returns size_t
%
%-------Serialization Interface-------
%string_serialize() : returns string
%string_deserialize(string serialized) : returns StereoCamera
%
classdef StereoCamera < gtsam.Value
  properties
    ptr_gtsamStereoCamera = 0
  end
  methods
    function obj = StereoCamera(varargin)
      if (nargin == 2 || (nargin == 3 && strcmp(varargin{3}, 'void'))) && isa(varargin{1}, 'uint64') && varargin{1} == uint64(5139824614673773682)
        if nargin == 2
          my_ptr = varargin{2};
        else
          my_ptr = gtsam_wrapper(441, varargin{2});
        end
        base_ptr = gtsam_wrapper(440, my_ptr);
      elseif nargin == 0
        [ my_ptr, base_ptr ] = gtsam_wrapper(442);
      elseif nargin == 2 && isa(varargin{1},'gtsam.Pose3') && isa(varargin{2},'gtsam.Cal3_S2Stereo')
        [ my_ptr, base_ptr ] = gtsam_wrapper(443, varargin{1}, varargin{2});
      else
        error('Arguments do not match any overload of gtsam.StereoCamera constructor');
      end
      obj = obj@gtsam.Value(uint64(5139824614673773682), base_ptr);
      obj.ptr_gtsamStereoCamera = my_ptr;
    end

    function delete(obj)
      gtsam_wrapper(444, obj.ptr_gtsamStereoCamera);
    end

    function display(obj), obj.print(''); end
    %DISPLAY Calls print on the object
    function disp(obj), obj.display; end
    %DISP Calls print on the object
    function varargout = backproject(this, varargin)
      % BACKPROJECT usage: backproject(StereoPoint2 p) : returns gtsam::Point3
      % Doxygen can be found at http://research.cc.gatech.edu/borg/sites/edu.borg/html/index.html
      if length(varargin) == 1 && isa(varargin{1},'gtsam.StereoPoint2')
        varargout{1} = gtsam_wrapper(445, this, varargin{:});
      else
        error('Arguments do not match any overload of function gtsam.StereoCamera.backproject');
      end
    end

    function varargout = baseline(this, varargin)
      % BASELINE usage: baseline() : returns double
      % Doxygen can be found at http://research.cc.gatech.edu/borg/sites/edu.borg/html/index.html
      varargout{1} = gtsam_wrapper(446, this, varargin{:});
    end

    function varargout = calibration(this, varargin)
      % CALIBRATION usage: calibration() : returns gtsam::Cal3_S2Stereo
      % Doxygen can be found at http://research.cc.gatech.edu/borg/sites/edu.borg/html/index.html
      varargout{1} = gtsam_wrapper(447, this, varargin{:});
    end

    function varargout = dim(this, varargin)
      % DIM usage: dim() : returns size_t
      % Doxygen can be found at http://research.cc.gatech.edu/borg/sites/edu.borg/html/index.html
      varargout{1} = gtsam_wrapper(448, this, varargin{:});
    end

    function varargout = equals(this, varargin)
      % EQUALS usage: equals(StereoCamera camera, double tol) : returns bool
      % Doxygen can be found at http://research.cc.gatech.edu/borg/sites/edu.borg/html/index.html
      if length(varargin) == 2 && isa(varargin{1},'gtsam.StereoCamera') && isa(varargin{2},'double')
        varargout{1} = gtsam_wrapper(449, this, varargin{:});
      else
        error('Arguments do not match any overload of function gtsam.StereoCamera.equals');
      end
    end

    function varargout = localCoordinates(this, varargin)
      % LOCALCOORDINATES usage: localCoordinates(StereoCamera T2) : returns Vector
      % Doxygen can be found at http://research.cc.gatech.edu/borg/sites/edu.borg/html/index.html
      if length(varargin) == 1 && isa(varargin{1},'gtsam.StereoCamera')
        varargout{1} = gtsam_wrapper(450, this, varargin{:});
      else
        error('Arguments do not match any overload of function gtsam.StereoCamera.localCoordinates');
      end
    end

    function varargout = pose(this, varargin)
      % POSE usage: pose() : returns gtsam::Pose3
      % Doxygen can be found at http://research.cc.gatech.edu/borg/sites/edu.borg/html/index.html
      varargout{1} = gtsam_wrapper(451, this, varargin{:});
    end

    function varargout = print(this, varargin)
      % PRINT usage: print(string s) : returns void
      % Doxygen can be found at http://research.cc.gatech.edu/borg/sites/edu.borg/html/index.html
      if length(varargin) == 1 && isa(varargin{1},'char')
        gtsam_wrapper(452, this, varargin{:});
      else
        error('Arguments do not match any overload of function gtsam.StereoCamera.print');
      end
    end

    function varargout = project(this, varargin)
      % PROJECT usage: project(Point3 point) : returns gtsam::StereoPoint2
      % Doxygen can be found at http://research.cc.gatech.edu/borg/sites/edu.borg/html/index.html
      if length(varargin) == 1 && isa(varargin{1},'gtsam.Point3')
        varargout{1} = gtsam_wrapper(453, this, varargin{:});
      else
        error('Arguments do not match any overload of function gtsam.StereoCamera.project');
      end
    end

    function varargout = retract(this, varargin)
      % RETRACT usage: retract(Vector d) : returns gtsam::StereoCamera
      % Doxygen can be found at http://research.cc.gatech.edu/borg/sites/edu.borg/html/index.html
      if length(varargin) == 1 && isa(varargin{1},'double')
        varargout{1} = gtsam_wrapper(454, this, varargin{:});
      else
        error('Arguments do not match any overload of function gtsam.StereoCamera.retract');
      end
    end

    function varargout = string_serialize(this, varargin)
      % STRING_SERIALIZE usage: string_serialize() : returns string
      % Doxygen can be found at http://research.cc.gatech.edu/borg/sites/edu.borg/html/index.html
      if length(varargin) == 0
        varargout{1} = gtsam_wrapper(455, this, varargin{:});
      else
        error('Arguments do not match any overload of function gtsam.StereoCamera.string_serialize');
      end
    end

    function sobj = saveobj(obj)
      % SAVEOBJ Saves the object to a matlab-readable format
      sobj = obj.string_serialize();
    end
  end

  methods(Static = true)
    function varargout = Dim(varargin)
      % DIM usage: Dim() : returns size_t
      % Doxygen can be found at http://research.cc.gatech.edu/borg/sites/edu.borg/html/index.html
      % 
      % Usage
      % DIM()
      if length(varargin) == 0
        varargout{1} = gtsam_wrapper(456, varargin{:});
      else
        error('Arguments do not match any overload of function gtsam.StereoCamera.Dim');
      end
    end

    function varargout = string_deserialize(varargin)
      % STRING_DESERIALIZE usage: string_deserialize() : returns gtsam.StereoCamera
      % Doxygen can be found at http://research.cc.gatech.edu/borg/sites/edu.borg/html/index.html
      if length(varargin) == 1
        varargout{1} = gtsam_wrapper(457, varargin{:});
      else
        error('Arguments do not match any overload of function gtsam.StereoCamera.string_deserialize');
      end
    end

    function obj = loadobj(sobj)
      % LOADOBJ Saves the object to a matlab-readable format
      obj = gtsam.StereoCamera.string_deserialize(sobj);
    end
  end
end
