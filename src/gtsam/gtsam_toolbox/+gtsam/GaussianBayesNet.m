%class GaussianBayesNet, see Doxygen page for details
%at http://research.cc.gatech.edu/borg/sites/edu.borg/html/index.html
%
%-------Constructors-------
%GaussianBayesNet()
%GaussianBayesNet(GaussianConditional conditional)
%
%-------Methods-------
%at(size_t idx) : returns gtsam::GaussianConditional
%back() : returns gtsam::GaussianConditional
%backSubstitute(VectorValues gx) : returns gtsam::VectorValues
%backSubstituteTranspose(VectorValues gx) : returns gtsam::VectorValues
%determinant() : returns double
%equals(GaussianBayesNet other, double tol) : returns bool
%error(VectorValues x) : returns double
%exists(size_t idx) : returns bool
%front() : returns gtsam::GaussianConditional
%gradient(VectorValues x0) : returns gtsam::VectorValues
%gradientAtZero() : returns gtsam::VectorValues
%keys() : returns gtsam::KeySet
%logDeterminant() : returns double
%optimize() : returns gtsam::VectorValues
%optimize(VectorValues solutionForMissing) : returns gtsam::VectorValues
%optimizeGradientSearch() : returns gtsam::VectorValues
%print(string s) : returns void
%push_back(GaussianConditional conditional) : returns void
%push_back(GaussianBayesNet bayesNet) : returns void
%size() : returns size_t
%size() : returns size_t
%
classdef GaussianBayesNet < handle
  properties
    ptr_gtsamGaussianBayesNet = 0
  end
  methods
    function obj = GaussianBayesNet(varargin)
      if (nargin == 2 || (nargin == 3 && strcmp(varargin{3}, 'void'))) && isa(varargin{1}, 'uint64') && varargin{1} == uint64(5139824614673773682)
        if nargin == 2
          my_ptr = varargin{2};
        else
          my_ptr = gtsam_wrapper(851, varargin{2});
        end
        gtsam_wrapper(850, my_ptr);
      elseif nargin == 0
        my_ptr = gtsam_wrapper(852);
      elseif nargin == 1 && isa(varargin{1},'gtsam.GaussianConditional')
        my_ptr = gtsam_wrapper(853, varargin{1});
      else
        error('Arguments do not match any overload of gtsam.GaussianBayesNet constructor');
      end
      obj.ptr_gtsamGaussianBayesNet = my_ptr;
    end

    function delete(obj)
      gtsam_wrapper(854, obj.ptr_gtsamGaussianBayesNet);
    end

    function display(obj), obj.print(''); end
    %DISPLAY Calls print on the object
    function disp(obj), obj.display; end
    %DISP Calls print on the object
    function varargout = at(this, varargin)
      % AT usage: at(size_t idx) : returns gtsam::GaussianConditional
      % Doxygen can be found at http://research.cc.gatech.edu/borg/sites/edu.borg/html/index.html
      varargout{1} = gtsam_wrapper(855, this, varargin{:});
    end

    function varargout = back(this, varargin)
      % BACK usage: back() : returns gtsam::GaussianConditional
      % Doxygen can be found at http://research.cc.gatech.edu/borg/sites/edu.borg/html/index.html
      varargout{1} = gtsam_wrapper(856, this, varargin{:});
    end

    function varargout = backSubstitute(this, varargin)
      % BACKSUBSTITUTE usage: backSubstitute(VectorValues gx) : returns gtsam::VectorValues
      % Doxygen can be found at http://research.cc.gatech.edu/borg/sites/edu.borg/html/index.html
      if length(varargin) == 1 && isa(varargin{1},'gtsam.VectorValues')
        varargout{1} = gtsam_wrapper(857, this, varargin{:});
      else
        error('Arguments do not match any overload of function gtsam.GaussianBayesNet.backSubstitute');
      end
    end

    function varargout = backSubstituteTranspose(this, varargin)
      % BACKSUBSTITUTETRANSPOSE usage: backSubstituteTranspose(VectorValues gx) : returns gtsam::VectorValues
      % Doxygen can be found at http://research.cc.gatech.edu/borg/sites/edu.borg/html/index.html
      if length(varargin) == 1 && isa(varargin{1},'gtsam.VectorValues')
        varargout{1} = gtsam_wrapper(858, this, varargin{:});
      else
        error('Arguments do not match any overload of function gtsam.GaussianBayesNet.backSubstituteTranspose');
      end
    end

    function varargout = determinant(this, varargin)
      % DETERMINANT usage: determinant() : returns double
      % Doxygen can be found at http://research.cc.gatech.edu/borg/sites/edu.borg/html/index.html
      varargout{1} = gtsam_wrapper(859, this, varargin{:});
    end

    function varargout = equals(this, varargin)
      % EQUALS usage: equals(GaussianBayesNet other, double tol) : returns bool
      % Doxygen can be found at http://research.cc.gatech.edu/borg/sites/edu.borg/html/index.html
      if length(varargin) == 2 && isa(varargin{1},'gtsam.GaussianBayesNet') && isa(varargin{2},'double')
        varargout{1} = gtsam_wrapper(860, this, varargin{:});
      else
        error('Arguments do not match any overload of function gtsam.GaussianBayesNet.equals');
      end
    end

    function varargout = error(this, varargin)
      % ERROR usage: error(VectorValues x) : returns double
      % Doxygen can be found at http://research.cc.gatech.edu/borg/sites/edu.borg/html/index.html
      if length(varargin) == 1 && isa(varargin{1},'gtsam.VectorValues')
        varargout{1} = gtsam_wrapper(861, this, varargin{:});
      else
        error('Arguments do not match any overload of function gtsam.GaussianBayesNet.error');
      end
    end

    function varargout = exists(this, varargin)
      % EXISTS usage: exists(size_t idx) : returns bool
      % Doxygen can be found at http://research.cc.gatech.edu/borg/sites/edu.borg/html/index.html
      varargout{1} = gtsam_wrapper(862, this, varargin{:});
    end

    function varargout = front(this, varargin)
      % FRONT usage: front() : returns gtsam::GaussianConditional
      % Doxygen can be found at http://research.cc.gatech.edu/borg/sites/edu.borg/html/index.html
      varargout{1} = gtsam_wrapper(863, this, varargin{:});
    end

    function varargout = gradient(this, varargin)
      % GRADIENT usage: gradient(VectorValues x0) : returns gtsam::VectorValues
      % Doxygen can be found at http://research.cc.gatech.edu/borg/sites/edu.borg/html/index.html
      if length(varargin) == 1 && isa(varargin{1},'gtsam.VectorValues')
        varargout{1} = gtsam_wrapper(864, this, varargin{:});
      else
        error('Arguments do not match any overload of function gtsam.GaussianBayesNet.gradient');
      end
    end

    function varargout = gradientAtZero(this, varargin)
      % GRADIENTATZERO usage: gradientAtZero() : returns gtsam::VectorValues
      % Doxygen can be found at http://research.cc.gatech.edu/borg/sites/edu.borg/html/index.html
      varargout{1} = gtsam_wrapper(865, this, varargin{:});
    end

    function varargout = keys(this, varargin)
      % KEYS usage: keys() : returns gtsam::KeySet
      % Doxygen can be found at http://research.cc.gatech.edu/borg/sites/edu.borg/html/index.html
      varargout{1} = gtsam_wrapper(866, this, varargin{:});
    end

    function varargout = logDeterminant(this, varargin)
      % LOGDETERMINANT usage: logDeterminant() : returns double
      % Doxygen can be found at http://research.cc.gatech.edu/borg/sites/edu.borg/html/index.html
      varargout{1} = gtsam_wrapper(867, this, varargin{:});
    end

    function varargout = optimize(this, varargin)
      % OPTIMIZE usage: optimize(), optimize(VectorValues solutionForMissing) : returns gtsam::VectorValues
      % Doxygen can be found at http://research.cc.gatech.edu/borg/sites/edu.borg/html/index.html
      % 
      % Method Overloads
      % optimize()
      % optimize(VectorValues solutionForMissing)
      if length(varargin) == 0
        varargout{1} = gtsam_wrapper(868, this, varargin{:});
      elseif length(varargin) == 1 && isa(varargin{1},'gtsam.VectorValues')
        varargout{1} = gtsam_wrapper(869, this, varargin{:});
      else
        error('Arguments do not match any overload of function gtsam.GaussianBayesNet.optimize');
      end
    end

    function varargout = optimizeGradientSearch(this, varargin)
      % OPTIMIZEGRADIENTSEARCH usage: optimizeGradientSearch() : returns gtsam::VectorValues
      % Doxygen can be found at http://research.cc.gatech.edu/borg/sites/edu.borg/html/index.html
      varargout{1} = gtsam_wrapper(870, this, varargin{:});
    end

    function varargout = print(this, varargin)
      % PRINT usage: print(string s) : returns void
      % Doxygen can be found at http://research.cc.gatech.edu/borg/sites/edu.borg/html/index.html
      if length(varargin) == 1 && isa(varargin{1},'char')
        gtsam_wrapper(871, this, varargin{:});
      else
        error('Arguments do not match any overload of function gtsam.GaussianBayesNet.print');
      end
    end

    function varargout = push_back(this, varargin)
      % PUSH_BACK usage: push_back(GaussianConditional conditional), push_back(GaussianBayesNet bayesNet) : returns void
      % Doxygen can be found at http://research.cc.gatech.edu/borg/sites/edu.borg/html/index.html
      % 
      % Method Overloads
      % push_back(GaussianConditional conditional)
      % push_back(GaussianBayesNet bayesNet)
      if length(varargin) == 1 && isa(varargin{1},'gtsam.GaussianConditional')
        gtsam_wrapper(872, this, varargin{:});
      elseif length(varargin) == 1 && isa(varargin{1},'gtsam.GaussianBayesNet')
        gtsam_wrapper(873, this, varargin{:});
      else
        error('Arguments do not match any overload of function gtsam.GaussianBayesNet.push_back');
      end
    end

    function varargout = size(this, varargin)
      % SIZE usage: size(), size() : returns size_t
      % Doxygen can be found at http://research.cc.gatech.edu/borg/sites/edu.borg/html/index.html
      % 
      % Method Overloads
      % size()
      % size()
      if length(varargin) == 0
        varargout{1} = gtsam_wrapper(874, this, varargin{:});
      elseif length(varargin) == 0
        varargout{1} = gtsam_wrapper(875, this, varargin{:});
      else
        error('Arguments do not match any overload of function gtsam.GaussianBayesNet.size');
      end
    end

  end

  methods(Static = true)
  end
end
