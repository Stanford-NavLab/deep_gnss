%class Pose3Upright, see Doxygen page for details
%at http://research.cc.gatech.edu/borg/sites/edu.borg/html/index.html
%
%-------Constructors-------
%Pose3Upright()
%Pose3Upright(Pose3Upright x)
%Pose3Upright(Rot2 bearing, Point3 t)
%Pose3Upright(double x, double y, double z, double theta)
%Pose3Upright(Pose2 pose, double z)
%
%-------Methods-------
%between(Pose3Upright p2) : returns gtsam::Pose3Upright
%compose(Pose3Upright p2) : returns gtsam::Pose3Upright
%dim() : returns size_t
%equals(Pose3Upright pose, double tol) : returns bool
%inverse() : returns gtsam::Pose3Upright
%localCoordinates(Pose3Upright p2) : returns Vector
%pose() : returns gtsam::Pose3
%pose2() : returns gtsam::Pose2
%print(string s) : returns void
%retract(Vector v) : returns gtsam::Pose3Upright
%rotation() : returns gtsam::Rot3
%rotation2() : returns gtsam::Rot2
%theta() : returns double
%translation() : returns gtsam::Point3
%translation2() : returns gtsam::Point2
%x() : returns double
%y() : returns double
%z() : returns double
%
%-------Static Methods-------
%Expmap(Vector xi) : returns gtsam::Pose3Upright
%Logmap(Pose3Upright p) : returns Vector
%identity() : returns gtsam::Pose3Upright
%
classdef Pose3Upright < gtsam.Value
  properties
    ptr_gtsamPose3Upright = 0
  end
  methods
    function obj = Pose3Upright(varargin)
      if (nargin == 2 || (nargin == 3 && strcmp(varargin{3}, 'void'))) && isa(varargin{1}, 'uint64') && varargin{1} == uint64(5139824614673773682)
        if nargin == 2
          my_ptr = varargin{2};
        else
          my_ptr = gtsam_unstable_wrapper(42, varargin{2});
        end
        base_ptr = gtsam_unstable_wrapper(41, my_ptr);
      elseif nargin == 0
        [ my_ptr, base_ptr ] = gtsam_unstable_wrapper(43);
      elseif nargin == 1 && isa(varargin{1},'gtsam.Pose3Upright')
        [ my_ptr, base_ptr ] = gtsam_unstable_wrapper(44, varargin{1});
      elseif nargin == 2 && isa(varargin{1},'gtsam.Rot2') && isa(varargin{2},'gtsam.Point3')
        [ my_ptr, base_ptr ] = gtsam_unstable_wrapper(45, varargin{1}, varargin{2});
      elseif nargin == 4 && isa(varargin{1},'double') && isa(varargin{2},'double') && isa(varargin{3},'double') && isa(varargin{4},'double')
        [ my_ptr, base_ptr ] = gtsam_unstable_wrapper(46, varargin{1}, varargin{2}, varargin{3}, varargin{4});
      elseif nargin == 2 && isa(varargin{1},'gtsam.Pose2') && isa(varargin{2},'double')
        [ my_ptr, base_ptr ] = gtsam_unstable_wrapper(47, varargin{1}, varargin{2});
      else
        error('Arguments do not match any overload of gtsam.Pose3Upright constructor');
      end
      obj = obj@gtsam.Value(uint64(5139824614673773682), base_ptr);
      obj.ptr_gtsamPose3Upright = my_ptr;
    end

    function delete(obj)
      gtsam_unstable_wrapper(48, obj.ptr_gtsamPose3Upright);
    end

    function display(obj), obj.print(''); end
    %DISPLAY Calls print on the object
    function disp(obj), obj.display; end
    %DISP Calls print on the object
    function varargout = between(this, varargin)
      % BETWEEN usage: between(Pose3Upright p2) : returns gtsam::Pose3Upright
      % Doxygen can be found at http://research.cc.gatech.edu/borg/sites/edu.borg/html/index.html
      if length(varargin) == 1 && isa(varargin{1},'gtsam.Pose3Upright')
        varargout{1} = gtsam_unstable_wrapper(49, this, varargin{:});
      else
        error('Arguments do not match any overload of function gtsam.Pose3Upright.between');
      end
    end

    function varargout = compose(this, varargin)
      % COMPOSE usage: compose(Pose3Upright p2) : returns gtsam::Pose3Upright
      % Doxygen can be found at http://research.cc.gatech.edu/borg/sites/edu.borg/html/index.html
      if length(varargin) == 1 && isa(varargin{1},'gtsam.Pose3Upright')
        varargout{1} = gtsam_unstable_wrapper(50, this, varargin{:});
      else
        error('Arguments do not match any overload of function gtsam.Pose3Upright.compose');
      end
    end

    function varargout = dim(this, varargin)
      % DIM usage: dim() : returns size_t
      % Doxygen can be found at http://research.cc.gatech.edu/borg/sites/edu.borg/html/index.html
      varargout{1} = gtsam_unstable_wrapper(51, this, varargin{:});
    end

    function varargout = equals(this, varargin)
      % EQUALS usage: equals(Pose3Upright pose, double tol) : returns bool
      % Doxygen can be found at http://research.cc.gatech.edu/borg/sites/edu.borg/html/index.html
      if length(varargin) == 2 && isa(varargin{1},'gtsam.Pose3Upright') && isa(varargin{2},'double')
        varargout{1} = gtsam_unstable_wrapper(52, this, varargin{:});
      else
        error('Arguments do not match any overload of function gtsam.Pose3Upright.equals');
      end
    end

    function varargout = inverse(this, varargin)
      % INVERSE usage: inverse() : returns gtsam::Pose3Upright
      % Doxygen can be found at http://research.cc.gatech.edu/borg/sites/edu.borg/html/index.html
      varargout{1} = gtsam_unstable_wrapper(53, this, varargin{:});
    end

    function varargout = localCoordinates(this, varargin)
      % LOCALCOORDINATES usage: localCoordinates(Pose3Upright p2) : returns Vector
      % Doxygen can be found at http://research.cc.gatech.edu/borg/sites/edu.borg/html/index.html
      if length(varargin) == 1 && isa(varargin{1},'gtsam.Pose3Upright')
        varargout{1} = gtsam_unstable_wrapper(54, this, varargin{:});
      else
        error('Arguments do not match any overload of function gtsam.Pose3Upright.localCoordinates');
      end
    end

    function varargout = pose(this, varargin)
      % POSE usage: pose() : returns gtsam::Pose3
      % Doxygen can be found at http://research.cc.gatech.edu/borg/sites/edu.borg/html/index.html
      varargout{1} = gtsam_unstable_wrapper(55, this, varargin{:});
    end

    function varargout = pose2(this, varargin)
      % POSE2 usage: pose2() : returns gtsam::Pose2
      % Doxygen can be found at http://research.cc.gatech.edu/borg/sites/edu.borg/html/index.html
      varargout{1} = gtsam_unstable_wrapper(56, this, varargin{:});
    end

    function varargout = print(this, varargin)
      % PRINT usage: print(string s) : returns void
      % Doxygen can be found at http://research.cc.gatech.edu/borg/sites/edu.borg/html/index.html
      if length(varargin) == 1 && isa(varargin{1},'char')
        gtsam_unstable_wrapper(57, this, varargin{:});
      else
        error('Arguments do not match any overload of function gtsam.Pose3Upright.print');
      end
    end

    function varargout = retract(this, varargin)
      % RETRACT usage: retract(Vector v) : returns gtsam::Pose3Upright
      % Doxygen can be found at http://research.cc.gatech.edu/borg/sites/edu.borg/html/index.html
      if length(varargin) == 1 && isa(varargin{1},'double')
        varargout{1} = gtsam_unstable_wrapper(58, this, varargin{:});
      else
        error('Arguments do not match any overload of function gtsam.Pose3Upright.retract');
      end
    end

    function varargout = rotation(this, varargin)
      % ROTATION usage: rotation() : returns gtsam::Rot3
      % Doxygen can be found at http://research.cc.gatech.edu/borg/sites/edu.borg/html/index.html
      varargout{1} = gtsam_unstable_wrapper(59, this, varargin{:});
    end

    function varargout = rotation2(this, varargin)
      % ROTATION2 usage: rotation2() : returns gtsam::Rot2
      % Doxygen can be found at http://research.cc.gatech.edu/borg/sites/edu.borg/html/index.html
      varargout{1} = gtsam_unstable_wrapper(60, this, varargin{:});
    end

    function varargout = theta(this, varargin)
      % THETA usage: theta() : returns double
      % Doxygen can be found at http://research.cc.gatech.edu/borg/sites/edu.borg/html/index.html
      varargout{1} = gtsam_unstable_wrapper(61, this, varargin{:});
    end

    function varargout = translation(this, varargin)
      % TRANSLATION usage: translation() : returns gtsam::Point3
      % Doxygen can be found at http://research.cc.gatech.edu/borg/sites/edu.borg/html/index.html
      varargout{1} = gtsam_unstable_wrapper(62, this, varargin{:});
    end

    function varargout = translation2(this, varargin)
      % TRANSLATION2 usage: translation2() : returns gtsam::Point2
      % Doxygen can be found at http://research.cc.gatech.edu/borg/sites/edu.borg/html/index.html
      varargout{1} = gtsam_unstable_wrapper(63, this, varargin{:});
    end

    function varargout = x(this, varargin)
      % X usage: x() : returns double
      % Doxygen can be found at http://research.cc.gatech.edu/borg/sites/edu.borg/html/index.html
      varargout{1} = gtsam_unstable_wrapper(64, this, varargin{:});
    end

    function varargout = y(this, varargin)
      % Y usage: y() : returns double
      % Doxygen can be found at http://research.cc.gatech.edu/borg/sites/edu.borg/html/index.html
      varargout{1} = gtsam_unstable_wrapper(65, this, varargin{:});
    end

    function varargout = z(this, varargin)
      % Z usage: z() : returns double
      % Doxygen can be found at http://research.cc.gatech.edu/borg/sites/edu.borg/html/index.html
      varargout{1} = gtsam_unstable_wrapper(66, this, varargin{:});
    end

  end

  methods(Static = true)
    function varargout = Expmap(varargin)
      % EXPMAP usage: Expmap(Vector xi) : returns gtsam::Pose3Upright
      % Doxygen can be found at http://research.cc.gatech.edu/borg/sites/edu.borg/html/index.html
      % 
      % Usage
      % EXPMAP(Vector xi)
      if length(varargin) == 1 && isa(varargin{1},'double')
        varargout{1} = gtsam_unstable_wrapper(67, varargin{:});
      else
        error('Arguments do not match any overload of function gtsam.Pose3Upright.Expmap');
      end
    end

    function varargout = Logmap(varargin)
      % LOGMAP usage: Logmap(Pose3Upright p) : returns Vector
      % Doxygen can be found at http://research.cc.gatech.edu/borg/sites/edu.borg/html/index.html
      % 
      % Usage
      % LOGMAP(Pose3Upright p)
      if length(varargin) == 1 && isa(varargin{1},'gtsam.Pose3Upright')
        varargout{1} = gtsam_unstable_wrapper(68, varargin{:});
      else
        error('Arguments do not match any overload of function gtsam.Pose3Upright.Logmap');
      end
    end

    function varargout = Identity(varargin)
      % IDENTITY usage: identity() : returns gtsam::Pose3Upright
      % Doxygen can be found at http://research.cc.gatech.edu/borg/sites/edu.borg/html/index.html
      % 
      % Usage
      % IDENTITY()
      if length(varargin) == 0
        varargout{1} = gtsam_unstable_wrapper(69, varargin{:});
      else
        error('Arguments do not match any overload of function gtsam.Pose3Upright.Identity');
      end
    end

  end
end
