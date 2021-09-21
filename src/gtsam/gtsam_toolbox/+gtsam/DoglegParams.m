%class DoglegParams, see Doxygen page for details
%at http://research.cc.gatech.edu/borg/sites/edu.borg/html/index.html
%
%-------Constructors-------
%DoglegParams()
%
%-------Methods-------
%getAbsoluteErrorTol() : returns double
%getDeltaInitial() : returns double
%getErrorTol() : returns double
%getLinearSolverType() : returns string
%getMaxIterations() : returns int
%getRelativeErrorTol() : returns double
%getVerbosity() : returns string
%getVerbosityDL() : returns string
%isCholmod() : returns bool
%isIterative() : returns bool
%isMultifrontal() : returns bool
%isSequential() : returns bool
%print(string s) : returns void
%setAbsoluteErrorTol(double value) : returns void
%setDeltaInitial(double deltaInitial) : returns void
%setErrorTol(double value) : returns void
%setIterativeParams(IterativeOptimizationParameters params) : returns void
%setLinearSolverType(string solver) : returns void
%setMaxIterations(int value) : returns void
%setOrdering(Ordering ordering) : returns void
%setRelativeErrorTol(double value) : returns void
%setVerbosity(string s) : returns void
%setVerbosityDL(string verbosityDL) : returns void
%
classdef DoglegParams < gtsam.NonlinearOptimizerParams
  properties
    ptr_gtsamDoglegParams = 0
  end
  methods
    function obj = DoglegParams(varargin)
      if (nargin == 2 || (nargin == 3 && strcmp(varargin{3}, 'void'))) && isa(varargin{1}, 'uint64') && varargin{1} == uint64(5139824614673773682)
        if nargin == 2
          my_ptr = varargin{2};
        else
          my_ptr = gtsam_wrapper(1228, varargin{2});
        end
        base_ptr = gtsam_wrapper(1227, my_ptr);
      elseif nargin == 0
        [ my_ptr, base_ptr ] = gtsam_wrapper(1229);
      else
        error('Arguments do not match any overload of gtsam.DoglegParams constructor');
      end
      obj = obj@gtsam.NonlinearOptimizerParams(uint64(5139824614673773682), base_ptr);
      obj.ptr_gtsamDoglegParams = my_ptr;
    end

    function delete(obj)
      gtsam_wrapper(1230, obj.ptr_gtsamDoglegParams);
    end

    function display(obj), obj.print(''); end
    %DISPLAY Calls print on the object
    function disp(obj), obj.display; end
    %DISP Calls print on the object
    function varargout = getAbsoluteErrorTol(this, varargin)
      % GETABSOLUTEERRORTOL usage: getAbsoluteErrorTol() : returns double
      % Doxygen can be found at http://research.cc.gatech.edu/borg/sites/edu.borg/html/index.html
      varargout{1} = gtsam_wrapper(1231, this, varargin{:});
    end

    function varargout = getDeltaInitial(this, varargin)
      % GETDELTAINITIAL usage: getDeltaInitial() : returns double
      % Doxygen can be found at http://research.cc.gatech.edu/borg/sites/edu.borg/html/index.html
      varargout{1} = gtsam_wrapper(1232, this, varargin{:});
    end

    function varargout = getErrorTol(this, varargin)
      % GETERRORTOL usage: getErrorTol() : returns double
      % Doxygen can be found at http://research.cc.gatech.edu/borg/sites/edu.borg/html/index.html
      varargout{1} = gtsam_wrapper(1233, this, varargin{:});
    end

    function varargout = getLinearSolverType(this, varargin)
      % GETLINEARSOLVERTYPE usage: getLinearSolverType() : returns string
      % Doxygen can be found at http://research.cc.gatech.edu/borg/sites/edu.borg/html/index.html
      varargout{1} = gtsam_wrapper(1234, this, varargin{:});
    end

    function varargout = getMaxIterations(this, varargin)
      % GETMAXITERATIONS usage: getMaxIterations() : returns int
      % Doxygen can be found at http://research.cc.gatech.edu/borg/sites/edu.borg/html/index.html
      varargout{1} = gtsam_wrapper(1235, this, varargin{:});
    end

    function varargout = getRelativeErrorTol(this, varargin)
      % GETRELATIVEERRORTOL usage: getRelativeErrorTol() : returns double
      % Doxygen can be found at http://research.cc.gatech.edu/borg/sites/edu.borg/html/index.html
      varargout{1} = gtsam_wrapper(1236, this, varargin{:});
    end

    function varargout = getVerbosity(this, varargin)
      % GETVERBOSITY usage: getVerbosity() : returns string
      % Doxygen can be found at http://research.cc.gatech.edu/borg/sites/edu.borg/html/index.html
      varargout{1} = gtsam_wrapper(1237, this, varargin{:});
    end

    function varargout = getVerbosityDL(this, varargin)
      % GETVERBOSITYDL usage: getVerbosityDL() : returns string
      % Doxygen can be found at http://research.cc.gatech.edu/borg/sites/edu.borg/html/index.html
      varargout{1} = gtsam_wrapper(1238, this, varargin{:});
    end

    function varargout = isCholmod(this, varargin)
      % ISCHOLMOD usage: isCholmod() : returns bool
      % Doxygen can be found at http://research.cc.gatech.edu/borg/sites/edu.borg/html/index.html
      varargout{1} = gtsam_wrapper(1239, this, varargin{:});
    end

    function varargout = isIterative(this, varargin)
      % ISITERATIVE usage: isIterative() : returns bool
      % Doxygen can be found at http://research.cc.gatech.edu/borg/sites/edu.borg/html/index.html
      varargout{1} = gtsam_wrapper(1240, this, varargin{:});
    end

    function varargout = isMultifrontal(this, varargin)
      % ISMULTIFRONTAL usage: isMultifrontal() : returns bool
      % Doxygen can be found at http://research.cc.gatech.edu/borg/sites/edu.borg/html/index.html
      varargout{1} = gtsam_wrapper(1241, this, varargin{:});
    end

    function varargout = isSequential(this, varargin)
      % ISSEQUENTIAL usage: isSequential() : returns bool
      % Doxygen can be found at http://research.cc.gatech.edu/borg/sites/edu.borg/html/index.html
      varargout{1} = gtsam_wrapper(1242, this, varargin{:});
    end

    function varargout = print(this, varargin)
      % PRINT usage: print(string s) : returns void
      % Doxygen can be found at http://research.cc.gatech.edu/borg/sites/edu.borg/html/index.html
      if length(varargin) == 1 && isa(varargin{1},'char')
        gtsam_wrapper(1243, this, varargin{:});
      else
        error('Arguments do not match any overload of function gtsam.DoglegParams.print');
      end
    end

    function varargout = setAbsoluteErrorTol(this, varargin)
      % SETABSOLUTEERRORTOL usage: setAbsoluteErrorTol(double value) : returns void
      % Doxygen can be found at http://research.cc.gatech.edu/borg/sites/edu.borg/html/index.html
      gtsam_wrapper(1244, this, varargin{:});
    end

    function varargout = setDeltaInitial(this, varargin)
      % SETDELTAINITIAL usage: setDeltaInitial(double deltaInitial) : returns void
      % Doxygen can be found at http://research.cc.gatech.edu/borg/sites/edu.borg/html/index.html
      gtsam_wrapper(1245, this, varargin{:});
    end

    function varargout = setErrorTol(this, varargin)
      % SETERRORTOL usage: setErrorTol(double value) : returns void
      % Doxygen can be found at http://research.cc.gatech.edu/borg/sites/edu.borg/html/index.html
      gtsam_wrapper(1246, this, varargin{:});
    end

    function varargout = setIterativeParams(this, varargin)
      % SETITERATIVEPARAMS usage: setIterativeParams(IterativeOptimizationParameters params) : returns void
      % Doxygen can be found at http://research.cc.gatech.edu/borg/sites/edu.borg/html/index.html
      if length(varargin) == 1 && isa(varargin{1},'gtsam.IterativeOptimizationParameters')
        gtsam_wrapper(1247, this, varargin{:});
      else
        error('Arguments do not match any overload of function gtsam.DoglegParams.setIterativeParams');
      end
    end

    function varargout = setLinearSolverType(this, varargin)
      % SETLINEARSOLVERTYPE usage: setLinearSolverType(string solver) : returns void
      % Doxygen can be found at http://research.cc.gatech.edu/borg/sites/edu.borg/html/index.html
      if length(varargin) == 1 && isa(varargin{1},'char')
        gtsam_wrapper(1248, this, varargin{:});
      else
        error('Arguments do not match any overload of function gtsam.DoglegParams.setLinearSolverType');
      end
    end

    function varargout = setMaxIterations(this, varargin)
      % SETMAXITERATIONS usage: setMaxIterations(int value) : returns void
      % Doxygen can be found at http://research.cc.gatech.edu/borg/sites/edu.borg/html/index.html
      gtsam_wrapper(1249, this, varargin{:});
    end

    function varargout = setOrdering(this, varargin)
      % SETORDERING usage: setOrdering(Ordering ordering) : returns void
      % Doxygen can be found at http://research.cc.gatech.edu/borg/sites/edu.borg/html/index.html
      if length(varargin) == 1 && isa(varargin{1},'gtsam.Ordering')
        gtsam_wrapper(1250, this, varargin{:});
      else
        error('Arguments do not match any overload of function gtsam.DoglegParams.setOrdering');
      end
    end

    function varargout = setRelativeErrorTol(this, varargin)
      % SETRELATIVEERRORTOL usage: setRelativeErrorTol(double value) : returns void
      % Doxygen can be found at http://research.cc.gatech.edu/borg/sites/edu.borg/html/index.html
      gtsam_wrapper(1251, this, varargin{:});
    end

    function varargout = setVerbosity(this, varargin)
      % SETVERBOSITY usage: setVerbosity(string s) : returns void
      % Doxygen can be found at http://research.cc.gatech.edu/borg/sites/edu.borg/html/index.html
      if length(varargin) == 1 && isa(varargin{1},'char')
        gtsam_wrapper(1252, this, varargin{:});
      else
        error('Arguments do not match any overload of function gtsam.DoglegParams.setVerbosity');
      end
    end

    function varargout = setVerbosityDL(this, varargin)
      % SETVERBOSITYDL usage: setVerbosityDL(string verbosityDL) : returns void
      % Doxygen can be found at http://research.cc.gatech.edu/borg/sites/edu.borg/html/index.html
      if length(varargin) == 1 && isa(varargin{1},'char')
        gtsam_wrapper(1253, this, varargin{:});
      else
        error('Arguments do not match any overload of function gtsam.DoglegParams.setVerbosityDL');
      end
    end

  end

  methods(Static = true)
  end
end
