%class ImuFactorPreintegratedMeasurements, see Doxygen page for details
%at http://research.cc.gatech.edu/borg/sites/edu.borg/html/index.html
%
%-------Constructors-------
%ImuFactorPreintegratedMeasurements(ConstantBias bias, Matrix measuredAccCovariance, Matrix measuredOmegaCovariance, Matrix integrationErrorCovariance, bool use2ndOrderIntegration)
%ImuFactorPreintegratedMeasurements(ConstantBias bias, Matrix measuredAccCovariance, Matrix measuredOmegaCovariance, Matrix integrationErrorCovariance)
%ImuFactorPreintegratedMeasurements(ImuFactorPreintegratedMeasurements rhs)
%
%-------Methods-------
%equals(ImuFactorPreintegratedMeasurements expected, double tol) : returns bool
%integrateMeasurement(Vector measuredAcc, Vector measuredOmega, double deltaT) : returns void
%integrateMeasurement(Vector measuredAcc, Vector measuredOmega, double deltaT, Pose3 body_P_sensor) : returns void
%print(string s) : returns void
%
classdef ImuFactorPreintegratedMeasurements < handle
  properties
    ptr_gtsamImuFactorPreintegratedMeasurements = 0
  end
  methods
    function obj = ImuFactorPreintegratedMeasurements(varargin)
      if nargin == 2 && isa(varargin{1}, 'uint64') && varargin{1} == uint64(5139824614673773682)
        my_ptr = varargin{2};
        gtsam_wrapper(2100, my_ptr);
      elseif nargin == 5 && isa(varargin{1},'gtsam.imuBias.ConstantBias') && isa(varargin{2},'double') && isa(varargin{3},'double') && isa(varargin{4},'double') && isa(varargin{5},'logical')
        my_ptr = gtsam_wrapper(2101, varargin{1}, varargin{2}, varargin{3}, varargin{4}, varargin{5});
      elseif nargin == 4 && isa(varargin{1},'gtsam.imuBias.ConstantBias') && isa(varargin{2},'double') && isa(varargin{3},'double') && isa(varargin{4},'double')
        my_ptr = gtsam_wrapper(2102, varargin{1}, varargin{2}, varargin{3}, varargin{4});
      elseif nargin == 1 && isa(varargin{1},'gtsam.ImuFactorPreintegratedMeasurements')
        my_ptr = gtsam_wrapper(2103, varargin{1});
      else
        error('Arguments do not match any overload of gtsam.ImuFactorPreintegratedMeasurements constructor');
      end
      obj.ptr_gtsamImuFactorPreintegratedMeasurements = my_ptr;
    end

    function delete(obj)
      gtsam_wrapper(2104, obj.ptr_gtsamImuFactorPreintegratedMeasurements);
    end

    function display(obj), obj.print(''); end
    %DISPLAY Calls print on the object
    function disp(obj), obj.display; end
    %DISP Calls print on the object
    function varargout = equals(this, varargin)
      % EQUALS usage: equals(ImuFactorPreintegratedMeasurements expected, double tol) : returns bool
      % Doxygen can be found at http://research.cc.gatech.edu/borg/sites/edu.borg/html/index.html
      if length(varargin) == 2 && isa(varargin{1},'gtsam.ImuFactorPreintegratedMeasurements') && isa(varargin{2},'double')
        varargout{1} = gtsam_wrapper(2105, this, varargin{:});
      else
        error('Arguments do not match any overload of function gtsam.ImuFactorPreintegratedMeasurements.equals');
      end
    end

    function varargout = integrateMeasurement(this, varargin)
      % INTEGRATEMEASUREMENT usage: integrateMeasurement(Vector measuredAcc, Vector measuredOmega, double deltaT), integrateMeasurement(Vector measuredAcc, Vector measuredOmega, double deltaT, Pose3 body_P_sensor) : returns void
      % Doxygen can be found at http://research.cc.gatech.edu/borg/sites/edu.borg/html/index.html
      % 
      % Method Overloads
      % integrateMeasurement(Vector measuredAcc, Vector measuredOmega, double deltaT)
      % integrateMeasurement(Vector measuredAcc, Vector measuredOmega, double deltaT, Pose3 body_P_sensor)
      if length(varargin) == 3 && isa(varargin{1},'double') && isa(varargin{2},'double') && isa(varargin{3},'double')
        gtsam_wrapper(2106, this, varargin{:});
      elseif length(varargin) == 4 && isa(varargin{1},'double') && isa(varargin{2},'double') && isa(varargin{3},'double') && isa(varargin{4},'gtsam.Pose3')
        gtsam_wrapper(2107, this, varargin{:});
      else
        error('Arguments do not match any overload of function gtsam.ImuFactorPreintegratedMeasurements.integrateMeasurement');
      end
    end

    function varargout = print(this, varargin)
      % PRINT usage: print(string s) : returns void
      % Doxygen can be found at http://research.cc.gatech.edu/borg/sites/edu.borg/html/index.html
      if length(varargin) == 1 && isa(varargin{1},'char')
        gtsam_wrapper(2108, this, varargin{:});
      else
        error('Arguments do not match any overload of function gtsam.ImuFactorPreintegratedMeasurements.print');
      end
    end

  end

  methods(Static = true)
  end
end
