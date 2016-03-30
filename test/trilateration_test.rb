require 'minitest_helper'

class TrilaterationTest < Minitest::Test
  def test_that_it_has_a_version_number
    refute_nil ::Trilateration::VERSION
  end

  def test_trilateration
    p1 = ::Trilateration::Point.new(1, 2)
    p2 = ::Trilateration::Point.new(8, 6)
    p3 = ::Trilateration::Point.new(1, 6)
    tri = ::Trilateration::Calculate.new(p1, p2, p3)

    test_output = tri.calculate_from_test_point(Trilateration::Point.new(4.25, 4.15, 1))
    output = tri.calculate_from_distances(4.02305854, 4.43677811, 3.87104637)

    assert_equal(test_output.x_rounded, output.x_rounded, 'X Coordinate is not correct')
    assert_equal(test_output.y_rounded, output.y_rounded, 'Y Coordinate is not correct')

    unless test_output.z.is_a?(Complex)
      refute_kind_of(Complex, output.z, "Z Coordinate shouldn't be a Complex")
      assert_equal(test_output.z_rounded, output.z_rounded, 'Z Coordinate is not correct')
    end
  end
end
