%class Isotropic, see Doxygen page for details
%at http://research.cc.gatech.edu/borg/sites/edu.borg/html/index.html
%
%-------Methods-------
%print(string s) : returns void
%
%-------Static Methods-------
%Precision(size_t dim, double precision) : returns gtsam::noiseModel::Isotropic
%Sigma(size_t dim, double sigma) : returns gtsam::noiseModel::Isotropic
%Variance(size_t dim, double varianace) : returns gtsam::noiseModel::Isotropic
%
classdef Isotropic < gtsam.noiseModel.Diagonal
  properties
    ptr_gtsamnoiseModelIsotropic = 0
  end
  methods
    function obj = Isotropic(varargin)
      if (nargin == 2 || (nargin == 3 && strcmp(varargin{3}, 'void'))) && isa(varargin{1}, 'uint64') && varargin{1} == uint64(5139824614673773682)
        if nargin == 2
          my_ptr = varargin{2};
        else
          my_ptr = gtsam_wrapper(593, varargin{2});
        end
        base_ptr = gtsam_wrapper(592, my_ptr);
      else
        error('Arguments do not match any overload of gtsam.noiseModel.Isotropic constructor');
      end
      obj = obj@gtsam.noiseModel.Diagonal(uint64(5139824614673773682), base_ptr);
      obj.ptr_gtsamnoiseModelIsotropic = my_ptr;
    end

    function delete(obj)
      gtsam_wrapper(594, obj.ptr_gtsamnoiseModelIsotropic);
    end

    function display(obj), obj.print(''); end
    %DISPLAY Calls print on the object
    function disp(obj), obj.display; end
    %DISP Calls print on the object
    function varargout = print(this, varargin)
      % PRINT usage: print(string s) : returns void
      % Doxygen can be found at http://research.cc.gatech.edu/borg/sites/edu.borg/html/index.html
      if length(varargin) == 1 && isa(varargin{1},'char')
        gtsam_wrapper(595, this, varargin{:});
      else
        error('Arguments do not match any overload of function gtsam.noiseModel.Isotropic.print');
      end
    end

  end

  methods(Static = true)
    function varargout = Precision(varargin)
      % PRECISION usage: Precision(size_t dim, double precision) : returns gtsam::noiseModel::Isotropic
      % Doxygen can be found at http://research.cc.gatech.edu/borg/sites/edu.borg/html/index.html
      % 
      % Usage
      % PRECISION(size_t dim, double precision)
      if length(varargin) == 2 && isa(varargin{1},'numeric') && isa(varargin{2},'double')
        varargout{1} = gtsam_wrapper(596, varargin{:});
      else
        error('Arguments do not match any overload of function gtsam.noiseModel.Isotropic.Precision');
      end
    end

    function varargout = Sigma(varargin)
      % SIGMA usage: Sigma(size_t dim, double sigma) : returns gtsam::noiseModel::Isotropic
      % Doxygen can be found at http://research.cc.gatech.edu/borg/sites/edu.borg/html/index.html
      % 
      % Usage
      % SIGMA(size_t dim, double sigma)
      if length(varargin) == 2 && isa(varargin{1},'numeric') && isa(varargin{2},'double')
        varargout{1} = gtsam_wrapper(597, varargin{:});
      else
        error('Arguments do not match any overload of function gtsam.noiseModel.Isotropic.Sigma');
      end
    end

    function varargout = Variance(varargin)
      % VARIANCE usage: Variance(size_t dim, double varianace) : returns gtsam::noiseModel::Isotropic
      % Doxygen can be found at http://research.cc.gatech.edu/borg/sites/edu.borg/html/index.html
      % 
      % Usage
      % VARIANCE(size_t dim, double varianace)
      if length(varargin) == 2 && isa(varargin{1},'numeric') && isa(varargin{2},'double')
        varargout{1} = gtsam_wrapper(598, varargin{:});
      else
        error('Arguments do not match any overload of function gtsam.noiseModel.Isotropic.Variance');
      end
    end

  end
end
