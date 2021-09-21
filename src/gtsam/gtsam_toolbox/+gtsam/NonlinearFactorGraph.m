%class NonlinearFactorGraph, see Doxygen page for details
%at http://research.cc.gatech.edu/borg/sites/edu.borg/html/index.html
%
%-------Constructors-------
%NonlinearFactorGraph()
%NonlinearFactorGraph(NonlinearFactorGraph graph)
%
%-------Methods-------
%add(NonlinearFactor factor) : returns void
%at(size_t idx) : returns gtsam::NonlinearFactor
%clone() : returns gtsam::NonlinearFactorGraph
%empty() : returns bool
%equals(NonlinearFactorGraph fg, double tol) : returns bool
%error(Values values) : returns double
%exists(size_t idx) : returns bool
%linearize(Values values) : returns gtsam::GaussianFactorGraph
%nrFactors() : returns size_t
%orderingCOLAMD() : returns gtsam::Ordering
%print(string s) : returns void
%probPrime(Values values) : returns double
%push_back(NonlinearFactorGraph factors) : returns void
%push_back(NonlinearFactor factor) : returns void
%remove(size_t i) : returns void
%size() : returns size_t
%
%-------Serialization Interface-------
%string_serialize() : returns string
%string_deserialize(string serialized) : returns NonlinearFactorGraph
%
classdef NonlinearFactorGraph < handle
  properties
    ptr_gtsamNonlinearFactorGraph = 0
  end
  methods
    function obj = NonlinearFactorGraph(varargin)
      if nargin == 2 && isa(varargin{1}, 'uint64') && varargin{1} == uint64(5139824614673773682)
        my_ptr = varargin{2};
        gtsam_wrapper(982, my_ptr);
      elseif nargin == 0
        my_ptr = gtsam_wrapper(983);
      elseif nargin == 1 && isa(varargin{1},'gtsam.NonlinearFactorGraph')
        my_ptr = gtsam_wrapper(984, varargin{1});
      else
        error('Arguments do not match any overload of gtsam.NonlinearFactorGraph constructor');
      end
      obj.ptr_gtsamNonlinearFactorGraph = my_ptr;
    end

    function delete(obj)
      gtsam_wrapper(985, obj.ptr_gtsamNonlinearFactorGraph);
    end

    function display(obj), obj.print(''); end
    %DISPLAY Calls print on the object
    function disp(obj), obj.display; end
    %DISP Calls print on the object
    function varargout = add(this, varargin)
      % ADD usage: add(NonlinearFactor factor) : returns void
      % Doxygen can be found at http://research.cc.gatech.edu/borg/sites/edu.borg/html/index.html
      if length(varargin) == 1 && isa(varargin{1},'gtsam.NonlinearFactor')
        gtsam_wrapper(986, this, varargin{:});
      else
        error('Arguments do not match any overload of function gtsam.NonlinearFactorGraph.add');
      end
    end

    function varargout = at(this, varargin)
      % AT usage: at(size_t idx) : returns gtsam::NonlinearFactor
      % Doxygen can be found at http://research.cc.gatech.edu/borg/sites/edu.borg/html/index.html
      varargout{1} = gtsam_wrapper(987, this, varargin{:});
    end

    function varargout = clone(this, varargin)
      % CLONE usage: clone() : returns gtsam::NonlinearFactorGraph
      % Doxygen can be found at http://research.cc.gatech.edu/borg/sites/edu.borg/html/index.html
      varargout{1} = gtsam_wrapper(988, this, varargin{:});
    end

    function varargout = empty(this, varargin)
      % EMPTY usage: empty() : returns bool
      % Doxygen can be found at http://research.cc.gatech.edu/borg/sites/edu.borg/html/index.html
      varargout{1} = gtsam_wrapper(989, this, varargin{:});
    end

    function varargout = equals(this, varargin)
      % EQUALS usage: equals(NonlinearFactorGraph fg, double tol) : returns bool
      % Doxygen can be found at http://research.cc.gatech.edu/borg/sites/edu.borg/html/index.html
      if length(varargin) == 2 && isa(varargin{1},'gtsam.NonlinearFactorGraph') && isa(varargin{2},'double')
        varargout{1} = gtsam_wrapper(990, this, varargin{:});
      else
        error('Arguments do not match any overload of function gtsam.NonlinearFactorGraph.equals');
      end
    end

    function varargout = error(this, varargin)
      % ERROR usage: error(Values values) : returns double
      % Doxygen can be found at http://research.cc.gatech.edu/borg/sites/edu.borg/html/index.html
      if length(varargin) == 1 && isa(varargin{1},'gtsam.Values')
        varargout{1} = gtsam_wrapper(991, this, varargin{:});
      else
        error('Arguments do not match any overload of function gtsam.NonlinearFactorGraph.error');
      end
    end

    function varargout = exists(this, varargin)
      % EXISTS usage: exists(size_t idx) : returns bool
      % Doxygen can be found at http://research.cc.gatech.edu/borg/sites/edu.borg/html/index.html
      varargout{1} = gtsam_wrapper(992, this, varargin{:});
    end

    function varargout = linearize(this, varargin)
      % LINEARIZE usage: linearize(Values values) : returns gtsam::GaussianFactorGraph
      % Doxygen can be found at http://research.cc.gatech.edu/borg/sites/edu.borg/html/index.html
      if length(varargin) == 1 && isa(varargin{1},'gtsam.Values')
        varargout{1} = gtsam_wrapper(993, this, varargin{:});
      else
        error('Arguments do not match any overload of function gtsam.NonlinearFactorGraph.linearize');
      end
    end

    function varargout = nrFactors(this, varargin)
      % NRFACTORS usage: nrFactors() : returns size_t
      % Doxygen can be found at http://research.cc.gatech.edu/borg/sites/edu.borg/html/index.html
      varargout{1} = gtsam_wrapper(994, this, varargin{:});
    end

    function varargout = orderingCOLAMD(this, varargin)
      % ORDERINGCOLAMD usage: orderingCOLAMD() : returns gtsam::Ordering
      % Doxygen can be found at http://research.cc.gatech.edu/borg/sites/edu.borg/html/index.html
      varargout{1} = gtsam_wrapper(995, this, varargin{:});
    end

    function varargout = print(this, varargin)
      % PRINT usage: print(string s) : returns void
      % Doxygen can be found at http://research.cc.gatech.edu/borg/sites/edu.borg/html/index.html
      if length(varargin) == 1 && isa(varargin{1},'char')
        gtsam_wrapper(996, this, varargin{:});
      else
        error('Arguments do not match any overload of function gtsam.NonlinearFactorGraph.print');
      end
    end

    function varargout = probPrime(this, varargin)
      % PROBPRIME usage: probPrime(Values values) : returns double
      % Doxygen can be found at http://research.cc.gatech.edu/borg/sites/edu.borg/html/index.html
      if length(varargin) == 1 && isa(varargin{1},'gtsam.Values')
        varargout{1} = gtsam_wrapper(997, this, varargin{:});
      else
        error('Arguments do not match any overload of function gtsam.NonlinearFactorGraph.probPrime');
      end
    end

    function varargout = push_back(this, varargin)
      % PUSH_BACK usage: push_back(NonlinearFactorGraph factors), push_back(NonlinearFactor factor) : returns void
      % Doxygen can be found at http://research.cc.gatech.edu/borg/sites/edu.borg/html/index.html
      % 
      % Method Overloads
      % push_back(NonlinearFactorGraph factors)
      % push_back(NonlinearFactor factor)
      if length(varargin) == 1 && isa(varargin{1},'gtsam.NonlinearFactorGraph')
        gtsam_wrapper(998, this, varargin{:});
      elseif length(varargin) == 1 && isa(varargin{1},'gtsam.NonlinearFactor')
        gtsam_wrapper(999, this, varargin{:});
      else
        error('Arguments do not match any overload of function gtsam.NonlinearFactorGraph.push_back');
      end
    end

    function varargout = remove(this, varargin)
      % REMOVE usage: remove(size_t i) : returns void
      % Doxygen can be found at http://research.cc.gatech.edu/borg/sites/edu.borg/html/index.html
      gtsam_wrapper(1000, this, varargin{:});
    end

    function varargout = size(this, varargin)
      % SIZE usage: size() : returns size_t
      % Doxygen can be found at http://research.cc.gatech.edu/borg/sites/edu.borg/html/index.html
      varargout{1} = gtsam_wrapper(1001, this, varargin{:});
    end

    function varargout = string_serialize(this, varargin)
      % STRING_SERIALIZE usage: string_serialize() : returns string
      % Doxygen can be found at http://research.cc.gatech.edu/borg/sites/edu.borg/html/index.html
      if length(varargin) == 0
        varargout{1} = gtsam_wrapper(1002, this, varargin{:});
      else
        error('Arguments do not match any overload of function gtsam.NonlinearFactorGraph.string_serialize');
      end
    end

    function sobj = saveobj(obj)
      % SAVEOBJ Saves the object to a matlab-readable format
      sobj = obj.string_serialize();
    end
  end

  methods(Static = true)
    function varargout = string_deserialize(varargin)
      % STRING_DESERIALIZE usage: string_deserialize() : returns gtsam.NonlinearFactorGraph
      % Doxygen can be found at http://research.cc.gatech.edu/borg/sites/edu.borg/html/index.html
      if length(varargin) == 1
        varargout{1} = gtsam_wrapper(1003, varargin{:});
      else
        error('Arguments do not match any overload of function gtsam.NonlinearFactorGraph.string_deserialize');
      end
    end

    function obj = loadobj(sobj)
      % LOADOBJ Saves the object to a matlab-readable format
      obj = gtsam.NonlinearFactorGraph.string_deserialize(sobj);
    end
  end
end
