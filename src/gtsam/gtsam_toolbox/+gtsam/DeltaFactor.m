%class DeltaFactor, see Doxygen page for details
%at http://research.cc.gatech.edu/borg/sites/edu.borg/html/index.html
%
%-------Constructors-------
%DeltaFactor(size_t i, size_t j, Point2 measured, Base noiseModel)
%
%-------Methods-------
%print(string s) : returns void
%
classdef DeltaFactor < gtsam.NoiseModelFactor
  properties
    ptr_gtsamDeltaFactor = 0
  end
  methods
    function obj = DeltaFactor(varargin)
      if (nargin == 2 || (nargin == 3 && strcmp(varargin{3}, 'void'))) && isa(varargin{1}, 'uint64') && varargin{1} == uint64(5139824614673773682)
        if nargin == 2
          my_ptr = varargin{2};
        else
          my_ptr = gtsam_unstable_wrapper(348, varargin{2});
        end
        base_ptr = gtsam_unstable_wrapper(347, my_ptr);
      elseif nargin == 4 && isa(varargin{1},'numeric') && isa(varargin{2},'numeric') && isa(varargin{3},'gtsam.Point2') && isa(varargin{4},'gtsam.noiseModel.Base')
        [ my_ptr, base_ptr ] = gtsam_unstable_wrapper(349, varargin{1}, varargin{2}, varargin{3}, varargin{4});
      else
        error('Arguments do not match any overload of gtsam.DeltaFactor constructor');
      end
      obj = obj@gtsam.NoiseModelFactor(uint64(5139824614673773682), base_ptr);
      obj.ptr_gtsamDeltaFactor = my_ptr;
    end

    function delete(obj)
      gtsam_unstable_wrapper(350, obj.ptr_gtsamDeltaFactor);
    end

    function display(obj), obj.print(''); end
    %DISPLAY Calls print on the object
    function disp(obj), obj.display; end
    %DISP Calls print on the object
    function varargout = print(this, varargin)
      % PRINT usage: print(string s) : returns void
      % Doxygen can be found at http://research.cc.gatech.edu/borg/sites/edu.borg/html/index.html
      if length(varargin) == 1 && isa(varargin{1},'char')
        gtsam_unstable_wrapper(351, this, varargin{:});
      else
        error('Arguments do not match any overload of function gtsam.DeltaFactor.print');
      end
    end

  end

  methods(Static = true)
  end
end
