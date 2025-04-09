# problem 7.1
function DFT_2(x = [20 5])
    L = length(x)
    k, n = size(x)
    Wx = [exp(-im * (2 * π / L) * k * n) for i in 0:(k - 1), j in 0:(k - 1)]
    Wy = [exp(-im * (2 * π / L) * k * n) for i in 0:(n - 1), j in 0:(n - 1)]
    v = Wx * x * Wy
    return v
end

DFT_2()

# problem 7.3
function dtft(x::AbstractVector, f::Real, fs::Real)
    T = 1 / fs
    L = length(x)
    dtft = 0
    for n = 0:(L - 1)
        for i = 0:(L - 1)
            dtft += x[i + 1] * exp(-im * 2 * π * f * i * T)
        end
    end
    return dtft
end

dtft([2, 10], 100, 250)

# problem 7.4
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

dft([0, -3, 0, 3])

# problem 7.5
function idft(X::Vector)::Vector
    N = length(X)
    x = []
    for n = 0:(N - 1)
        sum_n = 0
        for k in 0:(N - 1)
            sum_n += X[k + 1] * exp(im * (2 * π / N) * k * n)
        end
        append!(x, (1 / N) * sum_n)
    end
    return x
end

idft([0.0 + 0.0im, -7.347880794884119e-16 + 6.0im, 0.0 - 7.34788079488412e-16im, 2.204364238465236e-15 - 6.0im])