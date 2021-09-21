%class SubgraphSolverParameters, see Doxygen page for details
%at http://research.cc.gatech.edu/borg/sites/edu.borg/html/index.html
%
%-------Constructors-------
%SubgraphSolverParameters()
%
%-------Methods-------
%getVerbosity() : returns string
%print() : returns void
%setVerbosity(string s) : returns void
%
classdef SubgraphSolverParameters < gtsam.ConjugateGradientParameters
  properties
    ptr_gtsamSubgraphSolverParameters = 0
  end
  methods
    function obj = SubgraphSolverParameters(varargin)
      if (nargin == 2 || (nargin == 3 && strcmp(varargin{3}, 'void'))) && isa(varargin{1}, 'uint64') && varargin{1} == uint64(5139824614673773682)
        if nargin == 2
          my_ptr = varargin{2};
        else
          my_ptr = gtsam_wrapper(934, varargin{2});
        end
        base_ptr = gtsam_wrapper(933, my_ptr);
      elseif nargin == 0
        [ my_ptr, base_ptr ] = gtsam_wrapper(935);
      else
        error('Arguments do not match any overload of gtsam.SubgraphSolverParameters constructor');
      end
      obj = obj@gtsam.ConjugateGradientParameters(uint64(5139824614673773682), base_ptr);
      obj.ptr_gtsamSubgraphSolverParameters = my_ptr;
    end

    function delete(obj)
      gtsam_wrapper(936, obj.ptr_gtsamSubgraphSolverParameters);
    end

    function display(obj), obj.print(''); end
    %DISPLAY Calls print on the object
    function disp(obj), obj.display; end
    %DISP Calls print on the object
    function varargout = getVerbosity(this, varargin)
      % GETVERBOSITY usage: getVerbosity() : returns string
      % Doxygen can be found at http://research.cc.gatech.edu/borg/sites/edu.borg/html/index.html
      varargout{1} = gtsam_wrapper(937, this, varargin{:});
    end

    function varargout = print(this, varargin)
      % PRINT usage: print() : returns void
      % Doxygen can be found at http://research.cc.gatech.edu/borg/sites/edu.borg/html/index.html
      gtsam_wrapper(938, this, varargin{:});
    end

    function varargout = setVerbosity(this, varargin)
      % SETVERBOSITY usage: setVerbosity(string s) : returns void
      % Doxygen can be found at http://research.cc.gatech.edu/borg/sites/edu.borg/html/index.html
      if length(varargin) == 1 && isa(varargin{1},'char')
        gtsam_wrapper(939, this, varargin{:});
      else
        error('Arguments do not match any overload of function gtsam.SubgraphSolverParameters.setVerbosity');
      end
    end

  end

  methods(Static = true)
  end
end
