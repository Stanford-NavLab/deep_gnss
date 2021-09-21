%class KeyList, see Doxygen page for details
%at http://research.cc.gatech.edu/borg/sites/edu.borg/html/index.html
%
%-------Constructors-------
%KeyList()
%KeyList(KeyList other)
%
%-------Methods-------
%back() : returns size_t
%clear() : returns void
%empty() : returns bool
%front() : returns size_t
%pop_back() : returns void
%pop_front() : returns void
%push_back(size_t key) : returns void
%push_front(size_t key) : returns void
%remove(size_t key) : returns void
%size() : returns size_t
%sort() : returns void
%
%-------Serialization Interface-------
%string_serialize() : returns string
%string_deserialize(string serialized) : returns KeyList
%
classdef KeyList < handle
  properties
    ptr_gtsamKeyList = 0
  end
  methods
    function obj = KeyList(varargin)
      if nargin == 2 && isa(varargin{1}, 'uint64') && varargin{1} == uint64(5139824614673773682)
        my_ptr = varargin{2};
        gtsam_wrapper(1057, my_ptr);
      elseif nargin == 0
        my_ptr = gtsam_wrapper(1058);
      elseif nargin == 1 && isa(varargin{1},'gtsam.KeyList')
        my_ptr = gtsam_wrapper(1059, varargin{1});
      else
        error('Arguments do not match any overload of gtsam.KeyList constructor');
      end
      obj.ptr_gtsamKeyList = my_ptr;
    end

    function delete(obj)
      gtsam_wrapper(1060, obj.ptr_gtsamKeyList);
    end

    function display(obj), obj.print(''); end
    %DISPLAY Calls print on the object
    function disp(obj), obj.display; end
    %DISP Calls print on the object
    function varargout = back(this, varargin)
      % BACK usage: back() : returns size_t
      % Doxygen can be found at http://research.cc.gatech.edu/borg/sites/edu.borg/html/index.html
      varargout{1} = gtsam_wrapper(1061, this, varargin{:});
    end

    function varargout = clear(this, varargin)
      % CLEAR usage: clear() : returns void
      % Doxygen can be found at http://research.cc.gatech.edu/borg/sites/edu.borg/html/index.html
      gtsam_wrapper(1062, this, varargin{:});
    end

    function varargout = empty(this, varargin)
      % EMPTY usage: empty() : returns bool
      % Doxygen can be found at http://research.cc.gatech.edu/borg/sites/edu.borg/html/index.html
      varargout{1} = gtsam_wrapper(1063, this, varargin{:});
    end

    function varargout = front(this, varargin)
      % FRONT usage: front() : returns size_t
      % Doxygen can be found at http://research.cc.gatech.edu/borg/sites/edu.borg/html/index.html
      varargout{1} = gtsam_wrapper(1064, this, varargin{:});
    end

    function varargout = pop_back(this, varargin)
      % POP_BACK usage: pop_back() : returns void
      % Doxygen can be found at http://research.cc.gatech.edu/borg/sites/edu.borg/html/index.html
      gtsam_wrapper(1065, this, varargin{:});
    end

    function varargout = pop_front(this, varargin)
      % POP_FRONT usage: pop_front() : returns void
      % Doxygen can be found at http://research.cc.gatech.edu/borg/sites/edu.borg/html/index.html
      gtsam_wrapper(1066, this, varargin{:});
    end

    function varargout = push_back(this, varargin)
      % PUSH_BACK usage: push_back(size_t key) : returns void
      % Doxygen can be found at http://research.cc.gatech.edu/borg/sites/edu.borg/html/index.html
      gtsam_wrapper(1067, this, varargin{:});
    end

    function varargout = push_front(this, varargin)
      % PUSH_FRONT usage: push_front(size_t key) : returns void
      % Doxygen can be found at http://research.cc.gatech.edu/borg/sites/edu.borg/html/index.html
      gtsam_wrapper(1068, this, varargin{:});
    end

    function varargout = remove(this, varargin)
      % REMOVE usage: remove(size_t key) : returns void
      % Doxygen can be found at http://research.cc.gatech.edu/borg/sites/edu.borg/html/index.html
      gtsam_wrapper(1069, this, varargin{:});
    end

    function varargout = size(this, varargin)
      % SIZE usage: size() : returns size_t
      % Doxygen can be found at http://research.cc.gatech.edu/borg/sites/edu.borg/html/index.html
      varargout{1} = gtsam_wrapper(1070, this, varargin{:});
    end

    function varargout = sort(this, varargin)
      % SORT usage: sort() : returns void
      % Doxygen can be found at http://research.cc.gatech.edu/borg/sites/edu.borg/html/index.html
      gtsam_wrapper(1071, this, varargin{:});
    end

    function varargout = string_serialize(this, varargin)
      % STRING_SERIALIZE usage: string_serialize() : returns string
      % Doxygen can be found at http://research.cc.gatech.edu/borg/sites/edu.borg/html/index.html
      if length(varargin) == 0
        varargout{1} = gtsam_wrapper(1072, this, varargin{:});
      else
        error('Arguments do not match any overload of function gtsam.KeyList.string_serialize');
      end
    end

    function sobj = saveobj(obj)
      % SAVEOBJ Saves the object to a matlab-readable format
      sobj = obj.string_serialize();
    end
  end

  methods(Static = true)
    function varargout = string_deserialize(varargin)
      % STRING_DESERIALIZE usage: string_deserialize() : returns gtsam.KeyList
      % Doxygen can be found at http://research.cc.gatech.edu/borg/sites/edu.borg/html/index.html
      if length(varargin) == 1
        varargout{1} = gtsam_wrapper(1073, varargin{:});
      else
        error('Arguments do not match any overload of function gtsam.KeyList.string_deserialize');
      end
    end

    function obj = loadobj(sobj)
      % LOADOBJ Saves the object to a matlab-readable format
      obj = gtsam.KeyList.string_deserialize(sobj);
    end
  end
end
