%class InvDepthFactorVariant1, see Doxygen page for details
%at http://research.cc.gatech.edu/borg/sites/edu.borg/html/index.html
%
%-------Constructors-------
%InvDepthFactorVariant1(size_t poseKey, size_t landmarkKey, Point2 measured, Cal3_S2 K, Base model)
%
classdef InvDepthFactorVariant1 < gtsam.NonlinearFactor
  properties
    ptr_gtsamInvDepthFactorVariant1 = 0
  end
  methods
    function obj = InvDepthFactorVariant1(varargin)
      if (nargin == 2 || (nargin == 3 && strcmp(varargin{3}, 'void'))) && isa(varargin{1}, 'uint64') && varargin{1} == uint64(5139824614673773682)
        if nargin == 2
          my_ptr = varargin{2};
        else
          my_ptr = gtsam_unstable_wrapper(312, varargin{2});
        end
        base_ptr = gtsam_unstable_wrapper(311, my_ptr);
      elseif nargin == 5 && isa(varargin{1},'numeric') && isa(varargin{2},'numeric') && isa(varargin{3},'gtsam.Point2') && isa(varargin{4},'gtsam.Cal3_S2') && isa(varargin{5},'gtsam.noiseModel.Base')
        [ my_ptr, base_ptr ] = gtsam_unstable_wrapper(313, varargin{1}, varargin{2}, varargin{3}, varargin{4}, varargin{5});
      else
        error('Arguments do not match any overload of gtsam.InvDepthFactorVariant1 constructor');
      end
      obj = obj@gtsam.NonlinearFactor(uint64(5139824614673773682), base_ptr);
      obj.ptr_gtsamInvDepthFactorVariant1 = my_ptr;
    end

    function delete(obj)
      gtsam_unstable_wrapper(314, obj.ptr_gtsamInvDepthFactorVariant1);
    end

    function display(obj), obj.print(''); end
    %DISPLAY Calls print on the object
    function disp(obj), obj.display; end
    %DISP Calls print on the object
  end

  methods(Static = true)
  end
end
