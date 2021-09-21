%class GaussianBayesTree, see Doxygen page for details
%at http://research.cc.gatech.edu/borg/sites/edu.borg/html/index.html
%
%-------Constructors-------
%GaussianBayesTree()
%GaussianBayesTree(GaussianBayesTree other)
%
%-------Methods-------
%determinant() : returns double
%empty() : returns bool
%equals(GaussianBayesTree other, double tol) : returns bool
%error(VectorValues x) : returns double
%gradient(VectorValues x0) : returns gtsam::VectorValues
%gradientAtZero() : returns gtsam::VectorValues
%joint(size_t key1, size_t key2) : returns gtsam::GaussianFactorGraph
%jointBayesNet(size_t key1, size_t key2) : returns gtsam::GaussianBayesNet
%logDeterminant() : returns double
%marginalCovariance(size_t key) : returns Matrix
%marginalFactor(size_t key) : returns gtsam::GaussianConditional
%numCachedSeparatorMarginals() : returns size_t
%optimize() : returns gtsam::VectorValues
%optimizeGradientSearch() : returns gtsam::VectorValues
%print(string s) : returns void
%saveGraph(string s) : returns void
%size() : returns size_t
%
classdef GaussianBayesTree < handle
  properties
    ptr_gtsamGaussianBayesTree = 0
  end
  methods
    function obj = GaussianBayesTree(varargin)
      if (nargin == 2 || (nargin == 3 && strcmp(varargin{3}, 'void'))) && isa(varargin{1}, 'uint64') && varargin{1} == uint64(5139824614673773682)
        if nargin == 2
          my_ptr = varargin{2};
        else
          my_ptr = gtsam_wrapper(877, varargin{2});
        end
        gtsam_wrapper(876, my_ptr);
      elseif nargin == 0
        my_ptr = gtsam_wrapper(878);
      elseif nargin == 1 && isa(varargin{1},'gtsam.GaussianBayesTree')
        my_ptr = gtsam_wrapper(879, varargin{1});
      else
        error('Arguments do not match any overload of gtsam.GaussianBayesTree constructor');
      end
      obj.ptr_gtsamGaussianBayesTree = my_ptr;
    end

    function delete(obj)
      gtsam_wrapper(880, obj.ptr_gtsamGaussianBayesTree);
    end

    function display(obj), obj.print(''); end
    %DISPLAY Calls print on the object
    function disp(obj), obj.display; end
    %DISP Calls print on the object
    function varargout = determinant(this, varargin)
      % DETERMINANT usage: determinant() : returns double
      % Doxygen can be found at http://research.cc.gatech.edu/borg/sites/edu.borg/html/index.html
      varargout{1} = gtsam_wrapper(881, this, varargin{:});
    end

    function varargout = empty(this, varargin)
      % EMPTY usage: empty() : returns bool
      % Doxygen can be found at http://research.cc.gatech.edu/borg/sites/edu.borg/html/index.html
      varargout{1} = gtsam_wrapper(882, this, varargin{:});
    end

    function varargout = equals(this, varargin)
      % EQUALS usage: equals(GaussianBayesTree other, double tol) : returns bool
      % Doxygen can be found at http://research.cc.gatech.edu/borg/sites/edu.borg/html/index.html
      if length(varargin) == 2 && isa(varargin{1},'gtsam.GaussianBayesTree') && isa(varargin{2},'double')
        varargout{1} = gtsam_wrapper(883, this, varargin{:});
      else
        error('Arguments do not match any overload of function gtsam.GaussianBayesTree.equals');
      end
    end

    function varargout = error(this, varargin)
      % ERROR usage: error(VectorValues x) : returns double
      % Doxygen can be found at http://research.cc.gatech.edu/borg/sites/edu.borg/html/index.html
      if length(varargin) == 1 && isa(varargin{1},'gtsam.VectorValues')
        varargout{1} = gtsam_wrapper(884, this, varargin{:});
      else
        error('Arguments do not match any overload of function gtsam.GaussianBayesTree.error');
      end
    end

    function varargout = gradient(this, varargin)
      % GRADIENT usage: gradient(VectorValues x0) : returns gtsam::VectorValues
      % Doxygen can be found at http://research.cc.gatech.edu/borg/sites/edu.borg/html/index.html
      if length(varargin) == 1 && isa(varargin{1},'gtsam.VectorValues')
        varargout{1} = gtsam_wrapper(885, this, varargin{:});
      else
        error('Arguments do not match any overload of function gtsam.GaussianBayesTree.gradient');
      end
    end

    function varargout = gradientAtZero(this, varargin)
      % GRADIENTATZERO usage: gradientAtZero() : returns gtsam::VectorValues
      % Doxygen can be found at http://research.cc.gatech.edu/borg/sites/edu.borg/html/index.html
      varargout{1} = gtsam_wrapper(886, this, varargin{:});
    end

    function varargout = joint(this, varargin)
      % JOINT usage: joint(size_t key1, size_t key2) : returns gtsam::GaussianFactorGraph
      % Doxygen can be found at http://research.cc.gatech.edu/borg/sites/edu.borg/html/index.html
      varargout{1} = gtsam_wrapper(887, this, varargin{:});
    end

    function varargout = jointBayesNet(this, varargin)
      % JOINTBAYESNET usage: jointBayesNet(size_t key1, size_t key2) : returns gtsam::GaussianBayesNet
      % Doxygen can be found at http://research.cc.gatech.edu/borg/sites/edu.borg/html/index.html
      varargout{1} = gtsam_wrapper(888, this, varargin{:});
    end

    function varargout = logDeterminant(this, varargin)
      % LOGDETERMINANT usage: logDeterminant() : returns double
      % Doxygen can be found at http://research.cc.gatech.edu/borg/sites/edu.borg/html/index.html
      varargout{1} = gtsam_wrapper(889, this, varargin{:});
    end

    function varargout = marginalCovariance(this, varargin)
      % MARGINALCOVARIANCE usage: marginalCovariance(size_t key) : returns Matrix
      % Doxygen can be found at http://research.cc.gatech.edu/borg/sites/edu.borg/html/index.html
      varargout{1} = gtsam_wrapper(890, this, varargin{:});
    end

    function varargout = marginalFactor(this, varargin)
      % MARGINALFACTOR usage: marginalFactor(size_t key) : returns gtsam::GaussianConditional
      % Doxygen can be found at http://research.cc.gatech.edu/borg/sites/edu.borg/html/index.html
      varargout{1} = gtsam_wrapper(891, this, varargin{:});
    end

    function varargout = numCachedSeparatorMarginals(this, varargin)
      % NUMCACHEDSEPARATORMARGINALS usage: numCachedSeparatorMarginals() : returns size_t
      % Doxygen can be found at http://research.cc.gatech.edu/borg/sites/edu.borg/html/index.html
      varargout{1} = gtsam_wrapper(892, this, varargin{:});
    end

    function varargout = optimize(this, varargin)
      % OPTIMIZE usage: optimize() : returns gtsam::VectorValues
      % Doxygen can be found at http://research.cc.gatech.edu/borg/sites/edu.borg/html/index.html
      varargout{1} = gtsam_wrapper(893, this, varargin{:});
    end

    function varargout = optimizeGradientSearch(this, varargin)
      % OPTIMIZEGRADIENTSEARCH usage: optimizeGradientSearch() : returns gtsam::VectorValues
      % Doxygen can be found at http://research.cc.gatech.edu/borg/sites/edu.borg/html/index.html
      varargout{1} = gtsam_wrapper(894, this, varargin{:});
    end

    function varargout = print(this, varargin)
      % PRINT usage: print(string s) : returns void
      % Doxygen can be found at http://research.cc.gatech.edu/borg/sites/edu.borg/html/index.html
      if length(varargin) == 1 && isa(varargin{1},'char')
        gtsam_wrapper(895, this, varargin{:});
      else
        error('Arguments do not match any overload of function gtsam.GaussianBayesTree.print');
      end
    end

    function varargout = saveGraph(this, varargin)
      % SAVEGRAPH usage: saveGraph(string s) : returns void
      % Doxygen can be found at http://research.cc.gatech.edu/borg/sites/edu.borg/html/index.html
      if length(varargin) == 1 && isa(varargin{1},'char')
        gtsam_wrapper(896, this, varargin{:});
      else
        error('Arguments do not match any overload of function gtsam.GaussianBayesTree.saveGraph');
      end
    end

    function varargout = size(this, varargin)
      % SIZE usage: size() : returns size_t
      % Doxygen can be found at http://research.cc.gatech.edu/borg/sites/edu.borg/html/index.html
      varargout{1} = gtsam_wrapper(897, this, varargin{:});
    end

  end

  methods(Static = true)
  end
end
