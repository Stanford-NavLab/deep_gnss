%class GaussianISAM, see Doxygen page for details
%at http://research.cc.gatech.edu/borg/sites/edu.borg/html/index.html
%
%-------Constructors-------
%GaussianISAM()
%
%-------Methods-------
%clear() : returns void
%saveGraph(string s) : returns void
%update(GaussianFactorGraph newFactors) : returns void
%
classdef GaussianISAM < handle
  properties
    ptr_gtsamGaussianISAM = 0
  end
  methods
    function obj = GaussianISAM(varargin)
      if nargin == 2 && isa(varargin{1}, 'uint64') && varargin{1} == uint64(5139824614673773682)
        my_ptr = varargin{2};
        gtsam_wrapper(904, my_ptr);
      elseif nargin == 0
        my_ptr = gtsam_wrapper(905);
      else
        error('Arguments do not match any overload of gtsam.GaussianISAM constructor');
      end
      obj.ptr_gtsamGaussianISAM = my_ptr;
    end

    function delete(obj)
      gtsam_wrapper(906, obj.ptr_gtsamGaussianISAM);
    end

    function display(obj), obj.print(''); end
    %DISPLAY Calls print on the object
    function disp(obj), obj.display; end
    %DISP Calls print on the object
    function varargout = clear(this, varargin)
      % CLEAR usage: clear() : returns void
      % Doxygen can be found at http://research.cc.gatech.edu/borg/sites/edu.borg/html/index.html
      gtsam_wrapper(907, this, varargin{:});
    end

    function varargout = saveGraph(this, varargin)
      % SAVEGRAPH usage: saveGraph(string s) : returns void
      % Doxygen can be found at http://research.cc.gatech.edu/borg/sites/edu.borg/html/index.html
      if length(varargin) == 1 && isa(varargin{1},'char')
        gtsam_wrapper(908, this, varargin{:});
      else
        error('Arguments do not match any overload of function gtsam.GaussianISAM.saveGraph');
      end
    end

    function varargout = update(this, varargin)
      % UPDATE usage: update(GaussianFactorGraph newFactors) : returns void
      % Doxygen can be found at http://research.cc.gatech.edu/borg/sites/edu.borg/html/index.html
      if length(varargin) == 1 && isa(varargin{1},'gtsam.GaussianFactorGraph')
        gtsam_wrapper(909, this, varargin{:});
      else
        error('Arguments do not match any overload of function gtsam.GaussianISAM.update');
      end
    end

  end

  methods(Static = true)
  end
end
