%class Rot2, see Doxygen page for details
%at http://research.cc.gatech.edu/borg/sites/edu.borg/html/index.html
%
%-------Constructors-------
%Rot2()
%Rot2(double theta)
%
%-------Methods-------
%between(Rot2 p2) : returns gtsam::Rot2
%c() : returns double
%compose(Rot2 p2) : returns gtsam::Rot2
%degrees() : returns double
%dim() : returns size_t
%equals(Rot2 rot, double tol) : returns bool
%inverse() : returns gtsam::Rot2
%localCoordinates(Rot2 p) : returns Vector
%matrix() : returns Matrix
%print(string s) : returns void
%retract(Vector v) : returns gtsam::Rot2
%rotate(Point2 point) : returns gtsam::Point2
%s() : returns double
%theta() : returns double
%unrotate(Point2 point) : returns gtsam::Point2
%
%-------Static Methods-------
%Dim() : returns size_t
%Expmap(Vector v) : returns gtsam::Rot2
%Logmap(Rot2 p) : returns Vector
%atan2(double y, double x) : returns gtsam::Rot2
%fromAngle(double theta) : returns gtsam::Rot2
%fromCosSin(double c, double s) : returns gtsam::Rot2
%fromDegrees(double theta) : returns gtsam::Rot2
%identity() : returns gtsam::Rot2
%relativeBearing(Point2 d) : returns gtsam::Rot2
%
%-------Serialization Interface-------
%string_serialize() : returns string
%string_deserialize(string serialized) : returns Rot2
%
classdef Rot2 < gtsam.Value
  properties
    ptr_gtsamRot2 = 0
  end
  methods
    function obj = Rot2(varargin)
      if (nargin == 2 || (nargin == 3 && strcmp(varargin{3}, 'void'))) && isa(varargin{1}, 'uint64') && varargin{1} == uint64(5139824614673773682)
        if nargin == 2
          my_ptr = varargin{2};
        else
          my_ptr = gtsam_wrapper(133, varargin{2});
        end
        base_ptr = gtsam_wrapper(132, my_ptr);
      elseif nargin == 0
        [ my_ptr, base_ptr ] = gtsam_wrapper(134);
      elseif nargin == 1 && isa(varargin{1},'double')
        [ my_ptr, base_ptr ] = gtsam_wrapper(135, varargin{1});
      else
        error('Arguments do not match any overload of gtsam.Rot2 constructor');
      end
      obj = obj@gtsam.Value(uint64(5139824614673773682), base_ptr);
      obj.ptr_gtsamRot2 = my_ptr;
    end

    function delete(obj)
      gtsam_wrapper(136, obj.ptr_gtsamRot2);
    end

    function display(obj), obj.print(''); end
    %DISPLAY Calls print on the object
    function disp(obj), obj.display; end
    %DISP Calls print on the object
    function varargout = between(this, varargin)
      % BETWEEN usage: between(Rot2 p2) : returns gtsam::Rot2
      % Doxygen can be found at http://research.cc.gatech.edu/borg/sites/edu.borg/html/index.html
      if length(varargin) == 1 && isa(varargin{1},'gtsam.Rot2')
        varargout{1} = gtsam_wrapper(137, this, varargin{:});
      else
        error('Arguments do not match any overload of function gtsam.Rot2.between');
      end
    end

    function varargout = c(this, varargin)
      % C usage: c() : returns double
      % Doxygen can be found at http://research.cc.gatech.edu/borg/sites/edu.borg/html/index.html
      varargout{1} = gtsam_wrapper(138, this, varargin{:});
    end

    function varargout = compose(this, varargin)
      % COMPOSE usage: compose(Rot2 p2) : returns gtsam::Rot2
      % Doxygen can be found at http://research.cc.gatech.edu/borg/sites/edu.borg/html/index.html
      if length(varargin) == 1 && isa(varargin{1},'gtsam.Rot2')
        varargout{1} = gtsam_wrapper(139, this, varargin{:});
      else
        error('Arguments do not match any overload of function gtsam.Rot2.compose');
      end
    end

    function varargout = degrees(this, varargin)
      % DEGREES usage: degrees() : returns double
      % Doxygen can be found at http://research.cc.gatech.edu/borg/sites/edu.borg/html/index.html
      varargout{1} = gtsam_wrapper(140, this, varargin{:});
    end

    function varargout = dim(this, varargin)
      % DIM usage: dim() : returns size_t
      % Doxygen can be found at http://research.cc.gatech.edu/borg/sites/edu.borg/html/index.html
      varargout{1} = gtsam_wrapper(141, this, varargin{:});
    end

    function varargout = equals(this, varargin)
      % EQUALS usage: equals(Rot2 rot, double tol) : returns bool
      % Doxygen can be found at http://research.cc.gatech.edu/borg/sites/edu.borg/html/index.html
      if length(varargin) == 2 && isa(varargin{1},'gtsam.Rot2') && isa(varargin{2},'double')
        varargout{1} = gtsam_wrapper(142, this, varargin{:});
      else
        error('Arguments do not match any overload of function gtsam.Rot2.equals');
      end
    end

    function varargout = inverse(this, varargin)
      % INVERSE usage: inverse() : returns gtsam::Rot2
      % Doxygen can be found at http://research.cc.gatech.edu/borg/sites/edu.borg/html/index.html
      varargout{1} = gtsam_wrapper(143, this, varargin{:});
    end

    function varargout = localCoordinates(this, varargin)
      % LOCALCOORDINATES usage: localCoordinates(Rot2 p) : returns Vector
      % Doxygen can be found at http://research.cc.gatech.edu/borg/sites/edu.borg/html/index.html
      if length(varargin) == 1 && isa(varargin{1},'gtsam.Rot2')
        varargout{1} = gtsam_wrapper(144, this, varargin{:});
      else
        error('Arguments do not match any overload of function gtsam.Rot2.localCoordinates');
      end
    end

    function varargout = matrix(this, varargin)
      % MATRIX usage: matrix() : returns Matrix
      % Doxygen can be found at http://research.cc.gatech.edu/borg/sites/edu.borg/html/index.html
      varargout{1} = gtsam_wrapper(145, this, varargin{:});
    end

    function varargout = print(this, varargin)
      % PRINT usage: print(string s) : returns void
      % Doxygen can be found at http://research.cc.gatech.edu/borg/sites/edu.borg/html/index.html
      if length(varargin) == 1 && isa(varargin{1},'char')
        gtsam_wrapper(146, this, varargin{:});
      else
        error('Arguments do not match any overload of function gtsam.Rot2.print');
      end
    end

    function varargout = retract(this, varargin)
      % RETRACT usage: retract(Vector v) : returns gtsam::Rot2
      % Doxygen can be found at http://research.cc.gatech.edu/borg/sites/edu.borg/html/index.html
      if length(varargin) == 1 && isa(varargin{1},'double')
        varargout{1} = gtsam_wrapper(147, this, varargin{:});
      else
        error('Arguments do not match any overload of function gtsam.Rot2.retract');
      end
    end

    function varargout = rotate(this, varargin)
      % ROTATE usage: rotate(Point2 point) : returns gtsam::Point2
      % Doxygen can be found at http://research.cc.gatech.edu/borg/sites/edu.borg/html/index.html
      if length(varargin) == 1 && isa(varargin{1},'gtsam.Point2')
        varargout{1} = gtsam_wrapper(148, this, varargin{:});
      else
        error('Arguments do not match any overload of function gtsam.Rot2.rotate');
      end
    end

    function varargout = s(this, varargin)
      % S usage: s() : returns double
      % Doxygen can be found at http://research.cc.gatech.edu/borg/sites/edu.borg/html/index.html
      varargout{1} = gtsam_wrapper(149, this, varargin{:});
    end

    function varargout = theta(this, varargin)
      % THETA usage: theta() : returns double
      % Doxygen can be found at http://research.cc.gatech.edu/borg/sites/edu.borg/html/index.html
      varargout{1} = gtsam_wrapper(150, this, varargin{:});
    end

    function varargout = unrotate(this, varargin)
      % UNROTATE usage: unrotate(Point2 point) : returns gtsam::Point2
      % Doxygen can be found at http://research.cc.gatech.edu/borg/sites/edu.borg/html/index.html
      if length(varargin) == 1 && isa(varargin{1},'gtsam.Point2')
        varargout{1} = gtsam_wrapper(151, this, varargin{:});
      else
        error('Arguments do not match any overload of function gtsam.Rot2.unrotate');
      end
    end

    function varargout = string_serialize(this, varargin)
      % STRING_SERIALIZE usage: string_serialize() : returns string
      % Doxygen can be found at http://research.cc.gatech.edu/borg/sites/edu.borg/html/index.html
      if length(varargin) == 0
        varargout{1} = gtsam_wrapper(152, this, varargin{:});
      else
        error('Arguments do not match any overload of function gtsam.Rot2.string_serialize');
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
        varargout{1} = gtsam_wrapper(153, varargin{:});
      else
        error('Arguments do not match any overload of function gtsam.Rot2.Dim');
      end
    end

    function varargout = Expmap(varargin)
      % EXPMAP usage: Expmap(Vector v) : returns gtsam::Rot2
      % Doxygen can be found at http://research.cc.gatech.edu/borg/sites/edu.borg/html/index.html
      % 
      % Usage
      % EXPMAP(Vector v)
      if length(varargin) == 1 && isa(varargin{1},'double')
        varargout{1} = gtsam_wrapper(154, varargin{:});
      else
        error('Arguments do not match any overload of function gtsam.Rot2.Expmap');
      end
    end

    function varargout = Logmap(varargin)
      % LOGMAP usage: Logmap(Rot2 p) : returns Vector
      % Doxygen can be found at http://research.cc.gatech.edu/borg/sites/edu.borg/html/index.html
      % 
      % Usage
      % LOGMAP(Rot2 p)
      if length(varargin) == 1 && isa(varargin{1},'gtsam.Rot2')
        varargout{1} = gtsam_wrapper(155, varargin{:});
      else
        error('Arguments do not match any overload of function gtsam.Rot2.Logmap');
      end
    end

    function varargout = Atan2(varargin)
      % ATAN2 usage: atan2(double y, double x) : returns gtsam::Rot2
      % Doxygen can be found at http://research.cc.gatech.edu/borg/sites/edu.borg/html/index.html
      % 
      % Usage
      % ATAN2(double y, double x)
      if length(varargin) == 2 && isa(varargin{1},'double') && isa(varargin{2},'double')
        varargout{1} = gtsam_wrapper(156, varargin{:});
      else
        error('Arguments do not match any overload of function gtsam.Rot2.Atan2');
      end
    end

    function varargout = FromAngle(varargin)
      % FROMANGLE usage: fromAngle(double theta) : returns gtsam::Rot2
      % Doxygen can be found at http://research.cc.gatech.edu/borg/sites/edu.borg/html/index.html
      % 
      % Usage
      % FROMANGLE(double theta)
      if length(varargin) == 1 && isa(varargin{1},'double')
        varargout{1} = gtsam_wrapper(157, varargin{:});
      else
        error('Arguments do not match any overload of function gtsam.Rot2.FromAngle');
      end
    end

    function varargout = FromCosSin(varargin)
      % FROMCOSSIN usage: fromCosSin(double c, double s) : returns gtsam::Rot2
      % Doxygen can be found at http://research.cc.gatech.edu/borg/sites/edu.borg/html/index.html
      % 
      % Usage
      % FROMCOSSIN(double c, double s)
      if length(varargin) == 2 && isa(varargin{1},'double') && isa(varargin{2},'double')
        varargout{1} = gtsam_wrapper(158, varargin{:});
      else
        error('Arguments do not match any overload of function gtsam.Rot2.FromCosSin');
      end
    end

    function varargout = FromDegrees(varargin)
      % FROMDEGREES usage: fromDegrees(double theta) : returns gtsam::Rot2
      % Doxygen can be found at http://research.cc.gatech.edu/borg/sites/edu.borg/html/index.html
      % 
      % Usage
      % FROMDEGREES(double theta)
      if length(varargin) == 1 && isa(varargin{1},'double')
        varargout{1} = gtsam_wrapper(159, varargin{:});
      else
        error('Arguments do not match any overload of function gtsam.Rot2.FromDegrees');
      end
    end

    function varargout = Identity(varargin)
      % IDENTITY usage: identity() : returns gtsam::Rot2
      % Doxygen can be found at http://research.cc.gatech.edu/borg/sites/edu.borg/html/index.html
      % 
      % Usage
      % IDENTITY()
      if length(varargin) == 0
        varargout{1} = gtsam_wrapper(160, varargin{:});
      else
        error('Arguments do not match any overload of function gtsam.Rot2.Identity');
      end
    end

    function varargout = RelativeBearing(varargin)
      % RELATIVEBEARING usage: relativeBearing(Point2 d) : returns gtsam::Rot2
      % Doxygen can be found at http://research.cc.gatech.edu/borg/sites/edu.borg/html/index.html
      % 
      % Usage
      % RELATIVEBEARING(Point2 d)
      if length(varargin) == 1 && isa(varargin{1},'gtsam.Point2')
        varargout{1} = gtsam_wrapper(161, varargin{:});
      else
        error('Arguments do not match any overload of function gtsam.Rot2.RelativeBearing');
      end
    end

    function varargout = string_deserialize(varargin)
      % STRING_DESERIALIZE usage: string_deserialize() : returns gtsam.Rot2
      % Doxygen can be found at http://research.cc.gatech.edu/borg/sites/edu.borg/html/index.html
      if length(varargin) == 1
        varargout{1} = gtsam_wrapper(162, varargin{:});
      else
        error('Arguments do not match any overload of function gtsam.Rot2.string_deserialize');
      end
    end

    function obj = loadobj(sobj)
      % LOADOBJ Saves the object to a matlab-readable format
      obj = gtsam.Rot2.string_deserialize(sobj);
    end
  end
end
