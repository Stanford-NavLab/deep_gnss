%class TransformBtwRobotsUnaryFactorPose2, see Doxygen page for details
%at http://research.cc.gatech.edu/borg/sites/edu.borg/html/index.html
%
%-------Constructors-------
%TransformBtwRobotsUnaryFactorPose2(size_t key, Pose2 relativePose, size_t keyA, size_t keyB, Values valA, Values valB, Gaussian model)
%
%-------Methods-------
%setValAValB(Values valA, Values valB) : returns void
%unwhitenedError(Values x) : returns Vector
%whitenedError(Values x) : returns Vector
%
classdef TransformBtwRobotsUnaryFactorPose2 < gtsam.NonlinearFactor
  properties
    ptr_gtsamTransformBtwRobotsUnaryFactorPose2 = 0
  end
  methods
    function obj = TransformBtwRobotsUnaryFactorPose2(varargin)
      if (nargin == 2 || (nargin == 3 && strcmp(varargin{3}, 'void'))) && isa(varargin{1}, 'uint64') && varargin{1} == uint64(5139824614673773682)
        if nargin == 2
          my_ptr = varargin{2};
        else
          my_ptr = gtsam_unstable_wrapper(209, varargin{2});
        end
        base_ptr = gtsam_unstable_wrapper(208, my_ptr);
      elseif nargin == 7 && isa(varargin{1},'numeric') && isa(varargin{2},'gtsam.Pose2') && isa(varargin{3},'numeric') && isa(varargin{4},'numeric') && isa(varargin{5},'gtsam.Values') && isa(varargin{6},'gtsam.Values') && isa(varargin{7},'gtsam.noiseModel.Gaussian')
        [ my_ptr, base_ptr ] = gtsam_unstable_wrapper(210, varargin{1}, varargin{2}, varargin{3}, varargin{4}, varargin{5}, varargin{6}, varargin{7});
      else
        error('Arguments do not match any overload of gtsam.TransformBtwRobotsUnaryFactorPose2 constructor');
      end
      obj = obj@gtsam.NonlinearFactor(uint64(5139824614673773682), base_ptr);
      obj.ptr_gtsamTransformBtwRobotsUnaryFactorPose2 = my_ptr;
    end

    function delete(obj)
      gtsam_unstable_wrapper(211, obj.ptr_gtsamTransformBtwRobotsUnaryFactorPose2);
    end

    function display(obj), obj.print(''); end
    %DISPLAY Calls print on the object
    function disp(obj), obj.display; end
    %DISP Calls print on the object
    function varargout = setValAValB(this, varargin)
      % SETVALAVALB usage: setValAValB(Values valA, Values valB) : returns void
      % Doxygen can be found at http://research.cc.gatech.edu/borg/sites/edu.borg/html/index.html
      if length(varargin) == 2 && isa(varargin{1},'gtsam.Values') && isa(varargin{2},'gtsam.Values')
        gtsam_unstable_wrapper(212, this, varargin{:});
      else
        error('Arguments do not match any overload of function gtsam.TransformBtwRobotsUnaryFactorPose2.setValAValB');
      end
    end

    function varargout = unwhitenedError(this, varargin)
      % UNWHITENEDERROR usage: unwhitenedError(Values x) : returns Vector
      % Doxygen can be found at http://research.cc.gatech.edu/borg/sites/edu.borg/html/index.html
      if length(varargin) == 1 && isa(varargin{1},'gtsam.Values')
        varargout{1} = gtsam_unstable_wrapper(213, this, varargin{:});
      else
        error('Arguments do not match any overload of function gtsam.TransformBtwRobotsUnaryFactorPose2.unwhitenedError');
      end
    end

    function varargout = whitenedError(this, varargin)
      % WHITENEDERROR usage: whitenedError(Values x) : returns Vector
      % Doxygen can be found at http://research.cc.gatech.edu/borg/sites/edu.borg/html/index.html
      if length(varargin) == 1 && isa(varargin{1},'gtsam.Values')
        varargout{1} = gtsam_unstable_wrapper(214, this, varargin{:});
      else
        error('Arguments do not match any overload of function gtsam.TransformBtwRobotsUnaryFactorPose2.whitenedError');
      end
    end

  end

  methods(Static = true)
  end
end
