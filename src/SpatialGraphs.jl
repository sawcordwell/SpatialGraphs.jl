module SpatialGraphs

using Graphs

import Graphs: vertex_index

export # Types
       Geometry,
       Point,
       SimpleSpatialVertex,
       SpatialVertex,
       # Graphs.jl interfaces
       vertex_index,
       # Spatial interfaces
       geometry,
       # Visualisation
       plot


abstract SpatialVertex
abstract Geometry{T<:Real}

vertex_index(v::SpatialVertex) = v.index
geometry(v::SpatialVertex) = v.geom

immutable Point{T} <: Geometry{T}
  x::T
  y::T
end

(+)(a::Point, b::Point) = Point(a.x + b.x, a.y + b.y)
(-)(a::Point, b::Point) = Point(a.x - b.x, a.y - b.y)
(*)(p::Point, s::Real) = Point(p.x*s, p.y*s)
(*)(s::Real, p::Point) = p*s
(==)(a::Point, b::Point) = ==(a.x, b.x) && ==(a.y, b.y)

type SimpleSpatialVertex{T} <: SpatialVertex
  index::Int
  geom::Geometry{T}
end
SimpleSpatialVertex{T}(id::Int, x::T, y::T) =
  SimpleSpatialVertex(id, Point(x, y))

end # module
