require 'minitest_helper'

class TrilaterationTest < Minitest::Test
  def test_that_it_has_a_version_number
    refute_nil Trilateration::VERSION
  end

  def test_trilateration_from_test_point
    p1 = Trilateration::Point.new(1, 2)
    p2 = Trilateration::Point.new(8, 6)
    p3 = Trilateration::Point.new(1, 6)
    tri = Trilateration::Calculate.new(p1, p2, p3)

    output = tri.calculate_from_test_point(Trilateration::Point.new(4.25, 4.15, 1))

    assert_equal(4.25, output.x_rounded, 'X Coordinate is not correct')
    assert_equal(4.15, output.y_rounded, 'Y Coordinate is not correct')

    refute_kind_of(Complex, output.z, "Z Coordinate shouldn't be a Complex")
    assert_equal(1, output.z_rounded, 'Z Coordinate is not correct')
  end

  def test_readme_example
    p1 = Trilateration::Point.new(1, 2)
    p2 = Trilateration::Point.new(8, 6)
    p3 = Trilateration::Point.new(1, 6)
    tri = Trilateration::Calculate.new(p1, p2, p3)

    output = tri.calculate_from_distances(4.02305854, 4.43677811, 3.87104637)

    assert_equal(4.25, output.x_rounded, 'X Coordinate is not correct')
    assert_equal(4.15, output.y_rounded, 'Y Coordinate is not correct')

    refute_kind_of(Complex, output.z, "Z Coordinate shouldn't be a Complex")
    assert_equal(1, output.z_rounded, 'Z Coordinate is not correct')
  end

  def test_simple_trilateration
    p1 = Trilateration::Point.new(3, 3)
    p2 = Trilateration::Point.new(6, 3)
    p3 = Trilateration::Point.new(4, 6)
    tri = Trilateration::Calculate.new(p1, p2, p3)

    output = tri.calculate_from_distances(1, 2, 3)

    assert_equal 4, output.x, 'X Coordinate is not correct'
    assert_equal 3, output.y, 'Y Coordinate is not correct'

    refute_kind_of(Complex, output.z, "Z Coordinate shouldn't be a Complex")
    assert_equal 0, output.z, 'Z Coordinate is not correct'
  end

  def test_distance_calculations
    p1 = Trilateration::Point.new(3, 1)
    p2 = Trilateration::Point.new(1, 5)
    p3 = Trilateration::Point.new(4, 4)
    tri = Trilateration::Calculate.new(p1, p2, p3)

    relative_target = tri.get_relative_point(Trilateration::Point.new(3, 2), tri.point1)
    assert_equal 1, tri.calculate_dist1(relative_target)

    relative_target = tri.get_relative_point(Trilateration::Point.new(2, 4), tri.point1)
    assert_equal Math.sqrt(2), tri.calculate_dist2(relative_target)

    relative_target = tri.get_relative_point(Trilateration::Point.new(5, 7), tri.point1)
    assert_equal Math.sqrt(10), tri.calculate_dist3(relative_target)
  end
end
