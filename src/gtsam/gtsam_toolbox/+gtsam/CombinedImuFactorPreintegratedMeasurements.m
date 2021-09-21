%class CombinedImuFactorPreintegratedMeasurements, see Doxygen page for details
%at http://research.cc.gatech.edu/borg/sites/edu.borg/html/index.html
%
%-------Constructors-------
%CombinedImuFactorPreintegratedMeasurements(ConstantBias bias, Matrix measuredAccCovariance, Matrix measuredOmegaCovariance, Matrix integrationErrorCovariance, Matrix biasAccCovariance, Matrix biasOmegaCovariance, Matrix biasAccOmegaInit)
%CombinedImuFactorPreintegratedMeasurements(ConstantBias bias, Matrix measuredAccCovariance, Matrix measuredOmegaCovariance, Matrix integrationErrorCovariance, Matrix biasAccCovariance, Matrix biasOmegaCovariance, Matrix biasAccOmegaInit, bool use2ndOrderIntegration)
%CombinedImuFactorPreintegratedMeasurements(CombinedImuFactorPreintegratedMeasurements rhs)
%
%-------Methods-------
%equals(CombinedImuFactorPreintegratedMeasurements expected, double tol) : returns bool
%integrateMeasurement(Vector measuredAcc, Vector measuredOmega, double deltaT) : returns void
%integrateMeasurement(Vector measuredAcc, Vector measuredOmega, double deltaT, Pose3 body_P_sensor) : returns void
%print(string s) : returns void
%
classdef CombinedImuFactorPreintegratedMeasurements < handle
  properties
    ptr_gtsamCombinedImuFactorPreintegratedMeasurements = 0
  end
  methods
    function obj = CombinedImuFactorPreintegratedMeasurements(varargin)
      if nargin == 2 && isa(varargin{1}, 'uint64') && varargin{1} == uint64(5139824614673773682)
        my_ptr = varargin{2};
        gtsam_wrapper(2126, my_ptr);
      elseif nargin == 7 && isa(varargin{1},'gtsam.imuBias.ConstantBias') && isa(varargin{2},'double') && isa(varargin{3},'double') && isa(varargin{4},'double') && isa(varargin{5},'double') && isa(varargin{6},'double') && isa(varargin{7},'double')
        my_ptr = gtsam_wrapper(2127, varargin{1}, varargin{2}, varargin{3}, varargin{4}, varargin{5}, varargin{6}, varargin{7});
      elseif nargin == 8 && isa(varargin{1},'gtsam.imuBias.ConstantBias') && isa(varargin{2},'double') && isa(varargin{3},'double') && isa(varargin{4},'double') && isa(varargin{5},'double') && isa(varargin{6},'double') && isa(varargin{7},'double') && isa(varargin{8},'logical')
        my_ptr = gtsam_wrapper(2128, varargin{1}, varargin{2}, varargin{3}, varargin{4}, varargin{5}, varargin{6}, varargin{7}, varargin{8});
      elseif nargin == 1 && isa(varargin{1},'gtsam.CombinedImuFactorPreintegratedMeasurements')
        my_ptr = gtsam_wrapper(2129, varargin{1});
      else
        error('Arguments do not match any overload of gtsam.CombinedImuFactorPreintegratedMeasurements constructor');
      end
      obj.ptr_gtsamCombinedImuFactorPreintegratedMeasurements = my_ptr;
    end

    function delete(obj)
      gtsam_wrapper(2130, obj.ptr_gtsamCombinedImuFactorPreintegratedMeasurements);
    end

    function display(obj), obj.print(''); end
    %DISPLAY Calls print on the object
    function disp(obj), obj.display; end
    %DISP Calls print on the object
    function varargout = equals(this, varargin)
      % EQUALS usage: equals(CombinedImuFactorPreintegratedMeasurements expected, double tol) : returns bool
      % Doxygen can be found at http://research.cc.gatech.edu/borg/sites/edu.borg/html/index.html
      if length(varargin) == 2 && isa(varargin{1},'gtsam.CombinedImuFactorPreintegratedMeasurements') && isa(varargin{2},'double')
        varargout{1} = gtsam_wrapper(2131, this, varargin{:});
      else
        error('Arguments do not match any overload of function gtsam.CombinedImuFactorPreintegratedMeasurements.equals');
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
        gtsam_wrapper(2132, this, varargin{:});
      elseif length(varargin) == 4 && isa(varargin{1},'double') && isa(varargin{2},'double') && isa(varargin{3},'double') && isa(varargin{4},'gtsam.Pose3')
        gtsam_wrapper(2133, this, varargin{:});
      else
        error('Arguments do not match any overload of function gtsam.CombinedImuFactorPreintegratedMeasurements.integrateMeasurement');
      end
    end

    function varargout = print(this, varargin)
      % PRINT usage: print(string s) : returns void
      % Doxygen can be found at http://research.cc.gatech.edu/borg/sites/edu.borg/html/index.html
      if length(varargin) == 1 && isa(varargin{1},'char')
        gtsam_wrapper(2134, this, varargin{:});
      else
        error('Arguments do not match any overload of function gtsam.CombinedImuFactorPreintegratedMeasurements.print');
      end
    end

  end

  methods(Static = true)
  end
end
