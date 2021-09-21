%class DeltaFactorBase, see Doxygen page for details
%at http://research.cc.gatech.edu/borg/sites/edu.borg/html/index.html
%
%-------Constructors-------
%DeltaFactorBase(size_t b1, size_t i, size_t b2, size_t j, Point2 measured, Base noiseModel)
%
%-------Methods-------
%print(string s) : returns void
%
classdef DeltaFactorBase < gtsam.NoiseModelFactor
  properties
    ptr_gtsamDeltaFactorBase = 0
  end
  methods
    function obj = DeltaFactorBase(varargin)
      if (nargin == 2 || (nargin == 3 && strcmp(varargin{3}, 'void'))) && isa(varargin{1}, 'uint64') && varargin{1} == uint64(5139824614673773682)
        if nargin == 2
          my_ptr = varargin{2};
        else
          my_ptr = gtsam_unstable_wrapper(353, varargin{2});
        end
        base_ptr = gtsam_unstable_wrapper(352, my_ptr);
      elseif nargin == 6 && isa(varargin{1},'numeric') && isa(varargin{2},'numeric') && isa(varargin{3},'numeric') && isa(varargin{4},'numeric') && isa(varargin{5},'gtsam.Point2') && isa(varargin{6},'gtsam.noiseModel.Base')
        [ my_ptr, base_ptr ] = gtsam_unstable_wrapper(354, varargin{1}, varargin{2}, varargin{3}, varargin{4}, varargin{5}, varargin{6});
      else
        error('Arguments do not match any overload of gtsam.DeltaFactorBase constructor');
      end
      obj = obj@gtsam.NoiseModelFactor(uint64(5139824614673773682), base_ptr);
      obj.ptr_gtsamDeltaFactorBase = my_ptr;
    end

    function delete(obj)
      gtsam_unstable_wrapper(355, obj.ptr_gtsamDeltaFactorBase);
    end

    function display(obj), obj.print(''); end
    %DISPLAY Calls print on the object
    function disp(obj), obj.display; end
    %DISP Calls print on the object
    function varargout = print(this, varargin)
      % PRINT usage: print(string s) : returns void
      % Doxygen can be found at http://research.cc.gatech.edu/borg/sites/edu.borg/html/index.html
      if length(varargin) == 1 && isa(varargin{1},'char')
        gtsam_unstable_wrapper(356, this, varargin{:});
      else
        error('Arguments do not match any overload of function gtsam.DeltaFactorBase.print');
      end
    end

  end

  methods(Static = true)
  end
end
