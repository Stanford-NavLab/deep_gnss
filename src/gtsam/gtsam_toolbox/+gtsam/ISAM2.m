%class ISAM2, see Doxygen page for details
%at http://research.cc.gatech.edu/borg/sites/edu.borg/html/index.html
%
%-------Constructors-------
%ISAM2()
%ISAM2(ISAM2Params params)
%ISAM2(ISAM2 other)
%
%-------Methods-------
%calculateBestEstimate() : returns gtsam::Values
%calculateEstimate() : returns gtsam::Values
%calculateEstimate(size_t key) : returns gtsam::Values
%equals(ISAM2 other, double tol) : returns bool
%getDelta() : returns gtsam::VectorValues
%getFactorsUnsafe() : returns gtsam::NonlinearFactorGraph
%getLinearizationPoint() : returns gtsam::Values
%getVariableIndex() : returns gtsam::VariableIndex
%marginalCovariance(size_t key) : returns Matrix
%params() : returns gtsam::ISAM2Params
%print(string s) : returns void
%printStats() : returns void
%saveGraph(string s) : returns void
%update() : returns gtsam::ISAM2Result
%update(NonlinearFactorGraph newFactors, Values newTheta) : returns gtsam::ISAM2Result
%update(NonlinearFactorGraph newFactors, Values newTheta, KeyVector removeFactorIndices) : returns gtsam::ISAM2Result
%update(NonlinearFactorGraph newFactors, Values newTheta, KeyVector removeFactorIndices, KeyGroupMap constrainedKeys) : returns gtsam::ISAM2Result
%
classdef ISAM2 < handle
  properties
    ptr_gtsamISAM2 = 0
  end
  methods
    function obj = ISAM2(varargin)
      if nargin == 2 && isa(varargin{1}, 'uint64') && varargin{1} == uint64(5139824614673773682)
        my_ptr = varargin{2};
        gtsam_wrapper(1363, my_ptr);
      elseif nargin == 0
        my_ptr = gtsam_wrapper(1364);
      elseif nargin == 1 && isa(varargin{1},'gtsam.ISAM2Params')
        my_ptr = gtsam_wrapper(1365, varargin{1});
      elseif nargin == 1 && isa(varargin{1},'gtsam.ISAM2')
        my_ptr = gtsam_wrapper(1366, varargin{1});
      else
        error('Arguments do not match any overload of gtsam.ISAM2 constructor');
      end
      obj.ptr_gtsamISAM2 = my_ptr;
    end

    function delete(obj)
      gtsam_wrapper(1367, obj.ptr_gtsamISAM2);
    end

    function display(obj), obj.print(''); end
    %DISPLAY Calls print on the object
    function disp(obj), obj.display; end
    %DISP Calls print on the object
    function varargout = calculateBestEstimate(this, varargin)
      % CALCULATEBESTESTIMATE usage: calculateBestEstimate() : returns gtsam::Values
      % Doxygen can be found at http://research.cc.gatech.edu/borg/sites/edu.borg/html/index.html
      varargout{1} = gtsam_wrapper(1368, this, varargin{:});
    end

    function varargout = calculateEstimate(this, varargin)
      % CALCULATEESTIMATE usage: calculateEstimate(), calculateEstimate(size_t key) : returns gtsam::Values
      % Doxygen can be found at http://research.cc.gatech.edu/borg/sites/edu.borg/html/index.html
      % 
      % Method Overloads
      % calculateEstimate()
      % calculateEstimate(size_t key)
      if length(varargin) == 0
        varargout{1} = gtsam_wrapper(1369, this, varargin{:});
      elseif length(varargin) == 1 && isa(varargin{1},'numeric')
        varargout{1} = gtsam_wrapper(1370, this, varargin{:});
      else
        error('Arguments do not match any overload of function gtsam.ISAM2.calculateEstimate');
      end
    end

    function varargout = equals(this, varargin)
      % EQUALS usage: equals(ISAM2 other, double tol) : returns bool
      % Doxygen can be found at http://research.cc.gatech.edu/borg/sites/edu.borg/html/index.html
      if length(varargin) == 2 && isa(varargin{1},'gtsam.ISAM2') && isa(varargin{2},'double')
        varargout{1} = gtsam_wrapper(1371, this, varargin{:});
      else
        error('Arguments do not match any overload of function gtsam.ISAM2.equals');
      end
    end

    function varargout = getDelta(this, varargin)
      % GETDELTA usage: getDelta() : returns gtsam::VectorValues
      % Doxygen can be found at http://research.cc.gatech.edu/borg/sites/edu.borg/html/index.html
      varargout{1} = gtsam_wrapper(1372, this, varargin{:});
    end

    function varargout = getFactorsUnsafe(this, varargin)
      % GETFACTORSUNSAFE usage: getFactorsUnsafe() : returns gtsam::NonlinearFactorGraph
      % Doxygen can be found at http://research.cc.gatech.edu/borg/sites/edu.borg/html/index.html
      varargout{1} = gtsam_wrapper(1373, this, varargin{:});
    end

    function varargout = getLinearizationPoint(this, varargin)
      % GETLINEARIZATIONPOINT usage: getLinearizationPoint() : returns gtsam::Values
      % Doxygen can be found at http://research.cc.gatech.edu/borg/sites/edu.borg/html/index.html
      varargout{1} = gtsam_wrapper(1374, this, varargin{:});
    end

    function varargout = getVariableIndex(this, varargin)
      % GETVARIABLEINDEX usage: getVariableIndex() : returns gtsam::VariableIndex
      % Doxygen can be found at http://research.cc.gatech.edu/borg/sites/edu.borg/html/index.html
      varargout{1} = gtsam_wrapper(1375, this, varargin{:});
    end

    function varargout = marginalCovariance(this, varargin)
      % MARGINALCOVARIANCE usage: marginalCovariance(size_t key) : returns Matrix
      % Doxygen can be found at http://research.cc.gatech.edu/borg/sites/edu.borg/html/index.html
      varargout{1} = gtsam_wrapper(1376, this, varargin{:});
    end

    function varargout = params(this, varargin)
      % PARAMS usage: params() : returns gtsam::ISAM2Params
      % Doxygen can be found at http://research.cc.gatech.edu/borg/sites/edu.borg/html/index.html
      varargout{1} = gtsam_wrapper(1377, this, varargin{:});
    end

    function varargout = print(this, varargin)
      % PRINT usage: print(string s) : returns void
      % Doxygen can be found at http://research.cc.gatech.edu/borg/sites/edu.borg/html/index.html
      if length(varargin) == 1 && isa(varargin{1},'char')
        gtsam_wrapper(1378, this, varargin{:});
      else
        error('Arguments do not match any overload of function gtsam.ISAM2.print');
      end
    end

    function varargout = printStats(this, varargin)
      % PRINTSTATS usage: printStats() : returns void
      % Doxygen can be found at http://research.cc.gatech.edu/borg/sites/edu.borg/html/index.html
      gtsam_wrapper(1379, this, varargin{:});
    end

    function varargout = saveGraph(this, varargin)
      % SAVEGRAPH usage: saveGraph(string s) : returns void
      % Doxygen can be found at http://research.cc.gatech.edu/borg/sites/edu.borg/html/index.html
      if length(varargin) == 1 && isa(varargin{1},'char')
        gtsam_wrapper(1380, this, varargin{:});
      else
        error('Arguments do not match any overload of function gtsam.ISAM2.saveGraph');
      end
    end

    function varargout = update(this, varargin)
      % UPDATE usage: update(), update(NonlinearFactorGraph newFactors, Values newTheta), update(NonlinearFactorGraph newFactors, Values newTheta, KeyVector removeFactorIndices), update(NonlinearFactorGraph newFactors, Values newTheta, KeyVector removeFactorIndices, KeyGroupMap constrainedKeys) : returns gtsam::ISAM2Result
      % Doxygen can be found at http://research.cc.gatech.edu/borg/sites/edu.borg/html/index.html
      % 
      % Method Overloads
      % update()
      % update(NonlinearFactorGraph newFactors, Values newTheta)
      % update(NonlinearFactorGraph newFactors, Values newTheta, KeyVector removeFactorIndices)
      % update(NonlinearFactorGraph newFactors, Values newTheta, KeyVector removeFactorIndices, KeyGroupMap constrainedKeys)
      if length(varargin) == 0
        varargout{1} = gtsam_wrapper(1381, this, varargin{:});
      elseif length(varargin) == 2 && isa(varargin{1},'gtsam.NonlinearFactorGraph') && isa(varargin{2},'gtsam.Values')
        varargout{1} = gtsam_wrapper(1382, this, varargin{:});
      elseif length(varargin) == 3 && isa(varargin{1},'gtsam.NonlinearFactorGraph') && isa(varargin{2},'gtsam.Values') && isa(varargin{3},'gtsam.KeyVector')
        varargout{1} = gtsam_wrapper(1383, this, varargin{:});
      elseif length(varargin) == 4 && isa(varargin{1},'gtsam.NonlinearFactorGraph') && isa(varargin{2},'gtsam.Values') && isa(varargin{3},'gtsam.KeyVector') && isa(varargin{4},'gtsam.KeyGroupMap')
        varargout{1} = gtsam_wrapper(1384, this, varargin{:});
      else
        error('Arguments do not match any overload of function gtsam.ISAM2.update');
      end
    end

  end

  methods(Static = true)
  end
end
