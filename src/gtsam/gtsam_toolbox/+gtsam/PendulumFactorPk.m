%class PendulumFactorPk, see Doxygen page for details
%at http://research.cc.gatech.edu/borg/sites/edu.borg/html/index.html
%
%-------Constructors-------
%PendulumFactorPk(size_t pk, size_t qk, size_t qk1, double h, double m, double r, double g, double alpha)
%
%-------Methods-------
%evaluateError(LieScalar pk, LieScalar qk, LieScalar qk1) : returns Vector
%
classdef PendulumFactorPk < gtsam.NonlinearFactor
  properties
    ptr_gtsamPendulumFactorPk = 0
  end
  methods
    function obj = PendulumFactorPk(varargin)
      if (nargin == 2 || (nargin == 3 && strcmp(varargin{3}, 'void'))) && isa(varargin{1}, 'uint64') && varargin{1} == uint64(5139824614673773682)
        if nargin == 2
          my_ptr = varargin{2};
        else
          my_ptr = gtsam_unstable_wrapper(281, varargin{2});
        end
        base_ptr = gtsam_unstable_wrapper(280, my_ptr);
      elseif nargin == 8 && isa(varargin{1},'numeric') && isa(varargin{2},'numeric') && isa(varargin{3},'numeric') && isa(varargin{4},'double') && isa(varargin{5},'double') && isa(varargin{6},'double') && isa(varargin{7},'double') && isa(varargin{8},'double')
        [ my_ptr, base_ptr ] = gtsam_unstable_wrapper(282, varargin{1}, varargin{2}, varargin{3}, varargin{4}, varargin{5}, varargin{6}, varargin{7}, varargin{8});
      else
        error('Arguments do not match any overload of gtsam.PendulumFactorPk constructor');
      end
      obj = obj@gtsam.NonlinearFactor(uint64(5139824614673773682), base_ptr);
      obj.ptr_gtsamPendulumFactorPk = my_ptr;
    end

    function delete(obj)
      gtsam_unstable_wrapper(283, obj.ptr_gtsamPendulumFactorPk);
    end

    function display(obj), obj.print(''); end
    %DISPLAY Calls print on the object
    function disp(obj), obj.display; end
    %DISP Calls print on the object
    function varargout = evaluateError(this, varargin)
      % EVALUATEERROR usage: evaluateError(LieScalar pk, LieScalar qk, LieScalar qk1) : returns Vector
      % Doxygen can be found at http://research.cc.gatech.edu/borg/sites/edu.borg/html/index.html
      if length(varargin) == 3 && isa(varargin{1},'gtsam.LieScalar') && isa(varargin{2},'gtsam.LieScalar') && isa(varargin{3},'gtsam.LieScalar')
        varargout{1} = gtsam_unstable_wrapper(284, this, varargin{:});
      else
        error('Arguments do not match any overload of function gtsam.PendulumFactorPk.evaluateError');
      end
    end

  end

  methods(Static = true)
  end
end
