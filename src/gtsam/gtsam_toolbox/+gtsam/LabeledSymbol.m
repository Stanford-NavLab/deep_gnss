%class LabeledSymbol, see Doxygen page for details
%at http://research.cc.gatech.edu/borg/sites/edu.borg/html/index.html
%
%-------Constructors-------
%LabeledSymbol(size_t full_key)
%LabeledSymbol(LabeledSymbol key)
%LabeledSymbol(unsigned char valType, unsigned char label, size_t j)
%
%-------Methods-------
%chr() : returns unsigned char
%index() : returns size_t
%key() : returns size_t
%label() : returns unsigned char
%lower() : returns gtsam::LabeledSymbol
%newChr(unsigned char c) : returns gtsam::LabeledSymbol
%newLabel(unsigned char label) : returns gtsam::LabeledSymbol
%print(string s) : returns void
%upper() : returns gtsam::LabeledSymbol
%
classdef LabeledSymbol < handle
  properties
    ptr_gtsamLabeledSymbol = 0
  end
  methods
    function obj = LabeledSymbol(varargin)
      if nargin == 2 && isa(varargin{1}, 'uint64') && varargin{1} == uint64(5139824614673773682)
        my_ptr = varargin{2};
        gtsam_wrapper(957, my_ptr);
      elseif nargin == 1 && isa(varargin{1},'numeric')
        my_ptr = gtsam_wrapper(958, varargin{1});
      elseif nargin == 1 && isa(varargin{1},'gtsam.LabeledSymbol')
        my_ptr = gtsam_wrapper(959, varargin{1});
      elseif nargin == 3 && isa(varargin{1},'char') && isa(varargin{2},'char') && isa(varargin{3},'numeric')
        my_ptr = gtsam_wrapper(960, varargin{1}, varargin{2}, varargin{3});
      else
        error('Arguments do not match any overload of gtsam.LabeledSymbol constructor');
      end
      obj.ptr_gtsamLabeledSymbol = my_ptr;
    end

    function delete(obj)
      gtsam_wrapper(961, obj.ptr_gtsamLabeledSymbol);
    end

    function display(obj), obj.print(''); end
    %DISPLAY Calls print on the object
    function disp(obj), obj.display; end
    %DISP Calls print on the object
    function varargout = chr(this, varargin)
      % CHR usage: chr() : returns unsigned char
      % Doxygen can be found at http://research.cc.gatech.edu/borg/sites/edu.borg/html/index.html
      varargout{1} = gtsam_wrapper(962, this, varargin{:});
    end

    function varargout = index(this, varargin)
      % INDEX usage: index() : returns size_t
      % Doxygen can be found at http://research.cc.gatech.edu/borg/sites/edu.borg/html/index.html
      varargout{1} = gtsam_wrapper(963, this, varargin{:});
    end

    function varargout = key(this, varargin)
      % KEY usage: key() : returns size_t
      % Doxygen can be found at http://research.cc.gatech.edu/borg/sites/edu.borg/html/index.html
      varargout{1} = gtsam_wrapper(964, this, varargin{:});
    end

    function varargout = label(this, varargin)
      % LABEL usage: label() : returns unsigned char
      % Doxygen can be found at http://research.cc.gatech.edu/borg/sites/edu.borg/html/index.html
      varargout{1} = gtsam_wrapper(965, this, varargin{:});
    end

    function varargout = lower(this, varargin)
      % LOWER usage: lower() : returns gtsam::LabeledSymbol
      % Doxygen can be found at http://research.cc.gatech.edu/borg/sites/edu.borg/html/index.html
      varargout{1} = gtsam_wrapper(966, this, varargin{:});
    end

    function varargout = newChr(this, varargin)
      % NEWCHR usage: newChr(unsigned char c) : returns gtsam::LabeledSymbol
      % Doxygen can be found at http://research.cc.gatech.edu/borg/sites/edu.borg/html/index.html
      varargout{1} = gtsam_wrapper(967, this, varargin{:});
    end

    function varargout = newLabel(this, varargin)
      % NEWLABEL usage: newLabel(unsigned char label) : returns gtsam::LabeledSymbol
      % Doxygen can be found at http://research.cc.gatech.edu/borg/sites/edu.borg/html/index.html
      varargout{1} = gtsam_wrapper(968, this, varargin{:});
    end

    function varargout = print(this, varargin)
      % PRINT usage: print(string s) : returns void
      % Doxygen can be found at http://research.cc.gatech.edu/borg/sites/edu.borg/html/index.html
      if length(varargin) == 1 && isa(varargin{1},'char')
        gtsam_wrapper(969, this, varargin{:});
      else
        error('Arguments do not match any overload of function gtsam.LabeledSymbol.print');
      end
    end

    function varargout = upper(this, varargin)
      % UPPER usage: upper() : returns gtsam::LabeledSymbol
      % Doxygen can be found at http://research.cc.gatech.edu/borg/sites/edu.borg/html/index.html
      varargout{1} = gtsam_wrapper(970, this, varargin{:});
    end

  end

  methods(Static = true)
  end
end
