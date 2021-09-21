%class DRollPrior, see Doxygen page for details
%at http://research.cc.gatech.edu/borg/sites/edu.borg/html/index.html
%
%-------Constructors-------
%DRollPrior(size_t key, double wx, Base model)
%DRollPrior(size_t key, Base model)
%
classdef DRollPrior < gtsam.NonlinearFactor
  properties
    ptr_gtsamDRollPrior = 0
  end
  methods
    function obj = DRollPrior(varargin)
      if (nargin == 2 || (nargin == 3 && strcmp(varargin{3}, 'void'))) && isa(varargin{1}, 'uint64') && varargin{1} == uint64(5139824614673773682)
        if nargin == 2
          my_ptr = varargin{2};
        else
          my_ptr = gtsam_unstable_wrapper(252, varargin{2});
        end
        base_ptr = gtsam_unstable_wrapper(251, my_ptr);
      elseif nargin == 3 && isa(varargin{1},'numeric') && isa(varargin{2},'double') && isa(varargin{3},'gtsam.noiseModel.Base')
        [ my_ptr, base_ptr ] = gtsam_unstable_wrapper(253, varargin{1}, varargin{2}, varargin{3});
      elseif nargin == 2 && isa(varargin{1},'numeric') && isa(varargin{2},'gtsam.noiseModel.Base')
        [ my_ptr, base_ptr ] = gtsam_unstable_wrapper(254, varargin{1}, varargin{2});
      else
        error('Arguments do not match any overload of gtsam.DRollPrior constructor');
      end
      obj = obj@gtsam.NonlinearFactor(uint64(5139824614673773682), base_ptr);
      obj.ptr_gtsamDRollPrior = my_ptr;
    end

    function delete(obj)
      gtsam_unstable_wrapper(255, obj.ptr_gtsamDRollPrior);
    end

    function display(obj), obj.print(''); end
    %DISPLAY Calls print on the object
    function disp(obj), obj.display; end
    %DISP Calls print on the object
  end

  methods(Static = true)
  end
end
