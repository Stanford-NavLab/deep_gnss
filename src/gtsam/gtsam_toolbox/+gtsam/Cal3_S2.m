%class Cal3_S2, see Doxygen page for details
%at http://research.cc.gatech.edu/borg/sites/edu.borg/html/index.html
%
%-------Constructors-------
%Cal3_S2()
%Cal3_S2(double fx, double fy, double s, double u0, double v0)
%Cal3_S2(Vector v)
%Cal3_S2(double fov, int w, int h)
%
%-------Methods-------
%calibrate(Point2 p) : returns gtsam::Point2
%dim() : returns size_t
%equals(Cal3_S2 rhs, double tol) : returns bool
%fx() : returns double
%fy() : returns double
%localCoordinates(Cal3_S2 c) : returns Vector
%matrix() : returns Matrix
%matrix_inverse() : returns Matrix
%principalPoint() : returns gtsam::Point2
%print(string s) : returns void
%px() : returns double
%py() : returns double
%retract(Vector v) : returns gtsam::Cal3_S2
%skew() : returns double
%uncalibrate(Point2 p) : returns gtsam::Point2
%vector() : returns Vector
%
%-------Static Methods-------
%Dim() : returns size_t
%
%-------Serialization Interface-------
%string_serialize() : returns string
%string_deserialize(string serialized) : returns Cal3_S2
%
classdef Cal3_S2 < gtsam.Value
  properties
    ptr_gtsamCal3_S2 = 0
  end
  methods
    function obj = Cal3_S2(varargin)
      if (nargin == 2 || (nargin == 3 && strcmp(varargin{3}, 'void'))) && isa(varargin{1}, 'uint64') && varargin{1} == uint64(5139824614673773682)
        if nargin == 2
          my_ptr = varargin{2};
        else
          my_ptr = gtsam_wrapper(306, varargin{2});
        end
        base_ptr = gtsam_wrapper(305, my_ptr);
      elseif nargin == 0
        [ my_ptr, base_ptr ] = gtsam_wrapper(307);
      elseif nargin == 5 && isa(varargin{1},'double') && isa(varargin{2},'double') && isa(varargin{3},'double') && isa(varargin{4},'double') && isa(varargin{5},'double')
        [ my_ptr, base_ptr ] = gtsam_wrapper(308, varargin{1}, varargin{2}, varargin{3}, varargin{4}, varargin{5});
      elseif nargin == 1 && isa(varargin{1},'double')
        [ my_ptr, base_ptr ] = gtsam_wrapper(309, varargin{1});
      elseif nargin == 3 && isa(varargin{1},'double') && isa(varargin{2},'numeric') && isa(varargin{3},'numeric')
        [ my_ptr, base_ptr ] = gtsam_wrapper(310, varargin{1}, varargin{2}, varargin{3});
      else
        error('Arguments do not match any overload of gtsam.Cal3_S2 constructor');
      end
      obj = obj@gtsam.Value(uint64(5139824614673773682), base_ptr);
      obj.ptr_gtsamCal3_S2 = my_ptr;
    end

    function delete(obj)
      gtsam_wrapper(311, obj.ptr_gtsamCal3_S2);
    end

    function display(obj), obj.print(''); end
    %DISPLAY Calls print on the object
    function disp(obj), obj.display; end
    %DISP Calls print on the object
    function varargout = calibrate(this, varargin)
      % CALIBRATE usage: calibrate(Point2 p) : returns gtsam::Point2
      % Doxygen can be found at http://research.cc.gatech.edu/borg/sites/edu.borg/html/index.html
      if length(varargin) == 1 && isa(varargin{1},'gtsam.Point2')
        varargout{1} = gtsam_wrapper(312, this, varargin{:});
      else
        error('Arguments do not match any overload of function gtsam.Cal3_S2.calibrate');
      end
    end

    function varargout = dim(this, varargin)
      % DIM usage: dim() : returns size_t
      % Doxygen can be found at http://research.cc.gatech.edu/borg/sites/edu.borg/html/index.html
      varargout{1} = gtsam_wrapper(313, this, varargin{:});
    end

    function varargout = equals(this, varargin)
      % EQUALS usage: equals(Cal3_S2 rhs, double tol) : returns bool
      % Doxygen can be found at http://research.cc.gatech.edu/borg/sites/edu.borg/html/index.html
      if length(varargin) == 2 && isa(varargin{1},'gtsam.Cal3_S2') && isa(varargin{2},'double')
        varargout{1} = gtsam_wrapper(314, this, varargin{:});
      else
        error('Arguments do not match any overload of function gtsam.Cal3_S2.equals');
      end
    end

    function varargout = fx(this, varargin)
      % FX usage: fx() : returns double
      % Doxygen can be found at http://research.cc.gatech.edu/borg/sites/edu.borg/html/index.html
      varargout{1} = gtsam_wrapper(315, this, varargin{:});
    end

    function varargout = fy(this, varargin)
      % FY usage: fy() : returns double
      % Doxygen can be found at http://research.cc.gatech.edu/borg/sites/edu.borg/html/index.html
      varargout{1} = gtsam_wrapper(316, this, varargin{:});
    end

    function varargout = localCoordinates(this, varargin)
      % LOCALCOORDINATES usage: localCoordinates(Cal3_S2 c) : returns Vector
      % Doxygen can be found at http://research.cc.gatech.edu/borg/sites/edu.borg/html/index.html
      if length(varargin) == 1 && isa(varargin{1},'gtsam.Cal3_S2')
        varargout{1} = gtsam_wrapper(317, this, varargin{:});
      else
        error('Arguments do not match any overload of function gtsam.Cal3_S2.localCoordinates');
      end
    end

    function varargout = matrix(this, varargin)
      % MATRIX usage: matrix() : returns Matrix
      % Doxygen can be found at http://research.cc.gatech.edu/borg/sites/edu.borg/html/index.html
      varargout{1} = gtsam_wrapper(318, this, varargin{:});
    end

    function varargout = matrix_inverse(this, varargin)
      % MATRIX_INVERSE usage: matrix_inverse() : returns Matrix
      % Doxygen can be found at http://research.cc.gatech.edu/borg/sites/edu.borg/html/index.html
      varargout{1} = gtsam_wrapper(319, this, varargin{:});
    end

    function varargout = principalPoint(this, varargin)
      % PRINCIPALPOINT usage: principalPoint() : returns gtsam::Point2
      % Doxygen can be found at http://research.cc.gatech.edu/borg/sites/edu.borg/html/index.html
      varargout{1} = gtsam_wrapper(320, this, varargin{:});
    end

    function varargout = print(this, varargin)
      % PRINT usage: print(string s) : returns void
      % Doxygen can be found at http://research.cc.gatech.edu/borg/sites/edu.borg/html/index.html
      if length(varargin) == 1 && isa(varargin{1},'char')
        gtsam_wrapper(321, this, varargin{:});
      else
        error('Arguments do not match any overload of function gtsam.Cal3_S2.print');
      end
    end

    function varargout = px(this, varargin)
      % PX usage: px() : returns double
      % Doxygen can be found at http://research.cc.gatech.edu/borg/sites/edu.borg/html/index.html
      varargout{1} = gtsam_wrapper(322, this, varargin{:});
    end

    function varargout = py(this, varargin)
      % PY usage: py() : returns double
      % Doxygen can be found at http://research.cc.gatech.edu/borg/sites/edu.borg/html/index.html
      varargout{1} = gtsam_wrapper(323, this, varargin{:});
    end

    function varargout = retract(this, varargin)
      % RETRACT usage: retract(Vector v) : returns gtsam::Cal3_S2
      % Doxygen can be found at http://research.cc.gatech.edu/borg/sites/edu.borg/html/index.html
      if length(varargin) == 1 && isa(varargin{1},'double')
        varargout{1} = gtsam_wrapper(324, this, varargin{:});
      else
        error('Arguments do not match any overload of function gtsam.Cal3_S2.retract');
      end
    end

    function varargout = skew(this, varargin)
      % SKEW usage: skew() : returns double
      % Doxygen can be found at http://research.cc.gatech.edu/borg/sites/edu.borg/html/index.html
      varargout{1} = gtsam_wrapper(325, this, varargin{:});
    end

    function varargout = uncalibrate(this, varargin)
      % UNCALIBRATE usage: uncalibrate(Point2 p) : returns gtsam::Point2
      % Doxygen can be found at http://research.cc.gatech.edu/borg/sites/edu.borg/html/index.html
      if length(varargin) == 1 && isa(varargin{1},'gtsam.Point2')
        varargout{1} = gtsam_wrapper(326, this, varargin{:});
      else
        error('Arguments do not match any overload of function gtsam.Cal3_S2.uncalibrate');
      end
    end

    function varargout = vector(this, varargin)
      % VECTOR usage: vector() : returns Vector
      % Doxygen can be found at http://research.cc.gatech.edu/borg/sites/edu.borg/html/index.html
      varargout{1} = gtsam_wrapper(327, this, varargin{:});
    end

    function varargout = string_serialize(this, varargin)
      % STRING_SERIALIZE usage: string_serialize() : returns string
      % Doxygen can be found at http://research.cc.gatech.edu/borg/sites/edu.borg/html/index.html
      if length(varargin) == 0
        varargout{1} = gtsam_wrapper(328, this, varargin{:});
      else
        error('Arguments do not match any overload of function gtsam.Cal3_S2.string_serialize');
      end
    end

    function sobj = saveobj(obj)
      % SAVEOBJ Saves the object to a matlab-readable format
      sobj = obj.string_serialize();
    end
  end

  methods(Static = true)
    function varargout = Dim(varargin)
      % DIM usage: Dim() : returns size_t
      % Doxygen can be found at http://research.cc.gatech.edu/borg/sites/edu.borg/html/index.html
      % 
      % Usage
      % DIM()
      if length(varargin) == 0
        varargout{1} = gtsam_wrapper(329, varargin{:});
      else
        error('Arguments do not match any overload of function gtsam.Cal3_S2.Dim');
      end
    end

    function varargout = string_deserialize(varargin)
      % STRING_DESERIALIZE usage: string_deserialize() : returns gtsam.Cal3_S2
      % Doxygen can be found at http://research.cc.gatech.edu/borg/sites/edu.borg/html/index.html
      if length(varargin) == 1
        varargout{1} = gtsam_wrapper(330, varargin{:});
      else
        error('Arguments do not match any overload of function gtsam.Cal3_S2.string_deserialize');
      end
    end

    function obj = loadobj(sobj)
      % LOADOBJ Saves the object to a matlab-readable format
      obj = gtsam.Cal3_S2.string_deserialize(sobj);
    end
  end
end
