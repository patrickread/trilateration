Trilateration calculates the position of an unknown point, using the distance from three known points to it.

Example Usage:

p1 = Trilateration::Point.new(1,2)
p2 = Trilateration::Point.new(8,6)
p3 = Trilateration::Point.new(1,6)
tri = Trilateration::Calculate.new(p1, p2, p3)

output = tri.calculate_from_distances(4.02305854, 4.43677811, 3.87104637)