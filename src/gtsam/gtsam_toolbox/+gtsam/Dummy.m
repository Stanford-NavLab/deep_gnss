%class Dummy, see Doxygen page for details
%at http://research.cc.gatech.edu/borg/sites/edu.borg/html/index.html
%
%-------Constructors-------
%Dummy()
%
%-------Methods-------
%dummyTwoVar(unsigned char a) : returns unsigned char
%print(string s) : returns void
%
classdef Dummy < handle
  properties
    ptr_gtsamDummy = 0
  end
  methods
    function obj = Dummy(varargin)
      if nargin == 2 && isa(varargin{1}, 'uint64') && varargin{1} == uint64(5139824614673773682)
        my_ptr = varargin{2};
        gtsam_unstable_wrapper(0, my_ptr);
      elseif nargin == 0
        my_ptr = gtsam_unstable_wrapper(1);
      else
        error('Arguments do not match any overload of gtsam.Dummy constructor');
      end
      obj.ptr_gtsamDummy = my_ptr;
    end

    function delete(obj)
      gtsam_unstable_wrapper(2, obj.ptr_gtsamDummy);
    end

    function display(obj), obj.print(''); end
    %DISPLAY Calls print on the object
    function disp(obj), obj.display; end
    %DISP Calls print on the object
    function varargout = dummyTwoVar(this, varargin)
      % DUMMYTWOVAR usage: dummyTwoVar(unsigned char a) : returns unsigned char
      % Doxygen can be found at http://research.cc.gatech.edu/borg/sites/edu.borg/html/index.html
      varargout{1} = gtsam_unstable_wrapper(3, this, varargin{:});
    end

    function varargout = print(this, varargin)
      % PRINT usage: print(string s) : returns void
      % Doxygen can be found at http://research.cc.gatech.edu/borg/sites/edu.borg/html/index.html
      if length(varargin) == 1 && isa(varargin{1},'char')
        gtsam_unstable_wrapper(4, this, varargin{:});
      else
        error('Arguments do not match any overload of function gtsam.Dummy.print');
      end
    end

  end

  methods(Static = true)
  end
end
