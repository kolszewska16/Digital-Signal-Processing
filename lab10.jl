# problem 10.1
function firwin_lp_I(M::Integer, F0::Real)::Vector
    length = M + 1
    L = M / 2

    h = zeros(Float64, length)
    n = collect(-L:L)
    
    for i in eachindex(n)
        if n[i] != 0
            h[i] = 2 * F0 * (sin(2 * π * F0 * n[i])) / (2 * π * F0 * n[i])
        else
            h[i] = 2 * F0
        end
    end
    return h
end

using CairoMakie
M = 100
F0 = 0.2
x = 0:M
y = firwin_lp_I(M, F0)
stem(x, y)

# problem 10.2
function firwin_hp_I(M::Integer, F0::Real)::Vector
    length = M + 1
    L = M / 2

    h = zeros(Float64, length)
    n = collect(-L:L)

    for i in eachindex(n)
        if n[i] != 0
            h[i] = -2 * F0 * (sin(2 * π * F0 * n[i])) / (2 * π * F0 * n[i])
        else
            h[i] = 1 - 2 * F0
        end
    end
    return h
end

using CairoMakie
M = 100
F0 = 0.4
x = 0:M
y = firwin_hp_I(M, F0)
stem(x, y)

# problem 10.3
function firwin_bp_I(M::Integer, F1::Real, F2::Real)
    length = M + 1
    L = M / 2

    h = zeros(Float64, length)
    n = collect(-L:L)

    for i in eachindex(n)
        if n[i] != 0
            h[i] = 2 * F2 * (sin(2 * π * F2 * n[i])) / (2 * π * F2 * n[i]) - 2 * F1 * (sin(2 * π * F1 * n[i])) / (2 * π * F1 * n[i])
        else
            h[i] = 2 * F2 - 2 * F1
        end
    end
    return h
end

using CairoMakie
M = 100
F1 = 0.1
F2 = 0.3
x = 0:M
y = firwin_bp_I(M, F1, F2)
stem(x, y)

# problem 10.4
function firwin_bs_I(M::Int, F1::Real, F2::Real)::Vector
    length = M + 1
    L = M / 2

    h = zeros(Float64, length)
    n = collect(-L:L)

    for i in eachindex(n)
        if n[i] != 0
            h[i] = -2 * F1 * (sin(2 * π * F1 * n[i])) / (2 * π * F1 * n[i]) - (-2 * F2 * (sin(2 * π * F2 * n[i])) / (2 * π * F2 * n[i]))
        else
            h[i] = 1 - (2 * F2 - 2 * F1)
        end
    end
    return h
end

using CairoMakie
M = 100
F1 = 0.2
F2 = 0.5
x = 0:M
y = firwin_bs_I(M, F1, F2)
stem(x, y)