%class SimPolygon2D, see Doxygen page for details
%at http://research.cc.gatech.edu/borg/sites/edu.borg/html/index.html
%
%-------Methods-------
%contains(Point2 p) : returns bool
%equals(SimPolygon2D p, double tol) : returns bool
%landmark(size_t i) : returns gtsam::Point2
%overlaps(SimPolygon2D p) : returns bool
%print(string s) : returns void
%size() : returns size_t
%vertices() : returns gtsam::Point2Vector
%walls() : returns gtsam::SimWall2DVector
%
%-------Static Methods-------
%anyContains(Point2 p, SimPolygon2DVector obstacles) : returns bool
%anyOverlaps(SimPolygon2D p, SimPolygon2DVector obstacles) : returns bool
%createRectangle(Point2 p, double height, double width) : returns gtsam::SimPolygon2D
%createTriangle(Point2 pA, Point2 pB, Point2 pC) : returns gtsam::SimPolygon2D
%insideBox(double s, Point2 p) : returns bool
%nearExisting(Point2Vector S, Point2 p, double threshold) : returns bool
%randomAngle() : returns gtsam::Rot2
%randomBoundedPoint2(double boundary_size, Point2Vector landmarks, double min_landmark_dist) : returns gtsam::Point2
%randomBoundedPoint2(double boundary_size, Point2Vector landmarks, SimPolygon2DVector obstacles, double min_landmark_dist) : returns gtsam::Point2
%randomBoundedPoint2(double boundary_size, SimPolygon2DVector obstacles) : returns gtsam::Point2
%randomBoundedPoint2(Point2 LL_corner, Point2 UR_corner, Point2Vector landmarks, SimPolygon2DVector obstacles, double min_landmark_dist) : returns gtsam::Point2
%randomDistance(double mu, double sigma) : returns double
%randomDistance(double mu, double sigma, double min_dist) : returns double
%randomFreePose(double boundary_size, SimPolygon2DVector obstacles) : returns gtsam::Pose2
%randomPoint2(double s) : returns gtsam::Point2
%randomRectangle(double side_len, double mean_side_len, double sigma_side_len, double min_vertex_dist, double min_side_len, SimPolygon2DVector existing_polys) : returns gtsam::SimPolygon2D
%randomTriangle(double side_len, double mean_side_len, double sigma_side_len, double min_vertex_dist, double min_side_len, SimPolygon2DVector existing_polys) : returns gtsam::SimPolygon2D
%seedGenerator(size_t seed) : returns void
%
classdef SimPolygon2D < handle
  properties
    ptr_gtsamSimPolygon2D = 0
  end
  methods
    function obj = SimPolygon2D(varargin)
      if nargin == 2 && isa(varargin{1}, 'uint64') && varargin{1} == uint64(5139824614673773682)
        my_ptr = varargin{2};
        gtsam_unstable_wrapper(116, my_ptr);
      else
        error('Arguments do not match any overload of gtsam.SimPolygon2D constructor');
      end
      obj.ptr_gtsamSimPolygon2D = my_ptr;
    end

    function delete(obj)
      gtsam_unstable_wrapper(117, obj.ptr_gtsamSimPolygon2D);
    end

    function display(obj), obj.print(''); end
    %DISPLAY Calls print on the object
    function disp(obj), obj.display; end
    %DISP Calls print on the object
    function varargout = contains(this, varargin)
      % CONTAINS usage: contains(Point2 p) : returns bool
      % Doxygen can be found at http://research.cc.gatech.edu/borg/sites/edu.borg/html/index.html
      if length(varargin) == 1 && isa(varargin{1},'gtsam.Point2')
        varargout{1} = gtsam_unstable_wrapper(118, this, varargin{:});
      else
        error('Arguments do not match any overload of function gtsam.SimPolygon2D.contains');
      end
    end

    function varargout = equals(this, varargin)
      % EQUALS usage: equals(SimPolygon2D p, double tol) : returns bool
      % Doxygen can be found at http://research.cc.gatech.edu/borg/sites/edu.borg/html/index.html
      if length(varargin) == 2 && isa(varargin{1},'gtsam.SimPolygon2D') && isa(varargin{2},'double')
        varargout{1} = gtsam_unstable_wrapper(119, this, varargin{:});
      else
        error('Arguments do not match any overload of function gtsam.SimPolygon2D.equals');
      end
    end

    function varargout = landmark(this, varargin)
      % LANDMARK usage: landmark(size_t i) : returns gtsam::Point2
      % Doxygen can be found at http://research.cc.gatech.edu/borg/sites/edu.borg/html/index.html
      varargout{1} = gtsam_unstable_wrapper(120, this, varargin{:});
    end

    function varargout = overlaps(this, varargin)
      % OVERLAPS usage: overlaps(SimPolygon2D p) : returns bool
      % Doxygen can be found at http://research.cc.gatech.edu/borg/sites/edu.borg/html/index.html
      if length(varargin) == 1 && isa(varargin{1},'gtsam.SimPolygon2D')
        varargout{1} = gtsam_unstable_wrapper(121, this, varargin{:});
      else
        error('Arguments do not match any overload of function gtsam.SimPolygon2D.overlaps');
      end
    end

    function varargout = print(this, varargin)
      % PRINT usage: print(string s) : returns void
      % Doxygen can be found at http://research.cc.gatech.edu/borg/sites/edu.borg/html/index.html
      if length(varargin) == 1 && isa(varargin{1},'char')
        gtsam_unstable_wrapper(122, this, varargin{:});
      else
        error('Arguments do not match any overload of function gtsam.SimPolygon2D.print');
      end
    end

    function varargout = size(this, varargin)
      % SIZE usage: size() : returns size_t
      % Doxygen can be found at http://research.cc.gatech.edu/borg/sites/edu.borg/html/index.html
      varargout{1} = gtsam_unstable_wrapper(123, this, varargin{:});
    end

    function varargout = vertices(this, varargin)
      % VERTICES usage: vertices() : returns gtsam::Point2Vector
      % Doxygen can be found at http://research.cc.gatech.edu/borg/sites/edu.borg/html/index.html
      varargout{1} = gtsam_unstable_wrapper(124, this, varargin{:});
    end

    function varargout = walls(this, varargin)
      % WALLS usage: walls() : returns gtsam::SimWall2DVector
      % Doxygen can be found at http://research.cc.gatech.edu/borg/sites/edu.borg/html/index.html
      varargout{1} = gtsam_unstable_wrapper(125, this, varargin{:});
    end

  end

  methods(Static = true)
    function varargout = AnyContains(varargin)
      % ANYCONTAINS usage: anyContains(Point2 p, SimPolygon2DVector obstacles) : returns bool
      % Doxygen can be found at http://research.cc.gatech.edu/borg/sites/edu.borg/html/index.html
      % 
      % Usage
      % ANYCONTAINS(Point2 p, SimPolygon2DVector obstacles)
      if length(varargin) == 2 && isa(varargin{1},'gtsam.Point2') && isa(varargin{2},'gtsam.SimPolygon2DVector')
        varargout{1} = gtsam_unstable_wrapper(126, varargin{:});
      else
        error('Arguments do not match any overload of function gtsam.SimPolygon2D.AnyContains');
      end
    end

    function varargout = AnyOverlaps(varargin)
      % ANYOVERLAPS usage: anyOverlaps(SimPolygon2D p, SimPolygon2DVector obstacles) : returns bool
      % Doxygen can be found at http://research.cc.gatech.edu/borg/sites/edu.borg/html/index.html
      % 
      % Usage
      % ANYOVERLAPS(SimPolygon2D p, SimPolygon2DVector obstacles)
      if length(varargin) == 2 && isa(varargin{1},'gtsam.SimPolygon2D') && isa(varargin{2},'gtsam.SimPolygon2DVector')
        varargout{1} = gtsam_unstable_wrapper(127, varargin{:});
      else
        error('Arguments do not match any overload of function gtsam.SimPolygon2D.AnyOverlaps');
      end
    end

    function varargout = CreateRectangle(varargin)
      % CREATERECTANGLE usage: createRectangle(Point2 p, double height, double width) : returns gtsam::SimPolygon2D
      % Doxygen can be found at http://research.cc.gatech.edu/borg/sites/edu.borg/html/index.html
      % 
      % Usage
      % CREATERECTANGLE(Point2 p, double height, double width)
      if length(varargin) == 3 && isa(varargin{1},'gtsam.Point2') && isa(varargin{2},'double') && isa(varargin{3},'double')
        varargout{1} = gtsam_unstable_wrapper(128, varargin{:});
      else
        error('Arguments do not match any overload of function gtsam.SimPolygon2D.CreateRectangle');
      end
    end

    function varargout = CreateTriangle(varargin)
      % CREATETRIANGLE usage: createTriangle(Point2 pA, Point2 pB, Point2 pC) : returns gtsam::SimPolygon2D
      % Doxygen can be found at http://research.cc.gatech.edu/borg/sites/edu.borg/html/index.html
      % 
      % Usage
      % CREATETRIANGLE(Point2 pA, Point2 pB, Point2 pC)
      if length(varargin) == 3 && isa(varargin{1},'gtsam.Point2') && isa(varargin{2},'gtsam.Point2') && isa(varargin{3},'gtsam.Point2')
        varargout{1} = gtsam_unstable_wrapper(129, varargin{:});
      else
        error('Arguments do not match any overload of function gtsam.SimPolygon2D.CreateTriangle');
      end
    end

    function varargout = InsideBox(varargin)
      % INSIDEBOX usage: insideBox(double s, Point2 p) : returns bool
      % Doxygen can be found at http://research.cc.gatech.edu/borg/sites/edu.borg/html/index.html
      % 
      % Usage
      % INSIDEBOX(double s, Point2 p)
      if length(varargin) == 2 && isa(varargin{1},'double') && isa(varargin{2},'gtsam.Point2')
        varargout{1} = gtsam_unstable_wrapper(130, varargin{:});
      else
        error('Arguments do not match any overload of function gtsam.SimPolygon2D.InsideBox');
      end
    end

    function varargout = NearExisting(varargin)
      % NEAREXISTING usage: nearExisting(Point2Vector S, Point2 p, double threshold) : returns bool
      % Doxygen can be found at http://research.cc.gatech.edu/borg/sites/edu.borg/html/index.html
      % 
      % Usage
      % NEAREXISTING(Point2Vector S, Point2 p, double threshold)
      if length(varargin) == 3 && isa(varargin{1},'gtsam.Point2Vector') && isa(varargin{2},'gtsam.Point2') && isa(varargin{3},'double')
        varargout{1} = gtsam_unstable_wrapper(131, varargin{:});
      else
        error('Arguments do not match any overload of function gtsam.SimPolygon2D.NearExisting');
      end
    end

    function varargout = RandomAngle(varargin)
      % RANDOMANGLE usage: randomAngle() : returns gtsam::Rot2
      % Doxygen can be found at http://research.cc.gatech.edu/borg/sites/edu.borg/html/index.html
      % 
      % Usage
      % RANDOMANGLE()
      if length(varargin) == 0
        varargout{1} = gtsam_unstable_wrapper(132, varargin{:});
      else
        error('Arguments do not match any overload of function gtsam.SimPolygon2D.RandomAngle');
      end
    end

    function varargout = RandomBoundedPoint2(varargin)
      % RANDOMBOUNDEDPOINT2 usage: randomBoundedPoint2(double boundary_size, Point2Vector landmarks, double min_landmark_dist), randomBoundedPoint2(double boundary_size, Point2Vector landmarks, SimPolygon2DVector obstacles, double min_landmark_dist), randomBoundedPoint2(double boundary_size, SimPolygon2DVector obstacles), randomBoundedPoint2(Point2 LL_corner, Point2 UR_corner, Point2Vector landmarks, SimPolygon2DVector obstacles, double min_landmark_dist) : returns gtsam::Point2
      % Doxygen can be found at http://research.cc.gatech.edu/borg/sites/edu.borg/html/index.html
      % 
      % Usage
      % RANDOMBOUNDEDPOINT2(double boundary_size, Point2Vector landmarks, double min_landmark_dist)
      % RANDOMBOUNDEDPOINT2(double boundary_size, Point2Vector landmarks, SimPolygon2DVector obstacles, double min_landmark_dist)
      % RANDOMBOUNDEDPOINT2(double boundary_size, SimPolygon2DVector obstacles)
      % RANDOMBOUNDEDPOINT2(Point2 LL_corner, Point2 UR_corner, Point2Vector landmarks, SimPolygon2DVector obstacles, double min_landmark_dist)
      if length(varargin) == 3 && isa(varargin{1},'double') && isa(varargin{2},'gtsam.Point2Vector') && isa(varargin{3},'double')
        varargout{1} = gtsam_unstable_wrapper(133, varargin{:});
      elseif length(varargin) == 4 && isa(varargin{1},'double') && isa(varargin{2},'gtsam.Point2Vector') && isa(varargin{3},'gtsam.SimPolygon2DVector') && isa(varargin{4},'double')
        varargout{1} = gtsam_unstable_wrapper(134, varargin{:});
      elseif length(varargin) == 2 && isa(varargin{1},'double') && isa(varargin{2},'gtsam.SimPolygon2DVector')
        varargout{1} = gtsam_unstable_wrapper(135, varargin{:});
      elseif length(varargin) == 5 && isa(varargin{1},'gtsam.Point2') && isa(varargin{2},'gtsam.Point2') && isa(varargin{3},'gtsam.Point2Vector') && isa(varargin{4},'gtsam.SimPolygon2DVector') && isa(varargin{5},'double')
        varargout{1} = gtsam_unstable_wrapper(136, varargin{:});
      else
        error('Arguments do not match any overload of function gtsam.SimPolygon2D.RandomBoundedPoint2');
      end
    end

    function varargout = RandomDistance(varargin)
      % RANDOMDISTANCE usage: randomDistance(double mu, double sigma), randomDistance(double mu, double sigma, double min_dist) : returns double
      % Doxygen can be found at http://research.cc.gatech.edu/borg/sites/edu.borg/html/index.html
      % 
      % Usage
      % RANDOMDISTANCE(double mu, double sigma)
      % RANDOMDISTANCE(double mu, double sigma, double min_dist)
      if length(varargin) == 2 && isa(varargin{1},'double') && isa(varargin{2},'double')
        varargout{1} = gtsam_unstable_wrapper(137, varargin{:});
      elseif length(varargin) == 3 && isa(varargin{1},'double') && isa(varargin{2},'double') && isa(varargin{3},'double')
        varargout{1} = gtsam_unstable_wrapper(138, varargin{:});
      else
        error('Arguments do not match any overload of function gtsam.SimPolygon2D.RandomDistance');
      end
    end

    function varargout = RandomFreePose(varargin)
      % RANDOMFREEPOSE usage: randomFreePose(double boundary_size, SimPolygon2DVector obstacles) : returns gtsam::Pose2
      % Doxygen can be found at http://research.cc.gatech.edu/borg/sites/edu.borg/html/index.html
      % 
      % Usage
      % RANDOMFREEPOSE(double boundary_size, SimPolygon2DVector obstacles)
      if length(varargin) == 2 && isa(varargin{1},'double') && isa(varargin{2},'gtsam.SimPolygon2DVector')
        varargout{1} = gtsam_unstable_wrapper(139, varargin{:});
      else
        error('Arguments do not match any overload of function gtsam.SimPolygon2D.RandomFreePose');
      end
    end

    function varargout = RandomPoint2(varargin)
      % RANDOMPOINT2 usage: randomPoint2(double s) : returns gtsam::Point2
      % Doxygen can be found at http://research.cc.gatech.edu/borg/sites/edu.borg/html/index.html
      % 
      % Usage
      % RANDOMPOINT2(double s)
      if length(varargin) == 1 && isa(varargin{1},'double')
        varargout{1} = gtsam_unstable_wrapper(140, varargin{:});
      else
        error('Arguments do not match any overload of function gtsam.SimPolygon2D.RandomPoint2');
      end
    end

    function varargout = RandomRectangle(varargin)
      % RANDOMRECTANGLE usage: randomRectangle(double side_len, double mean_side_len, double sigma_side_len, double min_vertex_dist, double min_side_len, SimPolygon2DVector existing_polys) : returns gtsam::SimPolygon2D
      % Doxygen can be found at http://research.cc.gatech.edu/borg/sites/edu.borg/html/index.html
      % 
      % Usage
      % RANDOMRECTANGLE(double side_len, double mean_side_len, double sigma_side_len, double min_vertex_dist, double min_side_len, SimPolygon2DVector existing_polys)
      if length(varargin) == 6 && isa(varargin{1},'double') && isa(varargin{2},'double') && isa(varargin{3},'double') && isa(varargin{4},'double') && isa(varargin{5},'double') && isa(varargin{6},'gtsam.SimPolygon2DVector')
        varargout{1} = gtsam_unstable_wrapper(141, varargin{:});
      else
        error('Arguments do not match any overload of function gtsam.SimPolygon2D.RandomRectangle');
      end
    end

    function varargout = RandomTriangle(varargin)
      % RANDOMTRIANGLE usage: randomTriangle(double side_len, double mean_side_len, double sigma_side_len, double min_vertex_dist, double min_side_len, SimPolygon2DVector existing_polys) : returns gtsam::SimPolygon2D
      % Doxygen can be found at http://research.cc.gatech.edu/borg/sites/edu.borg/html/index.html
      % 
      % Usage
      % RANDOMTRIANGLE(double side_len, double mean_side_len, double sigma_side_len, double min_vertex_dist, double min_side_len, SimPolygon2DVector existing_polys)
      if length(varargin) == 6 && isa(varargin{1},'double') && isa(varargin{2},'double') && isa(varargin{3},'double') && isa(varargin{4},'double') && isa(varargin{5},'double') && isa(varargin{6},'gtsam.SimPolygon2DVector')
        varargout{1} = gtsam_unstable_wrapper(142, varargin{:});
      else
        error('Arguments do not match any overload of function gtsam.SimPolygon2D.RandomTriangle');
      end
    end

    function varargout = SeedGenerator(varargin)
      % SEEDGENERATOR usage: seedGenerator(size_t seed) : returns void
      % Doxygen can be found at http://research.cc.gatech.edu/borg/sites/edu.borg/html/index.html
      % 
      % Usage
      % SEEDGENERATOR(size_t seed)
      if length(varargin) == 1 && isa(varargin{1},'numeric')
        gtsam_unstable_wrapper(143, varargin{:});
      else
        error('Arguments do not match any overload of function gtsam.SimPolygon2D.SeedGenerator');
      end
    end

  end
end
