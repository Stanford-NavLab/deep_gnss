%class BetweenFactorPoseRTV, see Doxygen page for details
%at http://research.cc.gatech.edu/borg/sites/edu.borg/html/index.html
%
%-------Constructors-------
%BetweenFactorPoseRTV(size_t key1, size_t key2, PoseRTV relativePose, Base noiseModel)
%
classdef BetweenFactorPoseRTV < gtsam.NonlinearFactor
  properties
    ptr_gtsamBetweenFactorPoseRTV = 0
  end
  methods
    function obj = BetweenFactorPoseRTV(varargin)
      if (nargin == 2 || (nargin == 3 && strcmp(varargin{3}, 'void'))) && isa(varargin{1}, 'uint64') && varargin{1} == uint64(5139824614673773682)
        if nargin == 2
          my_ptr = varargin{2};
        else
          my_ptr = gtsam_unstable_wrapper(177, varargin{2});
        end
        base_ptr = gtsam_unstable_wrapper(176, my_ptr);
      elseif nargin == 4 && isa(varargin{1},'numeric') && isa(varargin{2},'numeric') && isa(varargin{3},'gtsam.PoseRTV') && isa(varargin{4},'gtsam.noiseModel.Base')
        [ my_ptr, base_ptr ] = gtsam_unstable_wrapper(178, varargin{1}, varargin{2}, varargin{3}, varargin{4});
      else
        error('Arguments do not match any overload of gtsam.BetweenFactorPoseRTV constructor');
      end
      obj = obj@gtsam.NonlinearFactor(uint64(5139824614673773682), base_ptr);
      obj.ptr_gtsamBetweenFactorPoseRTV = my_ptr;
    end

    function delete(obj)
      gtsam_unstable_wrapper(179, obj.ptr_gtsamBetweenFactorPoseRTV);
    end

    function display(obj), obj.print(''); end
    %DISPLAY Calls print on the object
    function disp(obj), obj.display; end
    %DISP Calls print on the object
  end

  methods(Static = true)
  end
end
