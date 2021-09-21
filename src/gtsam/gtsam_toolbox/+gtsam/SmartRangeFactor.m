%class SmartRangeFactor, see Doxygen page for details
%at http://research.cc.gatech.edu/borg/sites/edu.borg/html/index.html
%
%-------Constructors-------
%SmartRangeFactor(double s)
%
%-------Methods-------
%addRange(size_t key, double measuredRange) : returns void
%print(string s) : returns void
%triangulate(Values x) : returns gtsam::Point2
%
classdef SmartRangeFactor < gtsam.NoiseModelFactor
  properties
    ptr_gtsamSmartRangeFactor = 0
  end
  methods
    function obj = SmartRangeFactor(varargin)
      if (nargin == 2 || (nargin == 3 && strcmp(varargin{3}, 'void'))) && isa(varargin{1}, 'uint64') && varargin{1} == uint64(5139824614673773682)
        if nargin == 2
          my_ptr = varargin{2};
        else
          my_ptr = gtsam_unstable_wrapper(216, varargin{2});
        end
        base_ptr = gtsam_unstable_wrapper(215, my_ptr);
      elseif nargin == 1 && isa(varargin{1},'double')
        [ my_ptr, base_ptr ] = gtsam_unstable_wrapper(217, varargin{1});
      else
        error('Arguments do not match any overload of gtsam.SmartRangeFactor constructor');
      end
      obj = obj@gtsam.NoiseModelFactor(uint64(5139824614673773682), base_ptr);
      obj.ptr_gtsamSmartRangeFactor = my_ptr;
    end

    function delete(obj)
      gtsam_unstable_wrapper(218, obj.ptr_gtsamSmartRangeFactor);
    end

    function display(obj), obj.print(''); end
    %DISPLAY Calls print on the object
    function disp(obj), obj.display; end
    %DISP Calls print on the object
    function varargout = addRange(this, varargin)
      % ADDRANGE usage: addRange(size_t key, double measuredRange) : returns void
      % Doxygen can be found at http://research.cc.gatech.edu/borg/sites/edu.borg/html/index.html
      gtsam_unstable_wrapper(219, this, varargin{:});
    end

    function varargout = print(this, varargin)
      % PRINT usage: print(string s) : returns void
      % Doxygen can be found at http://research.cc.gatech.edu/borg/sites/edu.borg/html/index.html
      if length(varargin) == 1 && isa(varargin{1},'char')
        gtsam_unstable_wrapper(220, this, varargin{:});
      else
        error('Arguments do not match any overload of function gtsam.SmartRangeFactor.print');
      end
    end

    function varargout = triangulate(this, varargin)
      % TRIANGULATE usage: triangulate(Values x) : returns gtsam::Point2
      % Doxygen can be found at http://research.cc.gatech.edu/borg/sites/edu.borg/html/index.html
      if length(varargin) == 1 && isa(varargin{1},'gtsam.Values')
        varargout{1} = gtsam_unstable_wrapper(221, this, varargin{:});
      else
        error('Arguments do not match any overload of function gtsam.SmartRangeFactor.triangulate');
      end
    end

  end

  methods(Static = true)
  end
end
