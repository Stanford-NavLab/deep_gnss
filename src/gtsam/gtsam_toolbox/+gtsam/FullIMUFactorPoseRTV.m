%class FullIMUFactorPoseRTV, see Doxygen page for details
%at http://research.cc.gatech.edu/borg/sites/edu.borg/html/index.html
%
%-------Constructors-------
%FullIMUFactorPoseRTV(Vector accel, Vector gyro, double dt, size_t key1, size_t key2, Base model)
%FullIMUFactorPoseRTV(Vector imu, double dt, size_t key1, size_t key2, Base model)
%
%-------Methods-------
%accel() : returns Vector
%gyro() : returns Vector
%key1() : returns size_t
%key2() : returns size_t
%z() : returns Vector
%
classdef FullIMUFactorPoseRTV < gtsam.NonlinearFactor
  properties
    ptr_gtsamFullIMUFactorPoseRTV = 0
  end
  methods
    function obj = FullIMUFactorPoseRTV(varargin)
      if (nargin == 2 || (nargin == 3 && strcmp(varargin{3}, 'void'))) && isa(varargin{1}, 'uint64') && varargin{1} == uint64(5139824614673773682)
        if nargin == 2
          my_ptr = varargin{2};
        else
          my_ptr = gtsam_unstable_wrapper(238, varargin{2});
        end
        base_ptr = gtsam_unstable_wrapper(237, my_ptr);
      elseif nargin == 6 && isa(varargin{1},'double') && isa(varargin{2},'double') && isa(varargin{3},'double') && isa(varargin{4},'numeric') && isa(varargin{5},'numeric') && isa(varargin{6},'gtsam.noiseModel.Base')
        [ my_ptr, base_ptr ] = gtsam_unstable_wrapper(239, varargin{1}, varargin{2}, varargin{3}, varargin{4}, varargin{5}, varargin{6});
      elseif nargin == 5 && isa(varargin{1},'double') && isa(varargin{2},'double') && isa(varargin{3},'numeric') && isa(varargin{4},'numeric') && isa(varargin{5},'gtsam.noiseModel.Base')
        [ my_ptr, base_ptr ] = gtsam_unstable_wrapper(240, varargin{1}, varargin{2}, varargin{3}, varargin{4}, varargin{5});
      else
        error('Arguments do not match any overload of gtsam.FullIMUFactorPoseRTV constructor');
      end
      obj = obj@gtsam.NonlinearFactor(uint64(5139824614673773682), base_ptr);
      obj.ptr_gtsamFullIMUFactorPoseRTV = my_ptr;
    end

    function delete(obj)
      gtsam_unstable_wrapper(241, obj.ptr_gtsamFullIMUFactorPoseRTV);
    end

    function display(obj), obj.print(''); end
    %DISPLAY Calls print on the object
    function disp(obj), obj.display; end
    %DISP Calls print on the object
    function varargout = accel(this, varargin)
      % ACCEL usage: accel() : returns Vector
      % Doxygen can be found at http://research.cc.gatech.edu/borg/sites/edu.borg/html/index.html
      varargout{1} = gtsam_unstable_wrapper(242, this, varargin{:});
    end

    function varargout = gyro(this, varargin)
      % GYRO usage: gyro() : returns Vector
      % Doxygen can be found at http://research.cc.gatech.edu/borg/sites/edu.borg/html/index.html
      varargout{1} = gtsam_unstable_wrapper(243, this, varargin{:});
    end

    function varargout = key1(this, varargin)
      % KEY1 usage: key1() : returns size_t
      % Doxygen can be found at http://research.cc.gatech.edu/borg/sites/edu.borg/html/index.html
      varargout{1} = gtsam_unstable_wrapper(244, this, varargin{:});
    end

    function varargout = key2(this, varargin)
      % KEY2 usage: key2() : returns size_t
      % Doxygen can be found at http://research.cc.gatech.edu/borg/sites/edu.borg/html/index.html
      varargout{1} = gtsam_unstable_wrapper(245, this, varargin{:});
    end

    function varargout = z(this, varargin)
      % Z usage: z() : returns Vector
      % Doxygen can be found at http://research.cc.gatech.edu/borg/sites/edu.borg/html/index.html
      varargout{1} = gtsam_unstable_wrapper(246, this, varargin{:});
    end

  end

  methods(Static = true)
  end
end
