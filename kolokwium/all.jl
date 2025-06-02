# 2.06.2025
# filtr górnoprzepustowy, okno Hanninga
function rozwiazanie1(;
    order::Int = 48,
    fp::Float64 = 191.0,
    f0::Float64 = 66.85,
    z::Vector{Int} = [14, 33, 47],
)
    δ(n) = (n == 0) ? 1 : 0
    hanning(N) = [0.5 + 0.5 * cos((π * n) / (2 * N + 1)) for n in -N:N]

    n = -order / 2 : order / 2
    fg = f0 / fp
    h = zeros(Float64, length(n))

    for i in 1:length(n)
        h[i] = δ(n[i]) - 2 * sin(2 * π * fg * n[i]) / (2 * π * fg * n[i])
    end

    w = hanning(order / 2)
    hw = h .* w
    
    sum = 0
    for i in z
        sum += hw[i]
    end
    return sum
end

# 0.18286658126003053
rozwiazanie1()

# średnia dyskretnego sygnału
# fala piłokształtna o opadającym zboczu: A = 1, T = 1s, składowa stała: 0, g(0) = 0, dg/dt|t=0 = -2        
function rozwiazanie2(;
    fp::Float64 = 363.32,
    t1::Float64 = -6.95,
    N::Int = 76,
)
    g(t) = -2 * (t - floor(t + 0.5))
    x = range(start = t1, step = 1 / fp, length = N)
    y = [2.4 * g(2.4 * t - 2.7) for t in x]
    mean = sum(y) / length(y)
    return mean
end

# 0.6349655400198106
rozwiazanie2()

# średnia dyskretnego sygnału
# bipolarna fala prostokątna: A = 1, T = 1s, składowa stała: 0, g(0) = 1, g(t) = 0 dla 0 < t < 0.5      
function rozwiazanie3(;
    fp::Float64 = 371.56,
    t1::Float64 = 3.58,
    N::Int = 374,
)
    g(t) = sign(sin(2 * π * t))
    x = range(start = t1, step = 1 / fp, length = N)
    y = [3.6 * g(1.1 * t - 3.5) for t in x]
    mean = sum(y) / length(y)
    return mean
end

# 0.05775401069518711
rozwiazanie3()