# problem 6.1
function signal_sampling(n::Integer, fs::Real = 100, fp::Real = 250)
    x = []
    Tp = 1 / fp
    for i = 0:(n - 1)
        v = sin(2 * π * fs * i * Tp)
        append!(x, v)
    end
    return x
end

using CairoMakie
n = 10
x = 0:(n - 1)
y = signal_sampling(n)
stem(x, y)