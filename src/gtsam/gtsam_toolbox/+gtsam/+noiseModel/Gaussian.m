%class Gaussian, see Doxygen page for details
%at http://research.cc.gatech.edu/borg/sites/edu.borg/html/index.html
%
%-------Methods-------
%R() : returns Matrix
%equals(Base expected, double tol) : returns bool
%print(string s) : returns void
%
%-------Static Methods-------
%Covariance(Matrix R) : returns gtsam::noiseModel::Gaussian
%SqrtInformation(Matrix R) : returns gtsam::noiseModel::Gaussian
%
classdef Gaussian < gtsam.noiseModel.Base
  properties
    ptr_gtsamnoiseModelGaussian = 0
  end
  methods
    function obj = Gaussian(varargin)
      if (nargin == 2 || (nargin == 3 && strcmp(varargin{3}, 'void'))) && isa(varargin{1}, 'uint64') && varargin{1} == uint64(5139824614673773682)
        if nargin == 2
          my_ptr = varargin{2};
        else
          my_ptr = gtsam_wrapper(565, varargin{2});
        end
        base_ptr = gtsam_wrapper(564, my_ptr);
      else
        error('Arguments do not match any overload of gtsam.noiseModel.Gaussian constructor');
      end
      obj = obj@gtsam.noiseModel.Base(uint64(5139824614673773682), base_ptr);
      obj.ptr_gtsamnoiseModelGaussian = my_ptr;
    end

    function delete(obj)
      gtsam_wrapper(566, obj.ptr_gtsamnoiseModelGaussian);
    end

    function display(obj), obj.print(''); end
    %DISPLAY Calls print on the object
    function disp(obj), obj.display; end
    %DISP Calls print on the object
    function varargout = R(this, varargin)
      % R usage: R() : returns Matrix
      % Doxygen can be found at http://research.cc.gatech.edu/borg/sites/edu.borg/html/index.html
      varargout{1} = gtsam_wrapper(567, this, varargin{:});
    end

    function varargout = equals(this, varargin)
      % EQUALS usage: equals(Base expected, double tol) : returns bool
      % Doxygen can be found at http://research.cc.gatech.edu/borg/sites/edu.borg/html/index.html
      if length(varargin) == 2 && isa(varargin{1},'gtsam.noiseModel.Base') && isa(varargin{2},'double')
        varargout{1} = gtsam_wrapper(568, this, varargin{:});
      else
        error('Arguments do not match any overload of function gtsam.noiseModel.Gaussian.equals');
      end
    end

    function varargout = print(this, varargin)
      % PRINT usage: print(string s) : returns void
      % Doxygen can be found at http://research.cc.gatech.edu/borg/sites/edu.borg/html/index.html
      if length(varargin) == 1 && isa(varargin{1},'char')
        gtsam_wrapper(569, this, varargin{:});
      else
        error('Arguments do not match any overload of function gtsam.noiseModel.Gaussian.print');
      end
    end

  end

  methods(Static = true)
    function varargout = Covariance(varargin)
      % COVARIANCE usage: Covariance(Matrix R) : returns gtsam::noiseModel::Gaussian
      % Doxygen can be found at http://research.cc.gatech.edu/borg/sites/edu.borg/html/index.html
      % 
      % Usage
      % COVARIANCE(Matrix R)
      if length(varargin) == 1 && isa(varargin{1},'double')
        varargout{1} = gtsam_wrapper(570, varargin{:});
      else
        error('Arguments do not match any overload of function gtsam.noiseModel.Gaussian.Covariance');
      end
    end

    function varargout = SqrtInformation(varargin)
      % SQRTINFORMATION usage: SqrtInformation(Matrix R) : returns gtsam::noiseModel::Gaussian
      % Doxygen can be found at http://research.cc.gatech.edu/borg/sites/edu.borg/html/index.html
      % 
      % Usage
      % SQRTINFORMATION(Matrix R)
      if length(varargin) == 1 && isa(varargin{1},'double')
        varargout{1} = gtsam_wrapper(571, varargin{:});
      else
        error('Arguments do not match any overload of function gtsam.noiseModel.Gaussian.SqrtInformation');
      end
    end

  end
end
