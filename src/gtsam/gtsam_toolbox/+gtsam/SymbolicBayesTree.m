%class SymbolicBayesTree, see Doxygen page for details
%at http://research.cc.gatech.edu/borg/sites/edu.borg/html/index.html
%
%-------Constructors-------
%SymbolicBayesTree()
%SymbolicBayesTree(SymbolicBayesTree other)
%
%-------Methods-------
%clear() : returns void
%deleteCachedShortcuts() : returns void
%equals(SymbolicBayesTree other, double tol) : returns bool
%joint(size_t key1, size_t key2) : returns gtsam::SymbolicFactorGraph
%jointBayesNet(size_t key1, size_t key2) : returns gtsam::SymbolicBayesNet
%marginalFactor(size_t key) : returns gtsam::SymbolicConditional
%numCachedSeparatorMarginals() : returns size_t
%print(string s) : returns void
%saveGraph(string s) : returns void
%size() : returns size_t
%
classdef SymbolicBayesTree < handle
  properties
    ptr_gtsamSymbolicBayesTree = 0
  end
  methods
    function obj = SymbolicBayesTree(varargin)
      if nargin == 2 && isa(varargin{1}, 'uint64') && varargin{1} == uint64(5139824614673773682)
        my_ptr = varargin{2};
        gtsam_wrapper(535, my_ptr);
      elseif nargin == 0
        my_ptr = gtsam_wrapper(536);
      elseif nargin == 1 && isa(varargin{1},'gtsam.SymbolicBayesTree')
        my_ptr = gtsam_wrapper(537, varargin{1});
      else
        error('Arguments do not match any overload of gtsam.SymbolicBayesTree constructor');
      end
      obj.ptr_gtsamSymbolicBayesTree = my_ptr;
    end

    function delete(obj)
      gtsam_wrapper(538, obj.ptr_gtsamSymbolicBayesTree);
    end

    function display(obj), obj.print(''); end
    %DISPLAY Calls print on the object
    function disp(obj), obj.display; end
    %DISP Calls print on the object
    function varargout = clear(this, varargin)
      % CLEAR usage: clear() : returns void
      % Doxygen can be found at http://research.cc.gatech.edu/borg/sites/edu.borg/html/index.html
      gtsam_wrapper(539, this, varargin{:});
    end

    function varargout = deleteCachedShortcuts(this, varargin)
      % DELETECACHEDSHORTCUTS usage: deleteCachedShortcuts() : returns void
      % Doxygen can be found at http://research.cc.gatech.edu/borg/sites/edu.borg/html/index.html
      gtsam_wrapper(540, this, varargin{:});
    end

    function varargout = equals(this, varargin)
      % EQUALS usage: equals(SymbolicBayesTree other, double tol) : returns bool
      % Doxygen can be found at http://research.cc.gatech.edu/borg/sites/edu.borg/html/index.html
      if length(varargin) == 2 && isa(varargin{1},'gtsam.SymbolicBayesTree') && isa(varargin{2},'double')
        varargout{1} = gtsam_wrapper(541, this, varargin{:});
      else
        error('Arguments do not match any overload of function gtsam.SymbolicBayesTree.equals');
      end
    end

    function varargout = joint(this, varargin)
      % JOINT usage: joint(size_t key1, size_t key2) : returns gtsam::SymbolicFactorGraph
      % Doxygen can be found at http://research.cc.gatech.edu/borg/sites/edu.borg/html/index.html
      varargout{1} = gtsam_wrapper(542, this, varargin{:});
    end

    function varargout = jointBayesNet(this, varargin)
      % JOINTBAYESNET usage: jointBayesNet(size_t key1, size_t key2) : returns gtsam::SymbolicBayesNet
      % Doxygen can be found at http://research.cc.gatech.edu/borg/sites/edu.borg/html/index.html
      varargout{1} = gtsam_wrapper(543, this, varargin{:});
    end

    function varargout = marginalFactor(this, varargin)
      % MARGINALFACTOR usage: marginalFactor(size_t key) : returns gtsam::SymbolicConditional
      % Doxygen can be found at http://research.cc.gatech.edu/borg/sites/edu.borg/html/index.html
      varargout{1} = gtsam_wrapper(544, this, varargin{:});
    end

    function varargout = numCachedSeparatorMarginals(this, varargin)
      % NUMCACHEDSEPARATORMARGINALS usage: numCachedSeparatorMarginals() : returns size_t
      % Doxygen can be found at http://research.cc.gatech.edu/borg/sites/edu.borg/html/index.html
      varargout{1} = gtsam_wrapper(545, this, varargin{:});
    end

    function varargout = print(this, varargin)
      % PRINT usage: print(string s) : returns void
      % Doxygen can be found at http://research.cc.gatech.edu/borg/sites/edu.borg/html/index.html
      if length(varargin) == 1 && isa(varargin{1},'char')
        gtsam_wrapper(546, this, varargin{:});
      else
        error('Arguments do not match any overload of function gtsam.SymbolicBayesTree.print');
      end
    end

    function varargout = saveGraph(this, varargin)
      % SAVEGRAPH usage: saveGraph(string s) : returns void
      % Doxygen can be found at http://research.cc.gatech.edu/borg/sites/edu.borg/html/index.html
      if length(varargin) == 1 && isa(varargin{1},'char')
        gtsam_wrapper(547, this, varargin{:});
      else
        error('Arguments do not match any overload of function gtsam.SymbolicBayesTree.saveGraph');
      end
    end

    function varargout = size(this, varargin)
      % SIZE usage: size() : returns size_t
      % Doxygen can be found at http://research.cc.gatech.edu/borg/sites/edu.borg/html/index.html
      varargout{1} = gtsam_wrapper(548, this, varargin{:});
    end

  end

  methods(Static = true)
  end
end
