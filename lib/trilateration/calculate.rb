require 'trilateration/point'

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
      @rel_point1 = Point.new(0, 0, 0)
      @rel_point2 = get_relative_point(@point2, @point1)
      @rel_point3 = get_relative_point(@point3, @point1)
    end

    # Trilaterating an X,Y coordinate of an object based on its distance
    # from three sensor points which are at known coordinate positions
    # input: target point relative to the first sensor
    def calculate_from_distances(dist1, dist2, dist3)
      x = ((dist1 ** 2) - (dist2 ** 2) + (@rel_point2.x ** 2)) / (2 * @rel_point2.x)

      a = ((dist1 ** 2) - (dist3 ** 2) + (@rel_point3.x ** 2) + (@rel_point3.y ** 2)) / (2 * @rel_point3.y)
      b = (@rel_point3.x * dist1) / @rel_point3.y

      y = a - b

      z = ((dist1 ** 2) - (x ** 2) - (y ** 2)) ** 0.5

      Point.new(@point1.x + x, @point1.y + y, @point1.z + z)
    end

    # used similarly as calculate_from_distances, except this is a test method
    # input: a target point whose coordinates from @point1 are already known,
    # in order to test the trilateration algorithm quickly
    def calculate_from_test_point(target_point)
      rel_target_point = get_relative_point(target_point, @point1)
      dist1 = calculate_dist1(rel_target_point)
      dist2 = calculate_dist2(rel_target_point)
      dist3 = calculate_dist3(rel_target_point)

      calculate_from_distances(dist1, dist2, dist3)
    end

    def get_relative_point(relative_point, origin_point)
      Point.new(relative_point.x - origin_point.x, relative_point.y - origin_point.y, relative_point.z - origin_point.z)
    end

    def calculate_dist1(target_point)
      ((target_point.x ** 2) + (target_point.y ** 2) + (target_point.z ** 2)) ** 0.5
    end

    def calculate_dist2(target_point)
      (((target_point.x - @rel_point2.x) ** 2) + ((target_point.y - @rel_point2.y) ** 2) + (target_point.z ** 2)) ** 0.5
    end

    def calculate_dist3(target_point)
      (((target_point.x - @rel_point3.x) ** 2) + ((target_point.y - @rel_point3.y) ** 2) + (target_point.z ** 2)) ** 0.5
    end
  end
end
