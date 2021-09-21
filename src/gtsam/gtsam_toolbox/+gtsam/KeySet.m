%class KeySet, see Doxygen page for details
%at http://research.cc.gatech.edu/borg/sites/edu.borg/html/index.html
%
%-------Constructors-------
%KeySet()
%KeySet(KeySet other)
%KeySet(KeyVector other)
%KeySet(KeyList other)
%
%-------Methods-------
%clear() : returns void
%count(size_t key) : returns bool
%empty() : returns bool
%equals(KeySet other) : returns bool
%erase(size_t key) : returns bool
%insert(size_t key) : returns void
%merge(KeySet other) : returns void
%print(string s) : returns void
%size() : returns size_t
%
%-------Serialization Interface-------
%string_serialize() : returns string
%string_deserialize(string serialized) : returns KeySet
%
classdef KeySet < handle
  properties
    ptr_gtsamKeySet = 0
  end
  methods
    function obj = KeySet(varargin)
      if nargin == 2 && isa(varargin{1}, 'uint64') && varargin{1} == uint64(5139824614673773682)
        my_ptr = varargin{2};
        gtsam_wrapper(1074, my_ptr);
      elseif nargin == 0
        my_ptr = gtsam_wrapper(1075);
      elseif nargin == 1 && isa(varargin{1},'gtsam.KeySet')
        my_ptr = gtsam_wrapper(1076, varargin{1});
      elseif nargin == 1 && isa(varargin{1},'gtsam.KeyVector')
        my_ptr = gtsam_wrapper(1077, varargin{1});
      elseif nargin == 1 && isa(varargin{1},'gtsam.KeyList')
        my_ptr = gtsam_wrapper(1078, varargin{1});
      else
        error('Arguments do not match any overload of gtsam.KeySet constructor');
      end
      obj.ptr_gtsamKeySet = my_ptr;
    end

    function delete(obj)
      gtsam_wrapper(1079, obj.ptr_gtsamKeySet);
    end

    function display(obj), obj.print(''); end
    %DISPLAY Calls print on the object
    function disp(obj), obj.display; end
    %DISP Calls print on the object
    function varargout = clear(this, varargin)
      % CLEAR usage: clear() : returns void
      % Doxygen can be found at http://research.cc.gatech.edu/borg/sites/edu.borg/html/index.html
      gtsam_wrapper(1080, this, varargin{:});
    end

    function varargout = count(this, varargin)
      % COUNT usage: count(size_t key) : returns bool
      % Doxygen can be found at http://research.cc.gatech.edu/borg/sites/edu.borg/html/index.html
      varargout{1} = gtsam_wrapper(1081, this, varargin{:});
    end

    function varargout = empty(this, varargin)
      % EMPTY usage: empty() : returns bool
      % Doxygen can be found at http://research.cc.gatech.edu/borg/sites/edu.borg/html/index.html
      varargout{1} = gtsam_wrapper(1082, this, varargin{:});
    end

    function varargout = equals(this, varargin)
      % EQUALS usage: equals(KeySet other) : returns bool
      % Doxygen can be found at http://research.cc.gatech.edu/borg/sites/edu.borg/html/index.html
      if length(varargin) == 1 && isa(varargin{1},'gtsam.KeySet')
        varargout{1} = gtsam_wrapper(1083, this, varargin{:});
      else
        error('Arguments do not match any overload of function gtsam.KeySet.equals');
      end
    end

    function varargout = erase(this, varargin)
      % ERASE usage: erase(size_t key) : returns bool
      % Doxygen can be found at http://research.cc.gatech.edu/borg/sites/edu.borg/html/index.html
      varargout{1} = gtsam_wrapper(1084, this, varargin{:});
    end

    function varargout = insert(this, varargin)
      % INSERT usage: insert(size_t key) : returns void
      % Doxygen can be found at http://research.cc.gatech.edu/borg/sites/edu.borg/html/index.html
      gtsam_wrapper(1085, this, varargin{:});
    end

    function varargout = merge(this, varargin)
      % MERGE usage: merge(KeySet other) : returns void
      % Doxygen can be found at http://research.cc.gatech.edu/borg/sites/edu.borg/html/index.html
      if length(varargin) == 1 && isa(varargin{1},'gtsam.KeySet')
        gtsam_wrapper(1086, this, varargin{:});
      else
        error('Arguments do not match any overload of function gtsam.KeySet.merge');
      end
    end

    function varargout = print(this, varargin)
      % PRINT usage: print(string s) : returns void
      % Doxygen can be found at http://research.cc.gatech.edu/borg/sites/edu.borg/html/index.html
      if length(varargin) == 1 && isa(varargin{1},'char')
        gtsam_wrapper(1087, this, varargin{:});
      else
        error('Arguments do not match any overload of function gtsam.KeySet.print');
      end
    end

    function varargout = size(this, varargin)
      % SIZE usage: size() : returns size_t
      % Doxygen can be found at http://research.cc.gatech.edu/borg/sites/edu.borg/html/index.html
      varargout{1} = gtsam_wrapper(1088, this, varargin{:});
    end

    function varargout = string_serialize(this, varargin)
      % STRING_SERIALIZE usage: string_serialize() : returns string
      % Doxygen can be found at http://research.cc.gatech.edu/borg/sites/edu.borg/html/index.html
      if length(varargin) == 0
        varargout{1} = gtsam_wrapper(1089, this, varargin{:});
      else
        error('Arguments do not match any overload of function gtsam.KeySet.string_serialize');
      end
    end

    function sobj = saveobj(obj)
      % SAVEOBJ Saves the object to a matlab-readable format
      sobj = obj.string_serialize();
    end
  end

  methods(Static = true)
    function varargout = string_deserialize(varargin)
      % STRING_DESERIALIZE usage: string_deserialize() : returns gtsam.KeySet
      % Doxygen can be found at http://research.cc.gatech.edu/borg/sites/edu.borg/html/index.html
      if length(varargin) == 1
        varargout{1} = gtsam_wrapper(1090, varargin{:});
      else
        error('Arguments do not match any overload of function gtsam.KeySet.string_deserialize');
      end
    end

    function obj = loadobj(sobj)
      % LOADOBJ Saves the object to a matlab-readable format
      obj = gtsam.KeySet.string_deserialize(sobj);
    end
  end
end
