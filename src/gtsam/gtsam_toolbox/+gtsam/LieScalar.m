%class LieScalar, see Doxygen page for details
%at http://research.cc.gatech.edu/borg/sites/edu.borg/html/index.html
%
%-------Constructors-------
%LieScalar()
%LieScalar(double d)
%
%-------Methods-------
%between(LieScalar l2) : returns gtsam::LieScalar
%compose(LieScalar p) : returns gtsam::LieScalar
%dim() : returns size_t
%equals(LieScalar expected, double tol) : returns bool
%inverse() : returns gtsam::LieScalar
%localCoordinates(LieScalar t2) : returns Vector
%print(string s) : returns void
%retract(Vector v) : returns gtsam::LieScalar
%value() : returns double
%
%-------Static Methods-------
%Expmap(Vector v) : returns gtsam::LieScalar
%Logmap(LieScalar p) : returns Vector
%identity() : returns gtsam::LieScalar
%
classdef LieScalar < gtsam.Value
  properties
    ptr_gtsamLieScalar = 0
  end
  methods
    function obj = LieScalar(varargin)
      if (nargin == 2 || (nargin == 3 && strcmp(varargin{3}, 'void'))) && isa(varargin{1}, 'uint64') && varargin{1} == uint64(5139824614673773682)
        if nargin == 2
          my_ptr = varargin{2};
        else
          my_ptr = gtsam_wrapper(6, varargin{2});
        end
        base_ptr = gtsam_wrapper(5, my_ptr);
      elseif nargin == 0
        [ my_ptr, base_ptr ] = gtsam_wrapper(7);
      elseif nargin == 1 && isa(varargin{1},'double')
        [ my_ptr, base_ptr ] = gtsam_wrapper(8, varargin{1});
      else
        error('Arguments do not match any overload of gtsam.LieScalar constructor');
      end
      obj = obj@gtsam.Value(uint64(5139824614673773682), base_ptr);
      obj.ptr_gtsamLieScalar = my_ptr;
    end

    function delete(obj)
      gtsam_wrapper(9, obj.ptr_gtsamLieScalar);
    end

    function display(obj), obj.print(''); end
    %DISPLAY Calls print on the object
    function disp(obj), obj.display; end
    %DISP Calls print on the object
    function varargout = between(this, varargin)
      % BETWEEN usage: between(LieScalar l2) : returns gtsam::LieScalar
      % Doxygen can be found at http://research.cc.gatech.edu/borg/sites/edu.borg/html/index.html
      if length(varargin) == 1 && isa(varargin{1},'gtsam.LieScalar')
        varargout{1} = gtsam_wrapper(10, this, varargin{:});
      else
        error('Arguments do not match any overload of function gtsam.LieScalar.between');
      end
    end

    function varargout = compose(this, varargin)
      % COMPOSE usage: compose(LieScalar p) : returns gtsam::LieScalar
      % Doxygen can be found at http://research.cc.gatech.edu/borg/sites/edu.borg/html/index.html
      if length(varargin) == 1 && isa(varargin{1},'gtsam.LieScalar')
        varargout{1} = gtsam_wrapper(11, this, varargin{:});
      else
        error('Arguments do not match any overload of function gtsam.LieScalar.compose');
      end
    end

    function varargout = dim(this, varargin)
      % DIM usage: dim() : returns size_t
      % Doxygen can be found at http://research.cc.gatech.edu/borg/sites/edu.borg/html/index.html
      varargout{1} = gtsam_wrapper(12, this, varargin{:});
    end

    function varargout = equals(this, varargin)
      % EQUALS usage: equals(LieScalar expected, double tol) : returns bool
      % Doxygen can be found at http://research.cc.gatech.edu/borg/sites/edu.borg/html/index.html
      if length(varargin) == 2 && isa(varargin{1},'gtsam.LieScalar') && isa(varargin{2},'double')
        varargout{1} = gtsam_wrapper(13, this, varargin{:});
      else
        error('Arguments do not match any overload of function gtsam.LieScalar.equals');
      end
    end

    function varargout = inverse(this, varargin)
      % INVERSE usage: inverse() : returns gtsam::LieScalar
      % Doxygen can be found at http://research.cc.gatech.edu/borg/sites/edu.borg/html/index.html
      varargout{1} = gtsam_wrapper(14, this, varargin{:});
    end

    function varargout = localCoordinates(this, varargin)
      % LOCALCOORDINATES usage: localCoordinates(LieScalar t2) : returns Vector
      % Doxygen can be found at http://research.cc.gatech.edu/borg/sites/edu.borg/html/index.html
      if length(varargin) == 1 && isa(varargin{1},'gtsam.LieScalar')
        varargout{1} = gtsam_wrapper(15, this, varargin{:});
      else
        error('Arguments do not match any overload of function gtsam.LieScalar.localCoordinates');
      end
    end

    function varargout = print(this, varargin)
      % PRINT usage: print(string s) : returns void
      % Doxygen can be found at http://research.cc.gatech.edu/borg/sites/edu.borg/html/index.html
      if length(varargin) == 1 && isa(varargin{1},'char')
        gtsam_wrapper(16, this, varargin{:});
      else
        error('Arguments do not match any overload of function gtsam.LieScalar.print');
      end
    end

    function varargout = retract(this, varargin)
      % RETRACT usage: retract(Vector v) : returns gtsam::LieScalar
      % Doxygen can be found at http://research.cc.gatech.edu/borg/sites/edu.borg/html/index.html
      if length(varargin) == 1 && isa(varargin{1},'double')
        varargout{1} = gtsam_wrapper(17, this, varargin{:});
      else
        error('Arguments do not match any overload of function gtsam.LieScalar.retract');
      end
    end

    function varargout = value(this, varargin)
      % VALUE usage: value() : returns double
      % Doxygen can be found at http://research.cc.gatech.edu/borg/sites/edu.borg/html/index.html
      varargout{1} = gtsam_wrapper(18, this, varargin{:});
    end

  end

  methods(Static = true)
    function varargout = Expmap(varargin)
      % EXPMAP usage: Expmap(Vector v) : returns gtsam::LieScalar
      % Doxygen can be found at http://research.cc.gatech.edu/borg/sites/edu.borg/html/index.html
      % 
      % Usage
      % EXPMAP(Vector v)
      if length(varargin) == 1 && isa(varargin{1},'double')
        varargout{1} = gtsam_wrapper(19, varargin{:});
      else
        error('Arguments do not match any overload of function gtsam.LieScalar.Expmap');
      end
    end

    function varargout = Logmap(varargin)
      % LOGMAP usage: Logmap(LieScalar p) : returns Vector
      % Doxygen can be found at http://research.cc.gatech.edu/borg/sites/edu.borg/html/index.html
      % 
      % Usage
      % LOGMAP(LieScalar p)
      if length(varargin) == 1 && isa(varargin{1},'gtsam.LieScalar')
        varargout{1} = gtsam_wrapper(20, varargin{:});
      else
        error('Arguments do not match any overload of function gtsam.LieScalar.Logmap');
      end
    end

    function varargout = Identity(varargin)
      % IDENTITY usage: identity() : returns gtsam::LieScalar
      % Doxygen can be found at http://research.cc.gatech.edu/borg/sites/edu.borg/html/index.html
      % 
      % Usage
      % IDENTITY()
      if length(varargin) == 0
        varargout{1} = gtsam_wrapper(21, varargin{:});
      else
        error('Arguments do not match any overload of function gtsam.LieScalar.Identity');
      end
    end

  end
end
