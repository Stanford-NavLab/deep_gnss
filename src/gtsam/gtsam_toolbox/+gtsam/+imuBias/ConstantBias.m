%class ConstantBias, see Doxygen page for details
%at http://research.cc.gatech.edu/borg/sites/edu.borg/html/index.html
%
%-------Constructors-------
%ConstantBias()
%ConstantBias(Vector biasAcc, Vector biasGyro)
%
%-------Methods-------
%accelerometer() : returns Vector
%between(ConstantBias b) : returns gtsam::imuBias::ConstantBias
%compose(ConstantBias b) : returns gtsam::imuBias::ConstantBias
%correctAccelerometer(Vector measurement) : returns Vector
%correctGyroscope(Vector measurement) : returns Vector
%dim() : returns size_t
%equals(ConstantBias expected, double tol) : returns bool
%gyroscope() : returns Vector
%inverse() : returns gtsam::imuBias::ConstantBias
%localCoordinates(ConstantBias b) : returns Vector
%print(string s) : returns void
%retract(Vector v) : returns gtsam::imuBias::ConstantBias
%vector() : returns Vector
%
%-------Static Methods-------
%Dim() : returns size_t
%Expmap(Vector v) : returns gtsam::imuBias::ConstantBias
%Logmap(ConstantBias b) : returns Vector
%identity() : returns gtsam::imuBias::ConstantBias
%
classdef ConstantBias < gtsam.Value
  properties
    ptr_gtsamimuBiasConstantBias = 0
  end
  methods
    function obj = ConstantBias(varargin)
      if (nargin == 2 || (nargin == 3 && strcmp(varargin{3}, 'void'))) && isa(varargin{1}, 'uint64') && varargin{1} == uint64(5139824614673773682)
        if nargin == 2
          my_ptr = varargin{2};
        else
          my_ptr = gtsam_wrapper(2079, varargin{2});
        end
        base_ptr = gtsam_wrapper(2078, my_ptr);
      elseif nargin == 0
        [ my_ptr, base_ptr ] = gtsam_wrapper(2080);
      elseif nargin == 2 && isa(varargin{1},'double') && isa(varargin{2},'double')
        [ my_ptr, base_ptr ] = gtsam_wrapper(2081, varargin{1}, varargin{2});
      else
        error('Arguments do not match any overload of gtsam.imuBias.ConstantBias constructor');
      end
      obj = obj@gtsam.Value(uint64(5139824614673773682), base_ptr);
      obj.ptr_gtsamimuBiasConstantBias = my_ptr;
    end

    function delete(obj)
      gtsam_wrapper(2082, obj.ptr_gtsamimuBiasConstantBias);
    end

    function display(obj), obj.print(''); end
    %DISPLAY Calls print on the object
    function disp(obj), obj.display; end
    %DISP Calls print on the object
    function varargout = accelerometer(this, varargin)
      % ACCELEROMETER usage: accelerometer() : returns Vector
      % Doxygen can be found at http://research.cc.gatech.edu/borg/sites/edu.borg/html/index.html
      varargout{1} = gtsam_wrapper(2083, this, varargin{:});
    end

    function varargout = between(this, varargin)
      % BETWEEN usage: between(ConstantBias b) : returns gtsam::imuBias::ConstantBias
      % Doxygen can be found at http://research.cc.gatech.edu/borg/sites/edu.borg/html/index.html
      if length(varargin) == 1 && isa(varargin{1},'gtsam.imuBias.ConstantBias')
        varargout{1} = gtsam_wrapper(2084, this, varargin{:});
      else
        error('Arguments do not match any overload of function gtsam.imuBias.ConstantBias.between');
      end
    end

    function varargout = compose(this, varargin)
      % COMPOSE usage: compose(ConstantBias b) : returns gtsam::imuBias::ConstantBias
      % Doxygen can be found at http://research.cc.gatech.edu/borg/sites/edu.borg/html/index.html
      if length(varargin) == 1 && isa(varargin{1},'gtsam.imuBias.ConstantBias')
        varargout{1} = gtsam_wrapper(2085, this, varargin{:});
      else
        error('Arguments do not match any overload of function gtsam.imuBias.ConstantBias.compose');
      end
    end

    function varargout = correctAccelerometer(this, varargin)
      % CORRECTACCELEROMETER usage: correctAccelerometer(Vector measurement) : returns Vector
      % Doxygen can be found at http://research.cc.gatech.edu/borg/sites/edu.borg/html/index.html
      if length(varargin) == 1 && isa(varargin{1},'double')
        varargout{1} = gtsam_wrapper(2086, this, varargin{:});
      else
        error('Arguments do not match any overload of function gtsam.imuBias.ConstantBias.correctAccelerometer');
      end
    end

    function varargout = correctGyroscope(this, varargin)
      % CORRECTGYROSCOPE usage: correctGyroscope(Vector measurement) : returns Vector
      % Doxygen can be found at http://research.cc.gatech.edu/borg/sites/edu.borg/html/index.html
      if length(varargin) == 1 && isa(varargin{1},'double')
        varargout{1} = gtsam_wrapper(2087, this, varargin{:});
      else
        error('Arguments do not match any overload of function gtsam.imuBias.ConstantBias.correctGyroscope');
      end
    end

    function varargout = dim(this, varargin)
      % DIM usage: dim() : returns size_t
      % Doxygen can be found at http://research.cc.gatech.edu/borg/sites/edu.borg/html/index.html
      varargout{1} = gtsam_wrapper(2088, this, varargin{:});
    end

    function varargout = equals(this, varargin)
      % EQUALS usage: equals(ConstantBias expected, double tol) : returns bool
      % Doxygen can be found at http://research.cc.gatech.edu/borg/sites/edu.borg/html/index.html
      if length(varargin) == 2 && isa(varargin{1},'gtsam.imuBias.ConstantBias') && isa(varargin{2},'double')
        varargout{1} = gtsam_wrapper(2089, this, varargin{:});
      else
        error('Arguments do not match any overload of function gtsam.imuBias.ConstantBias.equals');
      end
    end

    function varargout = gyroscope(this, varargin)
      % GYROSCOPE usage: gyroscope() : returns Vector
      % Doxygen can be found at http://research.cc.gatech.edu/borg/sites/edu.borg/html/index.html
      varargout{1} = gtsam_wrapper(2090, this, varargin{:});
    end

    function varargout = inverse(this, varargin)
      % INVERSE usage: inverse() : returns gtsam::imuBias::ConstantBias
      % Doxygen can be found at http://research.cc.gatech.edu/borg/sites/edu.borg/html/index.html
      varargout{1} = gtsam_wrapper(2091, this, varargin{:});
    end

    function varargout = localCoordinates(this, varargin)
      % LOCALCOORDINATES usage: localCoordinates(ConstantBias b) : returns Vector
      % Doxygen can be found at http://research.cc.gatech.edu/borg/sites/edu.borg/html/index.html
      if length(varargin) == 1 && isa(varargin{1},'gtsam.imuBias.ConstantBias')
        varargout{1} = gtsam_wrapper(2092, this, varargin{:});
      else
        error('Arguments do not match any overload of function gtsam.imuBias.ConstantBias.localCoordinates');
      end
    end

    function varargout = print(this, varargin)
      % PRINT usage: print(string s) : returns void
      % Doxygen can be found at http://research.cc.gatech.edu/borg/sites/edu.borg/html/index.html
      if length(varargin) == 1 && isa(varargin{1},'char')
        gtsam_wrapper(2093, this, varargin{:});
      else
        error('Arguments do not match any overload of function gtsam.imuBias.ConstantBias.print');
      end
    end

    function varargout = retract(this, varargin)
      % RETRACT usage: retract(Vector v) : returns gtsam::imuBias::ConstantBias
      % Doxygen can be found at http://research.cc.gatech.edu/borg/sites/edu.borg/html/index.html
      if length(varargin) == 1 && isa(varargin{1},'double')
        varargout{1} = gtsam_wrapper(2094, this, varargin{:});
      else
        error('Arguments do not match any overload of function gtsam.imuBias.ConstantBias.retract');
      end
    end

    function varargout = vector(this, varargin)
      % VECTOR usage: vector() : returns Vector
      % Doxygen can be found at http://research.cc.gatech.edu/borg/sites/edu.borg/html/index.html
      varargout{1} = gtsam_wrapper(2095, this, varargin{:});
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
        varargout{1} = gtsam_wrapper(2096, varargin{:});
      else
        error('Arguments do not match any overload of function gtsam.imuBias.ConstantBias.Dim');
      end
    end

    function varargout = Expmap(varargin)
      % EXPMAP usage: Expmap(Vector v) : returns gtsam::imuBias::ConstantBias
      % Doxygen can be found at http://research.cc.gatech.edu/borg/sites/edu.borg/html/index.html
      % 
      % Usage
      % EXPMAP(Vector v)
      if length(varargin) == 1 && isa(varargin{1},'double')
        varargout{1} = gtsam_wrapper(2097, varargin{:});
      else
        error('Arguments do not match any overload of function gtsam.imuBias.ConstantBias.Expmap');
      end
    end

    function varargout = Logmap(varargin)
      % LOGMAP usage: Logmap(ConstantBias b) : returns Vector
      % Doxygen can be found at http://research.cc.gatech.edu/borg/sites/edu.borg/html/index.html
      % 
      % Usage
      % LOGMAP(ConstantBias b)
      if length(varargin) == 1 && isa(varargin{1},'gtsam.imuBias.ConstantBias')
        varargout{1} = gtsam_wrapper(2098, varargin{:});
      else
        error('Arguments do not match any overload of function gtsam.imuBias.ConstantBias.Logmap');
      end
    end

    function varargout = Identity(varargin)
      % IDENTITY usage: identity() : returns gtsam::imuBias::ConstantBias
      % Doxygen can be found at http://research.cc.gatech.edu/borg/sites/edu.borg/html/index.html
      % 
      % Usage
      % IDENTITY()
      if length(varargin) == 0
        varargout{1} = gtsam_wrapper(2099, varargin{:});
      else
        error('Arguments do not match any overload of function gtsam.imuBias.ConstantBias.Identity');
      end
    end

  end
end
