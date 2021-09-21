%class RelativeElevationFactor, see Doxygen page for details
%at http://research.cc.gatech.edu/borg/sites/edu.borg/html/index.html
%
%-------Constructors-------
%RelativeElevationFactor()
%RelativeElevationFactor(size_t poseKey, size_t pointKey, double measured, Base model)
%
%-------Methods-------
%measured() : returns double
%print(string s) : returns void
%
classdef RelativeElevationFactor < gtsam.NonlinearFactor
  properties
    ptr_gtsamRelativeElevationFactor = 0
  end
  methods
    function obj = RelativeElevationFactor(varargin)
      if (nargin == 2 || (nargin == 3 && strcmp(varargin{3}, 'void'))) && isa(varargin{1}, 'uint64') && varargin{1} == uint64(5139824614673773682)
        if nargin == 2
          my_ptr = varargin{2};
        else
          my_ptr = gtsam_unstable_wrapper(301, varargin{2});
        end
        base_ptr = gtsam_unstable_wrapper(300, my_ptr);
      elseif nargin == 0
        [ my_ptr, base_ptr ] = gtsam_unstable_wrapper(302);
      elseif nargin == 4 && isa(varargin{1},'numeric') && isa(varargin{2},'numeric') && isa(varargin{3},'double') && isa(varargin{4},'gtsam.noiseModel.Base')
        [ my_ptr, base_ptr ] = gtsam_unstable_wrapper(303, varargin{1}, varargin{2}, varargin{3}, varargin{4});
      else
        error('Arguments do not match any overload of gtsam.RelativeElevationFactor constructor');
      end
      obj = obj@gtsam.NonlinearFactor(uint64(5139824614673773682), base_ptr);
      obj.ptr_gtsamRelativeElevationFactor = my_ptr;
    end

    function delete(obj)
      gtsam_unstable_wrapper(304, obj.ptr_gtsamRelativeElevationFactor);
    end

    function display(obj), obj.print(''); end
    %DISPLAY Calls print on the object
    function disp(obj), obj.display; end
    %DISP Calls print on the object
    function varargout = measured(this, varargin)
      % MEASURED usage: measured() : returns double
      % Doxygen can be found at http://research.cc.gatech.edu/borg/sites/edu.borg/html/index.html
      varargout{1} = gtsam_unstable_wrapper(305, this, varargin{:});
    end

    function varargout = print(this, varargin)
      % PRINT usage: print(string s) : returns void
      % Doxygen can be found at http://research.cc.gatech.edu/borg/sites/edu.borg/html/index.html
      if length(varargin) == 1 && isa(varargin{1},'char')
        gtsam_unstable_wrapper(306, this, varargin{:});
      else
        error('Arguments do not match any overload of function gtsam.RelativeElevationFactor.print');
      end
    end

  end

  methods(Static = true)
  end
end
