%class PinholeCameraCal3DS2, see Doxygen page for details
%at http://research.cc.gatech.edu/borg/sites/edu.borg/html/index.html
%
%-------Constructors-------
%PinholeCameraCal3DS2()
%PinholeCameraCal3DS2(Pose3 pose)
%PinholeCameraCal3DS2(Pose3 pose, Cal3DS2 K)
%
%-------Methods-------
%backproject(Point2 p, double depth) : returns gtsam::Point3
%calibration() : returns gtsam::Cal3DS2
%dim() : returns size_t
%equals(PinholeCameraCal3DS2 camera, double tol) : returns bool
%localCoordinates(PinholeCameraCal3DS2 T2) : returns Vector
%pose() : returns gtsam::Pose3
%print(string s) : returns void
%project(Point3 point) : returns gtsam::Point2
%projectSafe(Point3 pw) : returns pair< gtsam::Point2, bool >
%range(Point3 point) : returns double
%range(Pose3 point) : returns double
%retract(Vector d) : returns gtsam::PinholeCameraCal3DS2
%
%-------Static Methods-------
%Dim() : returns size_t
%Level(Cal3DS2 K, Pose2 pose, double height) : returns gtsam::PinholeCameraCal3DS2
%Level(Pose2 pose, double height) : returns gtsam::PinholeCameraCal3DS2
%Lookat(Point3 eye, Point3 target, Point3 upVector, Cal3DS2 K) : returns gtsam::PinholeCameraCal3DS2
%project_to_camera(Point3 cameraPoint) : returns gtsam::Point2
%
%-------Serialization Interface-------
%string_serialize() : returns string
%string_deserialize(string serialized) : returns PinholeCameraCal3DS2
%
classdef PinholeCameraCal3DS2 < gtsam.Value
  properties
    ptr_gtsamPinholeCameraCal3DS2 = 0
  end
  methods
    function obj = PinholeCameraCal3DS2(varargin)
      if (nargin == 2 || (nargin == 3 && strcmp(varargin{3}, 'void'))) && isa(varargin{1}, 'uint64') && varargin{1} == uint64(5139824614673773682)
        if nargin == 2
          my_ptr = varargin{2};
        else
          my_ptr = gtsam_wrapper(416, varargin{2});
        end
        base_ptr = gtsam_wrapper(415, my_ptr);
      elseif nargin == 0
        [ my_ptr, base_ptr ] = gtsam_wrapper(417);
      elseif nargin == 1 && isa(varargin{1},'gtsam.Pose3')
        [ my_ptr, base_ptr ] = gtsam_wrapper(418, varargin{1});
      elseif nargin == 2 && isa(varargin{1},'gtsam.Pose3') && isa(varargin{2},'gtsam.Cal3DS2')
        [ my_ptr, base_ptr ] = gtsam_wrapper(419, varargin{1}, varargin{2});
      else
        error('Arguments do not match any overload of gtsam.PinholeCameraCal3DS2 constructor');
      end
      obj = obj@gtsam.Value(uint64(5139824614673773682), base_ptr);
      obj.ptr_gtsamPinholeCameraCal3DS2 = my_ptr;
    end

    function delete(obj)
      gtsam_wrapper(420, obj.ptr_gtsamPinholeCameraCal3DS2);
    end

    function display(obj), obj.print(''); end
    %DISPLAY Calls print on the object
    function disp(obj), obj.display; end
    %DISP Calls print on the object
    function varargout = backproject(this, varargin)
      % BACKPROJECT usage: backproject(Point2 p, double depth) : returns gtsam::Point3
      % Doxygen can be found at http://research.cc.gatech.edu/borg/sites/edu.borg/html/index.html
      if length(varargin) == 2 && isa(varargin{1},'gtsam.Point2') && isa(varargin{2},'double')
        varargout{1} = gtsam_wrapper(421, this, varargin{:});
      else
        error('Arguments do not match any overload of function gtsam.PinholeCameraCal3DS2.backproject');
      end
    end

    function varargout = calibration(this, varargin)
      % CALIBRATION usage: calibration() : returns gtsam::Cal3DS2
      % Doxygen can be found at http://research.cc.gatech.edu/borg/sites/edu.borg/html/index.html
      varargout{1} = gtsam_wrapper(422, this, varargin{:});
    end

    function varargout = dim(this, varargin)
      % DIM usage: dim() : returns size_t
      % Doxygen can be found at http://research.cc.gatech.edu/borg/sites/edu.borg/html/index.html
      varargout{1} = gtsam_wrapper(423, this, varargin{:});
    end

    function varargout = equals(this, varargin)
      % EQUALS usage: equals(PinholeCameraCal3DS2 camera, double tol) : returns bool
      % Doxygen can be found at http://research.cc.gatech.edu/borg/sites/edu.borg/html/index.html
      if length(varargin) == 2 && isa(varargin{1},'gtsam.PinholeCameraCal3DS2') && isa(varargin{2},'double')
        varargout{1} = gtsam_wrapper(424, this, varargin{:});
      else
        error('Arguments do not match any overload of function gtsam.PinholeCameraCal3DS2.equals');
      end
    end

    function varargout = localCoordinates(this, varargin)
      % LOCALCOORDINATES usage: localCoordinates(PinholeCameraCal3DS2 T2) : returns Vector
      % Doxygen can be found at http://research.cc.gatech.edu/borg/sites/edu.borg/html/index.html
      if length(varargin) == 1 && isa(varargin{1},'gtsam.PinholeCameraCal3DS2')
        varargout{1} = gtsam_wrapper(425, this, varargin{:});
      else
        error('Arguments do not match any overload of function gtsam.PinholeCameraCal3DS2.localCoordinates');
      end
    end

    function varargout = pose(this, varargin)
      % POSE usage: pose() : returns gtsam::Pose3
      % Doxygen can be found at http://research.cc.gatech.edu/borg/sites/edu.borg/html/index.html
      varargout{1} = gtsam_wrapper(426, this, varargin{:});
    end

    function varargout = print(this, varargin)
      % PRINT usage: print(string s) : returns void
      % Doxygen can be found at http://research.cc.gatech.edu/borg/sites/edu.borg/html/index.html
      if length(varargin) == 1 && isa(varargin{1},'char')
        gtsam_wrapper(427, this, varargin{:});
      else
        error('Arguments do not match any overload of function gtsam.PinholeCameraCal3DS2.print');
      end
    end

    function varargout = project(this, varargin)
      % PROJECT usage: project(Point3 point) : returns gtsam::Point2
      % Doxygen can be found at http://research.cc.gatech.edu/borg/sites/edu.borg/html/index.html
      if length(varargin) == 1 && isa(varargin{1},'gtsam.Point3')
        varargout{1} = gtsam_wrapper(428, this, varargin{:});
      else
        error('Arguments do not match any overload of function gtsam.PinholeCameraCal3DS2.project');
      end
    end

    function varargout = projectSafe(this, varargin)
      % PROJECTSAFE usage: projectSafe(Point3 pw) : returns pair< gtsam::Point2, bool >
      % Doxygen can be found at http://research.cc.gatech.edu/borg/sites/edu.borg/html/index.html
      if length(varargin) == 1 && isa(varargin{1},'gtsam.Point3')
        [ varargout{1} varargout{2} ] = gtsam_wrapper(429, this, varargin{:});
      else
        error('Arguments do not match any overload of function gtsam.PinholeCameraCal3DS2.projectSafe');
      end
    end

    function varargout = range(this, varargin)
      % RANGE usage: range(Point3 point), range(Pose3 point) : returns double
      % Doxygen can be found at http://research.cc.gatech.edu/borg/sites/edu.borg/html/index.html
      % 
      % Method Overloads
      % range(Point3 point)
      % range(Pose3 point)
      if length(varargin) == 1 && isa(varargin{1},'gtsam.Point3')
        varargout{1} = gtsam_wrapper(430, this, varargin{:});
      elseif length(varargin) == 1 && isa(varargin{1},'gtsam.Pose3')
        varargout{1} = gtsam_wrapper(431, this, varargin{:});
      else
        error('Arguments do not match any overload of function gtsam.PinholeCameraCal3DS2.range');
      end
    end

    function varargout = retract(this, varargin)
      % RETRACT usage: retract(Vector d) : returns gtsam::PinholeCameraCal3DS2
      % Doxygen can be found at http://research.cc.gatech.edu/borg/sites/edu.borg/html/index.html
      if length(varargin) == 1 && isa(varargin{1},'double')
        varargout{1} = gtsam_wrapper(432, this, varargin{:});
      else
        error('Arguments do not match any overload of function gtsam.PinholeCameraCal3DS2.retract');
      end
    end

    function varargout = string_serialize(this, varargin)
      % STRING_SERIALIZE usage: string_serialize() : returns string
      % Doxygen can be found at http://research.cc.gatech.edu/borg/sites/edu.borg/html/index.html
      if length(varargin) == 0
        varargout{1} = gtsam_wrapper(433, this, varargin{:});
      else
        error('Arguments do not match any overload of function gtsam.PinholeCameraCal3DS2.string_serialize');
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
        varargout{1} = gtsam_wrapper(434, varargin{:});
      else
        error('Arguments do not match any overload of function gtsam.PinholeCameraCal3DS2.Dim');
      end
    end

    function varargout = Level(varargin)
      % LEVEL usage: Level(Cal3DS2 K, Pose2 pose, double height), Level(Pose2 pose, double height) : returns gtsam::PinholeCameraCal3DS2
      % Doxygen can be found at http://research.cc.gatech.edu/borg/sites/edu.borg/html/index.html
      % 
      % Usage
      % LEVEL(Cal3DS2 K, Pose2 pose, double height)
      % LEVEL(Pose2 pose, double height)
      if length(varargin) == 3 && isa(varargin{1},'gtsam.Cal3DS2') && isa(varargin{2},'gtsam.Pose2') && isa(varargin{3},'double')
        varargout{1} = gtsam_wrapper(435, varargin{:});
      elseif length(varargin) == 2 && isa(varargin{1},'gtsam.Pose2') && isa(varargin{2},'double')
        varargout{1} = gtsam_wrapper(436, varargin{:});
      else
        error('Arguments do not match any overload of function gtsam.PinholeCameraCal3DS2.Level');
      end
    end

    function varargout = Lookat(varargin)
      % LOOKAT usage: Lookat(Point3 eye, Point3 target, Point3 upVector, Cal3DS2 K) : returns gtsam::PinholeCameraCal3DS2
      % Doxygen can be found at http://research.cc.gatech.edu/borg/sites/edu.borg/html/index.html
      % 
      % Usage
      % LOOKAT(Point3 eye, Point3 target, Point3 upVector, Cal3DS2 K)
      if length(varargin) == 4 && isa(varargin{1},'gtsam.Point3') && isa(varargin{2},'gtsam.Point3') && isa(varargin{3},'gtsam.Point3') && isa(varargin{4},'gtsam.Cal3DS2')
        varargout{1} = gtsam_wrapper(437, varargin{:});
      else
        error('Arguments do not match any overload of function gtsam.PinholeCameraCal3DS2.Lookat');
      end
    end

    function varargout = Project_to_camera(varargin)
      % PROJECT_TO_CAMERA usage: project_to_camera(Point3 cameraPoint) : returns gtsam::Point2
      % Doxygen can be found at http://research.cc.gatech.edu/borg/sites/edu.borg/html/index.html
      % 
      % Usage
      % PROJECT_TO_CAMERA(Point3 cameraPoint)
      if length(varargin) == 1 && isa(varargin{1},'gtsam.Point3')
        varargout{1} = gtsam_wrapper(438, varargin{:});
      else
        error('Arguments do not match any overload of function gtsam.PinholeCameraCal3DS2.Project_to_camera');
      end
    end

    function varargout = string_deserialize(varargin)
      % STRING_DESERIALIZE usage: string_deserialize() : returns gtsam.PinholeCameraCal3DS2
      % Doxygen can be found at http://research.cc.gatech.edu/borg/sites/edu.borg/html/index.html
      if length(varargin) == 1
        varargout{1} = gtsam_wrapper(439, varargin{:});
      else
        error('Arguments do not match any overload of function gtsam.PinholeCameraCal3DS2.string_deserialize');
      end
    end

    function obj = loadobj(sobj)
      % LOADOBJ Saves the object to a matlab-readable format
      obj = gtsam.PinholeCameraCal3DS2.string_deserialize(sobj);
    end
  end
end
