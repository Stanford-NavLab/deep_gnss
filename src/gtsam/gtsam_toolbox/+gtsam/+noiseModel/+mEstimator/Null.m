%class Null, see Doxygen page for details
%at http://research.cc.gatech.edu/borg/sites/edu.borg/html/index.html
%
%-------Constructors-------
%Null()
%
%-------Methods-------
%print(string s) : returns void
%
%-------Static Methods-------
%Create() : returns gtsam::noiseModel::mEstimator::Null
%
classdef Null < gtsam.noiseModel.mEstimator.Base
  properties
    ptr_gtsamnoiseModelmEstimatorNull = 0
  end
  methods
    function obj = Null(varargin)
      if (nargin == 2 || (nargin == 3 && strcmp(varargin{3}, 'void'))) && isa(varargin{1}, 'uint64') && varargin{1} == uint64(5139824614673773682)
        if nargin == 2
          my_ptr = varargin{2};
        else
          my_ptr = gtsam_wrapper(608, varargin{2});
        end
        base_ptr = gtsam_wrapper(607, my_ptr);
      elseif nargin == 0
        [ my_ptr, base_ptr ] = gtsam_wrapper(609);
      else
        error('Arguments do not match any overload of gtsam.noiseModel.mEstimator.Null constructor');
      end
      obj = obj@gtsam.noiseModel.mEstimator.Base(uint64(5139824614673773682), base_ptr);
      obj.ptr_gtsamnoiseModelmEstimatorNull = my_ptr;
    end

    function delete(obj)
      gtsam_wrapper(610, obj.ptr_gtsamnoiseModelmEstimatorNull);
    end

    function display(obj), obj.print(''); end
    %DISPLAY Calls print on the object
    function disp(obj), obj.display; end
    %DISP Calls print on the object
    function varargout = print(this, varargin)
      % PRINT usage: print(string s) : returns void
      % Doxygen can be found at http://research.cc.gatech.edu/borg/sites/edu.borg/html/index.html
      if length(varargin) == 1 && isa(varargin{1},'char')
        gtsam_wrapper(611, this, varargin{:});
      else
        error('Arguments do not match any overload of function gtsam.noiseModel.mEstimator.Null.print');
      end
    end

  end

  methods(Static = true)
    function varargout = Create(varargin)
      % CREATE usage: Create() : returns gtsam::noiseModel::mEstimator::Null
      % Doxygen can be found at http://research.cc.gatech.edu/borg/sites/edu.borg/html/index.html
      % 
      % Usage
      % CREATE()
      if length(varargin) == 0
        varargout{1} = gtsam_wrapper(612, varargin{:});
      else
        error('Arguments do not match any overload of function gtsam.noiseModel.mEstimator.Null.Create');
      end
    end

  end
end
