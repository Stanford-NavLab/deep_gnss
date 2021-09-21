%class DoglegOptimizer, see Doxygen page for details
%at http://research.cc.gatech.edu/borg/sites/edu.borg/html/index.html
%
%-------Constructors-------
%DoglegOptimizer(NonlinearFactorGraph graph, Values initialValues)
%DoglegOptimizer(NonlinearFactorGraph graph, Values initialValues, DoglegParams params)
%
%-------Methods-------
%error() : returns double
%getDelta() : returns double
%iterate() : returns void
%iterations() : returns int
%optimize() : returns gtsam::Values
%optimizeSafely() : returns gtsam::Values
%values() : returns gtsam::Values
%
classdef DoglegOptimizer < gtsam.NonlinearOptimizer
  properties
    ptr_gtsamDoglegOptimizer = 0
  end
  methods
    function obj = DoglegOptimizer(varargin)
      if (nargin == 2 || (nargin == 3 && strcmp(varargin{3}, 'void'))) && isa(varargin{1}, 'uint64') && varargin{1} == uint64(5139824614673773682)
        if nargin == 2
          my_ptr = varargin{2};
        else
          my_ptr = gtsam_wrapper(1275, varargin{2});
        end
        base_ptr = gtsam_wrapper(1274, my_ptr);
      elseif nargin == 2 && isa(varargin{1},'gtsam.NonlinearFactorGraph') && isa(varargin{2},'gtsam.Values')
        [ my_ptr, base_ptr ] = gtsam_wrapper(1276, varargin{1}, varargin{2});
      elseif nargin == 3 && isa(varargin{1},'gtsam.NonlinearFactorGraph') && isa(varargin{2},'gtsam.Values') && isa(varargin{3},'gtsam.DoglegParams')
        [ my_ptr, base_ptr ] = gtsam_wrapper(1277, varargin{1}, varargin{2}, varargin{3});
      else
        error('Arguments do not match any overload of gtsam.DoglegOptimizer constructor');
      end
      obj = obj@gtsam.NonlinearOptimizer(uint64(5139824614673773682), base_ptr);
      obj.ptr_gtsamDoglegOptimizer = my_ptr;
    end

    function delete(obj)
      gtsam_wrapper(1278, obj.ptr_gtsamDoglegOptimizer);
    end

    function display(obj), obj.print(''); end
    %DISPLAY Calls print on the object
    function disp(obj), obj.display; end
    %DISP Calls print on the object
    function varargout = error(this, varargin)
      % ERROR usage: error() : returns double
      % Doxygen can be found at http://research.cc.gatech.edu/borg/sites/edu.borg/html/index.html
      varargout{1} = gtsam_wrapper(1279, this, varargin{:});
    end

    function varargout = getDelta(this, varargin)
      % GETDELTA usage: getDelta() : returns double
      % Doxygen can be found at http://research.cc.gatech.edu/borg/sites/edu.borg/html/index.html
      varargout{1} = gtsam_wrapper(1280, this, varargin{:});
    end

    function varargout = iterate(this, varargin)
      % ITERATE usage: iterate() : returns void
      % Doxygen can be found at http://research.cc.gatech.edu/borg/sites/edu.borg/html/index.html
      gtsam_wrapper(1281, this, varargin{:});
    end

    function varargout = iterations(this, varargin)
      % ITERATIONS usage: iterations() : returns int
      % Doxygen can be found at http://research.cc.gatech.edu/borg/sites/edu.borg/html/index.html
      varargout{1} = gtsam_wrapper(1282, this, varargin{:});
    end

    function varargout = optimize(this, varargin)
      % OPTIMIZE usage: optimize() : returns gtsam::Values
      % Doxygen can be found at http://research.cc.gatech.edu/borg/sites/edu.borg/html/index.html
      varargout{1} = gtsam_wrapper(1283, this, varargin{:});
    end

    function varargout = optimizeSafely(this, varargin)
      % OPTIMIZESAFELY usage: optimizeSafely() : returns gtsam::Values
      % Doxygen can be found at http://research.cc.gatech.edu/borg/sites/edu.borg/html/index.html
      varargout{1} = gtsam_wrapper(1284, this, varargin{:});
    end

    function varargout = values(this, varargin)
      % VALUES usage: values() : returns gtsam::Values
      % Doxygen can be found at http://research.cc.gatech.edu/borg/sites/edu.borg/html/index.html
      varargout{1} = gtsam_wrapper(1285, this, varargin{:});
    end

  end

  methods(Static = true)
  end
end
