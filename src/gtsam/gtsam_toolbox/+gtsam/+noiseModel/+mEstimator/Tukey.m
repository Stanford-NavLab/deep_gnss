%class Tukey, see Doxygen page for details
%at http://research.cc.gatech.edu/borg/sites/edu.borg/html/index.html
%
%-------Constructors-------
%Tukey(double k)
%
%-------Methods-------
%print(string s) : returns void
%
%-------Static Methods-------
%Create(double k) : returns gtsam::noiseModel::mEstimator::Tukey
%
classdef Tukey < gtsam.noiseModel.mEstimator.Base
  properties
    ptr_gtsamnoiseModelmEstimatorTukey = 0
  end
  methods
    function obj = Tukey(varargin)
      if (nargin == 2 || (nargin == 3 && strcmp(varargin{3}, 'void'))) && isa(varargin{1}, 'uint64') && varargin{1} == uint64(5139824614673773682)
        if nargin == 2
          my_ptr = varargin{2};
        else
          my_ptr = gtsam_wrapper(626, varargin{2});
        end
        base_ptr = gtsam_wrapper(625, my_ptr);
      elseif nargin == 1 && isa(varargin{1},'double')
        [ my_ptr, base_ptr ] = gtsam_wrapper(627, varargin{1});
      else
        error('Arguments do not match any overload of gtsam.noiseModel.mEstimator.Tukey constructor');
      end
      obj = obj@gtsam.noiseModel.mEstimator.Base(uint64(5139824614673773682), base_ptr);
      obj.ptr_gtsamnoiseModelmEstimatorTukey = my_ptr;
    end

    function delete(obj)
      gtsam_wrapper(628, obj.ptr_gtsamnoiseModelmEstimatorTukey);
    end

    function display(obj), obj.print(''); end
    %DISPLAY Calls print on the object
    function disp(obj), obj.display; end
    %DISP Calls print on the object
    function varargout = print(this, varargin)
      % PRINT usage: print(string s) : returns void
      % Doxygen can be found at http://research.cc.gatech.edu/borg/sites/edu.borg/html/index.html
      if length(varargin) == 1 && isa(varargin{1},'char')
        gtsam_wrapper(629, this, varargin{:});
      else
        error('Arguments do not match any overload of function gtsam.noiseModel.mEstimator.Tukey.print');
      end
    end

  end

  methods(Static = true)
    function varargout = Create(varargin)
      % CREATE usage: Create(double k) : returns gtsam::noiseModel::mEstimator::Tukey
      % Doxygen can be found at http://research.cc.gatech.edu/borg/sites/edu.borg/html/index.html
      % 
      % Usage
      % CREATE(double k)
      if length(varargin) == 1 && isa(varargin{1},'double')
        varargout{1} = gtsam_wrapper(630, varargin{:});
      else
        error('Arguments do not match any overload of function gtsam.noiseModel.mEstimator.Tukey.Create');
      end
    end

  end
end
