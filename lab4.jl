# problem 4.1
function mean(x::AbstractVector)::Number
    return sum(x) / length(x)
end

using Random
mean([randn() + im * randn() for i in 1:100])

# problem 4.2
function peak2peak(x::AbstractVector)::Real
    v = maximum(x) - minimum(x)
    return v
end

# peak2peak(x::AbstractVector)::Real = maximum(x) - minimum(x)
using Random
peak2peak([randn() for i in 1:10])

# problem 4.3
function energy(x::AbstractVector)::Real
    limit = length(x)
    energy = 0
    for i = 1:limit
        energy += abs(x[i]) ^ 2
    end
    return energy
end

# energy(x::AbstractVector)::Real = sum(abs.(x).^2)
using Random
x = [randn() + im * randn() for i in 1:100]
energy(x)

# problem 4.4
function power(x::AbstractVector)::Real
    N = length(x)
    power = 0
    for i = 1:N
        power += 1 / N * abs(x[i]) ^ 2
    end
    return power
end

# power(x::AbstractVector)::Real = sum(abs.(x).^2) / length(x)
power([3 + im * 1, 4 - im * 1])

# problem 4.5
function rms(x::AbstractVector)::Real
    N = length(x)
    power = 0
    for i = 1:N
        power += 1 / N * abs(x[i]) ^ 2
    end
    rms = sqrt(power)
    return rms
end

# rms(x::AbstractVector)::Real = sqrt(sum(abs.(x).^2) / length(x))
using Random
rms([randn() for i in 1:10])

# problem 4.6
function running_mean(x::AbstractVector, M::Integer)::Vector
    N = length(x)
    mean = []
    for n = 1:N
        nmin = max(1, n - M)
        nmax = min(N, n + M)
        v = sum(x[nmin:nmax]) / (nmax - nmin + 1)
        append!(mean, v)
    end
    return mean
end

using Random
running_mean([randn() + im * randn() for i in 1:10], 2)

# problem 4.7
function running_energy(x::AbstractVector, M::Integer)::Vector
    N = length(x)
    energy = []
    for n = 1:N
        nmin = max(1, n - M)
        nmax = min(N, n + M)
        v = sum(abs.(x[nmin:nmax]).^2)
        append!(energy, v)
    end
    return energy
end

using Random
running_energy([randn() + im * randn() for i in 1:10], 2)

# problem 4.8
function running_power(x::AbstractVector, M::Integer)::Vector
    N = length(x)
    power = []
    for n = 1:N
        nmin = max(1, n - M)
        nmax = min(N, n + M)
        v = sum(abs.(x[nmin:nmax]).^2) / (nmax - nmin + 1)
        append!(power, v)
    end
    return power
end

using Random
running_power([randn() + im * randn() for i in 1:10], 2)