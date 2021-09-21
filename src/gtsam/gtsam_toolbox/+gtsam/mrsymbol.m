function varargout = mrsymbol(varargin)
      if length(varargin) == 3 && isa(varargin{1},'char') && isa(varargin{2},'char') && isa(varargin{3},'numeric')
        varargout{1} = gtsam_wrapper(2477, varargin{:});
      else
        error('Arguments do not match any overload of function gtsam.mrsymbol');
      end
