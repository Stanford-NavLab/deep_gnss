%class BearingS2, see Doxygen page for details
%at http://research.cc.gatech.edu/borg/sites/edu.borg/html/index.html
%
%-------Constructors-------
%BearingS2()
%BearingS2(double azimuth, double elevation)
%BearingS2(Rot2 azimuth, Rot2 elevation)
%
%-------Methods-------
%azimuth() : returns gtsam::Rot2
%dim() : returns size_t
%elevation() : returns gtsam::Rot2
%equals(BearingS2 x, double tol) : returns bool
%localCoordinates(BearingS2 p2) : returns Vector
%print(string s) : returns void
%retract(Vector v) : returns gtsam::BearingS2
%
%-------Static Methods-------
%fromDownwardsObservation(Pose3 A, Point3 B) : returns gtsam::BearingS2
%fromForwardObservation(Pose3 A, Point3 B) : returns gtsam::BearingS2
%
classdef BearingS2 < gtsam.Value
  properties
    ptr_gtsamBearingS2 = 0
  end
  methods
    function obj = BearingS2(varargin)
      if (nargin == 2 || (nargin == 3 && strcmp(varargin{3}, 'void'))) && isa(varargin{1}, 'uint64') && varargin{1} == uint64(5139824614673773682)
        if nargin == 2
          my_ptr = varargin{2};
        else
          my_ptr = gtsam_unstable_wrapper(71, varargin{2});
        end
        base_ptr = gtsam_unstable_wrapper(70, my_ptr);
      elseif nargin == 0
        [ my_ptr, base_ptr ] = gtsam_unstable_wrapper(72);
      elseif nargin == 2 && isa(varargin{1},'double') && isa(varargin{2},'double')
        [ my_ptr, base_ptr ] = gtsam_unstable_wrapper(73, varargin{1}, varargin{2});
      elseif nargin == 2 && isa(varargin{1},'gtsam.Rot2') && isa(varargin{2},'gtsam.Rot2')
        [ my_ptr, base_ptr ] = gtsam_unstable_wrapper(74, varargin{1}, varargin{2});
      else
        error('Arguments do not match any overload of gtsam.BearingS2 constructor');
      end
      obj = obj@gtsam.Value(uint64(5139824614673773682), base_ptr);
      obj.ptr_gtsamBearingS2 = my_ptr;
    end

    function delete(obj)
      gtsam_unstable_wrapper(75, obj.ptr_gtsamBearingS2);
    end

    function display(obj), obj.print(''); end
    %DISPLAY Calls print on the object
    function disp(obj), obj.display; end
    %DISP Calls print on the object
    function varargout = azimuth(this, varargin)
      % AZIMUTH usage: azimuth() : returns gtsam::Rot2
      % Doxygen can be found at http://research.cc.gatech.edu/borg/sites/edu.borg/html/index.html
      varargout{1} = gtsam_unstable_wrapper(76, this, varargin{:});
    end

    function varargout = dim(this, varargin)
      % DIM usage: dim() : returns size_t
      % Doxygen can be found at http://research.cc.gatech.edu/borg/sites/edu.borg/html/index.html
      varargout{1} = gtsam_unstable_wrapper(77, this, varargin{:});
    end

    function varargout = elevation(this, varargin)
      % ELEVATION usage: elevation() : returns gtsam::Rot2
      % Doxygen can be found at http://research.cc.gatech.edu/borg/sites/edu.borg/html/index.html
      varargout{1} = gtsam_unstable_wrapper(78, this, varargin{:});
    end

    function varargout = equals(this, varargin)
      % EQUALS usage: equals(BearingS2 x, double tol) : returns bool
      % Doxygen can be found at http://research.cc.gatech.edu/borg/sites/edu.borg/html/index.html
      if length(varargin) == 2 && isa(varargin{1},'gtsam.BearingS2') && isa(varargin{2},'double')
        varargout{1} = gtsam_unstable_wrapper(79, this, varargin{:});
      else
        error('Arguments do not match any overload of function gtsam.BearingS2.equals');
      end
    end

    function varargout = localCoordinates(this, varargin)
      % LOCALCOORDINATES usage: localCoordinates(BearingS2 p2) : returns Vector
      % Doxygen can be found at http://research.cc.gatech.edu/borg/sites/edu.borg/html/index.html
      if length(varargin) == 1 && isa(varargin{1},'gtsam.BearingS2')
        varargout{1} = gtsam_unstable_wrapper(80, this, varargin{:});
      else
        error('Arguments do not match any overload of function gtsam.BearingS2.localCoordinates');
      end
    end

    function varargout = print(this, varargin)
      % PRINT usage: print(string s) : returns void
      % Doxygen can be found at http://research.cc.gatech.edu/borg/sites/edu.borg/html/index.html
      if length(varargin) == 1 && isa(varargin{1},'char')
        gtsam_unstable_wrapper(81, this, varargin{:});
      else
        error('Arguments do not match any overload of function gtsam.BearingS2.print');
      end
    end

    function varargout = retract(this, varargin)
      % RETRACT usage: retract(Vector v) : returns gtsam::BearingS2
      % Doxygen can be found at http://research.cc.gatech.edu/borg/sites/edu.borg/html/index.html
      if length(varargin) == 1 && isa(varargin{1},'double')
        varargout{1} = gtsam_unstable_wrapper(82, this, varargin{:});
      else
        error('Arguments do not match any overload of function gtsam.BearingS2.retract');
      end
    end

  end

  methods(Static = true)
    function varargout = FromDownwardsObservation(varargin)
      % FROMDOWNWARDSOBSERVATION usage: fromDownwardsObservation(Pose3 A, Point3 B) : returns gtsam::BearingS2
      % Doxygen can be found at http://research.cc.gatech.edu/borg/sites/edu.borg/html/index.html
      % 
      % Usage
      % FROMDOWNWARDSOBSERVATION(Pose3 A, Point3 B)
      if length(varargin) == 2 && isa(varargin{1},'gtsam.Pose3') && isa(varargin{2},'gtsam.Point3')
        varargout{1} = gtsam_unstable_wrapper(83, varargin{:});
      else
        error('Arguments do not match any overload of function gtsam.BearingS2.FromDownwardsObservation');
      end
    end

    function varargout = FromForwardObservation(varargin)
      % FROMFORWARDOBSERVATION usage: fromForwardObservation(Pose3 A, Point3 B) : returns gtsam::BearingS2
      % Doxygen can be found at http://research.cc.gatech.edu/borg/sites/edu.borg/html/index.html
      % 
      % Usage
      % FROMFORWARDOBSERVATION(Pose3 A, Point3 B)
      if length(varargin) == 2 && isa(varargin{1},'gtsam.Pose3') && isa(varargin{2},'gtsam.Point3')
        varargout{1} = gtsam_unstable_wrapper(84, varargin{:});
      else
        error('Arguments do not match any overload of function gtsam.BearingS2.FromForwardObservation');
      end
    end

  end
end
