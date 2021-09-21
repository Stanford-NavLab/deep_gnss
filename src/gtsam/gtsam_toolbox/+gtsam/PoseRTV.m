%class PoseRTV, see Doxygen page for details
%at http://research.cc.gatech.edu/borg/sites/edu.borg/html/index.html
%
%-------Constructors-------
%PoseRTV()
%PoseRTV(Vector rtv)
%PoseRTV(Point3 pt, Rot3 rot, Point3 vel)
%PoseRTV(Rot3 rot, Point3 pt, Point3 vel)
%PoseRTV(Pose3 pose, Point3 vel)
%PoseRTV(Pose3 pose)
%PoseRTV(double roll, double pitch, double yaw, double x, double y, double z, double vx, double vy, double vz)
%
%-------Methods-------
%between(PoseRTV p) : returns gtsam::PoseRTV
%compose(PoseRTV p) : returns gtsam::PoseRTV
%dim() : returns size_t
%equals(PoseRTV other, double tol) : returns bool
%flyingDynamics(double pitch_rate, double heading_rate, double lift_control, double dt) : returns gtsam::PoseRTV
%generalDynamics(Vector accel, Vector gyro, double dt) : returns gtsam::PoseRTV
%imuPrediction(PoseRTV x2, double dt) : returns Vector
%inverse() : returns gtsam::PoseRTV
%localCoordinates(PoseRTV p) : returns Vector
%planarDynamics(double vel_rate, double heading_rate, double max_accel, double dt) : returns gtsam::PoseRTV
%pose() : returns gtsam::Pose3
%print(string s) : returns void
%range(PoseRTV other) : returns double
%retract(Vector v) : returns gtsam::PoseRTV
%rotation() : returns gtsam::Rot3
%transformed_from(Pose3 trans) : returns gtsam::PoseRTV
%translation() : returns gtsam::Point3
%translationIntegration(PoseRTV x2, double dt) : returns gtsam::Point3
%translationIntegrationVec(PoseRTV x2, double dt) : returns Vector
%translationVec() : returns Vector
%vector() : returns Vector
%velocity() : returns gtsam::Point3
%velocityVec() : returns Vector
%
%-------Static Methods-------
%Dim() : returns size_t
%Expmap(Vector v) : returns gtsam::PoseRTV
%Logmap(PoseRTV p) : returns Vector
%
classdef PoseRTV < gtsam.Value
  properties
    ptr_gtsamPoseRTV = 0
  end
  methods
    function obj = PoseRTV(varargin)
      if (nargin == 2 || (nargin == 3 && strcmp(varargin{3}, 'void'))) && isa(varargin{1}, 'uint64') && varargin{1} == uint64(5139824614673773682)
        if nargin == 2
          my_ptr = varargin{2};
        else
          my_ptr = gtsam_unstable_wrapper(6, varargin{2});
        end
        base_ptr = gtsam_unstable_wrapper(5, my_ptr);
      elseif nargin == 0
        [ my_ptr, base_ptr ] = gtsam_unstable_wrapper(7);
      elseif nargin == 1 && isa(varargin{1},'double')
        [ my_ptr, base_ptr ] = gtsam_unstable_wrapper(8, varargin{1});
      elseif nargin == 3 && isa(varargin{1},'gtsam.Point3') && isa(varargin{2},'gtsam.Rot3') && isa(varargin{3},'gtsam.Point3')
        [ my_ptr, base_ptr ] = gtsam_unstable_wrapper(9, varargin{1}, varargin{2}, varargin{3});
      elseif nargin == 3 && isa(varargin{1},'gtsam.Rot3') && isa(varargin{2},'gtsam.Point3') && isa(varargin{3},'gtsam.Point3')
        [ my_ptr, base_ptr ] = gtsam_unstable_wrapper(10, varargin{1}, varargin{2}, varargin{3});
      elseif nargin == 2 && isa(varargin{1},'gtsam.Pose3') && isa(varargin{2},'gtsam.Point3')
        [ my_ptr, base_ptr ] = gtsam_unstable_wrapper(11, varargin{1}, varargin{2});
      elseif nargin == 1 && isa(varargin{1},'gtsam.Pose3')
        [ my_ptr, base_ptr ] = gtsam_unstable_wrapper(12, varargin{1});
      elseif nargin == 9 && isa(varargin{1},'double') && isa(varargin{2},'double') && isa(varargin{3},'double') && isa(varargin{4},'double') && isa(varargin{5},'double') && isa(varargin{6},'double') && isa(varargin{7},'double') && isa(varargin{8},'double') && isa(varargin{9},'double')
        [ my_ptr, base_ptr ] = gtsam_unstable_wrapper(13, varargin{1}, varargin{2}, varargin{3}, varargin{4}, varargin{5}, varargin{6}, varargin{7}, varargin{8}, varargin{9});
      else
        error('Arguments do not match any overload of gtsam.PoseRTV constructor');
      end
      obj = obj@gtsam.Value(uint64(5139824614673773682), base_ptr);
      obj.ptr_gtsamPoseRTV = my_ptr;
    end

    function delete(obj)
      gtsam_unstable_wrapper(14, obj.ptr_gtsamPoseRTV);
    end

    function display(obj), obj.print(''); end
    %DISPLAY Calls print on the object
    function disp(obj), obj.display; end
    %DISP Calls print on the object
    function varargout = between(this, varargin)
      % BETWEEN usage: between(PoseRTV p) : returns gtsam::PoseRTV
      % Doxygen can be found at http://research.cc.gatech.edu/borg/sites/edu.borg/html/index.html
      if length(varargin) == 1 && isa(varargin{1},'gtsam.PoseRTV')
        varargout{1} = gtsam_unstable_wrapper(15, this, varargin{:});
      else
        error('Arguments do not match any overload of function gtsam.PoseRTV.between');
      end
    end

    function varargout = compose(this, varargin)
      % COMPOSE usage: compose(PoseRTV p) : returns gtsam::PoseRTV
      % Doxygen can be found at http://research.cc.gatech.edu/borg/sites/edu.borg/html/index.html
      if length(varargin) == 1 && isa(varargin{1},'gtsam.PoseRTV')
        varargout{1} = gtsam_unstable_wrapper(16, this, varargin{:});
      else
        error('Arguments do not match any overload of function gtsam.PoseRTV.compose');
      end
    end

    function varargout = dim(this, varargin)
      % DIM usage: dim() : returns size_t
      % Doxygen can be found at http://research.cc.gatech.edu/borg/sites/edu.borg/html/index.html
      varargout{1} = gtsam_unstable_wrapper(17, this, varargin{:});
    end

    function varargout = equals(this, varargin)
      % EQUALS usage: equals(PoseRTV other, double tol) : returns bool
      % Doxygen can be found at http://research.cc.gatech.edu/borg/sites/edu.borg/html/index.html
      if length(varargin) == 2 && isa(varargin{1},'gtsam.PoseRTV') && isa(varargin{2},'double')
        varargout{1} = gtsam_unstable_wrapper(18, this, varargin{:});
      else
        error('Arguments do not match any overload of function gtsam.PoseRTV.equals');
      end
    end

    function varargout = flyingDynamics(this, varargin)
      % FLYINGDYNAMICS usage: flyingDynamics(double pitch_rate, double heading_rate, double lift_control, double dt) : returns gtsam::PoseRTV
      % Doxygen can be found at http://research.cc.gatech.edu/borg/sites/edu.borg/html/index.html
      varargout{1} = gtsam_unstable_wrapper(19, this, varargin{:});
    end

    function varargout = generalDynamics(this, varargin)
      % GENERALDYNAMICS usage: generalDynamics(Vector accel, Vector gyro, double dt) : returns gtsam::PoseRTV
      % Doxygen can be found at http://research.cc.gatech.edu/borg/sites/edu.borg/html/index.html
      if length(varargin) == 3 && isa(varargin{1},'double') && isa(varargin{2},'double') && isa(varargin{3},'double')
        varargout{1} = gtsam_unstable_wrapper(20, this, varargin{:});
      else
        error('Arguments do not match any overload of function gtsam.PoseRTV.generalDynamics');
      end
    end

    function varargout = imuPrediction(this, varargin)
      % IMUPREDICTION usage: imuPrediction(PoseRTV x2, double dt) : returns Vector
      % Doxygen can be found at http://research.cc.gatech.edu/borg/sites/edu.borg/html/index.html
      if length(varargin) == 2 && isa(varargin{1},'gtsam.PoseRTV') && isa(varargin{2},'double')
        varargout{1} = gtsam_unstable_wrapper(21, this, varargin{:});
      else
        error('Arguments do not match any overload of function gtsam.PoseRTV.imuPrediction');
      end
    end

    function varargout = inverse(this, varargin)
      % INVERSE usage: inverse() : returns gtsam::PoseRTV
      % Doxygen can be found at http://research.cc.gatech.edu/borg/sites/edu.borg/html/index.html
      varargout{1} = gtsam_unstable_wrapper(22, this, varargin{:});
    end

    function varargout = localCoordinates(this, varargin)
      % LOCALCOORDINATES usage: localCoordinates(PoseRTV p) : returns Vector
      % Doxygen can be found at http://research.cc.gatech.edu/borg/sites/edu.borg/html/index.html
      if length(varargin) == 1 && isa(varargin{1},'gtsam.PoseRTV')
        varargout{1} = gtsam_unstable_wrapper(23, this, varargin{:});
      else
        error('Arguments do not match any overload of function gtsam.PoseRTV.localCoordinates');
      end
    end

    function varargout = planarDynamics(this, varargin)
      % PLANARDYNAMICS usage: planarDynamics(double vel_rate, double heading_rate, double max_accel, double dt) : returns gtsam::PoseRTV
      % Doxygen can be found at http://research.cc.gatech.edu/borg/sites/edu.borg/html/index.html
      varargout{1} = gtsam_unstable_wrapper(24, this, varargin{:});
    end

    function varargout = pose(this, varargin)
      % POSE usage: pose() : returns gtsam::Pose3
      % Doxygen can be found at http://research.cc.gatech.edu/borg/sites/edu.borg/html/index.html
      varargout{1} = gtsam_unstable_wrapper(25, this, varargin{:});
    end

    function varargout = print(this, varargin)
      % PRINT usage: print(string s) : returns void
      % Doxygen can be found at http://research.cc.gatech.edu/borg/sites/edu.borg/html/index.html
      if length(varargin) == 1 && isa(varargin{1},'char')
        gtsam_unstable_wrapper(26, this, varargin{:});
      else
        error('Arguments do not match any overload of function gtsam.PoseRTV.print');
      end
    end

    function varargout = range(this, varargin)
      % RANGE usage: range(PoseRTV other) : returns double
      % Doxygen can be found at http://research.cc.gatech.edu/borg/sites/edu.borg/html/index.html
      if length(varargin) == 1 && isa(varargin{1},'gtsam.PoseRTV')
        varargout{1} = gtsam_unstable_wrapper(27, this, varargin{:});
      else
        error('Arguments do not match any overload of function gtsam.PoseRTV.range');
      end
    end

    function varargout = retract(this, varargin)
      % RETRACT usage: retract(Vector v) : returns gtsam::PoseRTV
      % Doxygen can be found at http://research.cc.gatech.edu/borg/sites/edu.borg/html/index.html
      if length(varargin) == 1 && isa(varargin{1},'double')
        varargout{1} = gtsam_unstable_wrapper(28, this, varargin{:});
      else
        error('Arguments do not match any overload of function gtsam.PoseRTV.retract');
      end
    end

    function varargout = rotation(this, varargin)
      % ROTATION usage: rotation() : returns gtsam::Rot3
      % Doxygen can be found at http://research.cc.gatech.edu/borg/sites/edu.borg/html/index.html
      varargout{1} = gtsam_unstable_wrapper(29, this, varargin{:});
    end

    function varargout = transformed_from(this, varargin)
      % TRANSFORMED_FROM usage: transformed_from(Pose3 trans) : returns gtsam::PoseRTV
      % Doxygen can be found at http://research.cc.gatech.edu/borg/sites/edu.borg/html/index.html
      if length(varargin) == 1 && isa(varargin{1},'gtsam.Pose3')
        varargout{1} = gtsam_unstable_wrapper(30, this, varargin{:});
      else
        error('Arguments do not match any overload of function gtsam.PoseRTV.transformed_from');
      end
    end

    function varargout = translation(this, varargin)
      % TRANSLATION usage: translation() : returns gtsam::Point3
      % Doxygen can be found at http://research.cc.gatech.edu/borg/sites/edu.borg/html/index.html
      varargout{1} = gtsam_unstable_wrapper(31, this, varargin{:});
    end

    function varargout = translationIntegration(this, varargin)
      % TRANSLATIONINTEGRATION usage: translationIntegration(PoseRTV x2, double dt) : returns gtsam::Point3
      % Doxygen can be found at http://research.cc.gatech.edu/borg/sites/edu.borg/html/index.html
      if length(varargin) == 2 && isa(varargin{1},'gtsam.PoseRTV') && isa(varargin{2},'double')
        varargout{1} = gtsam_unstable_wrapper(32, this, varargin{:});
      else
        error('Arguments do not match any overload of function gtsam.PoseRTV.translationIntegration');
      end
    end

    function varargout = translationIntegrationVec(this, varargin)
      % TRANSLATIONINTEGRATIONVEC usage: translationIntegrationVec(PoseRTV x2, double dt) : returns Vector
      % Doxygen can be found at http://research.cc.gatech.edu/borg/sites/edu.borg/html/index.html
      if length(varargin) == 2 && isa(varargin{1},'gtsam.PoseRTV') && isa(varargin{2},'double')
        varargout{1} = gtsam_unstable_wrapper(33, this, varargin{:});
      else
        error('Arguments do not match any overload of function gtsam.PoseRTV.translationIntegrationVec');
      end
    end

    function varargout = translationVec(this, varargin)
      % TRANSLATIONVEC usage: translationVec() : returns Vector
      % Doxygen can be found at http://research.cc.gatech.edu/borg/sites/edu.borg/html/index.html
      varargout{1} = gtsam_unstable_wrapper(34, this, varargin{:});
    end

    function varargout = vector(this, varargin)
      % VECTOR usage: vector() : returns Vector
      % Doxygen can be found at http://research.cc.gatech.edu/borg/sites/edu.borg/html/index.html
      varargout{1} = gtsam_unstable_wrapper(35, this, varargin{:});
    end

    function varargout = velocity(this, varargin)
      % VELOCITY usage: velocity() : returns gtsam::Point3
      % Doxygen can be found at http://research.cc.gatech.edu/borg/sites/edu.borg/html/index.html
      varargout{1} = gtsam_unstable_wrapper(36, this, varargin{:});
    end

    function varargout = velocityVec(this, varargin)
      % VELOCITYVEC usage: velocityVec() : returns Vector
      % Doxygen can be found at http://research.cc.gatech.edu/borg/sites/edu.borg/html/index.html
      varargout{1} = gtsam_unstable_wrapper(37, this, varargin{:});
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
        varargout{1} = gtsam_unstable_wrapper(38, varargin{:});
      else
        error('Arguments do not match any overload of function gtsam.PoseRTV.Dim');
      end
    end

    function varargout = Expmap(varargin)
      % EXPMAP usage: Expmap(Vector v) : returns gtsam::PoseRTV
      % Doxygen can be found at http://research.cc.gatech.edu/borg/sites/edu.borg/html/index.html
      % 
      % Usage
      % EXPMAP(Vector v)
      if length(varargin) == 1 && isa(varargin{1},'double')
        varargout{1} = gtsam_unstable_wrapper(39, varargin{:});
      else
        error('Arguments do not match any overload of function gtsam.PoseRTV.Expmap');
      end
    end

    function varargout = Logmap(varargin)
      % LOGMAP usage: Logmap(PoseRTV p) : returns Vector
      % Doxygen can be found at http://research.cc.gatech.edu/borg/sites/edu.borg/html/index.html
      % 
      % Usage
      % LOGMAP(PoseRTV p)
      if length(varargin) == 1 && isa(varargin{1},'gtsam.PoseRTV')
        varargout{1} = gtsam_unstable_wrapper(40, varargin{:});
      else
        error('Arguments do not match any overload of function gtsam.PoseRTV.Logmap');
      end
    end

  end
end
