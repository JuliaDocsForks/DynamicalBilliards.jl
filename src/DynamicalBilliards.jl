__precompile__()

"""
A Julia package for dynamical billiard systems in two dimensions.

The goals of the package is to provide a flexible, easy-to-use
and intuitive framework for
fast implementation of billiard systems of arbitrary construction.
"""
module DynamicalBilliards

using LinearAlgebra
using StaticArrays
import Base: show, eltype, getindex

using Elliptic
using MuladdMacro
# The @muladd macro turns all expressions of the type
# a = b*c ± d
# to a call to `muladd`
# This can increase performance in some cases.

const SV = SVector{2}
export SVector

cossin(a) = ((x, y) = sincos(a); (y, x))

##########################################
# Core                                   #
##########################################
include("billiards/particles.jl")
include("billiards/obstacles.jl")
include("billiards/billiardtable.jl")
include("billiards/standard_billiards.jl")

include("timeevolution/collisions.jl")
include("timeevolution/propagation.jl")
include("timeevolution/highleveltimes.jl")

include("boundary/boundarymap.jl")
include("boundary/phasespacetools.jl")

include("poincare.jl")
include("lyapunov_spectrum.jl")

include("mushroomtools.jl")
export MushroomTools

include("raysplitting.jl")

include("parallel.jl")

include("testing.jl")

##########################################
# Test Options                           #
##########################################
"""
    test_options(;print_info = false, long_tests = false)
Set if you want the long version of the tests and if you want information to be
printed during testing.
"""
function test_options(;print_info::Bool = true, long_tests::Bool = true)
    ENV["DYNAMICALBILLIARDS_PRINTTEST"] = print_info
    ENV["DYNAMICALBILLIARDS_LONGTEST"] = long_tests
end

####################################################
# Plotting Routines (loaded when `Using PyPlot`)   #
####################################################
using Requires
function __init__()
    @require PyPlot="d330b81b-6aea-500a-939a-2ce795aea3ee" begin
        import .PyPlot: plot
        dir = joinpath(@__DIR__, "plotting")
        for f in readdir(dir)
            include(joinpath(dir, f))
        end
    end
end


###################
# Update messages #
###################
if !isfile(joinpath(@__DIR__, "update_v2.0.0"))
printstyled(stdout,
"""
\nUpdate message: DynamicalBilliards v2.0

The new version v2.0 of DynamicalBilliards brings massive performance
increase, a ton of new features, a more intuitive and simpler low-level interface,
automated animation production and much more stuff!

There are also a small amount of minor breaking changes! Please see the
updated documentation page as well as the changelog.\n
"""; color = :light_magenta)
touch(joinpath(@__DIR__, "update_v2.0.0"))
end


end#module
