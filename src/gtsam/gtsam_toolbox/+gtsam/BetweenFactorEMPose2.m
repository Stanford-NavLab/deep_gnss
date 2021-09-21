%class BetweenFactorEMPose2, see Doxygen page for details
%at http://research.cc.gatech.edu/borg/sites/edu.borg/html/index.html
%
%-------Constructors-------
%BetweenFactorEMPose2(size_t key1, size_t key2, Pose2 relativePose, Gaussian model_inlier, Gaussian model_outlier, double prior_inlier, double prior_outlier)
%BetweenFactorEMPose2(size_t key1, size_t key2, Pose2 relativePose, Gaussian model_inlier, Gaussian model_outlier, double prior_inlier, double prior_outlier, bool flag_bump_up_near_zero_probs)
%
%-------Methods-------
%calcIndicatorProb(Values x) : returns Vector
%get_flag_bump_up_near_zero_probs() : returns bool
%get_model_inlier_cov() : returns Matrix
%get_model_outlier_cov() : returns Matrix
%measured() : returns gtsam::Pose2
%set_flag_bump_up_near_zero_probs(bool flag) : returns void
%unwhitenedError(Values x) : returns Vector
%updateNoiseModels(Values values, NonlinearFactorGraph graph) : returns void
%updateNoiseModels_givenCovs(Values values, Matrix cov1, Matrix cov2, Matrix cov12) : returns void
%whitenedError(Values x) : returns Vector
%
classdef BetweenFactorEMPose2 < gtsam.NonlinearFactor
  properties
    ptr_gtsamBetweenFactorEMPose2 = 0
  end
  methods
    function obj = BetweenFactorEMPose2(varargin)
      if (nargin == 2 || (nargin == 3 && strcmp(varargin{3}, 'void'))) && isa(varargin{1}, 'uint64') && varargin{1} == uint64(5139824614673773682)
        if nargin == 2
          my_ptr = varargin{2};
        else
          my_ptr = gtsam_unstable_wrapper(181, varargin{2});
        end
        base_ptr = gtsam_unstable_wrapper(180, my_ptr);
      elseif nargin == 7 && isa(varargin{1},'numeric') && isa(varargin{2},'numeric') && isa(varargin{3},'gtsam.Pose2') && isa(varargin{4},'gtsam.noiseModel.Gaussian') && isa(varargin{5},'gtsam.noiseModel.Gaussian') && isa(varargin{6},'double') && isa(varargin{7},'double')
        [ my_ptr, base_ptr ] = gtsam_unstable_wrapper(182, varargin{1}, varargin{2}, varargin{3}, varargin{4}, varargin{5}, varargin{6}, varargin{7});
      elseif nargin == 8 && isa(varargin{1},'numeric') && isa(varargin{2},'numeric') && isa(varargin{3},'gtsam.Pose2') && isa(varargin{4},'gtsam.noiseModel.Gaussian') && isa(varargin{5},'gtsam.noiseModel.Gaussian') && isa(varargin{6},'double') && isa(varargin{7},'double') && isa(varargin{8},'logical')
        [ my_ptr, base_ptr ] = gtsam_unstable_wrapper(183, varargin{1}, varargin{2}, varargin{3}, varargin{4}, varargin{5}, varargin{6}, varargin{7}, varargin{8});
      else
        error('Arguments do not match any overload of gtsam.BetweenFactorEMPose2 constructor');
      end
      obj = obj@gtsam.NonlinearFactor(uint64(5139824614673773682), base_ptr);
      obj.ptr_gtsamBetweenFactorEMPose2 = my_ptr;
    end

    function delete(obj)
      gtsam_unstable_wrapper(184, obj.ptr_gtsamBetweenFactorEMPose2);
    end

    function display(obj), obj.print(''); end
    %DISPLAY Calls print on the object
    function disp(obj), obj.display; end
    %DISP Calls print on the object
    function varargout = calcIndicatorProb(this, varargin)
      % CALCINDICATORPROB usage: calcIndicatorProb(Values x) : returns Vector
      % Doxygen can be found at http://research.cc.gatech.edu/borg/sites/edu.borg/html/index.html
      if length(varargin) == 1 && isa(varargin{1},'gtsam.Values')
        varargout{1} = gtsam_unstable_wrapper(185, this, varargin{:});
      else
        error('Arguments do not match any overload of function gtsam.BetweenFactorEMPose2.calcIndicatorProb');
      end
    end

    function varargout = get_flag_bump_up_near_zero_probs(this, varargin)
      % GET_FLAG_BUMP_UP_NEAR_ZERO_PROBS usage: get_flag_bump_up_near_zero_probs() : returns bool
      % Doxygen can be found at http://research.cc.gatech.edu/borg/sites/edu.borg/html/index.html
      varargout{1} = gtsam_unstable_wrapper(186, this, varargin{:});
    end

    function varargout = get_model_inlier_cov(this, varargin)
      % GET_MODEL_INLIER_COV usage: get_model_inlier_cov() : returns Matrix
      % Doxygen can be found at http://research.cc.gatech.edu/borg/sites/edu.borg/html/index.html
      varargout{1} = gtsam_unstable_wrapper(187, this, varargin{:});
    end

    function varargout = get_model_outlier_cov(this, varargin)
      % GET_MODEL_OUTLIER_COV usage: get_model_outlier_cov() : returns Matrix
      % Doxygen can be found at http://research.cc.gatech.edu/borg/sites/edu.borg/html/index.html
      varargout{1} = gtsam_unstable_wrapper(188, this, varargin{:});
    end

    function varargout = measured(this, varargin)
      % MEASURED usage: measured() : returns gtsam::Pose2
      % Doxygen can be found at http://research.cc.gatech.edu/borg/sites/edu.borg/html/index.html
      varargout{1} = gtsam_unstable_wrapper(189, this, varargin{:});
    end

    function varargout = set_flag_bump_up_near_zero_probs(this, varargin)
      % SET_FLAG_BUMP_UP_NEAR_ZERO_PROBS usage: set_flag_bump_up_near_zero_probs(bool flag) : returns void
      % Doxygen can be found at http://research.cc.gatech.edu/borg/sites/edu.borg/html/index.html
      gtsam_unstable_wrapper(190, this, varargin{:});
    end

    function varargout = unwhitenedError(this, varargin)
      % UNWHITENEDERROR usage: unwhitenedError(Values x) : returns Vector
      % Doxygen can be found at http://research.cc.gatech.edu/borg/sites/edu.borg/html/index.html
      if length(varargin) == 1 && isa(varargin{1},'gtsam.Values')
        varargout{1} = gtsam_unstable_wrapper(191, this, varargin{:});
      else
        error('Arguments do not match any overload of function gtsam.BetweenFactorEMPose2.unwhitenedError');
      end
    end

    function varargout = updateNoiseModels(this, varargin)
      % UPDATENOISEMODELS usage: updateNoiseModels(Values values, NonlinearFactorGraph graph) : returns void
      % Doxygen can be found at http://research.cc.gatech.edu/borg/sites/edu.borg/html/index.html
      if length(varargin) == 2 && isa(varargin{1},'gtsam.Values') && isa(varargin{2},'gtsam.NonlinearFactorGraph')
        gtsam_unstable_wrapper(192, this, varargin{:});
      else
        error('Arguments do not match any overload of function gtsam.BetweenFactorEMPose2.updateNoiseModels');
      end
    end

    function varargout = updateNoiseModels_givenCovs(this, varargin)
      % UPDATENOISEMODELS_GIVENCOVS usage: updateNoiseModels_givenCovs(Values values, Matrix cov1, Matrix cov2, Matrix cov12) : returns void
      % Doxygen can be found at http://research.cc.gatech.edu/borg/sites/edu.borg/html/index.html
      if length(varargin) == 4 && isa(varargin{1},'gtsam.Values') && isa(varargin{2},'double') && isa(varargin{3},'double') && isa(varargin{4},'double')
        gtsam_unstable_wrapper(193, this, varargin{:});
      else
        error('Arguments do not match any overload of function gtsam.BetweenFactorEMPose2.updateNoiseModels_givenCovs');
      end
    end

    function varargout = whitenedError(this, varargin)
      % WHITENEDERROR usage: whitenedError(Values x) : returns Vector
      % Doxygen can be found at http://research.cc.gatech.edu/borg/sites/edu.borg/html/index.html
      if length(varargin) == 1 && isa(varargin{1},'gtsam.Values')
        varargout{1} = gtsam_unstable_wrapper(194, this, varargin{:});
      else
        error('Arguments do not match any overload of function gtsam.BetweenFactorEMPose2.whitenedError');
      end
    end

  end

  methods(Static = true)
  end
end
