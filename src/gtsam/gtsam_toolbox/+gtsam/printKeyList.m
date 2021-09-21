function varargout = printKeyList(varargin)
      if length(varargin) == 1 && isa(varargin{1},'gtsam.KeyList')
        gtsam_wrapper(2484, varargin{:});
      elseif length(varargin) == 2 && isa(varargin{1},'gtsam.KeyList') && isa(varargin{2},'char')
        gtsam_wrapper(2485, varargin{:});
      else
        error('Arguments do not match any overload of function gtsam.printKeyList');
      end
