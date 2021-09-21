%class EssentialMatrix, see Doxygen page for details
%at http://research.cc.gatech.edu/borg/sites/edu.borg/html/index.html
%
%-------Constructors-------
%EssentialMatrix(Rot3 aRb, Unit3 aTb)
%
%-------Methods-------
%dim() : returns size_t
%direction() : returns gtsam::Unit3
%equals(EssentialMatrix pose, double tol) : returns bool
%error(Vector vA, Vector vB) : returns double
%localCoordinates(EssentialMatrix s) : returns Vector
%matrix() : returns Matrix
%print(string s) : returns void
%retract(Vector v) : returns gtsam::EssentialMatrix
%rotation() : returns gtsam::Rot3
%
%-------Static Methods-------
%Dim() : returns size_t
%
classdef EssentialMatrix < gtsam.Value
  properties
    ptr_gtsamEssentialMatrix = 0
  end
  methods
    function obj = EssentialMatrix(varargin)
      if (nargin == 2 || (nargin == 3 && strcmp(varargin{3}, 'void'))) && isa(varargin{1}, 'uint64') && varargin{1} == uint64(5139824614673773682)
        if nargin == 2
          my_ptr = varargin{2};
        else
          my_ptr = gtsam_wrapper(292, varargin{2});
        end
        base_ptr = gtsam_wrapper(291, my_ptr);
      elseif nargin == 2 && isa(varargin{1},'gtsam.Rot3') && isa(varargin{2},'gtsam.Unit3')
        [ my_ptr, base_ptr ] = gtsam_wrapper(293, varargin{1}, varargin{2});
      else
        error('Arguments do not match any overload of gtsam.EssentialMatrix constructor');
      end
      obj = obj@gtsam.Value(uint64(5139824614673773682), base_ptr);
      obj.ptr_gtsamEssentialMatrix = my_ptr;
    end

    function delete(obj)
      gtsam_wrapper(294, obj.ptr_gtsamEssentialMatrix);
    end

    function display(obj), obj.print(''); end
    %DISPLAY Calls print on the object
    function disp(obj), obj.display; end
    %DISP Calls print on the object
    function varargout = dim(this, varargin)
      % DIM usage: dim() : returns size_t
      % Doxygen can be found at http://research.cc.gatech.edu/borg/sites/edu.borg/html/index.html
      varargout{1} = gtsam_wrapper(295, this, varargin{:});
    end

    function varargout = direction(this, varargin)
      % DIRECTION usage: direction() : returns gtsam::Unit3
      % Doxygen can be found at http://research.cc.gatech.edu/borg/sites/edu.borg/html/index.html
      varargout{1} = gtsam_wrapper(296, this, varargin{:});
    end

    function varargout = equals(this, varargin)
      % EQUALS usage: equals(EssentialMatrix pose, double tol) : returns bool
      % Doxygen can be found at http://research.cc.gatech.edu/borg/sites/edu.borg/html/index.html
      if length(varargin) == 2 && isa(varargin{1},'gtsam.EssentialMatrix') && isa(varargin{2},'double')
        varargout{1} = gtsam_wrapper(297, this, varargin{:});
      else
        error('Arguments do not match any overload of function gtsam.EssentialMatrix.equals');
      end
    end

    function varargout = error(this, varargin)
      % ERROR usage: error(Vector vA, Vector vB) : returns double
      % Doxygen can be found at http://research.cc.gatech.edu/borg/sites/edu.borg/html/index.html
      if length(varargin) == 2 && isa(varargin{1},'double') && isa(varargin{2},'double')
        varargout{1} = gtsam_wrapper(298, this, varargin{:});
      else
        error('Arguments do not match any overload of function gtsam.EssentialMatrix.error');
      end
    end

    function varargout = localCoordinates(this, varargin)
      % LOCALCOORDINATES usage: localCoordinates(EssentialMatrix s) : returns Vector
      % Doxygen can be found at http://research.cc.gatech.edu/borg/sites/edu.borg/html/index.html
      if length(varargin) == 1 && isa(varargin{1},'gtsam.EssentialMatrix')
        varargout{1} = gtsam_wrapper(299, this, varargin{:});
      else
        error('Arguments do not match any overload of function gtsam.EssentialMatrix.localCoordinates');
      end
    end

    function varargout = matrix(this, varargin)
      % MATRIX usage: matrix() : returns Matrix
      % Doxygen can be found at http://research.cc.gatech.edu/borg/sites/edu.borg/html/index.html
      varargout{1} = gtsam_wrapper(300, this, varargin{:});
    end

    function varargout = print(this, varargin)
      % PRINT usage: print(string s) : returns void
      % Doxygen can be found at http://research.cc.gatech.edu/borg/sites/edu.borg/html/index.html
      if length(varargin) == 1 && isa(varargin{1},'char')
        gtsam_wrapper(301, this, varargin{:});
      else
        error('Arguments do not match any overload of function gtsam.EssentialMatrix.print');
      end
    end

    function varargout = retract(this, varargin)
      % RETRACT usage: retract(Vector v) : returns gtsam::EssentialMatrix
      % Doxygen can be found at http://research.cc.gatech.edu/borg/sites/edu.borg/html/index.html
      if length(varargin) == 1 && isa(varargin{1},'double')
        varargout{1} = gtsam_wrapper(302, this, varargin{:});
      else
        error('Arguments do not match any overload of function gtsam.EssentialMatrix.retract');
      end
    end

    function varargout = rotation(this, varargin)
      % ROTATION usage: rotation() : returns gtsam::Rot3
      % Doxygen can be found at http://research.cc.gatech.edu/borg/sites/edu.borg/html/index.html
      varargout{1} = gtsam_wrapper(303, this, varargin{:});
    end

  end

  methods(Static = true)
    function varargout = Dim(varargin)
      % DIM usage: Dim() : returns size_t
      % Doxygen can be found at http://research.cc.gatech.edu/borg/sites/edu.borg/html/index.html
      % 
      % Usage
      % DIM()
      if length(varargin) == 0
        varargout{1} = gtsam_wrapper(304, varargin{:});
      else
        error('Arguments do not match any overload of function gtsam.EssentialMatrix.Dim');
      end
    end

  end
end
