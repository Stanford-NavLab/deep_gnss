%class SubgraphSolver, see Doxygen page for details
%at http://research.cc.gatech.edu/borg/sites/edu.borg/html/index.html
%
%-------Constructors-------
%SubgraphSolver(GaussianFactorGraph A, SubgraphSolverParameters parameters, Ordering ordering)
%SubgraphSolver(GaussianFactorGraph Ab1, GaussianFactorGraph Ab2, SubgraphSolverParameters parameters, Ordering ordering)
%
%-------Methods-------
%optimize() : returns gtsam::VectorValues
%
classdef SubgraphSolver < handle
  properties
    ptr_gtsamSubgraphSolver = 0
  end
  methods
    function obj = SubgraphSolver(varargin)
      if (nargin == 2 || (nargin == 3 && strcmp(varargin{3}, 'void'))) && isa(varargin{1}, 'uint64') && varargin{1} == uint64(5139824614673773682)
        if nargin == 2
          my_ptr = varargin{2};
        else
          my_ptr = gtsam_wrapper(941, varargin{2});
        end
        gtsam_wrapper(940, my_ptr);
      elseif nargin == 3 && isa(varargin{1},'gtsam.GaussianFactorGraph') && isa(varargin{2},'gtsam.SubgraphSolverParameters') && isa(varargin{3},'gtsam.Ordering')
        my_ptr = gtsam_wrapper(942, varargin{1}, varargin{2}, varargin{3});
      elseif nargin == 4 && isa(varargin{1},'gtsam.GaussianFactorGraph') && isa(varargin{2},'gtsam.GaussianFactorGraph') && isa(varargin{3},'gtsam.SubgraphSolverParameters') && isa(varargin{4},'gtsam.Ordering')
        my_ptr = gtsam_wrapper(943, varargin{1}, varargin{2}, varargin{3}, varargin{4});
      else
        error('Arguments do not match any overload of gtsam.SubgraphSolver constructor');
      end
      obj.ptr_gtsamSubgraphSolver = my_ptr;
    end

    function delete(obj)
      gtsam_wrapper(944, obj.ptr_gtsamSubgraphSolver);
    end

    function display(obj), obj.print(''); end
    %DISPLAY Calls print on the object
    function disp(obj), obj.display; end
    %DISP Calls print on the object
    function varargout = optimize(this, varargin)
      % OPTIMIZE usage: optimize() : returns gtsam::VectorValues
      % Doxygen can be found at http://research.cc.gatech.edu/borg/sites/edu.borg/html/index.html
      varargout{1} = gtsam_wrapper(945, this, varargin{:});
    end

  end

  methods(Static = true)
  end
end
