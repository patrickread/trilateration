module Trilateration
  class Point
    attr_accessor :x, :y, :z

    # Third dimension is optional
    def initialize pointX, pointY, pointZ=0
      @x = pointX
      @y = pointY
      @z = pointZ
    end

    def x_rounded
      @x.round(3)
    end

    def y_rounded
      @y.round(3)
    end

    def z_rounded
      @z.round(3)
    end
  end
end