%class VelocityConstraint3, see Doxygen page for details
%at http://research.cc.gatech.edu/borg/sites/edu.borg/html/index.html
%
%-------Constructors-------
%VelocityConstraint3(size_t key1, size_t key2, size_t velKey, double dt)
%
%-------Methods-------
%evaluateError(LieScalar x1, LieScalar x2, LieScalar v) : returns Vector
%
classdef VelocityConstraint3 < gtsam.NonlinearFactor
  properties
    ptr_gtsamVelocityConstraint3 = 0
  end
  methods
    function obj = VelocityConstraint3(varargin)
      if (nargin == 2 || (nargin == 3 && strcmp(varargin{3}, 'void'))) && isa(varargin{1}, 'uint64') && varargin{1} == uint64(5139824614673773682)
        if nargin == 2
          my_ptr = varargin{2};
        else
          my_ptr = gtsam_unstable_wrapper(266, varargin{2});
        end
        base_ptr = gtsam_unstable_wrapper(265, my_ptr);
      elseif nargin == 4 && isa(varargin{1},'numeric') && isa(varargin{2},'numeric') && isa(varargin{3},'numeric') && isa(varargin{4},'double')
        [ my_ptr, base_ptr ] = gtsam_unstable_wrapper(267, varargin{1}, varargin{2}, varargin{3}, varargin{4});
      else
        error('Arguments do not match any overload of gtsam.VelocityConstraint3 constructor');
      end
      obj = obj@gtsam.NonlinearFactor(uint64(5139824614673773682), base_ptr);
      obj.ptr_gtsamVelocityConstraint3 = my_ptr;
    end

    function delete(obj)
      gtsam_unstable_wrapper(268, obj.ptr_gtsamVelocityConstraint3);
    end

    function display(obj), obj.print(''); end
    %DISPLAY Calls print on the object
    function disp(obj), obj.display; end
    %DISP Calls print on the object
    function varargout = evaluateError(this, varargin)
      % EVALUATEERROR usage: evaluateError(LieScalar x1, LieScalar x2, LieScalar v) : returns Vector
      % Doxygen can be found at http://research.cc.gatech.edu/borg/sites/edu.borg/html/index.html
      if length(varargin) == 3 && isa(varargin{1},'gtsam.LieScalar') && isa(varargin{2},'gtsam.LieScalar') && isa(varargin{3},'gtsam.LieScalar')
        varargout{1} = gtsam_unstable_wrapper(269, this, varargin{:});
      else
        error('Arguments do not match any overload of function gtsam.VelocityConstraint3.evaluateError');
      end
    end

  end

  methods(Static = true)
  end
end
