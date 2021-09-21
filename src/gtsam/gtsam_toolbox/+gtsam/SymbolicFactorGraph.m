%class SymbolicFactorGraph, see Doxygen page for details
%at http://research.cc.gatech.edu/borg/sites/edu.borg/html/index.html
%
%-------Constructors-------
%SymbolicFactorGraph()
%SymbolicFactorGraph(SymbolicBayesNet bayesNet)
%SymbolicFactorGraph(SymbolicBayesTree bayesTree)
%
%-------Methods-------
%eliminateMultifrontal() : returns gtsam::SymbolicBayesTree
%eliminateMultifrontal(Ordering ordering) : returns gtsam::SymbolicBayesTree
%eliminatePartialMultifrontal(Ordering ordering) : returns pair< SharedSymbolicBayesTree, SharedSymbolicFactorGraph >
%eliminatePartialMultifrontal(KeyVector keys) : returns pair< SharedSymbolicBayesTree, SharedSymbolicFactorGraph >
%eliminatePartialSequential(Ordering ordering) : returns pair< SharedSymbolicBayesNet, SharedSymbolicFactorGraph >
%eliminatePartialSequential(KeyVector keys) : returns pair< SharedSymbolicBayesNet, SharedSymbolicFactorGraph >
%eliminateSequential() : returns gtsam::SymbolicBayesNet
%eliminateSequential(Ordering ordering) : returns gtsam::SymbolicBayesNet
%equals(SymbolicFactorGraph rhs, double tol) : returns bool
%exists(size_t idx) : returns bool
%keys() : returns gtsam::KeySet
%marginal(KeyVector variables) : returns gtsam::SymbolicFactorGraph
%marginalMultifrontalBayesNet(Ordering variables) : returns gtsam::SymbolicBayesNet
%marginalMultifrontalBayesNet(KeyVector variables) : returns gtsam::SymbolicBayesNet
%marginalMultifrontalBayesNet(Ordering variables, Ordering marginalizedVariableOrdering) : returns gtsam::SymbolicBayesNet
%marginalMultifrontalBayesNet(KeyVector variables, Ordering marginalizedVariableOrdering) : returns gtsam::SymbolicBayesNet
%print(string s) : returns void
%push_back(SymbolicFactor factor) : returns void
%push_back(SymbolicFactor factor) : returns void
%push_back(SymbolicFactorGraph graph) : returns void
%push_back(SymbolicBayesNet bayesNet) : returns void
%push_back(SymbolicBayesTree bayesTree) : returns void
%push_factor(size_t key) : returns void
%push_factor(size_t key1, size_t key2) : returns void
%push_factor(size_t key1, size_t key2, size_t key3) : returns void
%push_factor(size_t key1, size_t key2, size_t key3, size_t key4) : returns void
%size() : returns size_t
%
classdef SymbolicFactorGraph < handle
  properties
    ptr_gtsamSymbolicFactorGraph = 0
  end
  methods
    function obj = SymbolicFactorGraph(varargin)
      if nargin == 2 && isa(varargin{1}, 'uint64') && varargin{1} == uint64(5139824614673773682)
        my_ptr = varargin{2};
        gtsam_wrapper(474, my_ptr);
      elseif nargin == 0
        my_ptr = gtsam_wrapper(475);
      elseif nargin == 1 && isa(varargin{1},'gtsam.SymbolicBayesNet')
        my_ptr = gtsam_wrapper(476, varargin{1});
      elseif nargin == 1 && isa(varargin{1},'gtsam.SymbolicBayesTree')
        my_ptr = gtsam_wrapper(477, varargin{1});
      else
        error('Arguments do not match any overload of gtsam.SymbolicFactorGraph constructor');
      end
      obj.ptr_gtsamSymbolicFactorGraph = my_ptr;
    end

    function delete(obj)
      gtsam_wrapper(478, obj.ptr_gtsamSymbolicFactorGraph);
    end

    function display(obj), obj.print(''); end
    %DISPLAY Calls print on the object
    function disp(obj), obj.display; end
    %DISP Calls print on the object
    function varargout = eliminateMultifrontal(this, varargin)
      % ELIMINATEMULTIFRONTAL usage: eliminateMultifrontal(), eliminateMultifrontal(Ordering ordering) : returns gtsam::SymbolicBayesTree
      % Doxygen can be found at http://research.cc.gatech.edu/borg/sites/edu.borg/html/index.html
      % 
      % Method Overloads
      % eliminateMultifrontal()
      % eliminateMultifrontal(Ordering ordering)
      if length(varargin) == 0
        varargout{1} = gtsam_wrapper(479, this, varargin{:});
      elseif length(varargin) == 1 && isa(varargin{1},'gtsam.Ordering')
        varargout{1} = gtsam_wrapper(480, this, varargin{:});
      else
        error('Arguments do not match any overload of function gtsam.SymbolicFactorGraph.eliminateMultifrontal');
      end
    end

    function varargout = eliminatePartialMultifrontal(this, varargin)
      % ELIMINATEPARTIALMULTIFRONTAL usage: eliminatePartialMultifrontal(Ordering ordering), eliminatePartialMultifrontal(KeyVector keys) : returns pair< SharedSymbolicBayesTree, SharedSymbolicFactorGraph >
      % Doxygen can be found at http://research.cc.gatech.edu/borg/sites/edu.borg/html/index.html
      % 
      % Method Overloads
      % eliminatePartialMultifrontal(Ordering ordering)
      % eliminatePartialMultifrontal(KeyVector keys)
      if length(varargin) == 1 && isa(varargin{1},'gtsam.Ordering')
        [ varargout{1} varargout{2} ] = gtsam_wrapper(481, this, varargin{:});
      elseif length(varargin) == 1 && isa(varargin{1},'gtsam.KeyVector')
        [ varargout{1} varargout{2} ] = gtsam_wrapper(482, this, varargin{:});
      else
        error('Arguments do not match any overload of function gtsam.SymbolicFactorGraph.eliminatePartialMultifrontal');
      end
    end

    function varargout = eliminatePartialSequential(this, varargin)
      % ELIMINATEPARTIALSEQUENTIAL usage: eliminatePartialSequential(Ordering ordering), eliminatePartialSequential(KeyVector keys) : returns pair< SharedSymbolicBayesNet, SharedSymbolicFactorGraph >
      % Doxygen can be found at http://research.cc.gatech.edu/borg/sites/edu.borg/html/index.html
      % 
      % Method Overloads
      % eliminatePartialSequential(Ordering ordering)
      % eliminatePartialSequential(KeyVector keys)
      if length(varargin) == 1 && isa(varargin{1},'gtsam.Ordering')
        [ varargout{1} varargout{2} ] = gtsam_wrapper(483, this, varargin{:});
      elseif length(varargin) == 1 && isa(varargin{1},'gtsam.KeyVector')
        [ varargout{1} varargout{2} ] = gtsam_wrapper(484, this, varargin{:});
      else
        error('Arguments do not match any overload of function gtsam.SymbolicFactorGraph.eliminatePartialSequential');
      end
    end

    function varargout = eliminateSequential(this, varargin)
      % ELIMINATESEQUENTIAL usage: eliminateSequential(), eliminateSequential(Ordering ordering) : returns gtsam::SymbolicBayesNet
      % Doxygen can be found at http://research.cc.gatech.edu/borg/sites/edu.borg/html/index.html
      % 
      % Method Overloads
      % eliminateSequential()
      % eliminateSequential(Ordering ordering)
      if length(varargin) == 0
        varargout{1} = gtsam_wrapper(485, this, varargin{:});
      elseif length(varargin) == 1 && isa(varargin{1},'gtsam.Ordering')
        varargout{1} = gtsam_wrapper(486, this, varargin{:});
      else
        error('Arguments do not match any overload of function gtsam.SymbolicFactorGraph.eliminateSequential');
      end
    end

    function varargout = equals(this, varargin)
      % EQUALS usage: equals(SymbolicFactorGraph rhs, double tol) : returns bool
      % Doxygen can be found at http://research.cc.gatech.edu/borg/sites/edu.borg/html/index.html
      if length(varargin) == 2 && isa(varargin{1},'gtsam.SymbolicFactorGraph') && isa(varargin{2},'double')
        varargout{1} = gtsam_wrapper(487, this, varargin{:});
      else
        error('Arguments do not match any overload of function gtsam.SymbolicFactorGraph.equals');
      end
    end

    function varargout = exists(this, varargin)
      % EXISTS usage: exists(size_t idx) : returns bool
      % Doxygen can be found at http://research.cc.gatech.edu/borg/sites/edu.borg/html/index.html
      varargout{1} = gtsam_wrapper(488, this, varargin{:});
    end

    function varargout = keys(this, varargin)
      % KEYS usage: keys() : returns gtsam::KeySet
      % Doxygen can be found at http://research.cc.gatech.edu/borg/sites/edu.borg/html/index.html
      varargout{1} = gtsam_wrapper(489, this, varargin{:});
    end

    function varargout = marginal(this, varargin)
      % MARGINAL usage: marginal(KeyVector variables) : returns gtsam::SymbolicFactorGraph
      % Doxygen can be found at http://research.cc.gatech.edu/borg/sites/edu.borg/html/index.html
      if length(varargin) == 1 && isa(varargin{1},'gtsam.KeyVector')
        varargout{1} = gtsam_wrapper(490, this, varargin{:});
      else
        error('Arguments do not match any overload of function gtsam.SymbolicFactorGraph.marginal');
      end
    end

    function varargout = marginalMultifrontalBayesNet(this, varargin)
      % MARGINALMULTIFRONTALBAYESNET usage: marginalMultifrontalBayesNet(Ordering variables), marginalMultifrontalBayesNet(KeyVector variables), marginalMultifrontalBayesNet(Ordering variables, Ordering marginalizedVariableOrdering), marginalMultifrontalBayesNet(KeyVector variables, Ordering marginalizedVariableOrdering) : returns gtsam::SymbolicBayesNet
      % Doxygen can be found at http://research.cc.gatech.edu/borg/sites/edu.borg/html/index.html
      % 
      % Method Overloads
      % marginalMultifrontalBayesNet(Ordering variables)
      % marginalMultifrontalBayesNet(KeyVector variables)
      % marginalMultifrontalBayesNet(Ordering variables, Ordering marginalizedVariableOrdering)
      % marginalMultifrontalBayesNet(KeyVector variables, Ordering marginalizedVariableOrdering)
      if length(varargin) == 1 && isa(varargin{1},'gtsam.Ordering')
        varargout{1} = gtsam_wrapper(491, this, varargin{:});
      elseif length(varargin) == 1 && isa(varargin{1},'gtsam.KeyVector')
        varargout{1} = gtsam_wrapper(492, this, varargin{:});
      elseif length(varargin) == 2 && isa(varargin{1},'gtsam.Ordering') && isa(varargin{2},'gtsam.Ordering')
        varargout{1} = gtsam_wrapper(493, this, varargin{:});
      elseif length(varargin) == 2 && isa(varargin{1},'gtsam.KeyVector') && isa(varargin{2},'gtsam.Ordering')
        varargout{1} = gtsam_wrapper(494, this, varargin{:});
      else
        error('Arguments do not match any overload of function gtsam.SymbolicFactorGraph.marginalMultifrontalBayesNet');
      end
    end

    function varargout = print(this, varargin)
      % PRINT usage: print(string s) : returns void
      % Doxygen can be found at http://research.cc.gatech.edu/borg/sites/edu.borg/html/index.html
      if length(varargin) == 1 && isa(varargin{1},'char')
        gtsam_wrapper(495, this, varargin{:});
      else
        error('Arguments do not match any overload of function gtsam.SymbolicFactorGraph.print');
      end
    end

    function varargout = push_back(this, varargin)
      % PUSH_BACK usage: push_back(SymbolicFactor factor), push_back(SymbolicFactor factor), push_back(SymbolicFactorGraph graph), push_back(SymbolicBayesNet bayesNet), push_back(SymbolicBayesTree bayesTree) : returns void
      % Doxygen can be found at http://research.cc.gatech.edu/borg/sites/edu.borg/html/index.html
      % 
      % Method Overloads
      % push_back(SymbolicFactor factor)
      % push_back(SymbolicFactor factor)
      % push_back(SymbolicFactorGraph graph)
      % push_back(SymbolicBayesNet bayesNet)
      % push_back(SymbolicBayesTree bayesTree)
      if length(varargin) == 1 && isa(varargin{1},'gtsam.SymbolicFactor')
        gtsam_wrapper(496, this, varargin{:});
      elseif length(varargin) == 1 && isa(varargin{1},'gtsam.SymbolicFactor')
        gtsam_wrapper(497, this, varargin{:});
      elseif length(varargin) == 1 && isa(varargin{1},'gtsam.SymbolicFactorGraph')
        gtsam_wrapper(498, this, varargin{:});
      elseif length(varargin) == 1 && isa(varargin{1},'gtsam.SymbolicBayesNet')
        gtsam_wrapper(499, this, varargin{:});
      elseif length(varargin) == 1 && isa(varargin{1},'gtsam.SymbolicBayesTree')
        gtsam_wrapper(500, this, varargin{:});
      else
        error('Arguments do not match any overload of function gtsam.SymbolicFactorGraph.push_back');
      end
    end

    function varargout = push_factor(this, varargin)
      % PUSH_FACTOR usage: push_factor(size_t key), push_factor(size_t key1, size_t key2), push_factor(size_t key1, size_t key2, size_t key3), push_factor(size_t key1, size_t key2, size_t key3, size_t key4) : returns void
      % Doxygen can be found at http://research.cc.gatech.edu/borg/sites/edu.borg/html/index.html
      % 
      % Method Overloads
      % push_factor(size_t key)
      % push_factor(size_t key1, size_t key2)
      % push_factor(size_t key1, size_t key2, size_t key3)
      % push_factor(size_t key1, size_t key2, size_t key3, size_t key4)
      if length(varargin) == 1 && isa(varargin{1},'numeric')
        gtsam_wrapper(501, this, varargin{:});
      elseif length(varargin) == 2 && isa(varargin{1},'numeric') && isa(varargin{2},'numeric')
        gtsam_wrapper(502, this, varargin{:});
      elseif length(varargin) == 3 && isa(varargin{1},'numeric') && isa(varargin{2},'numeric') && isa(varargin{3},'numeric')
        gtsam_wrapper(503, this, varargin{:});
      elseif length(varargin) == 4 && isa(varargin{1},'numeric') && isa(varargin{2},'numeric') && isa(varargin{3},'numeric') && isa(varargin{4},'numeric')
        gtsam_wrapper(504, this, varargin{:});
      else
        error('Arguments do not match any overload of function gtsam.SymbolicFactorGraph.push_factor');
      end
    end

    function varargout = size(this, varargin)
      % SIZE usage: size() : returns size_t
      % Doxygen can be found at http://research.cc.gatech.edu/borg/sites/edu.borg/html/index.html
      varargout{1} = gtsam_wrapper(505, this, varargin{:});
    end

  end

  methods(Static = true)
  end
end
