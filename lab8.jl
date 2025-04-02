# problem 8.1
function frequency(x::AbstractVector, Δt::Real = 50 * 10^(-6), p::Integer = 8192)
    Fs = 1 / Δt
    k = [i for i in 0:(p - 1)]

    Fk = []
    for i in k
        v = (i * Fs) / p
        append!(Fk, v)
    end

    ΔF = Fk[2] - Fk[1]
    return ΔF
end

using Random
frequency([randn() for i in 1:2000])

# problem 8.2
function frequencies(k::AbstractVector, Δt::Real = 0.001, N::Integer = 2000)
    N = 2000
    Fs = 1 / Δt
    Fk = (k * Fs) / N
    return Fk
end

frequencies([0, 200, 1000, 1600])

# problem 8.8
function fftfreq(N::Integer, fs::Real)
    f = []
    for k in 0:(N - 1)
        fk = (k * fs) / N
        append!(f, fk)
    end
    return f
end

# fftfreq(N::Integer, fs::Real) = [(k * fs) / N for k in 0:(N - 1)]
fftfreq(8192, 1000)

