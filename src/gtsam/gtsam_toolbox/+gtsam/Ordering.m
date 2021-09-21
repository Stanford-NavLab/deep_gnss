%class Ordering, see Doxygen page for details
%at http://research.cc.gatech.edu/borg/sites/edu.borg/html/index.html
%
%-------Constructors-------
%Ordering()
%Ordering(Ordering other)
%
%-------Methods-------
%at(size_t key) : returns size_t
%equals(Ordering ord, double tol) : returns bool
%print(string s) : returns void
%push_back(size_t key) : returns void
%size() : returns size_t
%
%-------Serialization Interface-------
%string_serialize() : returns string
%string_deserialize(string serialized) : returns Ordering
%
classdef Ordering < handle
  properties
    ptr_gtsamOrdering = 0
  end
  methods
    function obj = Ordering(varargin)
      if nargin == 2 && isa(varargin{1}, 'uint64') && varargin{1} == uint64(5139824614673773682)
        my_ptr = varargin{2};
        gtsam_wrapper(971, my_ptr);
      elseif nargin == 0
        my_ptr = gtsam_wrapper(972);
      elseif nargin == 1 && isa(varargin{1},'gtsam.Ordering')
        my_ptr = gtsam_wrapper(973, varargin{1});
      else
        error('Arguments do not match any overload of gtsam.Ordering constructor');
      end
      obj.ptr_gtsamOrdering = my_ptr;
    end

    function delete(obj)
      gtsam_wrapper(974, obj.ptr_gtsamOrdering);
    end

    function display(obj), obj.print(''); end
    %DISPLAY Calls print on the object
    function disp(obj), obj.display; end
    %DISP Calls print on the object
    function varargout = at(this, varargin)
      % AT usage: at(size_t key) : returns size_t
      % Doxygen can be found at http://research.cc.gatech.edu/borg/sites/edu.borg/html/index.html
      varargout{1} = gtsam_wrapper(975, this, varargin{:});
    end

    function varargout = equals(this, varargin)
      % EQUALS usage: equals(Ordering ord, double tol) : returns bool
      % Doxygen can be found at http://research.cc.gatech.edu/borg/sites/edu.borg/html/index.html
      if length(varargin) == 2 && isa(varargin{1},'gtsam.Ordering') && isa(varargin{2},'double')
        varargout{1} = gtsam_wrapper(976, this, varargin{:});
      else
        error('Arguments do not match any overload of function gtsam.Ordering.equals');
      end
    end

    function varargout = print(this, varargin)
      % PRINT usage: print(string s) : returns void
      % Doxygen can be found at http://research.cc.gatech.edu/borg/sites/edu.borg/html/index.html
      if length(varargin) == 1 && isa(varargin{1},'char')
        gtsam_wrapper(977, this, varargin{:});
      else
        error('Arguments do not match any overload of function gtsam.Ordering.print');
      end
    end

    function varargout = push_back(this, varargin)
      % PUSH_BACK usage: push_back(size_t key) : returns void
      % Doxygen can be found at http://research.cc.gatech.edu/borg/sites/edu.borg/html/index.html
      gtsam_wrapper(978, this, varargin{:});
    end

    function varargout = size(this, varargin)
      % SIZE usage: size() : returns size_t
      % Doxygen can be found at http://research.cc.gatech.edu/borg/sites/edu.borg/html/index.html
      varargout{1} = gtsam_wrapper(979, this, varargin{:});
    end

    function varargout = string_serialize(this, varargin)
      % STRING_SERIALIZE usage: string_serialize() : returns string
      % Doxygen can be found at http://research.cc.gatech.edu/borg/sites/edu.borg/html/index.html
      if length(varargin) == 0
        varargout{1} = gtsam_wrapper(980, this, varargin{:});
      else
        error('Arguments do not match any overload of function gtsam.Ordering.string_serialize');
      end
    end

    function sobj = saveobj(obj)
      % SAVEOBJ Saves the object to a matlab-readable format
      sobj = obj.string_serialize();
    end
  end

  methods(Static = true)
    function varargout = string_deserialize(varargin)
      % STRING_DESERIALIZE usage: string_deserialize() : returns gtsam.Ordering
      % Doxygen can be found at http://research.cc.gatech.edu/borg/sites/edu.borg/html/index.html
      if length(varargin) == 1
        varargout{1} = gtsam_wrapper(981, varargin{:});
      else
        error('Arguments do not match any overload of function gtsam.Ordering.string_deserialize');
      end
    end

    function obj = loadobj(sobj)
      % LOADOBJ Saves the object to a matlab-readable format
      obj = gtsam.Ordering.string_deserialize(sobj);
    end
  end
end
