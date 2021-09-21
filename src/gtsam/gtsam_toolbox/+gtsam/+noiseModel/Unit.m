%class Unit, see Doxygen page for details
%at http://research.cc.gatech.edu/borg/sites/edu.borg/html/index.html
%
%-------Methods-------
%print(string s) : returns void
%
%-------Static Methods-------
%Create(size_t dim) : returns gtsam::noiseModel::Unit
%
classdef Unit < gtsam.noiseModel.Isotropic
  properties
    ptr_gtsamnoiseModelUnit = 0
  end
  methods
    function obj = Unit(varargin)
      if (nargin == 2 || (nargin == 3 && strcmp(varargin{3}, 'void'))) && isa(varargin{1}, 'uint64') && varargin{1} == uint64(5139824614673773682)
        if nargin == 2
          my_ptr = varargin{2};
        else
          my_ptr = gtsam_wrapper(600, varargin{2});
        end
        base_ptr = gtsam_wrapper(599, my_ptr);
      else
        error('Arguments do not match any overload of gtsam.noiseModel.Unit constructor');
      end
      obj = obj@gtsam.noiseModel.Isotropic(uint64(5139824614673773682), base_ptr);
      obj.ptr_gtsamnoiseModelUnit = my_ptr;
    end

    function delete(obj)
      gtsam_wrapper(601, obj.ptr_gtsamnoiseModelUnit);
    end

    function display(obj), obj.print(''); end
    %DISPLAY Calls print on the object
    function disp(obj), obj.display; end
    %DISP Calls print on the object
    function varargout = print(this, varargin)
      % PRINT usage: print(string s) : returns void
      % Doxygen can be found at http://research.cc.gatech.edu/borg/sites/edu.borg/html/index.html
      if length(varargin) == 1 && isa(varargin{1},'char')
        gtsam_wrapper(602, this, varargin{:});
      else
        error('Arguments do not match any overload of function gtsam.noiseModel.Unit.print');
      end
    end

  end

  methods(Static = true)
    function varargout = Create(varargin)
      % CREATE usage: Create(size_t dim) : returns gtsam::noiseModel::Unit
      % Doxygen can be found at http://research.cc.gatech.edu/borg/sites/edu.borg/html/index.html
      % 
      % Usage
      % CREATE(size_t dim)
      if length(varargin) == 1 && isa(varargin{1},'numeric')
        varargout{1} = gtsam_wrapper(603, varargin{:});
      else
        error('Arguments do not match any overload of function gtsam.noiseModel.Unit.Create');
      end
    end

  end
end
