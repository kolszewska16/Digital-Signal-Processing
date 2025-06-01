rect(N::Integer) = (N > 0) ? ones(N) : 0.0
triang(N::Integer) = (N > 0) ? [1 - abs((n - (N - 1) / 2) / ((N - 1) / 2)) for n in 0:(N - 1)] : 0.0
hanning(N::Integer) = (N > 0) ? [0.5 * (1 - cos((2 * π * n) / (N - 1))) for n in 0:(N - 1)] : 0.0
hamming(N::Integer) = (N > 0) ? [0.53836 - 0.46164 * cos((2 * π * n) / (N - 1)) for n in 0:(N - 1)] : 0.0
blackman(N::Integer) = (N > 0) ? [0.42 - 0.5 * cos((2 * π * n) / (N - 1)) + 0.08 * cos((4 * π * n) / (N - 1)) for n in 0:(N - 1)] : 0.0

# problem 1
# filtr górnoprzepustowy, okno Hanninga
function rozwiazanie1(;
    order::Int = 30,
    fp::Float64 = 192.0,
    f0::Float64 = 49.92,
    z::Vector{Int} = [1, 10, 1, 19, 21],
)
    delta(n) = (n == 0) ? 1 : 0
    hanning(N) = [0.5 + 0.5 * cos((2 * π * n) / (2 * N + 1)) for n in -N:N]

    fg = f0 / fp
    n = -order / 2 : order / 2
    h = zeros(Float64, length(n))
    
    for i in 1:length(n)
        h[i] = delta(n[i]) - 2 * fg * sin(2 * π * fg * n[i]) / (2 * π * fg * n[i])
    end

    w = hanning(order / 2)
    hw = h .* w

    sum = 0
    for i in z
        sum += hw[i]
    end
    return sum
end

#0.06181728496969081
rozwiazanie()

# problem 18     
# filtr pasmowoprzepustowy, okno Hamminga
function rozwiazanie18(;
    order::Int = 38,
    fp::Float64 = 190.0,
    f1::Float64 = 37.05,
    f2::Float64 = 69.35,
    z::Vector{Int} = [15, 17, 11, 19, 25, 13],
)
    missing
end

rozwiazanie18()

# problem 33  
# filtr górnoprzepustowy, okno Hamminga
function rozwiazanie33(;
    order::Int = 30,
    fp::Float64 = 199.0,
    f0::Float64 = 61.69,
    z::Vector{Int} = [3, 9, 25, 10, 3, 18],
)
    delta(n) = (n == 0) ? 1 : 0
    hamming(N) = [0.54 + 0.46 * cos((π * n) / (2 * N + 1)) for n in -N:N]

    n = -order / 2 : order / 2
    fg = f0 / fp
    h = zeros(Float64, length(n))

    for i in 1:length(n)
        h[i] = delta(n[i]) - 2 * sin(2 * π * fg * n[i]) / (2 * π * fg * n[i])
    end

    w = hamming(order / 2)
    hw = h .* w

    sum = 0
    for i in z
        sum += hw[i]
    end
    return sum
end

# 0.4262411341484607
rozwiazanie()

# problem 44
# filtr pasmowozaporowy, okno trójkątne
function rozwiazanie44(;
    order::Int = 80,
    fp::Float64 = 196.0,
    f1::Float64 = 64.68,
    f2::Float64 = 80.36,
    z::Vector{Int} = [7, 10, 13, 47],
)
    delta(n) = (n == 0) ? 1 : 0
    barlett(N) = [(1 - abs(n)) / (N + 1) for n in -N:N]

    fg1 = f1 / fp
    fg2 = f2 / fp
    n = -order / 2 : order / 2
    h = zeros(Float64, length(n))

    for i in 1:length(n)
        h[i] = delta(n[i]) - 2 * fg2 * sin(2 * π * fg2 * n[i]) / (2 * π * fg2 * n[i]) - 2 * fg1 * sin(2 * π * fg1 * n[i]) / (2 * π * fg1 * n[i])
    end

    w = barlett(order / 2)
    hw = h .* w
   
    sum = 0
    for i in z
        sum += hw[i]
    end
    return sum
end

# 0.014012689998477459
rozwiazanie()

# problem 50   
# filtr górnoprzepustowy, okno Hamminga
function rozwiazanie50(;
    order::Int = 52,
    fp::Float64 = 191.0,
    f0::Float64 = 82.13,
    z::Vector{Int} = [31, 22, 39, 34, 44, 34],
)
    delta(n) = (n == 0) ? 1 : 0
    hamming(N) = [0.54 + 0.46 * cos((π * n) / (2 * N + 1)) for n in -N:N]

    n = -order / 2 : order / 2
    fg = f0 / fp
    h = zeros(Float64, length(n))

    for i in 1:length(n)
        h[i] = delta(n[i]) - 2 * fg * sin(2 * π * fg * n[i]) / (2 * π * fg * n[i])
    end

    w = hamming(order / 2)
    hw = h .* w

    sum = 0
    for i in z
        sum += hw[i]
    end
    return sum
end

# -0.012370619168568329
rozwiazanie()