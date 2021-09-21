%class Cal3_S2Stereo, see Doxygen page for details
%at http://research.cc.gatech.edu/borg/sites/edu.borg/html/index.html
%
%-------Constructors-------
%Cal3_S2Stereo()
%Cal3_S2Stereo(double fx, double fy, double s, double u0, double v0, double b)
%Cal3_S2Stereo(Vector v)
%
%-------Methods-------
%baseline() : returns double
%equals(Cal3_S2Stereo K, double tol) : returns bool
%fx() : returns double
%fy() : returns double
%principalPoint() : returns gtsam::Point2
%print(string s) : returns void
%px() : returns double
%py() : returns double
%skew() : returns double
%
classdef Cal3_S2Stereo < handle
  properties
    ptr_gtsamCal3_S2Stereo = 0
  end
  methods
    function obj = Cal3_S2Stereo(varargin)
      if nargin == 2 && isa(varargin{1}, 'uint64') && varargin{1} == uint64(5139824614673773682)
        my_ptr = varargin{2};
        gtsam_wrapper(355, my_ptr);
      elseif nargin == 0
        my_ptr = gtsam_wrapper(356);
      elseif nargin == 6 && isa(varargin{1},'double') && isa(varargin{2},'double') && isa(varargin{3},'double') && isa(varargin{4},'double') && isa(varargin{5},'double') && isa(varargin{6},'double')
        my_ptr = gtsam_wrapper(357, varargin{1}, varargin{2}, varargin{3}, varargin{4}, varargin{5}, varargin{6});
      elseif nargin == 1 && isa(varargin{1},'double')
        my_ptr = gtsam_wrapper(358, varargin{1});
      else
        error('Arguments do not match any overload of gtsam.Cal3_S2Stereo constructor');
      end
      obj.ptr_gtsamCal3_S2Stereo = my_ptr;
    end

    function delete(obj)
      gtsam_wrapper(359, obj.ptr_gtsamCal3_S2Stereo);
    end

    function display(obj), obj.print(''); end
    %DISPLAY Calls print on the object
    function disp(obj), obj.display; end
    %DISP Calls print on the object
    function varargout = baseline(this, varargin)
      % BASELINE usage: baseline() : returns double
      % Doxygen can be found at http://research.cc.gatech.edu/borg/sites/edu.borg/html/index.html
      varargout{1} = gtsam_wrapper(360, this, varargin{:});
    end

    function varargout = equals(this, varargin)
      % EQUALS usage: equals(Cal3_S2Stereo K, double tol) : returns bool
      % Doxygen can be found at http://research.cc.gatech.edu/borg/sites/edu.borg/html/index.html
      if length(varargin) == 2 && isa(varargin{1},'gtsam.Cal3_S2Stereo') && isa(varargin{2},'double')
        varargout{1} = gtsam_wrapper(361, this, varargin{:});
      else
        error('Arguments do not match any overload of function gtsam.Cal3_S2Stereo.equals');
      end
    end

    function varargout = fx(this, varargin)
      % FX usage: fx() : returns double
      % Doxygen can be found at http://research.cc.gatech.edu/borg/sites/edu.borg/html/index.html
      varargout{1} = gtsam_wrapper(362, this, varargin{:});
    end

    function varargout = fy(this, varargin)
      % FY usage: fy() : returns double
      % Doxygen can be found at http://research.cc.gatech.edu/borg/sites/edu.borg/html/index.html
      varargout{1} = gtsam_wrapper(363, this, varargin{:});
    end

    function varargout = principalPoint(this, varargin)
      % PRINCIPALPOINT usage: principalPoint() : returns gtsam::Point2
      % Doxygen can be found at http://research.cc.gatech.edu/borg/sites/edu.borg/html/index.html
      varargout{1} = gtsam_wrapper(364, this, varargin{:});
    end

    function varargout = print(this, varargin)
      % PRINT usage: print(string s) : returns void
      % Doxygen can be found at http://research.cc.gatech.edu/borg/sites/edu.borg/html/index.html
      if length(varargin) == 1 && isa(varargin{1},'char')
        gtsam_wrapper(365, this, varargin{:});
      else
        error('Arguments do not match any overload of function gtsam.Cal3_S2Stereo.print');
      end
    end

    function varargout = px(this, varargin)
      % PX usage: px() : returns double
      % Doxygen can be found at http://research.cc.gatech.edu/borg/sites/edu.borg/html/index.html
      varargout{1} = gtsam_wrapper(366, this, varargin{:});
    end

    function varargout = py(this, varargin)
      % PY usage: py() : returns double
      % Doxygen can be found at http://research.cc.gatech.edu/borg/sites/edu.borg/html/index.html
      varargout{1} = gtsam_wrapper(367, this, varargin{:});
    end

    function varargout = skew(this, varargin)
      % SKEW usage: skew() : returns double
      % Doxygen can be found at http://research.cc.gatech.edu/borg/sites/edu.borg/html/index.html
      varargout{1} = gtsam_wrapper(368, this, varargin{:});
    end

  end

  methods(Static = true)
  end
end
