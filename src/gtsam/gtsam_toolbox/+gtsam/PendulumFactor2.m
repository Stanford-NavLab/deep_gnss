%class PendulumFactor2, see Doxygen page for details
%at http://research.cc.gatech.edu/borg/sites/edu.borg/html/index.html
%
%-------Constructors-------
%PendulumFactor2(size_t vk1, size_t vk, size_t qKey, double dt, double L, double g)
%
%-------Methods-------
%evaluateError(LieScalar vk1, LieScalar vk, LieScalar q) : returns Vector
%
classdef PendulumFactor2 < gtsam.NonlinearFactor
  properties
    ptr_gtsamPendulumFactor2 = 0
  end
  methods
    function obj = PendulumFactor2(varargin)
      if (nargin == 2 || (nargin == 3 && strcmp(varargin{3}, 'void'))) && isa(varargin{1}, 'uint64') && varargin{1} == uint64(5139824614673773682)
        if nargin == 2
          my_ptr = varargin{2};
        else
          my_ptr = gtsam_unstable_wrapper(276, varargin{2});
        end
        base_ptr = gtsam_unstable_wrapper(275, my_ptr);
      elseif nargin == 6 && isa(varargin{1},'numeric') && isa(varargin{2},'numeric') && isa(varargin{3},'numeric') && isa(varargin{4},'double') && isa(varargin{5},'double') && isa(varargin{6},'double')
        [ my_ptr, base_ptr ] = gtsam_unstable_wrapper(277, varargin{1}, varargin{2}, varargin{3}, varargin{4}, varargin{5}, varargin{6});
      else
        error('Arguments do not match any overload of gtsam.PendulumFactor2 constructor');
      end
      obj = obj@gtsam.NonlinearFactor(uint64(5139824614673773682), base_ptr);
      obj.ptr_gtsamPendulumFactor2 = my_ptr;
    end

    function delete(obj)
      gtsam_unstable_wrapper(278, obj.ptr_gtsamPendulumFactor2);
    end

    function display(obj), obj.print(''); end
    %DISPLAY Calls print on the object
    function disp(obj), obj.display; end
    %DISP Calls print on the object
    function varargout = evaluateError(this, varargin)
      % EVALUATEERROR usage: evaluateError(LieScalar vk1, LieScalar vk, LieScalar q) : returns Vector
      % Doxygen can be found at http://research.cc.gatech.edu/borg/sites/edu.borg/html/index.html
      if length(varargin) == 3 && isa(varargin{1},'gtsam.LieScalar') && isa(varargin{2},'gtsam.LieScalar') && isa(varargin{3},'gtsam.LieScalar')
        varargout{1} = gtsam_unstable_wrapper(279, this, varargin{:});
      else
        error('Arguments do not match any overload of function gtsam.PendulumFactor2.evaluateError');
      end
    end

  end

  methods(Static = true)
  end
end
