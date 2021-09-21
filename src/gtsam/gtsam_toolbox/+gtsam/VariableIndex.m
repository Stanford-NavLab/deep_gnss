%class VariableIndex, see Doxygen page for details
%at http://research.cc.gatech.edu/borg/sites/edu.borg/html/index.html
%
%-------Constructors-------
%VariableIndex()
%VariableIndex(SymbolicFactorGraph factorGraph)
%VariableIndex(GaussianFactorGraph factorGraph)
%VariableIndex(NonlinearFactorGraph factorGraph)
%VariableIndex(VariableIndex other)
%
%-------Methods-------
%equals(VariableIndex other, double tol) : returns bool
%nEntries() : returns size_t
%nFactors() : returns size_t
%print(string s) : returns void
%size() : returns size_t
%
classdef VariableIndex < handle
  properties
    ptr_gtsamVariableIndex = 0
  end
  methods
    function obj = VariableIndex(varargin)
      if nargin == 2 && isa(varargin{1}, 'uint64') && varargin{1} == uint64(5139824614673773682)
        my_ptr = varargin{2};
        gtsam_wrapper(549, my_ptr);
      elseif nargin == 0
        my_ptr = gtsam_wrapper(550);
      elseif nargin == 1 && isa(varargin{1},'gtsam.SymbolicFactorGraph')
        my_ptr = gtsam_wrapper(551, varargin{1});
      elseif nargin == 1 && isa(varargin{1},'gtsam.GaussianFactorGraph')
        my_ptr = gtsam_wrapper(552, varargin{1});
      elseif nargin == 1 && isa(varargin{1},'gtsam.NonlinearFactorGraph')
        my_ptr = gtsam_wrapper(553, varargin{1});
      elseif nargin == 1 && isa(varargin{1},'gtsam.VariableIndex')
        my_ptr = gtsam_wrapper(554, varargin{1});
      else
        error('Arguments do not match any overload of gtsam.VariableIndex constructor');
      end
      obj.ptr_gtsamVariableIndex = my_ptr;
    end

    function delete(obj)
      gtsam_wrapper(555, obj.ptr_gtsamVariableIndex);
    end

    function display(obj), obj.print(''); end
    %DISPLAY Calls print on the object
    function disp(obj), obj.display; end
    %DISP Calls print on the object
    function varargout = equals(this, varargin)
      % EQUALS usage: equals(VariableIndex other, double tol) : returns bool
      % Doxygen can be found at http://research.cc.gatech.edu/borg/sites/edu.borg/html/index.html
      if length(varargin) == 2 && isa(varargin{1},'gtsam.VariableIndex') && isa(varargin{2},'double')
        varargout{1} = gtsam_wrapper(556, this, varargin{:});
      else
        error('Arguments do not match any overload of function gtsam.VariableIndex.equals');
      end
    end

    function varargout = nEntries(this, varargin)
      % NENTRIES usage: nEntries() : returns size_t
      % Doxygen can be found at http://research.cc.gatech.edu/borg/sites/edu.borg/html/index.html
      varargout{1} = gtsam_wrapper(557, this, varargin{:});
    end

    function varargout = nFactors(this, varargin)
      % NFACTORS usage: nFactors() : returns size_t
      % Doxygen can be found at http://research.cc.gatech.edu/borg/sites/edu.borg/html/index.html
      varargout{1} = gtsam_wrapper(558, this, varargin{:});
    end

    function varargout = print(this, varargin)
      % PRINT usage: print(string s) : returns void
      % Doxygen can be found at http://research.cc.gatech.edu/borg/sites/edu.borg/html/index.html
      if length(varargin) == 1 && isa(varargin{1},'char')
        gtsam_wrapper(559, this, varargin{:});
      else
        error('Arguments do not match any overload of function gtsam.VariableIndex.print');
      end
    end

    function varargout = size(this, varargin)
      % SIZE usage: size() : returns size_t
      % Doxygen can be found at http://research.cc.gatech.edu/borg/sites/edu.borg/html/index.html
      varargout{1} = gtsam_wrapper(560, this, varargin{:});
    end

  end

  methods(Static = true)
  end
end
