%class Value, see Doxygen page for details
%at http://research.cc.gatech.edu/borg/sites/edu.borg/html/index.html
%
%-------Methods-------
%dim() : returns size_t
%print(string s) : returns void
%
classdef Value < handle
  properties
    ptr_gtsamValue = 0
  end
  methods
    function obj = Value(varargin)
      if (nargin == 2 || (nargin == 3 && strcmp(varargin{3}, 'void'))) && isa(varargin{1}, 'uint64') && varargin{1} == uint64(5139824614673773682)
        if nargin == 2
          my_ptr = varargin{2};
        else
          my_ptr = gtsam_wrapper(1, varargin{2});
        end
        gtsam_wrapper(0, my_ptr);
      else
        error('Arguments do not match any overload of gtsam.Value constructor');
      end
      obj.ptr_gtsamValue = my_ptr;
    end

    function delete(obj)
      gtsam_wrapper(2, obj.ptr_gtsamValue);
    end

    function display(obj), obj.print(''); end
    %DISPLAY Calls print on the object
    function disp(obj), obj.display; end
    %DISP Calls print on the object
    function varargout = dim(this, varargin)
      % DIM usage: dim() : returns size_t
      % Doxygen can be found at http://research.cc.gatech.edu/borg/sites/edu.borg/html/index.html
      varargout{1} = gtsam_wrapper(3, this, varargin{:});
    end

    function varargout = print(this, varargin)
      % PRINT usage: print(string s) : returns void
      % Doxygen can be found at http://research.cc.gatech.edu/borg/sites/edu.borg/html/index.html
      if length(varargin) == 1 && isa(varargin{1},'char')
        gtsam_wrapper(4, this, varargin{:});
      else
        error('Arguments do not match any overload of function gtsam.Value.print');
      end
    end

  end

  methods(Static = true)
  end
end
