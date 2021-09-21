%class NonlinearISAM, see Doxygen page for details
%at http://research.cc.gatech.edu/borg/sites/edu.borg/html/index.html
%
%-------Constructors-------
%NonlinearISAM()
%NonlinearISAM(int reorderInterval)
%
%-------Methods-------
%bayesTree() : returns gtsam::GaussianISAM
%estimate() : returns gtsam::Values
%getFactorsUnsafe() : returns gtsam::NonlinearFactorGraph
%getLinearizationPoint() : returns gtsam::Values
%marginalCovariance(size_t key) : returns Matrix
%print(string s) : returns void
%printStats() : returns void
%reorderCounter() : returns int
%reorderInterval() : returns int
%reorder_relinearize() : returns void
%saveGraph(string s) : returns void
%update(NonlinearFactorGraph newFactors, Values initialValues) : returns void
%
classdef NonlinearISAM < handle
  properties
    ptr_gtsamNonlinearISAM = 0
  end
  methods
    function obj = NonlinearISAM(varargin)
      if nargin == 2 && isa(varargin{1}, 'uint64') && varargin{1} == uint64(5139824614673773682)
        my_ptr = varargin{2};
        gtsam_wrapper(1385, my_ptr);
      elseif nargin == 0
        my_ptr = gtsam_wrapper(1386);
      elseif nargin == 1 && isa(varargin{1},'numeric')
        my_ptr = gtsam_wrapper(1387, varargin{1});
      else
        error('Arguments do not match any overload of gtsam.NonlinearISAM constructor');
      end
      obj.ptr_gtsamNonlinearISAM = my_ptr;
    end

    function delete(obj)
      gtsam_wrapper(1388, obj.ptr_gtsamNonlinearISAM);
    end

    function display(obj), obj.print(''); end
    %DISPLAY Calls print on the object
    function disp(obj), obj.display; end
    %DISP Calls print on the object
    function varargout = bayesTree(this, varargin)
      % BAYESTREE usage: bayesTree() : returns gtsam::GaussianISAM
      % Doxygen can be found at http://research.cc.gatech.edu/borg/sites/edu.borg/html/index.html
      varargout{1} = gtsam_wrapper(1389, this, varargin{:});
    end

    function varargout = estimate(this, varargin)
      % ESTIMATE usage: estimate() : returns gtsam::Values
      % Doxygen can be found at http://research.cc.gatech.edu/borg/sites/edu.borg/html/index.html
      varargout{1} = gtsam_wrapper(1390, this, varargin{:});
    end

    function varargout = getFactorsUnsafe(this, varargin)
      % GETFACTORSUNSAFE usage: getFactorsUnsafe() : returns gtsam::NonlinearFactorGraph
      % Doxygen can be found at http://research.cc.gatech.edu/borg/sites/edu.borg/html/index.html
      varargout{1} = gtsam_wrapper(1391, this, varargin{:});
    end

    function varargout = getLinearizationPoint(this, varargin)
      % GETLINEARIZATIONPOINT usage: getLinearizationPoint() : returns gtsam::Values
      % Doxygen can be found at http://research.cc.gatech.edu/borg/sites/edu.borg/html/index.html
      varargout{1} = gtsam_wrapper(1392, this, varargin{:});
    end

    function varargout = marginalCovariance(this, varargin)
      % MARGINALCOVARIANCE usage: marginalCovariance(size_t key) : returns Matrix
      % Doxygen can be found at http://research.cc.gatech.edu/borg/sites/edu.borg/html/index.html
      varargout{1} = gtsam_wrapper(1393, this, varargin{:});
    end

    function varargout = print(this, varargin)
      % PRINT usage: print(string s) : returns void
      % Doxygen can be found at http://research.cc.gatech.edu/borg/sites/edu.borg/html/index.html
      if length(varargin) == 1 && isa(varargin{1},'char')
        gtsam_wrapper(1394, this, varargin{:});
      else
        error('Arguments do not match any overload of function gtsam.NonlinearISAM.print');
      end
    end

    function varargout = printStats(this, varargin)
      % PRINTSTATS usage: printStats() : returns void
      % Doxygen can be found at http://research.cc.gatech.edu/borg/sites/edu.borg/html/index.html
      gtsam_wrapper(1395, this, varargin{:});
    end

    function varargout = reorderCounter(this, varargin)
      % REORDERCOUNTER usage: reorderCounter() : returns int
      % Doxygen can be found at http://research.cc.gatech.edu/borg/sites/edu.borg/html/index.html
      varargout{1} = gtsam_wrapper(1396, this, varargin{:});
    end

    function varargout = reorderInterval(this, varargin)
      % REORDERINTERVAL usage: reorderInterval() : returns int
      % Doxygen can be found at http://research.cc.gatech.edu/borg/sites/edu.borg/html/index.html
      varargout{1} = gtsam_wrapper(1397, this, varargin{:});
    end

    function varargout = reorder_relinearize(this, varargin)
      % REORDER_RELINEARIZE usage: reorder_relinearize() : returns void
      % Doxygen can be found at http://research.cc.gatech.edu/borg/sites/edu.borg/html/index.html
      gtsam_wrapper(1398, this, varargin{:});
    end

    function varargout = saveGraph(this, varargin)
      % SAVEGRAPH usage: saveGraph(string s) : returns void
      % Doxygen can be found at http://research.cc.gatech.edu/borg/sites/edu.borg/html/index.html
      if length(varargin) == 1 && isa(varargin{1},'char')
        gtsam_wrapper(1399, this, varargin{:});
      else
        error('Arguments do not match any overload of function gtsam.NonlinearISAM.saveGraph');
      end
    end

    function varargout = update(this, varargin)
      % UPDATE usage: update(NonlinearFactorGraph newFactors, Values initialValues) : returns void
      % Doxygen can be found at http://research.cc.gatech.edu/borg/sites/edu.borg/html/index.html
      if length(varargin) == 2 && isa(varargin{1},'gtsam.NonlinearFactorGraph') && isa(varargin{2},'gtsam.Values')
        gtsam_wrapper(1400, this, varargin{:});
      else
        error('Arguments do not match any overload of function gtsam.NonlinearISAM.update');
      end
    end

  end

  methods(Static = true)
  end
end
