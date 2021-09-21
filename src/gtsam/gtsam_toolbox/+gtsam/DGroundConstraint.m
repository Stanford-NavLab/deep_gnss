%class DGroundConstraint, see Doxygen page for details
%at http://research.cc.gatech.edu/borg/sites/edu.borg/html/index.html
%
%-------Constructors-------
%DGroundConstraint(size_t key, double height, Base model)
%DGroundConstraint(size_t key, Vector constraint, Base model)
%
classdef DGroundConstraint < gtsam.NonlinearFactor
  properties
    ptr_gtsamDGroundConstraint = 0
  end
  methods
    function obj = DGroundConstraint(varargin)
      if (nargin == 2 || (nargin == 3 && strcmp(varargin{3}, 'void'))) && isa(varargin{1}, 'uint64') && varargin{1} == uint64(5139824614673773682)
        if nargin == 2
          my_ptr = varargin{2};
        else
          my_ptr = gtsam_unstable_wrapper(261, varargin{2});
        end
        base_ptr = gtsam_unstable_wrapper(260, my_ptr);
      elseif nargin == 3 && isa(varargin{1},'numeric') && isa(varargin{2},'double') && isa(varargin{3},'gtsam.noiseModel.Base')
        [ my_ptr, base_ptr ] = gtsam_unstable_wrapper(262, varargin{1}, varargin{2}, varargin{3});
      elseif nargin == 3 && isa(varargin{1},'numeric') && isa(varargin{2},'double') && isa(varargin{3},'gtsam.noiseModel.Base')
        [ my_ptr, base_ptr ] = gtsam_unstable_wrapper(263, varargin{1}, varargin{2}, varargin{3});
      else
        error('Arguments do not match any overload of gtsam.DGroundConstraint constructor');
      end
      obj = obj@gtsam.NonlinearFactor(uint64(5139824614673773682), base_ptr);
      obj.ptr_gtsamDGroundConstraint = my_ptr;
    end

    function delete(obj)
      gtsam_unstable_wrapper(264, obj.ptr_gtsamDGroundConstraint);
    end

    function display(obj), obj.print(''); end
    %DISPLAY Calls print on the object
    function disp(obj), obj.display; end
    %DISP Calls print on the object
  end

  methods(Static = true)
  end
end
