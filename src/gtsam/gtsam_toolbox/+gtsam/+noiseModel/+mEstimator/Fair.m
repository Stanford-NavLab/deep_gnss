%class Fair, see Doxygen page for details
%at http://research.cc.gatech.edu/borg/sites/edu.borg/html/index.html
%
%-------Constructors-------
%Fair(double c)
%
%-------Methods-------
%print(string s) : returns void
%
%-------Static Methods-------
%Create(double c) : returns gtsam::noiseModel::mEstimator::Fair
%
classdef Fair < gtsam.noiseModel.mEstimator.Base
  properties
    ptr_gtsamnoiseModelmEstimatorFair = 0
  end
  methods
    function obj = Fair(varargin)
      if (nargin == 2 || (nargin == 3 && strcmp(varargin{3}, 'void'))) && isa(varargin{1}, 'uint64') && varargin{1} == uint64(5139824614673773682)
        if nargin == 2
          my_ptr = varargin{2};
        else
          my_ptr = gtsam_wrapper(614, varargin{2});
        end
        base_ptr = gtsam_wrapper(613, my_ptr);
      elseif nargin == 1 && isa(varargin{1},'double')
        [ my_ptr, base_ptr ] = gtsam_wrapper(615, varargin{1});
      else
        error('Arguments do not match any overload of gtsam.noiseModel.mEstimator.Fair constructor');
      end
      obj = obj@gtsam.noiseModel.mEstimator.Base(uint64(5139824614673773682), base_ptr);
      obj.ptr_gtsamnoiseModelmEstimatorFair = my_ptr;
    end

    function delete(obj)
      gtsam_wrapper(616, obj.ptr_gtsamnoiseModelmEstimatorFair);
    end

    function display(obj), obj.print(''); end
    %DISPLAY Calls print on the object
    function disp(obj), obj.display; end
    %DISP Calls print on the object
    function varargout = print(this, varargin)
      % PRINT usage: print(string s) : returns void
      % Doxygen can be found at http://research.cc.gatech.edu/borg/sites/edu.borg/html/index.html
      if length(varargin) == 1 && isa(varargin{1},'char')
        gtsam_wrapper(617, this, varargin{:});
      else
        error('Arguments do not match any overload of function gtsam.noiseModel.mEstimator.Fair.print');
      end
    end

  end

  methods(Static = true)
    function varargout = Create(varargin)
      % CREATE usage: Create(double c) : returns gtsam::noiseModel::mEstimator::Fair
      % Doxygen can be found at http://research.cc.gatech.edu/borg/sites/edu.borg/html/index.html
      % 
      % Usage
      % CREATE(double c)
      if length(varargin) == 1 && isa(varargin{1},'double')
        varargout{1} = gtsam_wrapper(618, varargin{:});
      else
        error('Arguments do not match any overload of function gtsam.noiseModel.mEstimator.Fair.Create');
      end
    end

  end
end
