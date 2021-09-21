%class CombinedImuFactor, see Doxygen page for details
%at http://research.cc.gatech.edu/borg/sites/edu.borg/html/index.html
%
%-------Constructors-------
%CombinedImuFactor(size_t pose_i, size_t vel_i, size_t pose_j, size_t vel_j, size_t bias_i, size_t bias_j, CombinedImuFactorPreintegratedMeasurements CombinedPreintegratedMeasurements, Vector gravity, Vector omegaCoriolis)
%
%-------Methods-------
%Predict(Pose3 pose_i, LieVector vel_i, Pose3 pose_j, LieVector vel_j, ConstantBias bias_i, ConstantBias bias_j, CombinedImuFactorPreintegratedMeasurements preintegratedMeasurements, Vector gravity, Vector omegaCoriolis) : returns void
%active(Values c) : returns bool
%clone() : returns gtsam::NonlinearFactor
%dim() : returns size_t
%equals(NonlinearFactor other, double tol) : returns void
%error(Values c) : returns double
%keys() : returns gtsam::KeyVector
%linearize(Values c) : returns gtsam::GaussianFactor
%preintegratedMeasurements() : returns gtsam::CombinedImuFactorPreintegratedMeasurements
%print(string s) : returns void
%printKeys(string s) : returns void
%size() : returns size_t
%
classdef CombinedImuFactor < gtsam.NonlinearFactor
  properties
    ptr_gtsamCombinedImuFactor = 0
  end
  methods
    function obj = CombinedImuFactor(varargin)
      if (nargin == 2 || (nargin == 3 && strcmp(varargin{3}, 'void'))) && isa(varargin{1}, 'uint64') && varargin{1} == uint64(5139824614673773682)
        if nargin == 2
          my_ptr = varargin{2};
        else
          my_ptr = gtsam_wrapper(2136, varargin{2});
        end
        base_ptr = gtsam_wrapper(2135, my_ptr);
      elseif nargin == 9 && isa(varargin{1},'numeric') && isa(varargin{2},'numeric') && isa(varargin{3},'numeric') && isa(varargin{4},'numeric') && isa(varargin{5},'numeric') && isa(varargin{6},'numeric') && isa(varargin{7},'gtsam.CombinedImuFactorPreintegratedMeasurements') && isa(varargin{8},'double') && isa(varargin{9},'double')
        [ my_ptr, base_ptr ] = gtsam_wrapper(2137, varargin{1}, varargin{2}, varargin{3}, varargin{4}, varargin{5}, varargin{6}, varargin{7}, varargin{8}, varargin{9});
      else
        error('Arguments do not match any overload of gtsam.CombinedImuFactor constructor');
      end
      obj = obj@gtsam.NonlinearFactor(uint64(5139824614673773682), base_ptr);
      obj.ptr_gtsamCombinedImuFactor = my_ptr;
    end

    function delete(obj)
      gtsam_wrapper(2138, obj.ptr_gtsamCombinedImuFactor);
    end

    function display(obj), obj.print(''); end
    %DISPLAY Calls print on the object
    function disp(obj), obj.display; end
    %DISP Calls print on the object
    function varargout = Predict(this, varargin)
      % PREDICT usage: Predict(Pose3 pose_i, LieVector vel_i, Pose3 pose_j, LieVector vel_j, ConstantBias bias_i, ConstantBias bias_j, CombinedImuFactorPreintegratedMeasurements preintegratedMeasurements, Vector gravity, Vector omegaCoriolis) : returns void
      % Doxygen can be found at http://research.cc.gatech.edu/borg/sites/edu.borg/html/index.html
      if length(varargin) == 9 && isa(varargin{1},'gtsam.Pose3') && isa(varargin{2},'gtsam.LieVector') && isa(varargin{3},'gtsam.Pose3') && isa(varargin{4},'gtsam.LieVector') && isa(varargin{5},'gtsam.imuBias.ConstantBias') && isa(varargin{6},'gtsam.imuBias.ConstantBias') && isa(varargin{7},'gtsam.CombinedImuFactorPreintegratedMeasurements') && isa(varargin{8},'double') && isa(varargin{9},'double')
        gtsam_wrapper(2139, this, varargin{:});
      else
        error('Arguments do not match any overload of function gtsam.CombinedImuFactor.Predict');
      end
    end

    function varargout = active(this, varargin)
      % ACTIVE usage: active(Values c) : returns bool
      % Doxygen can be found at http://research.cc.gatech.edu/borg/sites/edu.borg/html/index.html
      if length(varargin) == 1 && isa(varargin{1},'gtsam.Values')
        varargout{1} = gtsam_wrapper(2140, this, varargin{:});
      else
        error('Arguments do not match any overload of function gtsam.CombinedImuFactor.active');
      end
    end

    function varargout = clone(this, varargin)
      % CLONE usage: clone() : returns gtsam::NonlinearFactor
      % Doxygen can be found at http://research.cc.gatech.edu/borg/sites/edu.borg/html/index.html
      varargout{1} = gtsam_wrapper(2141, this, varargin{:});
    end

    function varargout = dim(this, varargin)
      % DIM usage: dim() : returns size_t
      % Doxygen can be found at http://research.cc.gatech.edu/borg/sites/edu.borg/html/index.html
      varargout{1} = gtsam_wrapper(2142, this, varargin{:});
    end

    function varargout = equals(this, varargin)
      % EQUALS usage: equals(NonlinearFactor other, double tol) : returns void
      % Doxygen can be found at http://research.cc.gatech.edu/borg/sites/edu.borg/html/index.html
      if length(varargin) == 2 && isa(varargin{1},'gtsam.NonlinearFactor') && isa(varargin{2},'double')
        gtsam_wrapper(2143, this, varargin{:});
      else
        error('Arguments do not match any overload of function gtsam.CombinedImuFactor.equals');
      end
    end

    function varargout = error(this, varargin)
      % ERROR usage: error(Values c) : returns double
      % Doxygen can be found at http://research.cc.gatech.edu/borg/sites/edu.borg/html/index.html
      if length(varargin) == 1 && isa(varargin{1},'gtsam.Values')
        varargout{1} = gtsam_wrapper(2144, this, varargin{:});
      else
        error('Arguments do not match any overload of function gtsam.CombinedImuFactor.error');
      end
    end

    function varargout = keys(this, varargin)
      % KEYS usage: keys() : returns gtsam::KeyVector
      % Doxygen can be found at http://research.cc.gatech.edu/borg/sites/edu.borg/html/index.html
      varargout{1} = gtsam_wrapper(2145, this, varargin{:});
    end

    function varargout = linearize(this, varargin)
      % LINEARIZE usage: linearize(Values c) : returns gtsam::GaussianFactor
      % Doxygen can be found at http://research.cc.gatech.edu/borg/sites/edu.borg/html/index.html
      if length(varargin) == 1 && isa(varargin{1},'gtsam.Values')
        varargout{1} = gtsam_wrapper(2146, this, varargin{:});
      else
        error('Arguments do not match any overload of function gtsam.CombinedImuFactor.linearize');
      end
    end

    function varargout = preintegratedMeasurements(this, varargin)
      % PREINTEGRATEDMEASUREMENTS usage: preintegratedMeasurements() : returns gtsam::CombinedImuFactorPreintegratedMeasurements
      % Doxygen can be found at http://research.cc.gatech.edu/borg/sites/edu.borg/html/index.html
      varargout{1} = gtsam_wrapper(2147, this, varargin{:});
    end

    function varargout = print(this, varargin)
      % PRINT usage: print(string s) : returns void
      % Doxygen can be found at http://research.cc.gatech.edu/borg/sites/edu.borg/html/index.html
      if length(varargin) == 1 && isa(varargin{1},'char')
        gtsam_wrapper(2148, this, varargin{:});
      else
        error('Arguments do not match any overload of function gtsam.CombinedImuFactor.print');
      end
    end

    function varargout = printKeys(this, varargin)
      % PRINTKEYS usage: printKeys(string s) : returns void
      % Doxygen can be found at http://research.cc.gatech.edu/borg/sites/edu.borg/html/index.html
      if length(varargin) == 1 && isa(varargin{1},'char')
        gtsam_wrapper(2149, this, varargin{:});
      else
        error('Arguments do not match any overload of function gtsam.CombinedImuFactor.printKeys');
      end
    end

    function varargout = size(this, varargin)
      % SIZE usage: size() : returns size_t
      % Doxygen can be found at http://research.cc.gatech.edu/borg/sites/edu.borg/html/index.html
      varargout{1} = gtsam_wrapper(2150, this, varargin{:});
    end

  end

  methods(Static = true)
  end
end
