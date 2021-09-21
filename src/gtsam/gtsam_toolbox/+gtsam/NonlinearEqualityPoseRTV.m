%class NonlinearEqualityPoseRTV, see Doxygen page for details
%at http://research.cc.gatech.edu/borg/sites/edu.borg/html/index.html
%
%-------Constructors-------
%NonlinearEqualityPoseRTV(size_t j, PoseRTV feasible)
%NonlinearEqualityPoseRTV(size_t j, PoseRTV feasible, double error_gain)
%
classdef NonlinearEqualityPoseRTV < gtsam.NonlinearFactor
  properties
    ptr_gtsamNonlinearEqualityPoseRTV = 0
  end
  methods
    function obj = NonlinearEqualityPoseRTV(varargin)
      if (nargin == 2 || (nargin == 3 && strcmp(varargin{3}, 'void'))) && isa(varargin{1}, 'uint64') && varargin{1} == uint64(5139824614673773682)
        if nargin == 2
          my_ptr = varargin{2};
        else
          my_ptr = gtsam_unstable_wrapper(223, varargin{2});
        end
        base_ptr = gtsam_unstable_wrapper(222, my_ptr);
      elseif nargin == 2 && isa(varargin{1},'numeric') && isa(varargin{2},'gtsam.PoseRTV')
        [ my_ptr, base_ptr ] = gtsam_unstable_wrapper(224, varargin{1}, varargin{2});
      elseif nargin == 3 && isa(varargin{1},'numeric') && isa(varargin{2},'gtsam.PoseRTV') && isa(varargin{3},'double')
        [ my_ptr, base_ptr ] = gtsam_unstable_wrapper(225, varargin{1}, varargin{2}, varargin{3});
      else
        error('Arguments do not match any overload of gtsam.NonlinearEqualityPoseRTV constructor');
      end
      obj = obj@gtsam.NonlinearFactor(uint64(5139824614673773682), base_ptr);
      obj.ptr_gtsamNonlinearEqualityPoseRTV = my_ptr;
    end

    function delete(obj)
      gtsam_unstable_wrapper(226, obj.ptr_gtsamNonlinearEqualityPoseRTV);
    end

    function display(obj), obj.print(''); end
    %DISPLAY Calls print on the object
    function disp(obj), obj.display; end
    %DISP Calls print on the object
  end

  methods(Static = true)
  end
end
