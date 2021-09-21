function varargout = load2D(varargin)
      if length(varargin) == 5 && isa(varargin{1},'char') && isa(varargin{2},'gtsam.noiseModel.Diagonal') && isa(varargin{3},'numeric') && isa(varargin{4},'logical') && isa(varargin{5},'logical')
        [ varargout{1} varargout{2} ] = gtsam_wrapper(2469, varargin{:});
      elseif length(varargin) == 4 && isa(varargin{1},'char') && isa(varargin{2},'gtsam.noiseModel.Diagonal') && isa(varargin{3},'numeric') && isa(varargin{4},'logical')
        [ varargout{1} varargout{2} ] = gtsam_wrapper(2470, varargin{:});
      elseif length(varargin) == 3 && isa(varargin{1},'char') && isa(varargin{2},'gtsam.noiseModel.Diagonal') && isa(varargin{3},'numeric')
        [ varargout{1} varargout{2} ] = gtsam_wrapper(2471, varargin{:});
      elseif length(varargin) == 2 && isa(varargin{1},'char') && isa(varargin{2},'gtsam.noiseModel.Diagonal')
        [ varargout{1} varargout{2} ] = gtsam_wrapper(2472, varargin{:});
      elseif length(varargin) == 1 && isa(varargin{1},'char')
        [ varargout{1} varargout{2} ] = gtsam_wrapper(2473, varargin{:});
      else
        error('Arguments do not match any overload of function gtsam.load2D');
      end
