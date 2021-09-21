%class Sampler, see Doxygen page for details
%at http://research.cc.gatech.edu/borg/sites/edu.borg/html/index.html
%
%-------Constructors-------
%Sampler(Diagonal model, int seed)
%Sampler(Vector sigmas, int seed)
%Sampler(int seed)
%
%-------Methods-------
%dim() : returns size_t
%model() : returns gtsam::noiseModel::Diagonal
%sample() : returns Vector
%sampleNewModel(Diagonal model) : returns Vector
%sigmas() : returns Vector
%
classdef Sampler < handle
  properties
    ptr_gtsamSampler = 0
  end
  methods
    function obj = Sampler(varargin)
      if nargin == 2 && isa(varargin{1}, 'uint64') && varargin{1} == uint64(5139824614673773682)
        my_ptr = varargin{2};
        gtsam_wrapper(637, my_ptr);
      elseif nargin == 2 && isa(varargin{1},'gtsam.noiseModel.Diagonal') && isa(varargin{2},'numeric')
        my_ptr = gtsam_wrapper(638, varargin{1}, varargin{2});
      elseif nargin == 2 && isa(varargin{1},'double') && isa(varargin{2},'numeric')
        my_ptr = gtsam_wrapper(639, varargin{1}, varargin{2});
      elseif nargin == 1 && isa(varargin{1},'numeric')
        my_ptr = gtsam_wrapper(640, varargin{1});
      else
        error('Arguments do not match any overload of gtsam.Sampler constructor');
      end
      obj.ptr_gtsamSampler = my_ptr;
    end

    function delete(obj)
      gtsam_wrapper(641, obj.ptr_gtsamSampler);
    end

    function display(obj), obj.print(''); end
    %DISPLAY Calls print on the object
    function disp(obj), obj.display; end
    %DISP Calls print on the object
    function varargout = dim(this, varargin)
      % DIM usage: dim() : returns size_t
      % Doxygen can be found at http://research.cc.gatech.edu/borg/sites/edu.borg/html/index.html
      varargout{1} = gtsam_wrapper(642, this, varargin{:});
    end

    function varargout = model(this, varargin)
      % MODEL usage: model() : returns gtsam::noiseModel::Diagonal
      % Doxygen can be found at http://research.cc.gatech.edu/borg/sites/edu.borg/html/index.html
      varargout{1} = gtsam_wrapper(643, this, varargin{:});
    end

    function varargout = sample(this, varargin)
      % SAMPLE usage: sample() : returns Vector
      % Doxygen can be found at http://research.cc.gatech.edu/borg/sites/edu.borg/html/index.html
      varargout{1} = gtsam_wrapper(644, this, varargin{:});
    end

    function varargout = sampleNewModel(this, varargin)
      % SAMPLENEWMODEL usage: sampleNewModel(Diagonal model) : returns Vector
      % Doxygen can be found at http://research.cc.gatech.edu/borg/sites/edu.borg/html/index.html
      if length(varargin) == 1 && isa(varargin{1},'gtsam.noiseModel.Diagonal')
        varargout{1} = gtsam_wrapper(645, this, varargin{:});
      else
        error('Arguments do not match any overload of function gtsam.Sampler.sampleNewModel');
      end
    end

    function varargout = sigmas(this, varargin)
      % SIGMAS usage: sigmas() : returns Vector
      % Doxygen can be found at http://research.cc.gatech.edu/borg/sites/edu.borg/html/index.html
      varargout{1} = gtsam_wrapper(646, this, varargin{:});
    end

  end

  methods(Static = true)
  end
end
