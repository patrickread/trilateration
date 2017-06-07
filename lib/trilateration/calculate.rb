require 'matrix'

module Trilateration
  class Calculate
    attr_accessor :point1, :point2, :point3, :rel_point1, :rel_point2, :rel_point3

    # where point1 is our origin, and p2 and p3 are two other
    # sensors in which we know the relative positions
    def initialize(p1, p2, p3)
      @point1 = p1
      @point2 = p2
      @point3 = p3

      # adjust all the points so that they are relative to p1
      @rel_point1 = Vector[0, 0, 0]
      @rel_point2 = @point2 - @point1
      @rel_point3 = @point3 - @point1
    end

    # Trilaterating an X,Y coordinate of an object based on its distance
    # from three sensor points which are at known coordinate positions
    # input: target point relative to the first sensor
    def calculate_from_distances(dist1, dist2, dist3)
      # From Wikipedia: https://en.wikipedia.org/wiki/Trilateration
      ex = @rel_point2 / @rel_point2.norm
      i = ex.dot(@rel_point3)
      ey = (@rel_point3 - (i * ex)) / (@rel_point3 - (i * ex)).norm
      ez = ex.cross(ey)
      d = @rel_point2.norm
      j = ey.dot(@rel_point3)

      x = (dist1**2 - dist2**2 + d**2) / (2 * d)
      y = ((dist1**2 - dist3**2 + i**2 + j**2) / (2 * j)) - ((i / j) * x)

      z = Math.sqrt((dist1**2 - x**2 - y**2).abs)

      @point1 + (x * ex) + (y * ey) + (z * ez)
    end

    # used similarly as calculate_from_distances, except this is a test method
    # input: a target point whose coordinates from @point1 are already known,
    # in order to test the trilateration algorithm quickly
    def calculate_from_test_point(target_point)
      dist1 = calculate_distance(target_point, @point1)
      dist2 = calculate_distance(target_point, @point2)
      dist3 = calculate_distance(target_point, @point3)

      calculate_from_distances(dist1, dist2, dist3)
    end

    def calculate_distance(target_point, origin_point)
      (target_point - origin_point).r
    end
  end
end
