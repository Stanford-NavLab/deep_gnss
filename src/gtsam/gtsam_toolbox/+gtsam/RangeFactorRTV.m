%class RangeFactorRTV, see Doxygen page for details
%at http://research.cc.gatech.edu/borg/sites/edu.borg/html/index.html
%
%-------Constructors-------
%RangeFactorRTV(size_t key1, size_t key2, double measured, Base noiseModel)
%
classdef RangeFactorRTV < gtsam.NonlinearFactor
  properties
    ptr_gtsamRangeFactorRTV = 0
  end
  methods
    function obj = RangeFactorRTV(varargin)
      if (nargin == 2 || (nargin == 3 && strcmp(varargin{3}, 'void'))) && isa(varargin{1}, 'uint64') && varargin{1} == uint64(5139824614673773682)
        if nargin == 2
          my_ptr = varargin{2};
        else
          my_ptr = gtsam_unstable_wrapper(363, varargin{2});
        end
        base_ptr = gtsam_unstable_wrapper(362, my_ptr);
      elseif nargin == 4 && isa(varargin{1},'numeric') && isa(varargin{2},'numeric') && isa(varargin{3},'double') && isa(varargin{4},'gtsam.noiseModel.Base')
        [ my_ptr, base_ptr ] = gtsam_unstable_wrapper(364, varargin{1}, varargin{2}, varargin{3}, varargin{4});
      else
        error('Arguments do not match any overload of gtsam.RangeFactorRTV constructor');
      end
      obj = obj@gtsam.NonlinearFactor(uint64(5139824614673773682), base_ptr);
      obj.ptr_gtsamRangeFactorRTV = my_ptr;
    end

    function delete(obj)
      gtsam_unstable_wrapper(365, obj.ptr_gtsamRangeFactorRTV);
    end

    function display(obj), obj.print(''); end
    %DISPLAY Calls print on the object
    function disp(obj), obj.display; end
    %DISP Calls print on the object
  end

  methods(Static = true)
  end
end
