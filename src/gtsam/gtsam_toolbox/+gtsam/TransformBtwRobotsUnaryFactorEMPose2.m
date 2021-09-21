%class TransformBtwRobotsUnaryFactorEMPose2, see Doxygen page for details
%at http://research.cc.gatech.edu/borg/sites/edu.borg/html/index.html
%
%-------Constructors-------
%TransformBtwRobotsUnaryFactorEMPose2(size_t key, Pose2 relativePose, size_t keyA, size_t keyB, Values valA, Values valB, Gaussian model_inlier, Gaussian model_outlier, double prior_inlier, double prior_outlier)
%TransformBtwRobotsUnaryFactorEMPose2(size_t key, Pose2 relativePose, size_t keyA, size_t keyB, Values valA, Values valB, Gaussian model_inlier, Gaussian model_outlier, double prior_inlier, double prior_outlier, bool flag_bump_up_near_zero_probs, bool start_with_M_step)
%
%-------Methods-------
%calcIndicatorProb(Values x) : returns Vector
%get_model_inlier_cov() : returns Matrix
%get_model_outlier_cov() : returns Matrix
%setValAValB(Values valA, Values valB) : returns void
%unwhitenedError(Values x) : returns Vector
%updateNoiseModels(Values values, NonlinearFactorGraph graph) : returns void
%updateNoiseModels_givenCovs(Values values, Matrix cov1, Matrix cov2, Matrix cov12) : returns void
%whitenedError(Values x) : returns Vector
%
classdef TransformBtwRobotsUnaryFactorEMPose2 < gtsam.NonlinearFactor
  properties
    ptr_gtsamTransformBtwRobotsUnaryFactorEMPose2 = 0
  end
  methods
    function obj = TransformBtwRobotsUnaryFactorEMPose2(varargin)
      if (nargin == 2 || (nargin == 3 && strcmp(varargin{3}, 'void'))) && isa(varargin{1}, 'uint64') && varargin{1} == uint64(5139824614673773682)
        if nargin == 2
          my_ptr = varargin{2};
        else
          my_ptr = gtsam_unstable_wrapper(196, varargin{2});
        end
        base_ptr = gtsam_unstable_wrapper(195, my_ptr);
      elseif nargin == 10 && isa(varargin{1},'numeric') && isa(varargin{2},'gtsam.Pose2') && isa(varargin{3},'numeric') && isa(varargin{4},'numeric') && isa(varargin{5},'gtsam.Values') && isa(varargin{6},'gtsam.Values') && isa(varargin{7},'gtsam.noiseModel.Gaussian') && isa(varargin{8},'gtsam.noiseModel.Gaussian') && isa(varargin{9},'double') && isa(varargin{10},'double')
        [ my_ptr, base_ptr ] = gtsam_unstable_wrapper(197, varargin{1}, varargin{2}, varargin{3}, varargin{4}, varargin{5}, varargin{6}, varargin{7}, varargin{8}, varargin{9}, varargin{10});
      elseif nargin == 12 && isa(varargin{1},'numeric') && isa(varargin{2},'gtsam.Pose2') && isa(varargin{3},'numeric') && isa(varargin{4},'numeric') && isa(varargin{5},'gtsam.Values') && isa(varargin{6},'gtsam.Values') && isa(varargin{7},'gtsam.noiseModel.Gaussian') && isa(varargin{8},'gtsam.noiseModel.Gaussian') && isa(varargin{9},'double') && isa(varargin{10},'double') && isa(varargin{11},'logical') && isa(varargin{12},'logical')
        [ my_ptr, base_ptr ] = gtsam_unstable_wrapper(198, varargin{1}, varargin{2}, varargin{3}, varargin{4}, varargin{5}, varargin{6}, varargin{7}, varargin{8}, varargin{9}, varargin{10}, varargin{11}, varargin{12});
      else
        error('Arguments do not match any overload of gtsam.TransformBtwRobotsUnaryFactorEMPose2 constructor');
      end
      obj = obj@gtsam.NonlinearFactor(uint64(5139824614673773682), base_ptr);
      obj.ptr_gtsamTransformBtwRobotsUnaryFactorEMPose2 = my_ptr;
    end

    function delete(obj)
      gtsam_unstable_wrapper(199, obj.ptr_gtsamTransformBtwRobotsUnaryFactorEMPose2);
    end

    function display(obj), obj.print(''); end
    %DISPLAY Calls print on the object
    function disp(obj), obj.display; end
    %DISP Calls print on the object
    function varargout = calcIndicatorProb(this, varargin)
      % CALCINDICATORPROB usage: calcIndicatorProb(Values x) : returns Vector
      % Doxygen can be found at http://research.cc.gatech.edu/borg/sites/edu.borg/html/index.html
      if length(varargin) == 1 && isa(varargin{1},'gtsam.Values')
        varargout{1} = gtsam_unstable_wrapper(200, this, varargin{:});
      else
        error('Arguments do not match any overload of function gtsam.TransformBtwRobotsUnaryFactorEMPose2.calcIndicatorProb');
      end
    end

    function varargout = get_model_inlier_cov(this, varargin)
      % GET_MODEL_INLIER_COV usage: get_model_inlier_cov() : returns Matrix
      % Doxygen can be found at http://research.cc.gatech.edu/borg/sites/edu.borg/html/index.html
      varargout{1} = gtsam_unstable_wrapper(201, this, varargin{:});
    end

    function varargout = get_model_outlier_cov(this, varargin)
      % GET_MODEL_OUTLIER_COV usage: get_model_outlier_cov() : returns Matrix
      % Doxygen can be found at http://research.cc.gatech.edu/borg/sites/edu.borg/html/index.html
      varargout{1} = gtsam_unstable_wrapper(202, this, varargin{:});
    end

    function varargout = setValAValB(this, varargin)
      % SETVALAVALB usage: setValAValB(Values valA, Values valB) : returns void
      % Doxygen can be found at http://research.cc.gatech.edu/borg/sites/edu.borg/html/index.html
      if length(varargin) == 2 && isa(varargin{1},'gtsam.Values') && isa(varargin{2},'gtsam.Values')
        gtsam_unstable_wrapper(203, this, varargin{:});
      else
        error('Arguments do not match any overload of function gtsam.TransformBtwRobotsUnaryFactorEMPose2.setValAValB');
      end
    end

    function varargout = unwhitenedError(this, varargin)
      % UNWHITENEDERROR usage: unwhitenedError(Values x) : returns Vector
      % Doxygen can be found at http://research.cc.gatech.edu/borg/sites/edu.borg/html/index.html
      if length(varargin) == 1 && isa(varargin{1},'gtsam.Values')
        varargout{1} = gtsam_unstable_wrapper(204, this, varargin{:});
      else
        error('Arguments do not match any overload of function gtsam.TransformBtwRobotsUnaryFactorEMPose2.unwhitenedError');
      end
    end

    function varargout = updateNoiseModels(this, varargin)
      % UPDATENOISEMODELS usage: updateNoiseModels(Values values, NonlinearFactorGraph graph) : returns void
      % Doxygen can be found at http://research.cc.gatech.edu/borg/sites/edu.borg/html/index.html
      if length(varargin) == 2 && isa(varargin{1},'gtsam.Values') && isa(varargin{2},'gtsam.NonlinearFactorGraph')
        gtsam_unstable_wrapper(205, this, varargin{:});
      else
        error('Arguments do not match any overload of function gtsam.TransformBtwRobotsUnaryFactorEMPose2.updateNoiseModels');
      end
    end

    function varargout = updateNoiseModels_givenCovs(this, varargin)
      % UPDATENOISEMODELS_GIVENCOVS usage: updateNoiseModels_givenCovs(Values values, Matrix cov1, Matrix cov2, Matrix cov12) : returns void
      % Doxygen can be found at http://research.cc.gatech.edu/borg/sites/edu.borg/html/index.html
      if length(varargin) == 4 && isa(varargin{1},'gtsam.Values') && isa(varargin{2},'double') && isa(varargin{3},'double') && isa(varargin{4},'double')
        gtsam_unstable_wrapper(206, this, varargin{:});
      else
        error('Arguments do not match any overload of function gtsam.TransformBtwRobotsUnaryFactorEMPose2.updateNoiseModels_givenCovs');
      end
    end

    function varargout = whitenedError(this, varargin)
      % WHITENEDERROR usage: whitenedError(Values x) : returns Vector
      % Doxygen can be found at http://research.cc.gatech.edu/borg/sites/edu.borg/html/index.html
      if length(varargin) == 1 && isa(varargin{1},'gtsam.Values')
        varargout{1} = gtsam_unstable_wrapper(207, this, varargin{:});
      else
        error('Arguments do not match any overload of function gtsam.TransformBtwRobotsUnaryFactorEMPose2.whitenedError');
      end
    end

  end

  methods(Static = true)
  end
end
