%class Base, see Doxygen page for details
%at http://research.cc.gatech.edu/borg/sites/edu.borg/html/index.html
%
classdef Base < handle
  properties
    ptr_gtsamnoiseModelmEstimatorBase = 0
  end
  methods
    function obj = Base(varargin)
      if (nargin == 2 || (nargin == 3 && strcmp(varargin{3}, 'void'))) && isa(varargin{1}, 'uint64') && varargin{1} == uint64(5139824614673773682)
        if nargin == 2
          my_ptr = varargin{2};
        else
          my_ptr = gtsam_wrapper(605, varargin{2});
        end
        gtsam_wrapper(604, my_ptr);
      else
        error('Arguments do not match any overload of gtsam.noiseModel.mEstimator.Base constructor');
      end
      obj.ptr_gtsamnoiseModelmEstimatorBase = my_ptr;
    end

    function delete(obj)
      gtsam_wrapper(606, obj.ptr_gtsamnoiseModelmEstimatorBase);
    end

    function display(obj), obj.print(''); end
    %DISPLAY Calls print on the object
    function disp(obj), obj.display; end
    %DISP Calls print on the object
  end

  methods(Static = true)
  end
end
