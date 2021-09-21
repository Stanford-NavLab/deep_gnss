%class AHRS, see Doxygen page for details
%at http://research.cc.gatech.edu/borg/sites/edu.borg/html/index.html
%
%-------Constructors-------
%AHRS(Matrix U, Matrix F, double g_e)
%
%-------Methods-------
%aid(Mechanization_bRn2 mech, GaussianDensity state, Vector f, bool Farrel) : returns pair< gtsam::Mechanization_bRn2, SharedGaussianDensity >
%aidGeneral(Mechanization_bRn2 mech, GaussianDensity state, Vector f, Vector f_expected, Rot3 increment) : returns pair< gtsam::Mechanization_bRn2, SharedGaussianDensity >
%initialize(double g_e) : returns pair< gtsam::Mechanization_bRn2, SharedGaussianDensity >
%integrate(Mechanization_bRn2 mech, GaussianDensity state, Vector u, double dt) : returns pair< gtsam::Mechanization_bRn2, SharedGaussianDensity >
%print(string s) : returns void
%
classdef AHRS < handle
  properties
    ptr_gtsamAHRS = 0
  end
  methods
    function obj = AHRS(varargin)
      if nargin == 2 && isa(varargin{1}, 'uint64') && varargin{1} == uint64(5139824614673773682)
        my_ptr = varargin{2};
        gtsam_unstable_wrapper(339, my_ptr);
      elseif nargin == 3 && isa(varargin{1},'double') && isa(varargin{2},'double') && isa(varargin{3},'double')
        my_ptr = gtsam_unstable_wrapper(340, varargin{1}, varargin{2}, varargin{3});
      else
        error('Arguments do not match any overload of gtsam.AHRS constructor');
      end
      obj.ptr_gtsamAHRS = my_ptr;
    end

    function delete(obj)
      gtsam_unstable_wrapper(341, obj.ptr_gtsamAHRS);
    end

    function display(obj), obj.print(''); end
    %DISPLAY Calls print on the object
    function disp(obj), obj.display; end
    %DISP Calls print on the object
    function varargout = aid(this, varargin)
      % AID usage: aid(Mechanization_bRn2 mech, GaussianDensity state, Vector f, bool Farrel) : returns pair< gtsam::Mechanization_bRn2, SharedGaussianDensity >
      % Doxygen can be found at http://research.cc.gatech.edu/borg/sites/edu.borg/html/index.html
      if length(varargin) == 4 && isa(varargin{1},'gtsam.Mechanization_bRn2') && isa(varargin{2},'gtsam.GaussianDensity') && isa(varargin{3},'double') && isa(varargin{4},'logical')
        [ varargout{1} varargout{2} ] = gtsam_unstable_wrapper(342, this, varargin{:});
      else
        error('Arguments do not match any overload of function gtsam.AHRS.aid');
      end
    end

    function varargout = aidGeneral(this, varargin)
      % AIDGENERAL usage: aidGeneral(Mechanization_bRn2 mech, GaussianDensity state, Vector f, Vector f_expected, Rot3 increment) : returns pair< gtsam::Mechanization_bRn2, SharedGaussianDensity >
      % Doxygen can be found at http://research.cc.gatech.edu/borg/sites/edu.borg/html/index.html
      if length(varargin) == 5 && isa(varargin{1},'gtsam.Mechanization_bRn2') && isa(varargin{2},'gtsam.GaussianDensity') && isa(varargin{3},'double') && isa(varargin{4},'double') && isa(varargin{5},'gtsam.Rot3')
        [ varargout{1} varargout{2} ] = gtsam_unstable_wrapper(343, this, varargin{:});
      else
        error('Arguments do not match any overload of function gtsam.AHRS.aidGeneral');
      end
    end

    function varargout = initialize(this, varargin)
      % INITIALIZE usage: initialize(double g_e) : returns pair< gtsam::Mechanization_bRn2, SharedGaussianDensity >
      % Doxygen can be found at http://research.cc.gatech.edu/borg/sites/edu.borg/html/index.html
      [ varargout{1} varargout{2} ] = gtsam_unstable_wrapper(344, this, varargin{:});
    end

    function varargout = integrate(this, varargin)
      % INTEGRATE usage: integrate(Mechanization_bRn2 mech, GaussianDensity state, Vector u, double dt) : returns pair< gtsam::Mechanization_bRn2, SharedGaussianDensity >
      % Doxygen can be found at http://research.cc.gatech.edu/borg/sites/edu.borg/html/index.html
      if length(varargin) == 4 && isa(varargin{1},'gtsam.Mechanization_bRn2') && isa(varargin{2},'gtsam.GaussianDensity') && isa(varargin{3},'double') && isa(varargin{4},'double')
        [ varargout{1} varargout{2} ] = gtsam_unstable_wrapper(345, this, varargin{:});
      else
        error('Arguments do not match any overload of function gtsam.AHRS.integrate');
      end
    end

    function varargout = print(this, varargin)
      % PRINT usage: print(string s) : returns void
      % Doxygen can be found at http://research.cc.gatech.edu/borg/sites/edu.borg/html/index.html
      if length(varargin) == 1 && isa(varargin{1},'char')
        gtsam_unstable_wrapper(346, this, varargin{:});
      else
        error('Arguments do not match any overload of function gtsam.AHRS.print');
      end
    end

  end

  methods(Static = true)
  end
end
