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

# problem 8.10
rect(N::Integer) = (N > 0) ? ones(N) : 0.0
function dft(x::Vector)::Vector
    N = length(x)
    X = []
    for k = 0:(N - 1)
        sum_k = 0
        for n in 0:(N - 1)
            sum_k += x[n + 1] * exp(-im * (2 * π / N) * k * n)
        end
        append!(X, sum_k)
    end
    return X
end

function amplitude_spectrum(x::Vector, w::Vector=CPS.rect(length(x)))::Vector
    x_win = x .* w
    X = dft(x_win)
    N = length(X)

    A = [abs(X[i + 1]) for i in 0:(N - 1)]
    return A
end

# amplitude_spectrum(x::Vector, w::Vector=rect(length(x)))::Vector = [abs(dft(x .* w)[i]) for i in 1:length(x)]
using CairoMakie
a = [0, -3, 0, 3]
N = length(a)
x = 0:(N - 1)
y = amplitude_spectrum(a)
stem(x, y)

# problem 8.11
rect(N::Integer) = (N > 0) ? ones(N) : 0.0
function dft(x::Vector)::Vector
    N = length(x)
    X = []
    for k = 0:(N - 1)
        sum_k = 0
        for n in 0:(N - 1)
            sum_k += x[n + 1] * exp(-im * (2 * π / N) * k * n)
        end
        append!(X, sum_k)
    end
    return X
end

function power_spectrum(x::Vector, w::Vector=rect(length(x)))::Vector
    x_win = x .* w
    N = length(x)
    X = dft(x_win)
    P = []
    
    for i = 0:(N - 1)
        pow = abs(X[i + 1])^2
        append!(P, pow)
    end
    return P
end

# power_spectrum(x::Vector, w::Vector=rect(length(x)))::Vector = [abs(dft(x .* w)[i])^2 for i in 1:length(x)]
using CairoMakie
a = [0, -3, 0, 3]
N = length(a)
x = 0:(N - 1)
y = power_spectrum(a)
stem(x, y)