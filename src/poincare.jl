export psos

propagate_posvel(pos, p::Particle{T}, t) where {T} =
    (SV{T}(pos[1] + p.vel[1]*t, pos[2] + p.vel[2]*t), p.vel)

function propagate_posvel(pos, p::MagneticParticle{T}, t) where {T}
    ω = p.omega
    φ0 = atan2(p.vel[2], p.vel[1])
    s0, c0 = sincos(φ0)
    sωφ0, cωφ0 = sincos(ω*t + φ0)
    ppos = SV{T}(sωφ0/ω - s0/ω, -cωφ0/ω + c0/ω)
    psos_vel = SV{T}(cωφ0, sωφ0)
    return pos + ppos, psos_vel
end


"""
    psos(bd::Billiard, plane::InfiniteWall, t, particles)
Compute the Poincaré section of the `particles` with the given `plane`, by evolving
each one for time `t` (either integer or float) inside `bd`.

The `plane` can be an [`InfiniteWall`](@ref) of *any* orientation, however only
crossings of the `plane` such that `dot(velocity, normal) < 0` are allowed, with
`normal` the normal unit vector of the `plane`.

`particles` can be:
* A single particle.
* A `Vector` of particles.
* An integer `n` optionally followed by an angular velocity `ω`.

Return the positions `poss` and velocities `vels` at the instances of crossing
the `plane`. If given more than one particle, the result is a vector of vectors
of vectors.
"""
function psos(
    bd::Billiard{T}, plane::InfiniteWall{T}, t, par::AbstractParticle{T}) where {T}

    p = deepcopy(par)
    rpos = SV{T}[]
    rvel = SV{T}[]
    count = zero(t)

    # periodic = isperiodic(bd)
    # ismagnetic = typeof(p) <: MagneticParticle
    # ismagnetic && (absω = abs(p.omega))
    # t_to_write = zero(T)

    while count < t
        # compute collision times
        tmin::T, i::Int = next_collision(p, bd)

        # if periodic && typeof(bd[i]) <: PeriodicWall

        tplane = collisiontime(p, plane)

        # if tplane is smaller, I intersect the section
        if tplane ≥ 0 && tplane < tmin && tplane != Inf
            psos_pos, psos_vel = propagate_posvel(p.pos, p, tplane)
            if dot(psos_vel, plane.normal) < 0 # only write crossings with 1 direction
                push!(rpos, psos_pos); push!(rvel, psos_vel)
            end
        end

        tmin == Inf && break
        # Now "bounce" the particle normally:
        tmin = relocate!(p, bd[i], tmin)
        resolvecollision!(p, bd[i])

        count += increment_counter(t, tmin)
    end
    return rpos, rvel
end

function psos(bd::Billiard{T}, plane::InfiniteWall{T}, t,
    pars::Vector{<:AbstractParticle{T}}) where {T}

    retpos = Vector{SV{T}}[]
    retvel = Vector{SV{T}}[]

    for p ∈ pars
        rpos, rvel = psos(bd, plane, t, p)
        push!(retpos, rpos); push!(retvel, rvel)
    end
    return retpos, retvel
end

psos(bd, plane, t, n::Integer) = psos(bd, plane, t, [randominside(bd) for i=1:n])
psos(bd, plane, t, n::Integer, ω::Real) =
psos(bd, plane, t, [randominside(bd, ω) for i=1:n])
