%class Values, see Doxygen page for details
%at http://research.cc.gatech.edu/borg/sites/edu.borg/html/index.html
%
%-------Constructors-------
%Values()
%Values(Values other)
%
%-------Methods-------
%at(size_t j) : returns gtsam::Value
%clear() : returns void
%dim() : returns size_t
%empty() : returns bool
%equals(Values other, double tol) : returns bool
%erase(size_t j) : returns void
%exists(size_t j) : returns bool
%insert(size_t j, Value value) : returns void
%insert(Values values) : returns void
%keys() : returns gtsam::KeyList
%localCoordinates(Values cp) : returns gtsam::VectorValues
%print(string s) : returns void
%retract(VectorValues delta) : returns gtsam::Values
%size() : returns size_t
%swap(Values values) : returns void
%update(size_t j, Value val) : returns void
%update(Values values) : returns void
%zeroVectors() : returns gtsam::VectorValues
%
%-------Serialization Interface-------
%string_serialize() : returns string
%string_deserialize(string serialized) : returns Values
%
classdef Values < handle
  properties
    ptr_gtsamValues = 0
  end
  methods
    function obj = Values(varargin)
      if nargin == 2 && isa(varargin{1}, 'uint64') && varargin{1} == uint64(5139824614673773682)
        my_ptr = varargin{2};
        gtsam_wrapper(1033, my_ptr);
      elseif nargin == 0
        my_ptr = gtsam_wrapper(1034);
      elseif nargin == 1 && isa(varargin{1},'gtsam.Values')
        my_ptr = gtsam_wrapper(1035, varargin{1});
      else
        error('Arguments do not match any overload of gtsam.Values constructor');
      end
      obj.ptr_gtsamValues = my_ptr;
    end

    function delete(obj)
      gtsam_wrapper(1036, obj.ptr_gtsamValues);
    end

    function display(obj), obj.print(''); end
    %DISPLAY Calls print on the object
    function disp(obj), obj.display; end
    %DISP Calls print on the object
    function varargout = at(this, varargin)
      % AT usage: at(size_t j) : returns gtsam::Value
      % Doxygen can be found at http://research.cc.gatech.edu/borg/sites/edu.borg/html/index.html
      varargout{1} = gtsam_wrapper(1037, this, varargin{:});
    end

    function varargout = clear(this, varargin)
      % CLEAR usage: clear() : returns void
      % Doxygen can be found at http://research.cc.gatech.edu/borg/sites/edu.borg/html/index.html
      gtsam_wrapper(1038, this, varargin{:});
    end

    function varargout = dim(this, varargin)
      % DIM usage: dim() : returns size_t
      % Doxygen can be found at http://research.cc.gatech.edu/borg/sites/edu.borg/html/index.html
      varargout{1} = gtsam_wrapper(1039, this, varargin{:});
    end

    function varargout = empty(this, varargin)
      % EMPTY usage: empty() : returns bool
      % Doxygen can be found at http://research.cc.gatech.edu/borg/sites/edu.borg/html/index.html
      varargout{1} = gtsam_wrapper(1040, this, varargin{:});
    end

    function varargout = equals(this, varargin)
      % EQUALS usage: equals(Values other, double tol) : returns bool
      % Doxygen can be found at http://research.cc.gatech.edu/borg/sites/edu.borg/html/index.html
      if length(varargin) == 2 && isa(varargin{1},'gtsam.Values') && isa(varargin{2},'double')
        varargout{1} = gtsam_wrapper(1041, this, varargin{:});
      else
        error('Arguments do not match any overload of function gtsam.Values.equals');
      end
    end

    function varargout = erase(this, varargin)
      % ERASE usage: erase(size_t j) : returns void
      % Doxygen can be found at http://research.cc.gatech.edu/borg/sites/edu.borg/html/index.html
      gtsam_wrapper(1042, this, varargin{:});
    end

    function varargout = exists(this, varargin)
      % EXISTS usage: exists(size_t j) : returns bool
      % Doxygen can be found at http://research.cc.gatech.edu/borg/sites/edu.borg/html/index.html
      varargout{1} = gtsam_wrapper(1043, this, varargin{:});
    end

    function varargout = insert(this, varargin)
      % INSERT usage: insert(size_t j, Value value), insert(Values values) : returns void
      % Doxygen can be found at http://research.cc.gatech.edu/borg/sites/edu.borg/html/index.html
      % 
      % Method Overloads
      % insert(size_t j, Value value)
      % insert(Values values)
      if length(varargin) == 2 && isa(varargin{1},'numeric') && isa(varargin{2},'gtsam.Value')
        gtsam_wrapper(1044, this, varargin{:});
      elseif length(varargin) == 1 && isa(varargin{1},'gtsam.Values')
        gtsam_wrapper(1045, this, varargin{:});
      else
        error('Arguments do not match any overload of function gtsam.Values.insert');
      end
    end

    function varargout = keys(this, varargin)
      % KEYS usage: keys() : returns gtsam::KeyList
      % Doxygen can be found at http://research.cc.gatech.edu/borg/sites/edu.borg/html/index.html
      varargout{1} = gtsam_wrapper(1046, this, varargin{:});
    end

    function varargout = localCoordinates(this, varargin)
      % LOCALCOORDINATES usage: localCoordinates(Values cp) : returns gtsam::VectorValues
      % Doxygen can be found at http://research.cc.gatech.edu/borg/sites/edu.borg/html/index.html
      if length(varargin) == 1 && isa(varargin{1},'gtsam.Values')
        varargout{1} = gtsam_wrapper(1047, this, varargin{:});
      else
        error('Arguments do not match any overload of function gtsam.Values.localCoordinates');
      end
    end

    function varargout = print(this, varargin)
      % PRINT usage: print(string s) : returns void
      % Doxygen can be found at http://research.cc.gatech.edu/borg/sites/edu.borg/html/index.html
      if length(varargin) == 1 && isa(varargin{1},'char')
        gtsam_wrapper(1048, this, varargin{:});
      else
        error('Arguments do not match any overload of function gtsam.Values.print');
      end
    end

    function varargout = retract(this, varargin)
      % RETRACT usage: retract(VectorValues delta) : returns gtsam::Values
      % Doxygen can be found at http://research.cc.gatech.edu/borg/sites/edu.borg/html/index.html
      if length(varargin) == 1 && isa(varargin{1},'gtsam.VectorValues')
        varargout{1} = gtsam_wrapper(1049, this, varargin{:});
      else
        error('Arguments do not match any overload of function gtsam.Values.retract');
      end
    end

    function varargout = size(this, varargin)
      % SIZE usage: size() : returns size_t
      % Doxygen can be found at http://research.cc.gatech.edu/borg/sites/edu.borg/html/index.html
      varargout{1} = gtsam_wrapper(1050, this, varargin{:});
    end

    function varargout = swap(this, varargin)
      % SWAP usage: swap(Values values) : returns void
      % Doxygen can be found at http://research.cc.gatech.edu/borg/sites/edu.borg/html/index.html
      if length(varargin) == 1 && isa(varargin{1},'gtsam.Values')
        gtsam_wrapper(1051, this, varargin{:});
      else
        error('Arguments do not match any overload of function gtsam.Values.swap');
      end
    end

    function varargout = update(this, varargin)
      % UPDATE usage: update(size_t j, Value val), update(Values values) : returns void
      % Doxygen can be found at http://research.cc.gatech.edu/borg/sites/edu.borg/html/index.html
      % 
      % Method Overloads
      % update(size_t j, Value val)
      % update(Values values)
      if length(varargin) == 2 && isa(varargin{1},'numeric') && isa(varargin{2},'gtsam.Value')
        gtsam_wrapper(1052, this, varargin{:});
      elseif length(varargin) == 1 && isa(varargin{1},'gtsam.Values')
        gtsam_wrapper(1053, this, varargin{:});
      else
        error('Arguments do not match any overload of function gtsam.Values.update');
      end
    end

    function varargout = zeroVectors(this, varargin)
      % ZEROVECTORS usage: zeroVectors() : returns gtsam::VectorValues
      % Doxygen can be found at http://research.cc.gatech.edu/borg/sites/edu.borg/html/index.html
      varargout{1} = gtsam_wrapper(1054, this, varargin{:});
    end

    function varargout = string_serialize(this, varargin)
      % STRING_SERIALIZE usage: string_serialize() : returns string
      % Doxygen can be found at http://research.cc.gatech.edu/borg/sites/edu.borg/html/index.html
      if length(varargin) == 0
        varargout{1} = gtsam_wrapper(1055, this, varargin{:});
      else
        error('Arguments do not match any overload of function gtsam.Values.string_serialize');
      end
    end

    function sobj = saveobj(obj)
      % SAVEOBJ Saves the object to a matlab-readable format
      sobj = obj.string_serialize();
    end
  end

  methods(Static = true)
    function varargout = string_deserialize(varargin)
      % STRING_DESERIALIZE usage: string_deserialize() : returns gtsam.Values
      % Doxygen can be found at http://research.cc.gatech.edu/borg/sites/edu.borg/html/index.html
      if length(varargin) == 1
        varargout{1} = gtsam_wrapper(1056, varargin{:});
      else
        error('Arguments do not match any overload of function gtsam.Values.string_deserialize');
      end
    end

    function obj = loadobj(sobj)
      % LOADOBJ Saves the object to a matlab-readable format
      obj = gtsam.Values.string_deserialize(sobj);
    end
  end
end
