%class StereoPoint2, see Doxygen page for details
%at http://research.cc.gatech.edu/borg/sites/edu.borg/html/index.html
%
%-------Constructors-------
%StereoPoint2()
%StereoPoint2(double uL, double uR, double v)
%
%-------Methods-------
%between(StereoPoint2 p2) : returns gtsam::StereoPoint2
%compose(StereoPoint2 p2) : returns gtsam::StereoPoint2
%dim() : returns size_t
%equals(StereoPoint2 point, double tol) : returns bool
%inverse() : returns gtsam::StereoPoint2
%localCoordinates(StereoPoint2 p) : returns Vector
%print(string s) : returns void
%retract(Vector v) : returns gtsam::StereoPoint2
%uL() : returns double
%uR() : returns double
%v() : returns double
%vector() : returns Vector
%
%-------Static Methods-------
%Dim() : returns size_t
%Expmap(Vector v) : returns gtsam::StereoPoint2
%Logmap(StereoPoint2 p) : returns Vector
%identity() : returns gtsam::StereoPoint2
%
%-------Serialization Interface-------
%string_serialize() : returns string
%string_deserialize(string serialized) : returns StereoPoint2
%
classdef StereoPoint2 < gtsam.Value
  properties
    ptr_gtsamStereoPoint2 = 0
  end
  methods
    function obj = StereoPoint2(varargin)
      if (nargin == 2 || (nargin == 3 && strcmp(varargin{3}, 'void'))) && isa(varargin{1}, 'uint64') && varargin{1} == uint64(5139824614673773682)
        if nargin == 2
          my_ptr = varargin{2};
        else
          my_ptr = gtsam_wrapper(86, varargin{2});
        end
        base_ptr = gtsam_wrapper(85, my_ptr);
      elseif nargin == 0
        [ my_ptr, base_ptr ] = gtsam_wrapper(87);
      elseif nargin == 3 && isa(varargin{1},'double') && isa(varargin{2},'double') && isa(varargin{3},'double')
        [ my_ptr, base_ptr ] = gtsam_wrapper(88, varargin{1}, varargin{2}, varargin{3});
      else
        error('Arguments do not match any overload of gtsam.StereoPoint2 constructor');
      end
      obj = obj@gtsam.Value(uint64(5139824614673773682), base_ptr);
      obj.ptr_gtsamStereoPoint2 = my_ptr;
    end

    function delete(obj)
      gtsam_wrapper(89, obj.ptr_gtsamStereoPoint2);
    end

    function display(obj), obj.print(''); end
    %DISPLAY Calls print on the object
    function disp(obj), obj.display; end
    %DISP Calls print on the object
    function varargout = between(this, varargin)
      % BETWEEN usage: between(StereoPoint2 p2) : returns gtsam::StereoPoint2
      % Doxygen can be found at http://research.cc.gatech.edu/borg/sites/edu.borg/html/index.html
      if length(varargin) == 1 && isa(varargin{1},'gtsam.StereoPoint2')
        varargout{1} = gtsam_wrapper(90, this, varargin{:});
      else
        error('Arguments do not match any overload of function gtsam.StereoPoint2.between');
      end
    end

    function varargout = compose(this, varargin)
      % COMPOSE usage: compose(StereoPoint2 p2) : returns gtsam::StereoPoint2
      % Doxygen can be found at http://research.cc.gatech.edu/borg/sites/edu.borg/html/index.html
      if length(varargin) == 1 && isa(varargin{1},'gtsam.StereoPoint2')
        varargout{1} = gtsam_wrapper(91, this, varargin{:});
      else
        error('Arguments do not match any overload of function gtsam.StereoPoint2.compose');
      end
    end

    function varargout = dim(this, varargin)
      % DIM usage: dim() : returns size_t
      % Doxygen can be found at http://research.cc.gatech.edu/borg/sites/edu.borg/html/index.html
      varargout{1} = gtsam_wrapper(92, this, varargin{:});
    end

    function varargout = equals(this, varargin)
      % EQUALS usage: equals(StereoPoint2 point, double tol) : returns bool
      % Doxygen can be found at http://research.cc.gatech.edu/borg/sites/edu.borg/html/index.html
      if length(varargin) == 2 && isa(varargin{1},'gtsam.StereoPoint2') && isa(varargin{2},'double')
        varargout{1} = gtsam_wrapper(93, this, varargin{:});
      else
        error('Arguments do not match any overload of function gtsam.StereoPoint2.equals');
      end
    end

    function varargout = inverse(this, varargin)
      % INVERSE usage: inverse() : returns gtsam::StereoPoint2
      % Doxygen can be found at http://research.cc.gatech.edu/borg/sites/edu.borg/html/index.html
      varargout{1} = gtsam_wrapper(94, this, varargin{:});
    end

    function varargout = localCoordinates(this, varargin)
      % LOCALCOORDINATES usage: localCoordinates(StereoPoint2 p) : returns Vector
      % Doxygen can be found at http://research.cc.gatech.edu/borg/sites/edu.borg/html/index.html
      if length(varargin) == 1 && isa(varargin{1},'gtsam.StereoPoint2')
        varargout{1} = gtsam_wrapper(95, this, varargin{:});
      else
        error('Arguments do not match any overload of function gtsam.StereoPoint2.localCoordinates');
      end
    end

    function varargout = print(this, varargin)
      % PRINT usage: print(string s) : returns void
      % Doxygen can be found at http://research.cc.gatech.edu/borg/sites/edu.borg/html/index.html
      if length(varargin) == 1 && isa(varargin{1},'char')
        gtsam_wrapper(96, this, varargin{:});
      else
        error('Arguments do not match any overload of function gtsam.StereoPoint2.print');
      end
    end

    function varargout = retract(this, varargin)
      % RETRACT usage: retract(Vector v) : returns gtsam::StereoPoint2
      % Doxygen can be found at http://research.cc.gatech.edu/borg/sites/edu.borg/html/index.html
      if length(varargin) == 1 && isa(varargin{1},'double')
        varargout{1} = gtsam_wrapper(97, this, varargin{:});
      else
        error('Arguments do not match any overload of function gtsam.StereoPoint2.retract');
      end
    end

    function varargout = uL(this, varargin)
      % UL usage: uL() : returns double
      % Doxygen can be found at http://research.cc.gatech.edu/borg/sites/edu.borg/html/index.html
      varargout{1} = gtsam_wrapper(98, this, varargin{:});
    end

    function varargout = uR(this, varargin)
      % UR usage: uR() : returns double
      % Doxygen can be found at http://research.cc.gatech.edu/borg/sites/edu.borg/html/index.html
      varargout{1} = gtsam_wrapper(99, this, varargin{:});
    end

    function varargout = v(this, varargin)
      % V usage: v() : returns double
      % Doxygen can be found at http://research.cc.gatech.edu/borg/sites/edu.borg/html/index.html
      varargout{1} = gtsam_wrapper(100, this, varargin{:});
    end

    function varargout = vector(this, varargin)
      % VECTOR usage: vector() : returns Vector
      % Doxygen can be found at http://research.cc.gatech.edu/borg/sites/edu.borg/html/index.html
      varargout{1} = gtsam_wrapper(101, this, varargin{:});
    end

    function varargout = string_serialize(this, varargin)
      % STRING_SERIALIZE usage: string_serialize() : returns string
      % Doxygen can be found at http://research.cc.gatech.edu/borg/sites/edu.borg/html/index.html
      if length(varargin) == 0
        varargout{1} = gtsam_wrapper(102, this, varargin{:});
      else
        error('Arguments do not match any overload of function gtsam.StereoPoint2.string_serialize');
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
        varargout{1} = gtsam_wrapper(103, varargin{:});
      else
        error('Arguments do not match any overload of function gtsam.StereoPoint2.Dim');
      end
    end

    function varargout = Expmap(varargin)
      % EXPMAP usage: Expmap(Vector v) : returns gtsam::StereoPoint2
      % Doxygen can be found at http://research.cc.gatech.edu/borg/sites/edu.borg/html/index.html
      % 
      % Usage
      % EXPMAP(Vector v)
      if length(varargin) == 1 && isa(varargin{1},'double')
        varargout{1} = gtsam_wrapper(104, varargin{:});
      else
        error('Arguments do not match any overload of function gtsam.StereoPoint2.Expmap');
      end
    end

    function varargout = Logmap(varargin)
      % LOGMAP usage: Logmap(StereoPoint2 p) : returns Vector
      % Doxygen can be found at http://research.cc.gatech.edu/borg/sites/edu.borg/html/index.html
      % 
      % Usage
      % LOGMAP(StereoPoint2 p)
      if length(varargin) == 1 && isa(varargin{1},'gtsam.StereoPoint2')
        varargout{1} = gtsam_wrapper(105, varargin{:});
      else
        error('Arguments do not match any overload of function gtsam.StereoPoint2.Logmap');
      end
    end

    function varargout = Identity(varargin)
      % IDENTITY usage: identity() : returns gtsam::StereoPoint2
      % Doxygen can be found at http://research.cc.gatech.edu/borg/sites/edu.borg/html/index.html
      % 
      % Usage
      % IDENTITY()
      if length(varargin) == 0
        varargout{1} = gtsam_wrapper(106, varargin{:});
      else
        error('Arguments do not match any overload of function gtsam.StereoPoint2.Identity');
      end
    end

    function varargout = string_deserialize(varargin)
      % STRING_DESERIALIZE usage: string_deserialize() : returns gtsam.StereoPoint2
      % Doxygen can be found at http://research.cc.gatech.edu/borg/sites/edu.borg/html/index.html
      if length(varargin) == 1
        varargout{1} = gtsam_wrapper(107, varargin{:});
      else
        error('Arguments do not match any overload of function gtsam.StereoPoint2.string_deserialize');
      end
    end

    function obj = loadobj(sobj)
      % LOADOBJ Saves the object to a matlab-readable format
      obj = gtsam.StereoPoint2.string_deserialize(sobj);
    end
  end
end
