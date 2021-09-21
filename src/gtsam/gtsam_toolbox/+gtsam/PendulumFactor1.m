%class PendulumFactor1, see Doxygen page for details
%at http://research.cc.gatech.edu/borg/sites/edu.borg/html/index.html
%
%-------Constructors-------
%PendulumFactor1(size_t k1, size_t k, size_t velKey, double dt)
%
%-------Methods-------
%evaluateError(LieScalar qk1, LieScalar qk, LieScalar v) : returns Vector
%
classdef PendulumFactor1 < gtsam.NonlinearFactor
  properties
    ptr_gtsamPendulumFactor1 = 0
  end
  methods
    function obj = PendulumFactor1(varargin)
      if (nargin == 2 || (nargin == 3 && strcmp(varargin{3}, 'void'))) && isa(varargin{1}, 'uint64') && varargin{1} == uint64(5139824614673773682)
        if nargin == 2
          my_ptr = varargin{2};
        else
          my_ptr = gtsam_unstable_wrapper(271, varargin{2});
        end
        base_ptr = gtsam_unstable_wrapper(270, my_ptr);
      elseif nargin == 4 && isa(varargin{1},'numeric') && isa(varargin{2},'numeric') && isa(varargin{3},'numeric') && isa(varargin{4},'double')
        [ my_ptr, base_ptr ] = gtsam_unstable_wrapper(272, varargin{1}, varargin{2}, varargin{3}, varargin{4});
      else
        error('Arguments do not match any overload of gtsam.PendulumFactor1 constructor');
      end
      obj = obj@gtsam.NonlinearFactor(uint64(5139824614673773682), base_ptr);
      obj.ptr_gtsamPendulumFactor1 = my_ptr;
    end

    function delete(obj)
      gtsam_unstable_wrapper(273, obj.ptr_gtsamPendulumFactor1);
    end

    function display(obj), obj.print(''); end
    %DISPLAY Calls print on the object
    function disp(obj), obj.display; end
    %DISP Calls print on the object
    function varargout = evaluateError(this, varargin)
      % EVALUATEERROR usage: evaluateError(LieScalar qk1, LieScalar qk, LieScalar v) : returns Vector
      % Doxygen can be found at http://research.cc.gatech.edu/borg/sites/edu.borg/html/index.html
      if length(varargin) == 3 && isa(varargin{1},'gtsam.LieScalar') && isa(varargin{2},'gtsam.LieScalar') && isa(varargin{3},'gtsam.LieScalar')
        varargout{1} = gtsam_unstable_wrapper(274, this, varargin{:});
      else
        error('Arguments do not match any overload of function gtsam.PendulumFactor1.evaluateError');
      end
    end

  end

  methods(Static = true)
  end
end
