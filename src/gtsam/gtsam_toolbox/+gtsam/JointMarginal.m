%class JointMarginal, see Doxygen page for details
%at http://research.cc.gatech.edu/borg/sites/edu.borg/html/index.html
%
%-------Methods-------
%at(size_t iVariable, size_t jVariable) : returns Matrix
%fullMatrix() : returns Matrix
%print(string s) : returns void
%print() : returns void
%
classdef JointMarginal < handle
  properties
    ptr_gtsamJointMarginal = 0
  end
  methods
    function obj = JointMarginal(varargin)
      if nargin == 2 && isa(varargin{1}, 'uint64') && varargin{1} == uint64(5139824614673773682)
        my_ptr = varargin{2};
        gtsam_wrapper(1123, my_ptr);
      else
        error('Arguments do not match any overload of gtsam.JointMarginal constructor');
      end
      obj.ptr_gtsamJointMarginal = my_ptr;
    end

    function delete(obj)
      gtsam_wrapper(1124, obj.ptr_gtsamJointMarginal);
    end

    function display(obj), obj.print(''); end
    %DISPLAY Calls print on the object
    function disp(obj), obj.display; end
    %DISP Calls print on the object
    function varargout = at(this, varargin)
      % AT usage: at(size_t iVariable, size_t jVariable) : returns Matrix
      % Doxygen can be found at http://research.cc.gatech.edu/borg/sites/edu.borg/html/index.html
      varargout{1} = gtsam_wrapper(1125, this, varargin{:});
    end

    function varargout = fullMatrix(this, varargin)
      % FULLMATRIX usage: fullMatrix() : returns Matrix
      % Doxygen can be found at http://research.cc.gatech.edu/borg/sites/edu.borg/html/index.html
      varargout{1} = gtsam_wrapper(1126, this, varargin{:});
    end

    function varargout = print(this, varargin)
      % PRINT usage: print(string s), print() : returns void
      % Doxygen can be found at http://research.cc.gatech.edu/borg/sites/edu.borg/html/index.html
      % 
      % Method Overloads
      % print(string s)
      % print()
      if length(varargin) == 1 && isa(varargin{1},'char')
        gtsam_wrapper(1127, this, varargin{:});
      elseif length(varargin) == 0
        gtsam_wrapper(1128, this, varargin{:});
      else
        error('Arguments do not match any overload of function gtsam.JointMarginal.print');
      end
    end

  end

  methods(Static = true)
  end
end
