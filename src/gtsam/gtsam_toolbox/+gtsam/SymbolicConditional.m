%class SymbolicConditional, see Doxygen page for details
%at http://research.cc.gatech.edu/borg/sites/edu.borg/html/index.html
%
%-------Constructors-------
%SymbolicConditional()
%SymbolicConditional(SymbolicConditional other)
%SymbolicConditional(size_t key)
%SymbolicConditional(size_t key, size_t parent)
%SymbolicConditional(size_t key, size_t parent1, size_t parent2)
%SymbolicConditional(size_t key, size_t parent1, size_t parent2, size_t parent3)
%
%-------Methods-------
%equals(SymbolicConditional other, double tol) : returns bool
%keys() : returns gtsam::KeyVector
%nrFrontals() : returns size_t
%nrParents() : returns size_t
%print(string s) : returns void
%size() : returns size_t
%
%-------Static Methods-------
%FromKeys(KeyVector keys, size_t nrFrontals) : returns gtsam::SymbolicConditional
%
classdef SymbolicConditional < gtsam.SymbolicFactor
  properties
    ptr_gtsamSymbolicConditional = 0
  end
  methods
    function obj = SymbolicConditional(varargin)
      if (nargin == 2 || (nargin == 3 && strcmp(varargin{3}, 'void'))) && isa(varargin{1}, 'uint64') && varargin{1} == uint64(5139824614673773682)
        if nargin == 2
          my_ptr = varargin{2};
        else
          my_ptr = gtsam_wrapper(507, varargin{2});
        end
        base_ptr = gtsam_wrapper(506, my_ptr);
      elseif nargin == 0
        [ my_ptr, base_ptr ] = gtsam_wrapper(508);
      elseif nargin == 1 && isa(varargin{1},'gtsam.SymbolicConditional')
        [ my_ptr, base_ptr ] = gtsam_wrapper(509, varargin{1});
      elseif nargin == 1 && isa(varargin{1},'numeric')
        [ my_ptr, base_ptr ] = gtsam_wrapper(510, varargin{1});
      elseif nargin == 2 && isa(varargin{1},'numeric') && isa(varargin{2},'numeric')
        [ my_ptr, base_ptr ] = gtsam_wrapper(511, varargin{1}, varargin{2});
      elseif nargin == 3 && isa(varargin{1},'numeric') && isa(varargin{2},'numeric') && isa(varargin{3},'numeric')
        [ my_ptr, base_ptr ] = gtsam_wrapper(512, varargin{1}, varargin{2}, varargin{3});
      elseif nargin == 4 && isa(varargin{1},'numeric') && isa(varargin{2},'numeric') && isa(varargin{3},'numeric') && isa(varargin{4},'numeric')
        [ my_ptr, base_ptr ] = gtsam_wrapper(513, varargin{1}, varargin{2}, varargin{3}, varargin{4});
      else
        error('Arguments do not match any overload of gtsam.SymbolicConditional constructor');
      end
      obj = obj@gtsam.SymbolicFactor(uint64(5139824614673773682), base_ptr);
      obj.ptr_gtsamSymbolicConditional = my_ptr;
    end

    function delete(obj)
      gtsam_wrapper(514, obj.ptr_gtsamSymbolicConditional);
    end

    function display(obj), obj.print(''); end
    %DISPLAY Calls print on the object
    function disp(obj), obj.display; end
    %DISP Calls print on the object
    function varargout = equals(this, varargin)
      % EQUALS usage: equals(SymbolicConditional other, double tol) : returns bool
      % Doxygen can be found at http://research.cc.gatech.edu/borg/sites/edu.borg/html/index.html
      if length(varargin) == 2 && isa(varargin{1},'gtsam.SymbolicConditional') && isa(varargin{2},'double')
        varargout{1} = gtsam_wrapper(515, this, varargin{:});
      else
        error('Arguments do not match any overload of function gtsam.SymbolicConditional.equals');
      end
    end

    function varargout = keys(this, varargin)
      % KEYS usage: keys() : returns gtsam::KeyVector
      % Doxygen can be found at http://research.cc.gatech.edu/borg/sites/edu.borg/html/index.html
      varargout{1} = gtsam_wrapper(516, this, varargin{:});
    end

    function varargout = nrFrontals(this, varargin)
      % NRFRONTALS usage: nrFrontals() : returns size_t
      % Doxygen can be found at http://research.cc.gatech.edu/borg/sites/edu.borg/html/index.html
      varargout{1} = gtsam_wrapper(517, this, varargin{:});
    end

    function varargout = nrParents(this, varargin)
      % NRPARENTS usage: nrParents() : returns size_t
      % Doxygen can be found at http://research.cc.gatech.edu/borg/sites/edu.borg/html/index.html
      varargout{1} = gtsam_wrapper(518, this, varargin{:});
    end

    function varargout = print(this, varargin)
      % PRINT usage: print(string s) : returns void
      % Doxygen can be found at http://research.cc.gatech.edu/borg/sites/edu.borg/html/index.html
      if length(varargin) == 1 && isa(varargin{1},'char')
        gtsam_wrapper(519, this, varargin{:});
      else
        error('Arguments do not match any overload of function gtsam.SymbolicConditional.print');
      end
    end

    function varargout = size(this, varargin)
      % SIZE usage: size() : returns size_t
      % Doxygen can be found at http://research.cc.gatech.edu/borg/sites/edu.borg/html/index.html
      varargout{1} = gtsam_wrapper(520, this, varargin{:});
    end

  end

  methods(Static = true)
    function varargout = FromKeys(varargin)
      % FROMKEYS usage: FromKeys(KeyVector keys, size_t nrFrontals) : returns gtsam::SymbolicConditional
      % Doxygen can be found at http://research.cc.gatech.edu/borg/sites/edu.borg/html/index.html
      % 
      % Usage
      % FROMKEYS(KeyVector keys, size_t nrFrontals)
      if length(varargin) == 2 && isa(varargin{1},'gtsam.KeyVector') && isa(varargin{2},'numeric')
        varargout{1} = gtsam_wrapper(521, varargin{:});
      else
        error('Arguments do not match any overload of function gtsam.SymbolicConditional.FromKeys');
      end
    end

  end
end
