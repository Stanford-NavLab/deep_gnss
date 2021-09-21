%class IterativeOptimizationParameters, see Doxygen page for details
%at http://research.cc.gatech.edu/borg/sites/edu.borg/html/index.html
%
%-------Methods-------
%getVerbosity() : returns string
%print() : returns void
%setVerbosity(string s) : returns void
%
classdef IterativeOptimizationParameters < handle
  properties
    ptr_gtsamIterativeOptimizationParameters = 0
  end
  methods
    function obj = IterativeOptimizationParameters(varargin)
      if (nargin == 2 || (nargin == 3 && strcmp(varargin{3}, 'void'))) && isa(varargin{1}, 'uint64') && varargin{1} == uint64(5139824614673773682)
        if nargin == 2
          my_ptr = varargin{2};
        else
          my_ptr = gtsam_wrapper(911, varargin{2});
        end
        gtsam_wrapper(910, my_ptr);
      else
        error('Arguments do not match any overload of gtsam.IterativeOptimizationParameters constructor');
      end
      obj.ptr_gtsamIterativeOptimizationParameters = my_ptr;
    end

    function delete(obj)
      gtsam_wrapper(912, obj.ptr_gtsamIterativeOptimizationParameters);
    end

    function display(obj), obj.print(''); end
    %DISPLAY Calls print on the object
    function disp(obj), obj.display; end
    %DISP Calls print on the object
    function varargout = getVerbosity(this, varargin)
      % GETVERBOSITY usage: getVerbosity() : returns string
      % Doxygen can be found at http://research.cc.gatech.edu/borg/sites/edu.borg/html/index.html
      varargout{1} = gtsam_wrapper(913, this, varargin{:});
    end

    function varargout = print(this, varargin)
      % PRINT usage: print() : returns void
      % Doxygen can be found at http://research.cc.gatech.edu/borg/sites/edu.borg/html/index.html
      gtsam_wrapper(914, this, varargin{:});
    end

    function varargout = setVerbosity(this, varargin)
      % SETVERBOSITY usage: setVerbosity(string s) : returns void
      % Doxygen can be found at http://research.cc.gatech.edu/borg/sites/edu.borg/html/index.html
      if length(varargin) == 1 && isa(varargin{1},'char')
        gtsam_wrapper(915, this, varargin{:});
      else
        error('Arguments do not match any overload of function gtsam.IterativeOptimizationParameters.setVerbosity');
      end
    end

  end

  methods(Static = true)
  end
end
