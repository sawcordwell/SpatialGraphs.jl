using SpatialGraphs
using Base.Test

@test Point{Float64} <: Geometry{Float64}

@test Point(1, 2) + Point(2, 1) == Point(3, 3)
@test Point(1.0, 2.0) + Point(2, 1) == Point(3.0, 3.0)
@test Point(1, 2) * 2 == Point(2, 4)
@test Point(1, 2) * 2.0 == Point(2.0, 4.0)
@test 2 * Point(1, 2) == Point(2.0, 4.0)

SimpleSpatialVertex(1, Point(1.2, 3.5))
SimpleSpatialVertex(1, 1.2, 3.5)
