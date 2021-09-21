%class CalibratedCamera, see Doxygen page for details
%at http://research.cc.gatech.edu/borg/sites/edu.borg/html/index.html
%
%-------Constructors-------
%CalibratedCamera()
%CalibratedCamera(Pose3 pose)
%CalibratedCamera(Vector v)
%
%-------Methods-------
%compose(CalibratedCamera c) : returns gtsam::CalibratedCamera
%dim() : returns size_t
%equals(CalibratedCamera camera, double tol) : returns bool
%inverse() : returns gtsam::CalibratedCamera
%localCoordinates(CalibratedCamera T2) : returns Vector
%pose() : returns gtsam::Pose3
%print(string s) : returns void
%project(Point3 point) : returns gtsam::Point2
%range(Point3 p) : returns double
%retract(Vector d) : returns gtsam::CalibratedCamera
%
%-------Static Methods-------
%Dim() : returns size_t
%Level(Pose2 pose2, double height) : returns gtsam::CalibratedCamera
%project_to_camera(Point3 cameraPoint) : returns gtsam::Point2
%
%-------Serialization Interface-------
%string_serialize() : returns string
%string_deserialize(string serialized) : returns CalibratedCamera
%
classdef CalibratedCamera < gtsam.Value
  properties
    ptr_gtsamCalibratedCamera = 0
  end
  methods
    function obj = CalibratedCamera(varargin)
      if (nargin == 2 || (nargin == 3 && strcmp(varargin{3}, 'void'))) && isa(varargin{1}, 'uint64') && varargin{1} == uint64(5139824614673773682)
        if nargin == 2
          my_ptr = varargin{2};
        else
          my_ptr = gtsam_wrapper(370, varargin{2});
        end
        base_ptr = gtsam_wrapper(369, my_ptr);
      elseif nargin == 0
        [ my_ptr, base_ptr ] = gtsam_wrapper(371);
      elseif nargin == 1 && isa(varargin{1},'gtsam.Pose3')
        [ my_ptr, base_ptr ] = gtsam_wrapper(372, varargin{1});
      elseif nargin == 1 && isa(varargin{1},'double')
        [ my_ptr, base_ptr ] = gtsam_wrapper(373, varargin{1});
      else
        error('Arguments do not match any overload of gtsam.CalibratedCamera constructor');
      end
      obj = obj@gtsam.Value(uint64(5139824614673773682), base_ptr);
      obj.ptr_gtsamCalibratedCamera = my_ptr;
    end

    function delete(obj)
      gtsam_wrapper(374, obj.ptr_gtsamCalibratedCamera);
    end

    function display(obj), obj.print(''); end
    %DISPLAY Calls print on the object
    function disp(obj), obj.display; end
    %DISP Calls print on the object
    function varargout = compose(this, varargin)
      % COMPOSE usage: compose(CalibratedCamera c) : returns gtsam::CalibratedCamera
      % Doxygen can be found at http://research.cc.gatech.edu/borg/sites/edu.borg/html/index.html
      if length(varargin) == 1 && isa(varargin{1},'gtsam.CalibratedCamera')
        varargout{1} = gtsam_wrapper(375, this, varargin{:});
      else
        error('Arguments do not match any overload of function gtsam.CalibratedCamera.compose');
      end
    end

    function varargout = dim(this, varargin)
      % DIM usage: dim() : returns size_t
      % Doxygen can be found at http://research.cc.gatech.edu/borg/sites/edu.borg/html/index.html
      varargout{1} = gtsam_wrapper(376, this, varargin{:});
    end

    function varargout = equals(this, varargin)
      % EQUALS usage: equals(CalibratedCamera camera, double tol) : returns bool
      % Doxygen can be found at http://research.cc.gatech.edu/borg/sites/edu.borg/html/index.html
      if length(varargin) == 2 && isa(varargin{1},'gtsam.CalibratedCamera') && isa(varargin{2},'double')
        varargout{1} = gtsam_wrapper(377, this, varargin{:});
      else
        error('Arguments do not match any overload of function gtsam.CalibratedCamera.equals');
      end
    end

    function varargout = inverse(this, varargin)
      % INVERSE usage: inverse() : returns gtsam::CalibratedCamera
      % Doxygen can be found at http://research.cc.gatech.edu/borg/sites/edu.borg/html/index.html
      varargout{1} = gtsam_wrapper(378, this, varargin{:});
    end

    function varargout = localCoordinates(this, varargin)
      % LOCALCOORDINATES usage: localCoordinates(CalibratedCamera T2) : returns Vector
      % Doxygen can be found at http://research.cc.gatech.edu/borg/sites/edu.borg/html/index.html
      if length(varargin) == 1 && isa(varargin{1},'gtsam.CalibratedCamera')
        varargout{1} = gtsam_wrapper(379, this, varargin{:});
      else
        error('Arguments do not match any overload of function gtsam.CalibratedCamera.localCoordinates');
      end
    end

    function varargout = pose(this, varargin)
      % POSE usage: pose() : returns gtsam::Pose3
      % Doxygen can be found at http://research.cc.gatech.edu/borg/sites/edu.borg/html/index.html
      varargout{1} = gtsam_wrapper(380, this, varargin{:});
    end

    function varargout = print(this, varargin)
      % PRINT usage: print(string s) : returns void
      % Doxygen can be found at http://research.cc.gatech.edu/borg/sites/edu.borg/html/index.html
      if length(varargin) == 1 && isa(varargin{1},'char')
        gtsam_wrapper(381, this, varargin{:});
      else
        error('Arguments do not match any overload of function gtsam.CalibratedCamera.print');
      end
    end

    function varargout = project(this, varargin)
      % PROJECT usage: project(Point3 point) : returns gtsam::Point2
      % Doxygen can be found at http://research.cc.gatech.edu/borg/sites/edu.borg/html/index.html
      if length(varargin) == 1 && isa(varargin{1},'gtsam.Point3')
        varargout{1} = gtsam_wrapper(382, this, varargin{:});
      else
        error('Arguments do not match any overload of function gtsam.CalibratedCamera.project');
      end
    end

    function varargout = range(this, varargin)
      % RANGE usage: range(Point3 p) : returns double
      % Doxygen can be found at http://research.cc.gatech.edu/borg/sites/edu.borg/html/index.html
      if length(varargin) == 1 && isa(varargin{1},'gtsam.Point3')
        varargout{1} = gtsam_wrapper(383, this, varargin{:});
      else
        error('Arguments do not match any overload of function gtsam.CalibratedCamera.range');
      end
    end

    function varargout = retract(this, varargin)
      % RETRACT usage: retract(Vector d) : returns gtsam::CalibratedCamera
      % Doxygen can be found at http://research.cc.gatech.edu/borg/sites/edu.borg/html/index.html
      if length(varargin) == 1 && isa(varargin{1},'double')
        varargout{1} = gtsam_wrapper(384, this, varargin{:});
      else
        error('Arguments do not match any overload of function gtsam.CalibratedCamera.retract');
      end
    end

    function varargout = string_serialize(this, varargin)
      % STRING_SERIALIZE usage: string_serialize() : returns string
      % Doxygen can be found at http://research.cc.gatech.edu/borg/sites/edu.borg/html/index.html
      if length(varargin) == 0
        varargout{1} = gtsam_wrapper(385, this, varargin{:});
      else
        error('Arguments do not match any overload of function gtsam.CalibratedCamera.string_serialize');
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
        varargout{1} = gtsam_wrapper(386, varargin{:});
      else
        error('Arguments do not match any overload of function gtsam.CalibratedCamera.Dim');
      end
    end

    function varargout = Level(varargin)
      % LEVEL usage: Level(Pose2 pose2, double height) : returns gtsam::CalibratedCamera
      % Doxygen can be found at http://research.cc.gatech.edu/borg/sites/edu.borg/html/index.html
      % 
      % Usage
      % LEVEL(Pose2 pose2, double height)
      if length(varargin) == 2 && isa(varargin{1},'gtsam.Pose2') && isa(varargin{2},'double')
        varargout{1} = gtsam_wrapper(387, varargin{:});
      else
        error('Arguments do not match any overload of function gtsam.CalibratedCamera.Level');
      end
    end

    function varargout = Project_to_camera(varargin)
      % PROJECT_TO_CAMERA usage: project_to_camera(Point3 cameraPoint) : returns gtsam::Point2
      % Doxygen can be found at http://research.cc.gatech.edu/borg/sites/edu.borg/html/index.html
      % 
      % Usage
      % PROJECT_TO_CAMERA(Point3 cameraPoint)
      if length(varargin) == 1 && isa(varargin{1},'gtsam.Point3')
        varargout{1} = gtsam_wrapper(388, varargin{:});
      else
        error('Arguments do not match any overload of function gtsam.CalibratedCamera.Project_to_camera');
      end
    end

    function varargout = string_deserialize(varargin)
      % STRING_DESERIALIZE usage: string_deserialize() : returns gtsam.CalibratedCamera
      % Doxygen can be found at http://research.cc.gatech.edu/borg/sites/edu.borg/html/index.html
      if length(varargin) == 1
        varargout{1} = gtsam_wrapper(389, varargin{:});
      else
        error('Arguments do not match any overload of function gtsam.CalibratedCamera.string_deserialize');
      end
    end

    function obj = loadobj(sobj)
      % LOADOBJ Saves the object to a matlab-readable format
      obj = gtsam.CalibratedCamera.string_deserialize(sobj);
    end
  end
end
