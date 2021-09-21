%class DHeightPrior, see Doxygen page for details
%at http://research.cc.gatech.edu/borg/sites/edu.borg/html/index.html
%
%-------Constructors-------
%DHeightPrior(size_t key, double height, Base model)
%
classdef DHeightPrior < gtsam.NonlinearFactor
  properties
    ptr_gtsamDHeightPrior = 0
  end
  methods
    function obj = DHeightPrior(varargin)
      if (nargin == 2 || (nargin == 3 && strcmp(varargin{3}, 'void'))) && isa(varargin{1}, 'uint64') && varargin{1} == uint64(5139824614673773682)
        if nargin == 2
          my_ptr = varargin{2};
        else
          my_ptr = gtsam_unstable_wrapper(248, varargin{2});
        end
        base_ptr = gtsam_unstable_wrapper(247, my_ptr);
      elseif nargin == 3 && isa(varargin{1},'numeric') && isa(varargin{2},'double') && isa(varargin{3},'gtsam.noiseModel.Base')
        [ my_ptr, base_ptr ] = gtsam_unstable_wrapper(249, varargin{1}, varargin{2}, varargin{3});
      else
        error('Arguments do not match any overload of gtsam.DHeightPrior constructor');
      end
      obj = obj@gtsam.NonlinearFactor(uint64(5139824614673773682), base_ptr);
      obj.ptr_gtsamDHeightPrior = my_ptr;
    end

    function delete(obj)
      gtsam_unstable_wrapper(250, obj.ptr_gtsamDHeightPrior);
    end

    function display(obj), obj.print(''); end
    %DISPLAY Calls print on the object
    function disp(obj), obj.display; end
    %DISP Calls print on the object
  end

  methods(Static = true)
  end
end
