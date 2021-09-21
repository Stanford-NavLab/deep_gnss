%class SimWall2DVector, see Doxygen page for details
%at http://research.cc.gatech.edu/borg/sites/edu.borg/html/index.html
%
%-------Methods-------
%assign(size_t n, SimWall2D u) : returns void
%at(size_t n) : returns gtsam::SimWall2D
%back() : returns gtsam::SimWall2D
%capacity() : returns size_t
%empty() : returns bool
%front() : returns gtsam::SimWall2D
%max_size() : returns size_t
%pop_back() : returns void
%push_back(SimWall2D x) : returns void
%reserve(size_t n) : returns void
%resize(size_t sz) : returns void
%size() : returns size_t
%
classdef SimWall2DVector < handle
  properties
    ptr_gtsamSimWall2DVector = 0
  end
  methods
    function obj = SimWall2DVector(varargin)
      if nargin == 2 && isa(varargin{1}, 'uint64') && varargin{1} == uint64(5139824614673773682)
        my_ptr = varargin{2};
        gtsam_unstable_wrapper(144, my_ptr);
      else
        error('Arguments do not match any overload of gtsam.SimWall2DVector constructor');
      end
      obj.ptr_gtsamSimWall2DVector = my_ptr;
    end

    function delete(obj)
      gtsam_unstable_wrapper(145, obj.ptr_gtsamSimWall2DVector);
    end

    function display(obj), obj.print(''); end
    %DISPLAY Calls print on the object
    function disp(obj), obj.display; end
    %DISP Calls print on the object
    function varargout = assign(this, varargin)
      % ASSIGN usage: assign(size_t n, SimWall2D u) : returns void
      % Doxygen can be found at http://research.cc.gatech.edu/borg/sites/edu.borg/html/index.html
      if length(varargin) == 2 && isa(varargin{1},'numeric') && isa(varargin{2},'gtsam.SimWall2D')
        gtsam_unstable_wrapper(146, this, varargin{:});
      else
        error('Arguments do not match any overload of function gtsam.SimWall2DVector.assign');
      end
    end

    function varargout = at(this, varargin)
      % AT usage: at(size_t n) : returns gtsam::SimWall2D
      % Doxygen can be found at http://research.cc.gatech.edu/borg/sites/edu.borg/html/index.html
      varargout{1} = gtsam_unstable_wrapper(147, this, varargin{:});
    end

    function varargout = back(this, varargin)
      % BACK usage: back() : returns gtsam::SimWall2D
      % Doxygen can be found at http://research.cc.gatech.edu/borg/sites/edu.borg/html/index.html
      varargout{1} = gtsam_unstable_wrapper(148, this, varargin{:});
    end

    function varargout = capacity(this, varargin)
      % CAPACITY usage: capacity() : returns size_t
      % Doxygen can be found at http://research.cc.gatech.edu/borg/sites/edu.borg/html/index.html
      varargout{1} = gtsam_unstable_wrapper(149, this, varargin{:});
    end

    function varargout = empty(this, varargin)
      % EMPTY usage: empty() : returns bool
      % Doxygen can be found at http://research.cc.gatech.edu/borg/sites/edu.borg/html/index.html
      varargout{1} = gtsam_unstable_wrapper(150, this, varargin{:});
    end

    function varargout = front(this, varargin)
      % FRONT usage: front() : returns gtsam::SimWall2D
      % Doxygen can be found at http://research.cc.gatech.edu/borg/sites/edu.borg/html/index.html
      varargout{1} = gtsam_unstable_wrapper(151, this, varargin{:});
    end

    function varargout = max_size(this, varargin)
      % MAX_SIZE usage: max_size() : returns size_t
      % Doxygen can be found at http://research.cc.gatech.edu/borg/sites/edu.borg/html/index.html
      varargout{1} = gtsam_unstable_wrapper(152, this, varargin{:});
    end

    function varargout = pop_back(this, varargin)
      % POP_BACK usage: pop_back() : returns void
      % Doxygen can be found at http://research.cc.gatech.edu/borg/sites/edu.borg/html/index.html
      gtsam_unstable_wrapper(153, this, varargin{:});
    end

    function varargout = push_back(this, varargin)
      % PUSH_BACK usage: push_back(SimWall2D x) : returns void
      % Doxygen can be found at http://research.cc.gatech.edu/borg/sites/edu.borg/html/index.html
      if length(varargin) == 1 && isa(varargin{1},'gtsam.SimWall2D')
        gtsam_unstable_wrapper(154, this, varargin{:});
      else
        error('Arguments do not match any overload of function gtsam.SimWall2DVector.push_back');
      end
    end

    function varargout = reserve(this, varargin)
      % RESERVE usage: reserve(size_t n) : returns void
      % Doxygen can be found at http://research.cc.gatech.edu/borg/sites/edu.borg/html/index.html
      gtsam_unstable_wrapper(155, this, varargin{:});
    end

    function varargout = resize(this, varargin)
      % RESIZE usage: resize(size_t sz) : returns void
      % Doxygen can be found at http://research.cc.gatech.edu/borg/sites/edu.borg/html/index.html
      gtsam_unstable_wrapper(156, this, varargin{:});
    end

    function varargout = size(this, varargin)
      % SIZE usage: size() : returns size_t
      % Doxygen can be found at http://research.cc.gatech.edu/borg/sites/edu.borg/html/index.html
      varargout{1} = gtsam_unstable_wrapper(157, this, varargin{:});
    end

  end

  methods(Static = true)
  end
end
