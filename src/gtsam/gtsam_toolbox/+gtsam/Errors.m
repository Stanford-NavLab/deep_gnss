%class Errors, see Doxygen page for details
%at http://research.cc.gatech.edu/borg/sites/edu.borg/html/index.html
%
%-------Constructors-------
%Errors()
%Errors(VectorValues V)
%
%-------Methods-------
%equals(Errors expected, double tol) : returns bool
%print(string s) : returns void
%
classdef Errors < handle
  properties
    ptr_gtsamErrors = 0
  end
  methods
    function obj = Errors(varargin)
      if nargin == 2 && isa(varargin{1}, 'uint64') && varargin{1} == uint64(5139824614673773682)
        my_ptr = varargin{2};
        gtsam_wrapper(898, my_ptr);
      elseif nargin == 0
        my_ptr = gtsam_wrapper(899);
      elseif nargin == 1 && isa(varargin{1},'gtsam.VectorValues')
        my_ptr = gtsam_wrapper(900, varargin{1});
      else
        error('Arguments do not match any overload of gtsam.Errors constructor');
      end
      obj.ptr_gtsamErrors = my_ptr;
    end

    function delete(obj)
      gtsam_wrapper(901, obj.ptr_gtsamErrors);
    end

    function display(obj), obj.print(''); end
    %DISPLAY Calls print on the object
    function disp(obj), obj.display; end
    %DISP Calls print on the object
    function varargout = equals(this, varargin)
      % EQUALS usage: equals(Errors expected, double tol) : returns bool
      % Doxygen can be found at http://research.cc.gatech.edu/borg/sites/edu.borg/html/index.html
      if length(varargin) == 2 && isa(varargin{1},'gtsam.Errors') && isa(varargin{2},'double')
        varargout{1} = gtsam_wrapper(902, this, varargin{:});
      else
        error('Arguments do not match any overload of function gtsam.Errors.equals');
      end
    end

    function varargout = print(this, varargin)
      % PRINT usage: print(string s) : returns void
      % Doxygen can be found at http://research.cc.gatech.edu/borg/sites/edu.borg/html/index.html
      if length(varargin) == 1 && isa(varargin{1},'char')
        gtsam_wrapper(903, this, varargin{:});
      else
        error('Arguments do not match any overload of function gtsam.Errors.print');
      end
    end

  end

  methods(Static = true)
  end
end
