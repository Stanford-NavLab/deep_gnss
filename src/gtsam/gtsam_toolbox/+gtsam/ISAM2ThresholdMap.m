%class ISAM2ThresholdMap, see Doxygen page for details
%at http://research.cc.gatech.edu/borg/sites/edu.borg/html/index.html
%
%-------Constructors-------
%ISAM2ThresholdMap()
%ISAM2ThresholdMap(ISAM2ThresholdMap other)
%
%-------Methods-------
%clear() : returns void
%empty() : returns bool
%insert(ISAM2ThresholdMapValue value) : returns void
%size() : returns size_t
%
classdef ISAM2ThresholdMap < handle
  properties
    ptr_gtsamISAM2ThresholdMap = 0
  end
  methods
    function obj = ISAM2ThresholdMap(varargin)
      if nargin == 2 && isa(varargin{1}, 'uint64') && varargin{1} == uint64(5139824614673773682)
        my_ptr = varargin{2};
        gtsam_wrapper(1321, my_ptr);
      elseif nargin == 0
        my_ptr = gtsam_wrapper(1322);
      elseif nargin == 1 && isa(varargin{1},'gtsam.ISAM2ThresholdMap')
        my_ptr = gtsam_wrapper(1323, varargin{1});
      else
        error('Arguments do not match any overload of gtsam.ISAM2ThresholdMap constructor');
      end
      obj.ptr_gtsamISAM2ThresholdMap = my_ptr;
    end

    function delete(obj)
      gtsam_wrapper(1324, obj.ptr_gtsamISAM2ThresholdMap);
    end

    function display(obj), obj.print(''); end
    %DISPLAY Calls print on the object
    function disp(obj), obj.display; end
    %DISP Calls print on the object
    function varargout = clear(this, varargin)
      % CLEAR usage: clear() : returns void
      % Doxygen can be found at http://research.cc.gatech.edu/borg/sites/edu.borg/html/index.html
      gtsam_wrapper(1325, this, varargin{:});
    end

    function varargout = empty(this, varargin)
      % EMPTY usage: empty() : returns bool
      % Doxygen can be found at http://research.cc.gatech.edu/borg/sites/edu.borg/html/index.html
      varargout{1} = gtsam_wrapper(1326, this, varargin{:});
    end

    function varargout = insert(this, varargin)
      % INSERT usage: insert(ISAM2ThresholdMapValue value) : returns void
      % Doxygen can be found at http://research.cc.gatech.edu/borg/sites/edu.borg/html/index.html
      if length(varargin) == 1 && isa(varargin{1},'gtsam.ISAM2ThresholdMapValue')
        gtsam_wrapper(1327, this, varargin{:});
      else
        error('Arguments do not match any overload of function gtsam.ISAM2ThresholdMap.insert');
      end
    end

    function varargout = size(this, varargin)
      % SIZE usage: size() : returns size_t
      % Doxygen can be found at http://research.cc.gatech.edu/borg/sites/edu.borg/html/index.html
      varargout{1} = gtsam_wrapper(1328, this, varargin{:});
    end

  end

  methods(Static = true)
  end
end
