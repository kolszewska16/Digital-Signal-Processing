# problem 3.1
function generate_signal1()
    fs = 1000
    A = 2
    f = 25
    ɸ = π / 4
    t0 = 0.25
    N = 256

    x = []
    for i = 1:N
        t = t0 + (i - 1) / fs
        value = A * sin(2 * π * f * t + ɸ)
        append!(x, value)
    end
    return x
end

generate_signal1()

# problem 3.2
function generate_signal2()
    fs = 2048
    A = 0.25
    f = π / 2
    ɸ = π
    t0 = 5.0
    tn = 10.0
    N = (tn - t0) * fs + 1

    x = []
    for i = 1:N
        t = t0 + (i - 1) / fs
        value = A * exp(im * 2 * π * f * t + ɸ)
        append!(x, value)
    end
    return x
end

generate_signal2()

# problem 3.3
using Random
function white_noise()
    N = 1000
    P = 0.25
    σ = sqrt(P)
    x = []
    for i = 1:N
        v = randn() * σ
        append!(x, v)
    end
    return x
end

white_noise()

# problem 3.4
using Random
function complex_white_noise()
    N = 1000
    P = 2
    σ = sqrt(P / 2)
    x = []
    for i = 1:N
        v = randn() * σ + im * randn() * σ
        append!(x, v)
    end
    return x
end

complex_white_noise()

# problem 3.5
function ci_rectangular(t::Real; T::Real=1.0)::Real
    if(abs(t) < T / 2)
        return 1.0
    elseif(abs(t) == T / 2)
        return 0.5
    else
        return 0.0
    end
end

# ci_rectangular(t::Real; T::Real=1.0)::Real = (abs(t) < T / 2) ? 1.0 : ((abs(t) == T / 2) ? 0.5 : 0.0)
using CairoMakie
x = range(-2, 2, 1000)
y = ci_rectangular.(x)
lines(x, y)

# problem 3.6
function ci_triangle(t::Real; T::Real=1.0)::Real
    v = 1 - abs(t)
    if(t > -T && t < T)
        return v
    else
        return 0.0
    end
end

# ci_triangle(t::Real; T::Real=1.0)::Real = (abs(t) < T) ? (1 - abs(t)) : 0.0
using CairoMakie
x = range(-2, 2, 1000)
y = ci_triangle.(x)
lines(x, y)

# problem 3.7
function ci_literka_M(t::Real; T=1.0)::Real
    v = abs(t) + 0.5
    if(abs(t) <= T / 2)
        return v
    else
        return 0.0
    end
end

# ci_literka_M(t::Real; T=1.0)::Real = (abs(t) <= T / 2) ? (abs(t) + 0.5) : 0.0
using CairoMakie
x = range(-2, 2, 1000)
y = ci_literka_M.(x)
lines(x, y)

# problem 3.8
function ci_literka_U(t::Real; T=1.0)::Real
    if(abs(t) <= T / 2)
        return 4 * t^2
    else
        return 0.0
    end
end

# ci_literka_U(t::Real; T=1.0)::Real = (abs(t) <= T / 2) ? (4 * t^2) : 0.0
using CairoMakie
x = range(-2, 2, 1000)
y = ci_literka_U.(x)
lines(x, y)

# problem 3.12
function square_wave(t::Real)::Real
    A = 1
    T = 1
    x = A * sin(2 * π * 1 / T * t)
    return sign(x)
end

# square_wave(t::Real)::Real = sign(sin(2  * π * 1 * t))
using CairoMakie
x = range(-2, 2, 1000)
y = square_wave.(x)
lines(x, y)

# problem 3.22
function kronecker(n::Integer)::Real
    if(n == 0)
        return 1.0
    else
        return 0.0
    end
end

# kronecker(n::Integer)::Real = (n == 0) ? 1.0 : 0.0
using CairoMakie
x = -5:1:5
println(x)
y = kronecker.(x)
stem(x, y)

# problem 3.23
function heaviside(n::Integer)::Real
    if(n >= 0)
        return 1.0
    else
        return 0.0
    end
end

# heaviside(n::Integer)::Real = (n >= 0) ? 1.0 : 0.0
using CairoMakie
x = -5:1:5
y = heaviside.(x)
stem(x, y)

# problem 3.24
function rect(N::Integer)
    if(N > 0)
        x = []
        for i = 1:N
            append!(x, 1.0)
        end
        return x
    else
        return 0.0
    end
end

# rect(N::Integer) = (N > 0) ? ones(N) : 0.0
using CairoMakie
N = 100
x = 0:(N - 1)
y = rect(N)
lines(x, y)

# problem 3.25
function triang(N::Integer)
    if(N > 0)
        x = []
        for n = 0:(N - 1)
            v = 1 - abs((n - (N - 1) / 2) / ((N - 1) / 2))
            append!(x, v)
        end
        return x
    else
        return 0.0
    end
end

# triang(N::Integer) = (N > 0) ? [1 - abs((n - (N - 1) / 2) / ((N - 1) / 2)) for n in 0:(N - 1)] : 0.0
using CairoMakie
N = 100
x = 0:(N - 1)
y = triang(N)
stem(x, y)

# problem 3.26
function hanning(N::Integer)
    if(N >  0)
        x = []
        for n = 0:(N - 1)
            v = 0.5 * (1 - cos((2 * π * n) / (N - 1)))
            append!(x, v)
        end
        return x
    else 
        return 0.0
    end
end

# hanning(N::Integer) = (N > 0) ? [0.5 * (1 - cos((2 * π * n) / (N - 1))) for n in 0:(N - 1)] : 0.0
using CairoMakie
N = 100
x = 0:(N - 1)
y = hanning(N)
stem(x, y)

# problem 3.27
function hamming(N::Integer)
    α = 0.53836
    β = 0.46164
    if(N > 0)
        x = []
        for n = 0:(N - 1)
            v = α - β * cos((2 * π * n) / (N - 1))
            append!(x, v)
        end
        return x
    else
        return 0.0
    end
end

# hamming(N::Integer) = (N > 0) ? [0.53836 - 0.46164 * cos((2 * π * n) / (N - 1)) for n in 0:(N - 1)] : 0.0
using  CairoMakie
N = 100
x = 0:(N - 1)
y = hamming(N)
stem(x, y)

# problem 3.28
function blackman(N::Integer)
    α = 0.16
    a0 = (1 - α) / 2
    a1 = 0.5
    a2 = α / 2
    if(N > 0)
        x = []
        for n = 0:(N - 1)
            v = a0 - a1 * cos((2 * π * n) / (N - 1)) + a2 * cos((4 * π * n) / (N - 1))
            append!(x, v)
        end
        return x
    else
        return 0.0
    end
end

# blackman(N::Integer) = (N > 0) ? [0.42 - 0.5 * cos((2 * π * n) / (N - 1)) + 0.08 * cos((4 * π * n) / (N - 1)) for n in 0:(N - 1)] : 0.0
using CairoMakie
N = 100
x = 0:(N - 1)
y = blackman(N)
stem(x, y)