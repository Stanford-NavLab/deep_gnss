%class ISAM2Clique, see Doxygen page for details
%at http://research.cc.gatech.edu/borg/sites/edu.borg/html/index.html
%
%-------Constructors-------
%ISAM2Clique()
%
%-------Methods-------
%gradientContribution() : returns Vector
%print(string s) : returns void
%
classdef ISAM2Clique < handle
  properties
    ptr_gtsamISAM2Clique = 0
  end
  methods
    function obj = ISAM2Clique(varargin)
      if nargin == 2 && isa(varargin{1}, 'uint64') && varargin{1} == uint64(5139824614673773682)
        my_ptr = varargin{2};
        gtsam_wrapper(1351, my_ptr);
      elseif nargin == 0
        my_ptr = gtsam_wrapper(1352);
      else
        error('Arguments do not match any overload of gtsam.ISAM2Clique constructor');
      end
      obj.ptr_gtsamISAM2Clique = my_ptr;
    end

    function delete(obj)
      gtsam_wrapper(1353, obj.ptr_gtsamISAM2Clique);
    end

    function display(obj), obj.print(''); end
    %DISPLAY Calls print on the object
    function disp(obj), obj.display; end
    %DISP Calls print on the object
    function varargout = gradientContribution(this, varargin)
      % GRADIENTCONTRIBUTION usage: gradientContribution() : returns Vector
      % Doxygen can be found at http://research.cc.gatech.edu/borg/sites/edu.borg/html/index.html
      varargout{1} = gtsam_wrapper(1354, this, varargin{:});
    end

    function varargout = print(this, varargin)
      % PRINT usage: print(string s) : returns void
      % Doxygen can be found at http://research.cc.gatech.edu/borg/sites/edu.borg/html/index.html
      if length(varargin) == 1 && isa(varargin{1},'char')
        gtsam_wrapper(1355, this, varargin{:});
      else
        error('Arguments do not match any overload of function gtsam.ISAM2Clique.print');
      end
    end

  end

  methods(Static = true)
  end
end
