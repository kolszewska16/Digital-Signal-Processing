# problem 3.1
function generate_signal()
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

generate_signal()

# problem 3.2
function generate_signal()
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

generate_signal()

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
    v = 1.0
    if(abs(t) <= T / 2)
        return v
    else
        return 0.0
    end
end

# ci_rectangular(t::Real; T::Real=1.0)::Real = (abs(t) <= T / 2) ? 1.0 : 0.0
ci_rectangular(0.34)
ci_rectangular(-0.62)

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
ci_triangle(0.24)

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
ci_literka_M(0.2)

# problem 3.8
function ci_literka_U(t::Real; T=1.0)::Real
    if(abs(t) <= T / 2)
        return 4 * t^2
    else
        return 0.0
    end
end

# ci_literka_U(t::Real; T=1.0)::Real = (abs(t) <= T / 2) ? (4 * t^2) : 0.0
ci_literka_U(0.3)

# problem 3.12
function square_wave(t::Real)::Real
    A = 1
    T = 1
    x = A * sin(2 * π * 1 / T * t)
    return sign(x)
end

# square_wave(t::Real)::Real = sign(sin(2  * π * 1 * t))
square_wave(0.51)