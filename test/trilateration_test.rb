require 'minitest_helper'

class TrilaterationTest < Minitest::Test
  def test_that_it_has_a_version_number
    refute_nil Trilateration::VERSION
  end

  def test_trilateration
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
end
