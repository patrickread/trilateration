require 'minitest_helper'

class TrilaterationTest < Minitest::Test
  def test_that_it_has_a_version_number
    refute_nil Trilateration::VERSION
  end

  def test_trilateration_from_test_point
    p1 = Vector[1, 2, 0]
    p2 = Vector[8, 6, 0]
    p3 = Vector[1, 6, 0]
    tri = Trilateration::Calculate.new(p1, p2, p3)

    output = tri.calculate_from_test_point(Vector[4.25, 4.15, 1])

    assert_equal(4.25, output[0].round(3), 'X Coordinate is not correct')
    assert_equal(4.15, output[1].round(3), 'Y Coordinate is not correct')

    refute_kind_of(Complex, output[2], "Z Coordinate shouldn't be a Complex")
    assert_equal(1, output[2].round(3), 'Z Coordinate is not correct')
  end

  def test_readme_example
    p1 = Vector[1, 2, 0]
    p2 = Vector[8, 6, 0]
    p3 = Vector[1, 6, 0]
    tri = Trilateration::Calculate.new(p1, p2, p3)

    output = tri.calculate_from_distances(4.02305854, 4.29941857, 3.87104637)

    assert_equal(4.25, output[0].round(3), 'X Coordinate is not correct')
    assert_equal(4.15, output[1].round(3), 'Y Coordinate is not correct')

    refute_kind_of(Complex, output[2], "Z Coordinate shouldn't be a Complex")
    assert_equal(1, output[2].round(3), 'Z Coordinate is not correct')
  end

  def test_simple_trilateration
    p1 = Vector[3, 3, 0]
    p2 = Vector[6, 3, 0]
    p3 = Vector[4, 6, 0]
    tri = Trilateration::Calculate.new(p1, p2, p3)

    output = tri.calculate_from_distances(1, 2, 3)

    assert_equal 4, output[0], 'X Coordinate is not correct'
    assert_equal 3, output[1], 'Y Coordinate is not correct'

    refute_kind_of(Complex, output[2], "Z Coordinate shouldn't be a Complex")
    assert_equal 0, output[2], 'Z Coordinate is not correct'
  end

  def test_another_simple_trilateration
    p1 = Vector[2, 1, 0]
    p2 = Vector[4, 2, 0]
    p3 = Vector[3, 3, 0]
    tri = Trilateration::Calculate.new(p1, p2, p3)

    output = tri.calculate_from_distances(Math.sqrt(2), 1, 1)

    assert_equal 3, output[0].round(3), 'X Coordinate is not correct'
    assert_equal 2, output[1].round(3), 'Y Coordinate is not correct'

    refute_kind_of(Complex, output[2], "Z Coordinate shouldn't be a Complex")
    assert_equal 0, output[2].round(3), 'Z Coordinate is not correct'
  end

  def test_distance_calculations
    p1 = Vector[3, 1, 0]
    p2 = Vector[1, 5, 0]
    p3 = Vector[4, 4, 0]
    tri = Trilateration::Calculate.new(p1, p2, p3)

    assert_equal 1, tri.calculate_distance(Vector[3, 2, 0], p1)
    assert_equal Math.sqrt(2), tri.calculate_distance(Vector[2, 4, 0], p2)
    assert_equal Math.sqrt(10), tri.calculate_distance(Vector[5, 7, 0], p3)
  end
end
