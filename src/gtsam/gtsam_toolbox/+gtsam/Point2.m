%class Point2, see Doxygen page for details
%at http://research.cc.gatech.edu/borg/sites/edu.borg/html/index.html
%
%-------Constructors-------
%Point2()
%Point2(double x, double y)
%Point2(Vector v)
%
%-------Methods-------
%between(Point2 p2) : returns gtsam::Point2
%compose(Point2 p2) : returns gtsam::Point2
%dim() : returns size_t
%dist(Point2 p2) : returns double
%equals(Point2 pose, double tol) : returns bool
%inverse() : returns gtsam::Point2
%localCoordinates(Point2 p) : returns Vector
%norm() : returns double
%print(string s) : returns void
%retract(Vector v) : returns gtsam::Point2
%vector() : returns Vector
%x() : returns double
%y() : returns double
%
%-------Static Methods-------
%Dim() : returns size_t
%Expmap(Vector v) : returns gtsam::Point2
%Logmap(Point2 p) : returns Vector
%identity() : returns gtsam::Point2
%
%-------Serialization Interface-------
%string_serialize() : returns string
%string_deserialize(string serialized) : returns Point2
%
classdef Point2 < gtsam.Value
  properties
    ptr_gtsamPoint2 = 0
  end
  methods
    function obj = Point2(varargin)
      if (nargin == 2 || (nargin == 3 && strcmp(varargin{3}, 'void'))) && isa(varargin{1}, 'uint64') && varargin{1} == uint64(5139824614673773682)
        if nargin == 2
          my_ptr = varargin{2};
        else
          my_ptr = gtsam_wrapper(61, varargin{2});
        end
        base_ptr = gtsam_wrapper(60, my_ptr);
      elseif nargin == 0
        [ my_ptr, base_ptr ] = gtsam_wrapper(62);
      elseif nargin == 2 && isa(varargin{1},'double') && isa(varargin{2},'double')
        [ my_ptr, base_ptr ] = gtsam_wrapper(63, varargin{1}, varargin{2});
      elseif nargin == 1 && isa(varargin{1},'double')
        [ my_ptr, base_ptr ] = gtsam_wrapper(64, varargin{1});
      else
        error('Arguments do not match any overload of gtsam.Point2 constructor');
      end
      obj = obj@gtsam.Value(uint64(5139824614673773682), base_ptr);
      obj.ptr_gtsamPoint2 = my_ptr;
    end

    function delete(obj)
      gtsam_wrapper(65, obj.ptr_gtsamPoint2);
    end

    function display(obj), obj.print(''); end
    %DISPLAY Calls print on the object
    function disp(obj), obj.display; end
    %DISP Calls print on the object
    function varargout = between(this, varargin)
      % BETWEEN usage: between(Point2 p2) : returns gtsam::Point2
      % Doxygen can be found at http://research.cc.gatech.edu/borg/sites/edu.borg/html/index.html
      if length(varargin) == 1 && isa(varargin{1},'gtsam.Point2')
        varargout{1} = gtsam_wrapper(66, this, varargin{:});
      else
        error('Arguments do not match any overload of function gtsam.Point2.between');
      end
    end

    function varargout = compose(this, varargin)
      % COMPOSE usage: compose(Point2 p2) : returns gtsam::Point2
      % Doxygen can be found at http://research.cc.gatech.edu/borg/sites/edu.borg/html/index.html
      if length(varargin) == 1 && isa(varargin{1},'gtsam.Point2')
        varargout{1} = gtsam_wrapper(67, this, varargin{:});
      else
        error('Arguments do not match any overload of function gtsam.Point2.compose');
      end
    end

    function varargout = dim(this, varargin)
      % DIM usage: dim() : returns size_t
      % Doxygen can be found at http://research.cc.gatech.edu/borg/sites/edu.borg/html/index.html
      varargout{1} = gtsam_wrapper(68, this, varargin{:});
    end

    function varargout = dist(this, varargin)
      % DIST usage: dist(Point2 p2) : returns double
      % Doxygen can be found at http://research.cc.gatech.edu/borg/sites/edu.borg/html/index.html
      if length(varargin) == 1 && isa(varargin{1},'gtsam.Point2')
        varargout{1} = gtsam_wrapper(69, this, varargin{:});
      else
        error('Arguments do not match any overload of function gtsam.Point2.dist');
      end
    end

    function varargout = equals(this, varargin)
      % EQUALS usage: equals(Point2 pose, double tol) : returns bool
      % Doxygen can be found at http://research.cc.gatech.edu/borg/sites/edu.borg/html/index.html
      if length(varargin) == 2 && isa(varargin{1},'gtsam.Point2') && isa(varargin{2},'double')
        varargout{1} = gtsam_wrapper(70, this, varargin{:});
      else
        error('Arguments do not match any overload of function gtsam.Point2.equals');
      end
    end

    function varargout = inverse(this, varargin)
      % INVERSE usage: inverse() : returns gtsam::Point2
      % Doxygen can be found at http://research.cc.gatech.edu/borg/sites/edu.borg/html/index.html
      varargout{1} = gtsam_wrapper(71, this, varargin{:});
    end

    function varargout = localCoordinates(this, varargin)
      % LOCALCOORDINATES usage: localCoordinates(Point2 p) : returns Vector
      % Doxygen can be found at http://research.cc.gatech.edu/borg/sites/edu.borg/html/index.html
      if length(varargin) == 1 && isa(varargin{1},'gtsam.Point2')
        varargout{1} = gtsam_wrapper(72, this, varargin{:});
      else
        error('Arguments do not match any overload of function gtsam.Point2.localCoordinates');
      end
    end

    function varargout = norm(this, varargin)
      % NORM usage: norm() : returns double
      % Doxygen can be found at http://research.cc.gatech.edu/borg/sites/edu.borg/html/index.html
      varargout{1} = gtsam_wrapper(73, this, varargin{:});
    end

    function varargout = print(this, varargin)
      % PRINT usage: print(string s) : returns void
      % Doxygen can be found at http://research.cc.gatech.edu/borg/sites/edu.borg/html/index.html
      if length(varargin) == 1 && isa(varargin{1},'char')
        gtsam_wrapper(74, this, varargin{:});
      else
        error('Arguments do not match any overload of function gtsam.Point2.print');
      end
    end

    function varargout = retract(this, varargin)
      % RETRACT usage: retract(Vector v) : returns gtsam::Point2
      % Doxygen can be found at http://research.cc.gatech.edu/borg/sites/edu.borg/html/index.html
      if length(varargin) == 1 && isa(varargin{1},'double')
        varargout{1} = gtsam_wrapper(75, this, varargin{:});
      else
        error('Arguments do not match any overload of function gtsam.Point2.retract');
      end
    end

    function varargout = vector(this, varargin)
      % VECTOR usage: vector() : returns Vector
      % Doxygen can be found at http://research.cc.gatech.edu/borg/sites/edu.borg/html/index.html
      varargout{1} = gtsam_wrapper(76, this, varargin{:});
    end

    function varargout = x(this, varargin)
      % X usage: x() : returns double
      % Doxygen can be found at http://research.cc.gatech.edu/borg/sites/edu.borg/html/index.html
      varargout{1} = gtsam_wrapper(77, this, varargin{:});
    end

    function varargout = y(this, varargin)
      % Y usage: y() : returns double
      % Doxygen can be found at http://research.cc.gatech.edu/borg/sites/edu.borg/html/index.html
      varargout{1} = gtsam_wrapper(78, this, varargin{:});
    end

    function varargout = string_serialize(this, varargin)
      % STRING_SERIALIZE usage: string_serialize() : returns string
      % Doxygen can be found at http://research.cc.gatech.edu/borg/sites/edu.borg/html/index.html
      if length(varargin) == 0
        varargout{1} = gtsam_wrapper(79, this, varargin{:});
      else
        error('Arguments do not match any overload of function gtsam.Point2.string_serialize');
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
        varargout{1} = gtsam_wrapper(80, varargin{:});
      else
        error('Arguments do not match any overload of function gtsam.Point2.Dim');
      end
    end

    function varargout = Expmap(varargin)
      % EXPMAP usage: Expmap(Vector v) : returns gtsam::Point2
      % Doxygen can be found at http://research.cc.gatech.edu/borg/sites/edu.borg/html/index.html
      % 
      % Usage
      % EXPMAP(Vector v)
      if length(varargin) == 1 && isa(varargin{1},'double')
        varargout{1} = gtsam_wrapper(81, varargin{:});
      else
        error('Arguments do not match any overload of function gtsam.Point2.Expmap');
      end
    end

    function varargout = Logmap(varargin)
      % LOGMAP usage: Logmap(Point2 p) : returns Vector
      % Doxygen can be found at http://research.cc.gatech.edu/borg/sites/edu.borg/html/index.html
      % 
      % Usage
      % LOGMAP(Point2 p)
      if length(varargin) == 1 && isa(varargin{1},'gtsam.Point2')
        varargout{1} = gtsam_wrapper(82, varargin{:});
      else
        error('Arguments do not match any overload of function gtsam.Point2.Logmap');
      end
    end

    function varargout = Identity(varargin)
      % IDENTITY usage: identity() : returns gtsam::Point2
      % Doxygen can be found at http://research.cc.gatech.edu/borg/sites/edu.borg/html/index.html
      % 
      % Usage
      % IDENTITY()
      if length(varargin) == 0
        varargout{1} = gtsam_wrapper(83, varargin{:});
      else
        error('Arguments do not match any overload of function gtsam.Point2.Identity');
      end
    end

    function varargout = string_deserialize(varargin)
      % STRING_DESERIALIZE usage: string_deserialize() : returns gtsam.Point2
      % Doxygen can be found at http://research.cc.gatech.edu/borg/sites/edu.borg/html/index.html
      if length(varargin) == 1
        varargout{1} = gtsam_wrapper(84, varargin{:});
      else
        error('Arguments do not match any overload of function gtsam.Point2.string_deserialize');
      end
    end

    function obj = loadobj(sobj)
      % LOADOBJ Saves the object to a matlab-readable format
      obj = gtsam.Point2.string_deserialize(sobj);
    end
  end
end
