%class OdometryFactorBase, see Doxygen page for details
%at http://research.cc.gatech.edu/borg/sites/edu.borg/html/index.html
%
%-------Constructors-------
%OdometryFactorBase(size_t b1, size_t i, size_t b2, size_t j, Pose2 measured, Base noiseModel)
%
%-------Methods-------
%print(string s) : returns void
%
classdef OdometryFactorBase < gtsam.NoiseModelFactor
  properties
    ptr_gtsamOdometryFactorBase = 0
  end
  methods
    function obj = OdometryFactorBase(varargin)
      if (nargin == 2 || (nargin == 3 && strcmp(varargin{3}, 'void'))) && isa(varargin{1}, 'uint64') && varargin{1} == uint64(5139824614673773682)
        if nargin == 2
          my_ptr = varargin{2};
        else
          my_ptr = gtsam_unstable_wrapper(358, varargin{2});
        end
        base_ptr = gtsam_unstable_wrapper(357, my_ptr);
      elseif nargin == 6 && isa(varargin{1},'numeric') && isa(varargin{2},'numeric') && isa(varargin{3},'numeric') && isa(varargin{4},'numeric') && isa(varargin{5},'gtsam.Pose2') && isa(varargin{6},'gtsam.noiseModel.Base')
        [ my_ptr, base_ptr ] = gtsam_unstable_wrapper(359, varargin{1}, varargin{2}, varargin{3}, varargin{4}, varargin{5}, varargin{6});
      else
        error('Arguments do not match any overload of gtsam.OdometryFactorBase constructor');
      end
      obj = obj@gtsam.NoiseModelFactor(uint64(5139824614673773682), base_ptr);
      obj.ptr_gtsamOdometryFactorBase = my_ptr;
    end

    function delete(obj)
      gtsam_unstable_wrapper(360, obj.ptr_gtsamOdometryFactorBase);
    end

    function display(obj), obj.print(''); end
    %DISPLAY Calls print on the object
    function disp(obj), obj.display; end
    %DISP Calls print on the object
    function varargout = print(this, varargin)
      % PRINT usage: print(string s) : returns void
      % Doxygen can be found at http://research.cc.gatech.edu/borg/sites/edu.borg/html/index.html
      if length(varargin) == 1 && isa(varargin{1},'char')
        gtsam_unstable_wrapper(361, this, varargin{:});
      else
        error('Arguments do not match any overload of function gtsam.OdometryFactorBase.print');
      end
    end

  end

  methods(Static = true)
  end
end
