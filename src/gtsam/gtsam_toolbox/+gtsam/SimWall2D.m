%class SimWall2D, see Doxygen page for details
%at http://research.cc.gatech.edu/borg/sites/edu.borg/html/index.html
%
%-------Constructors-------
%SimWall2D()
%SimWall2D(Point2 a, Point2 b)
%SimWall2D(double ax, double ay, double bx, double by)
%
%-------Methods-------
%a() : returns gtsam::Point2
%b() : returns gtsam::Point2
%equals(SimWall2D other, double tol) : returns bool
%intersects(SimWall2D wall) : returns bool
%length() : returns double
%midpoint() : returns gtsam::Point2
%norm() : returns gtsam::Point2
%print(string s) : returns void
%reflection(Point2 init, Point2 intersection) : returns gtsam::Rot2
%scale(double s) : returns gtsam::SimWall2D
%
classdef SimWall2D < handle
  properties
    ptr_gtsamSimWall2D = 0
  end
  methods
    function obj = SimWall2D(varargin)
      if nargin == 2 && isa(varargin{1}, 'uint64') && varargin{1} == uint64(5139824614673773682)
        my_ptr = varargin{2};
        gtsam_unstable_wrapper(101, my_ptr);
      elseif nargin == 0
        my_ptr = gtsam_unstable_wrapper(102);
      elseif nargin == 2 && isa(varargin{1},'gtsam.Point2') && isa(varargin{2},'gtsam.Point2')
        my_ptr = gtsam_unstable_wrapper(103, varargin{1}, varargin{2});
      elseif nargin == 4 && isa(varargin{1},'double') && isa(varargin{2},'double') && isa(varargin{3},'double') && isa(varargin{4},'double')
        my_ptr = gtsam_unstable_wrapper(104, varargin{1}, varargin{2}, varargin{3}, varargin{4});
      else
        error('Arguments do not match any overload of gtsam.SimWall2D constructor');
      end
      obj.ptr_gtsamSimWall2D = my_ptr;
    end

    function delete(obj)
      gtsam_unstable_wrapper(105, obj.ptr_gtsamSimWall2D);
    end

    function display(obj), obj.print(''); end
    %DISPLAY Calls print on the object
    function disp(obj), obj.display; end
    %DISP Calls print on the object
    function varargout = a(this, varargin)
      % A usage: a() : returns gtsam::Point2
      % Doxygen can be found at http://research.cc.gatech.edu/borg/sites/edu.borg/html/index.html
      varargout{1} = gtsam_unstable_wrapper(106, this, varargin{:});
    end

    function varargout = b(this, varargin)
      % B usage: b() : returns gtsam::Point2
      % Doxygen can be found at http://research.cc.gatech.edu/borg/sites/edu.borg/html/index.html
      varargout{1} = gtsam_unstable_wrapper(107, this, varargin{:});
    end

    function varargout = equals(this, varargin)
      % EQUALS usage: equals(SimWall2D other, double tol) : returns bool
      % Doxygen can be found at http://research.cc.gatech.edu/borg/sites/edu.borg/html/index.html
      if length(varargin) == 2 && isa(varargin{1},'gtsam.SimWall2D') && isa(varargin{2},'double')
        varargout{1} = gtsam_unstable_wrapper(108, this, varargin{:});
      else
        error('Arguments do not match any overload of function gtsam.SimWall2D.equals');
      end
    end

    function varargout = intersects(this, varargin)
      % INTERSECTS usage: intersects(SimWall2D wall) : returns bool
      % Doxygen can be found at http://research.cc.gatech.edu/borg/sites/edu.borg/html/index.html
      if length(varargin) == 1 && isa(varargin{1},'gtsam.SimWall2D')
        varargout{1} = gtsam_unstable_wrapper(109, this, varargin{:});
      else
        error('Arguments do not match any overload of function gtsam.SimWall2D.intersects');
      end
    end

    function varargout = length(this, varargin)
      % LENGTH usage: length() : returns double
      % Doxygen can be found at http://research.cc.gatech.edu/borg/sites/edu.borg/html/index.html
      varargout{1} = gtsam_unstable_wrapper(110, this, varargin{:});
    end

    function varargout = midpoint(this, varargin)
      % MIDPOINT usage: midpoint() : returns gtsam::Point2
      % Doxygen can be found at http://research.cc.gatech.edu/borg/sites/edu.borg/html/index.html
      varargout{1} = gtsam_unstable_wrapper(111, this, varargin{:});
    end

    function varargout = norm(this, varargin)
      % NORM usage: norm() : returns gtsam::Point2
      % Doxygen can be found at http://research.cc.gatech.edu/borg/sites/edu.borg/html/index.html
      varargout{1} = gtsam_unstable_wrapper(112, this, varargin{:});
    end

    function varargout = print(this, varargin)
      % PRINT usage: print(string s) : returns void
      % Doxygen can be found at http://research.cc.gatech.edu/borg/sites/edu.borg/html/index.html
      if length(varargin) == 1 && isa(varargin{1},'char')
        gtsam_unstable_wrapper(113, this, varargin{:});
      else
        error('Arguments do not match any overload of function gtsam.SimWall2D.print');
      end
    end

    function varargout = reflection(this, varargin)
      % REFLECTION usage: reflection(Point2 init, Point2 intersection) : returns gtsam::Rot2
      % Doxygen can be found at http://research.cc.gatech.edu/borg/sites/edu.borg/html/index.html
      if length(varargin) == 2 && isa(varargin{1},'gtsam.Point2') && isa(varargin{2},'gtsam.Point2')
        varargout{1} = gtsam_unstable_wrapper(114, this, varargin{:});
      else
        error('Arguments do not match any overload of function gtsam.SimWall2D.reflection');
      end
    end

    function varargout = scale(this, varargin)
      % SCALE usage: scale(double s) : returns gtsam::SimWall2D
      % Doxygen can be found at http://research.cc.gatech.edu/borg/sites/edu.borg/html/index.html
      varargout{1} = gtsam_unstable_wrapper(115, this, varargin{:});
    end

  end

  methods(Static = true)
  end
end
