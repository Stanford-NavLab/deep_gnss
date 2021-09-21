%class SymbolicFactor, see Doxygen page for details
%at http://research.cc.gatech.edu/borg/sites/edu.borg/html/index.html
%
%-------Constructors-------
%SymbolicFactor(SymbolicFactor f)
%SymbolicFactor()
%SymbolicFactor(size_t j)
%SymbolicFactor(size_t j1, size_t j2)
%SymbolicFactor(size_t j1, size_t j2, size_t j3)
%SymbolicFactor(size_t j1, size_t j2, size_t j3, size_t j4)
%SymbolicFactor(size_t j1, size_t j2, size_t j3, size_t j4, size_t j5)
%SymbolicFactor(size_t j1, size_t j2, size_t j3, size_t j4, size_t j5, size_t j6)
%
%-------Methods-------
%equals(SymbolicFactor other, double tol) : returns bool
%keys() : returns gtsam::KeyVector
%print(string s) : returns void
%size() : returns size_t
%
%-------Static Methods-------
%FromKeys(KeyVector js) : returns gtsam::SymbolicFactor
%
classdef SymbolicFactor < handle
  properties
    ptr_gtsamSymbolicFactor = 0
  end
  methods
    function obj = SymbolicFactor(varargin)
      if (nargin == 2 || (nargin == 3 && strcmp(varargin{3}, 'void'))) && isa(varargin{1}, 'uint64') && varargin{1} == uint64(5139824614673773682)
        if nargin == 2
          my_ptr = varargin{2};
        else
          my_ptr = gtsam_wrapper(459, varargin{2});
        end
        gtsam_wrapper(458, my_ptr);
      elseif nargin == 1 && isa(varargin{1},'gtsam.SymbolicFactor')
        my_ptr = gtsam_wrapper(460, varargin{1});
      elseif nargin == 0
        my_ptr = gtsam_wrapper(461);
      elseif nargin == 1 && isa(varargin{1},'numeric')
        my_ptr = gtsam_wrapper(462, varargin{1});
      elseif nargin == 2 && isa(varargin{1},'numeric') && isa(varargin{2},'numeric')
        my_ptr = gtsam_wrapper(463, varargin{1}, varargin{2});
      elseif nargin == 3 && isa(varargin{1},'numeric') && isa(varargin{2},'numeric') && isa(varargin{3},'numeric')
        my_ptr = gtsam_wrapper(464, varargin{1}, varargin{2}, varargin{3});
      elseif nargin == 4 && isa(varargin{1},'numeric') && isa(varargin{2},'numeric') && isa(varargin{3},'numeric') && isa(varargin{4},'numeric')
        my_ptr = gtsam_wrapper(465, varargin{1}, varargin{2}, varargin{3}, varargin{4});
      elseif nargin == 5 && isa(varargin{1},'numeric') && isa(varargin{2},'numeric') && isa(varargin{3},'numeric') && isa(varargin{4},'numeric') && isa(varargin{5},'numeric')
        my_ptr = gtsam_wrapper(466, varargin{1}, varargin{2}, varargin{3}, varargin{4}, varargin{5});
      elseif nargin == 6 && isa(varargin{1},'numeric') && isa(varargin{2},'numeric') && isa(varargin{3},'numeric') && isa(varargin{4},'numeric') && isa(varargin{5},'numeric') && isa(varargin{6},'numeric')
        my_ptr = gtsam_wrapper(467, varargin{1}, varargin{2}, varargin{3}, varargin{4}, varargin{5}, varargin{6});
      else
        error('Arguments do not match any overload of gtsam.SymbolicFactor constructor');
      end
      obj.ptr_gtsamSymbolicFactor = my_ptr;
    end

    function delete(obj)
      gtsam_wrapper(468, obj.ptr_gtsamSymbolicFactor);
    end

    function display(obj), obj.print(''); end
    %DISPLAY Calls print on the object
    function disp(obj), obj.display; end
    %DISP Calls print on the object
    function varargout = equals(this, varargin)
      % EQUALS usage: equals(SymbolicFactor other, double tol) : returns bool
      % Doxygen can be found at http://research.cc.gatech.edu/borg/sites/edu.borg/html/index.html
      if length(varargin) == 2 && isa(varargin{1},'gtsam.SymbolicFactor') && isa(varargin{2},'double')
        varargout{1} = gtsam_wrapper(469, this, varargin{:});
      else
        error('Arguments do not match any overload of function gtsam.SymbolicFactor.equals');
      end
    end

    function varargout = keys(this, varargin)
      % KEYS usage: keys() : returns gtsam::KeyVector
      % Doxygen can be found at http://research.cc.gatech.edu/borg/sites/edu.borg/html/index.html
      varargout{1} = gtsam_wrapper(470, this, varargin{:});
    end

    function varargout = print(this, varargin)
      % PRINT usage: print(string s) : returns void
      % Doxygen can be found at http://research.cc.gatech.edu/borg/sites/edu.borg/html/index.html
      if length(varargin) == 1 && isa(varargin{1},'char')
        gtsam_wrapper(471, this, varargin{:});
      else
        error('Arguments do not match any overload of function gtsam.SymbolicFactor.print');
      end
    end

    function varargout = size(this, varargin)
      % SIZE usage: size() : returns size_t
      % Doxygen can be found at http://research.cc.gatech.edu/borg/sites/edu.borg/html/index.html
      varargout{1} = gtsam_wrapper(472, this, varargin{:});
    end

  end

  methods(Static = true)
    function varargout = FromKeys(varargin)
      % FROMKEYS usage: FromKeys(KeyVector js) : returns gtsam::SymbolicFactor
      % Doxygen can be found at http://research.cc.gatech.edu/borg/sites/edu.borg/html/index.html
      % 
      % Usage
      % FROMKEYS(KeyVector js)
      if length(varargin) == 1 && isa(varargin{1},'gtsam.KeyVector')
        varargout{1} = gtsam_wrapper(473, varargin{:});
      else
        error('Arguments do not match any overload of function gtsam.SymbolicFactor.FromKeys');
      end
    end

  end
end
