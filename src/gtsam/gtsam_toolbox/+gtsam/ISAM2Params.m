%class ISAM2Params, see Doxygen page for details
%at http://research.cc.gatech.edu/borg/sites/edu.borg/html/index.html
%
%-------Constructors-------
%ISAM2Params()
%
%-------Methods-------
%getFactorization() : returns string
%getRelinearizeSkip() : returns int
%isCacheLinearizedFactors() : returns bool
%isEnableDetailedResults() : returns bool
%isEnablePartialRelinearizationCheck() : returns bool
%isEnableRelinearization() : returns bool
%isEvaluateNonlinearError() : returns bool
%print(string str) : returns void
%setCacheLinearizedFactors(bool cacheLinearizedFactors) : returns void
%setEnableDetailedResults(bool enableDetailedResults) : returns void
%setEnablePartialRelinearizationCheck(bool enablePartialRelinearizationCheck) : returns void
%setEnableRelinearization(bool enableRelinearization) : returns void
%setEvaluateNonlinearError(bool evaluateNonlinearError) : returns void
%setFactorization(string factorization) : returns void
%setOptimizationParams(ISAM2GaussNewtonParams params) : returns void
%setOptimizationParams(ISAM2DoglegParams params) : returns void
%setRelinearizeSkip(int relinearizeSkip) : returns void
%setRelinearizeThreshold(double relinearizeThreshold) : returns void
%setRelinearizeThreshold(ISAM2ThresholdMap relinearizeThreshold) : returns void
%
classdef ISAM2Params < handle
  properties
    ptr_gtsamISAM2Params = 0
  end
  methods
    function obj = ISAM2Params(varargin)
      if nargin == 2 && isa(varargin{1}, 'uint64') && varargin{1} == uint64(5139824614673773682)
        my_ptr = varargin{2};
        gtsam_wrapper(1329, my_ptr);
      elseif nargin == 0
        my_ptr = gtsam_wrapper(1330);
      else
        error('Arguments do not match any overload of gtsam.ISAM2Params constructor');
      end
      obj.ptr_gtsamISAM2Params = my_ptr;
    end

    function delete(obj)
      gtsam_wrapper(1331, obj.ptr_gtsamISAM2Params);
    end

    function display(obj), obj.print(''); end
    %DISPLAY Calls print on the object
    function disp(obj), obj.display; end
    %DISP Calls print on the object
    function varargout = getFactorization(this, varargin)
      % GETFACTORIZATION usage: getFactorization() : returns string
      % Doxygen can be found at http://research.cc.gatech.edu/borg/sites/edu.borg/html/index.html
      varargout{1} = gtsam_wrapper(1332, this, varargin{:});
    end

    function varargout = getRelinearizeSkip(this, varargin)
      % GETRELINEARIZESKIP usage: getRelinearizeSkip() : returns int
      % Doxygen can be found at http://research.cc.gatech.edu/borg/sites/edu.borg/html/index.html
      varargout{1} = gtsam_wrapper(1333, this, varargin{:});
    end

    function varargout = isCacheLinearizedFactors(this, varargin)
      % ISCACHELINEARIZEDFACTORS usage: isCacheLinearizedFactors() : returns bool
      % Doxygen can be found at http://research.cc.gatech.edu/borg/sites/edu.borg/html/index.html
      varargout{1} = gtsam_wrapper(1334, this, varargin{:});
    end

    function varargout = isEnableDetailedResults(this, varargin)
      % ISENABLEDETAILEDRESULTS usage: isEnableDetailedResults() : returns bool
      % Doxygen can be found at http://research.cc.gatech.edu/borg/sites/edu.borg/html/index.html
      varargout{1} = gtsam_wrapper(1335, this, varargin{:});
    end

    function varargout = isEnablePartialRelinearizationCheck(this, varargin)
      % ISENABLEPARTIALRELINEARIZATIONCHECK usage: isEnablePartialRelinearizationCheck() : returns bool
      % Doxygen can be found at http://research.cc.gatech.edu/borg/sites/edu.borg/html/index.html
      varargout{1} = gtsam_wrapper(1336, this, varargin{:});
    end

    function varargout = isEnableRelinearization(this, varargin)
      % ISENABLERELINEARIZATION usage: isEnableRelinearization() : returns bool
      % Doxygen can be found at http://research.cc.gatech.edu/borg/sites/edu.borg/html/index.html
      varargout{1} = gtsam_wrapper(1337, this, varargin{:});
    end

    function varargout = isEvaluateNonlinearError(this, varargin)
      % ISEVALUATENONLINEARERROR usage: isEvaluateNonlinearError() : returns bool
      % Doxygen can be found at http://research.cc.gatech.edu/borg/sites/edu.borg/html/index.html
      varargout{1} = gtsam_wrapper(1338, this, varargin{:});
    end

    function varargout = print(this, varargin)
      % PRINT usage: print(string str) : returns void
      % Doxygen can be found at http://research.cc.gatech.edu/borg/sites/edu.borg/html/index.html
      if length(varargin) == 1 && isa(varargin{1},'char')
        gtsam_wrapper(1339, this, varargin{:});
      else
        error('Arguments do not match any overload of function gtsam.ISAM2Params.print');
      end
    end

    function varargout = setCacheLinearizedFactors(this, varargin)
      % SETCACHELINEARIZEDFACTORS usage: setCacheLinearizedFactors(bool cacheLinearizedFactors) : returns void
      % Doxygen can be found at http://research.cc.gatech.edu/borg/sites/edu.borg/html/index.html
      gtsam_wrapper(1340, this, varargin{:});
    end

    function varargout = setEnableDetailedResults(this, varargin)
      % SETENABLEDETAILEDRESULTS usage: setEnableDetailedResults(bool enableDetailedResults) : returns void
      % Doxygen can be found at http://research.cc.gatech.edu/borg/sites/edu.borg/html/index.html
      gtsam_wrapper(1341, this, varargin{:});
    end

    function varargout = setEnablePartialRelinearizationCheck(this, varargin)
      % SETENABLEPARTIALRELINEARIZATIONCHECK usage: setEnablePartialRelinearizationCheck(bool enablePartialRelinearizationCheck) : returns void
      % Doxygen can be found at http://research.cc.gatech.edu/borg/sites/edu.borg/html/index.html
      gtsam_wrapper(1342, this, varargin{:});
    end

    function varargout = setEnableRelinearization(this, varargin)
      % SETENABLERELINEARIZATION usage: setEnableRelinearization(bool enableRelinearization) : returns void
      % Doxygen can be found at http://research.cc.gatech.edu/borg/sites/edu.borg/html/index.html
      gtsam_wrapper(1343, this, varargin{:});
    end

    function varargout = setEvaluateNonlinearError(this, varargin)
      % SETEVALUATENONLINEARERROR usage: setEvaluateNonlinearError(bool evaluateNonlinearError) : returns void
      % Doxygen can be found at http://research.cc.gatech.edu/borg/sites/edu.borg/html/index.html
      gtsam_wrapper(1344, this, varargin{:});
    end

    function varargout = setFactorization(this, varargin)
      % SETFACTORIZATION usage: setFactorization(string factorization) : returns void
      % Doxygen can be found at http://research.cc.gatech.edu/borg/sites/edu.borg/html/index.html
      if length(varargin) == 1 && isa(varargin{1},'char')
        gtsam_wrapper(1345, this, varargin{:});
      else
        error('Arguments do not match any overload of function gtsam.ISAM2Params.setFactorization');
      end
    end

    function varargout = setOptimizationParams(this, varargin)
      % SETOPTIMIZATIONPARAMS usage: setOptimizationParams(ISAM2GaussNewtonParams params), setOptimizationParams(ISAM2DoglegParams params) : returns void
      % Doxygen can be found at http://research.cc.gatech.edu/borg/sites/edu.borg/html/index.html
      % 
      % Method Overloads
      % setOptimizationParams(ISAM2GaussNewtonParams params)
      % setOptimizationParams(ISAM2DoglegParams params)
      if length(varargin) == 1 && isa(varargin{1},'gtsam.ISAM2GaussNewtonParams')
        gtsam_wrapper(1346, this, varargin{:});
      elseif length(varargin) == 1 && isa(varargin{1},'gtsam.ISAM2DoglegParams')
        gtsam_wrapper(1347, this, varargin{:});
      else
        error('Arguments do not match any overload of function gtsam.ISAM2Params.setOptimizationParams');
      end
    end

    function varargout = setRelinearizeSkip(this, varargin)
      % SETRELINEARIZESKIP usage: setRelinearizeSkip(int relinearizeSkip) : returns void
      % Doxygen can be found at http://research.cc.gatech.edu/borg/sites/edu.borg/html/index.html
      gtsam_wrapper(1348, this, varargin{:});
    end

    function varargout = setRelinearizeThreshold(this, varargin)
      % SETRELINEARIZETHRESHOLD usage: setRelinearizeThreshold(double relinearizeThreshold), setRelinearizeThreshold(ISAM2ThresholdMap relinearizeThreshold) : returns void
      % Doxygen can be found at http://research.cc.gatech.edu/borg/sites/edu.borg/html/index.html
      % 
      % Method Overloads
      % setRelinearizeThreshold(double relinearizeThreshold)
      % setRelinearizeThreshold(ISAM2ThresholdMap relinearizeThreshold)
      if length(varargin) == 1 && isa(varargin{1},'double')
        gtsam_wrapper(1349, this, varargin{:});
      elseif length(varargin) == 1 && isa(varargin{1},'gtsam.ISAM2ThresholdMap')
        gtsam_wrapper(1350, this, varargin{:});
      else
        error('Arguments do not match any overload of function gtsam.ISAM2Params.setRelinearizeThreshold');
      end
    end

  end

  methods(Static = true)
  end
end
