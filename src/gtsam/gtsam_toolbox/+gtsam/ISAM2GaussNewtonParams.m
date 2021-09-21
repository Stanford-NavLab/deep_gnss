%class ISAM2GaussNewtonParams, see Doxygen page for details
%at http://research.cc.gatech.edu/borg/sites/edu.borg/html/index.html
%
%-------Constructors-------
%ISAM2GaussNewtonParams()
%
%-------Methods-------
%getWildfireThreshold() : returns double
%print(string str) : returns void
%setWildfireThreshold(double wildfireThreshold) : returns void
%
classdef ISAM2GaussNewtonParams < handle
  properties
    ptr_gtsamISAM2GaussNewtonParams = 0
  end
  methods
    function obj = ISAM2GaussNewtonParams(varargin)
      if nargin == 2 && isa(varargin{1}, 'uint64') && varargin{1} == uint64(5139824614673773682)
        my_ptr = varargin{2};
        gtsam_wrapper(1299, my_ptr);
      elseif nargin == 0
        my_ptr = gtsam_wrapper(1300);
      else
        error('Arguments do not match any overload of gtsam.ISAM2GaussNewtonParams constructor');
      end
      obj.ptr_gtsamISAM2GaussNewtonParams = my_ptr;
    end

    function delete(obj)
      gtsam_wrapper(1301, obj.ptr_gtsamISAM2GaussNewtonParams);
    end

    function display(obj), obj.print(''); end
    %DISPLAY Calls print on the object
    function disp(obj), obj.display; end
    %DISP Calls print on the object
    function varargout = getWildfireThreshold(this, varargin)
      % GETWILDFIRETHRESHOLD usage: getWildfireThreshold() : returns double
      % Doxygen can be found at http://research.cc.gatech.edu/borg/sites/edu.borg/html/index.html
      varargout{1} = gtsam_wrapper(1302, this, varargin{:});
    end

    function varargout = print(this, varargin)
      % PRINT usage: print(string str) : returns void
      % Doxygen can be found at http://research.cc.gatech.edu/borg/sites/edu.borg/html/index.html
      if length(varargin) == 1 && isa(varargin{1},'char')
        gtsam_wrapper(1303, this, varargin{:});
      else
        error('Arguments do not match any overload of function gtsam.ISAM2GaussNewtonParams.print');
      end
    end

    function varargout = setWildfireThreshold(this, varargin)
      % SETWILDFIRETHRESHOLD usage: setWildfireThreshold(double wildfireThreshold) : returns void
      % Doxygen can be found at http://research.cc.gatech.edu/borg/sites/edu.borg/html/index.html
      gtsam_wrapper(1304, this, varargin{:});
    end

  end

  methods(Static = true)
  end
end
