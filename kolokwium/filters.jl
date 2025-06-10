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
    δ(n) = (n == 0) ? 1 : 0
    hanning(N) = [0.5 + 0.5 * cos((2 * π * n) / (2 * N + 1)) for n in -N:N]

    fg = f0 / fp
    n = -order / 2 : order / 2
    h = zeros(Float64, length(n))
    
    for i in 1:length(n)
        h[i] = δ(n[i]) - 2 * fg * sin(2 * π * fg * n[i]) / (2 * π * fg * n[i])
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
    hamming(N) = [0.54 + 0.46 * cos((2 * π * n) / (2 * N + 1)) for n in -N:N]

    n = -order / 2 : order / 2
    fg1 = f1 / fp
    fg2 = f2 / fp
    h = zeros(Float64, length(n))

    for i in 1:length(n)
        h[i] = 2 * fg2 * sin(2 * π * fg2 * n[i]) / (2 * π * fg2 * n[i]) + 2 * fg1 * sin(2 * π * fg1 * n[i]) / (2 * π * fg1 * n[i])
    end
    
    w = hamming(order / 2)
    hw = h .* w
    
    sum = 0
    for i in z
        sum += hw[i]
    end
    return sum
end

# -0.02790845272184913
rozwiazanie18()

# problem 33  
# filtr górnoprzepustowy, okno Hamminga
function rozwiazanie33(;
    order::Int = 30,
    fp::Float64 = 199.0,
    f0::Float64 = 61.69,
    z::Vector{Int} = [3, 9, 25, 10, 3, 18],
)
    δ(n) = (n == 0) ? 1 : 0
    hamming(N) = [0.54 + 0.46 * cos((π * n) / (2 * N + 1)) for n in -N:N]

    n = -order / 2 : order / 2
    fg = f0 / fp
    h = zeros(Float64, length(n))

    for i in 1:length(n)
        h[i] = δ(n[i]) - 2 * sin(2 * π * fg * n[i]) / (2 * π * fg * n[i])
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
    δ(n) = (n == 0) ? 1 : 0
    barlett(N) = [(1 - abs(n)) / (N + 1) for n in -N:N]

    fg1 = f1 / fp
    fg2 = f2 / fp
    n = -order / 2 : order / 2
    h = zeros(Float64, length(n))

    for i in 1:length(n)
        h[i] = δ(n[i]) - 2 * fg2 * sin(2 * π * fg2 * n[i]) / (2 * π * fg2 * n[i]) - 2 * fg1 * sin(2 * π * fg1 * n[i]) / (2 * π * fg1 * n[i])
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
    δ(n) = (n == 0) ? 1 : 0
    hamming(N) = [0.54 + 0.46 * cos((π * n) / (2 * N + 1)) for n in -N:N]

    n = -order / 2 : order / 2
    fg = f0 / fp
    h = zeros(Float64, length(n))

    for i in 1:length(n)
        h[i] = δ(n[i]) - 2 * fg * sin(2 * π * fg * n[i]) / (2 * π * fg * n[i])
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



# problem 1
# filtr dolnoprzepustowy, okno Blackmana          
function rozwiazanie1(;
    order::Int = 86,
    fp::Float64 = 192.0,
    f0::Float64 = 32.64,
    z::Vector{Int} = [26, 24, 82],
)
    blackman(N) = [0.42 + 0.5 * cos((2 * π * n) / (2 * N + 1)) + 0.08 * cos((4 * π * n) / (2 * N + 1)) for n in -N:N]
    
    n = -order / 2 : order / 2
    fg = f0 / fp
    h = zeros(Float64, length(n))

    for i in 1:length(n)
        h[i] += 2 * fg * sin(2 * π * fg * n[i]) / (2 * π * fg * n[i])
    end

    w = blackman(order / 2)
    hw = h .* w
    sum = 0
    for i in z
        sum += hw[i]
    end
    return sum
end

# 0.006983941709695528
rozwiazanie1()

# problem 2
# filtr dolnoprzepustowy, okno Blackmana          
function rozwiazanie2(;
    order::Int = 86,
    fp::Float64 = 192.0,
    f0::Float64 = 32.64,
    z::Vector{Int} = [26, 24, 82],
)
    blackman(N) = [0.42 + 0.5 * cos((2 * π * n) / (2 * N + 1)) + 0.08 * cos((4 * π * n) / (2 * N + 1)) for n in -N:N]
    n = -order / 2 : order / 2
    fg = f0 / fp
    h = zeros(Float64, length(n))

    for i in 1:length(n)
        h[i] += 2 * fg * sin(2 * π * fg * n[i]) / (2 * π * fg * n[i])
    end

    w = blackman(order / 2)
    hw = h .* w
    sum = 0
    for i in z
        sum += hw[i]
    end
    return sum
end

# 0.006983941709695528
rozwiazanie2()

# problem 5
# filtr górnoprzepustowy, okno Blackmana          
function rozwiazanie5(;
    order::Int = 16,
    fp::Float64 = 192.0,
    f0::Float64 = 36.48,
    z::Vector{Int} = [15, 12, 16, 15, 1],
)
    δ(n) = (n == 0) ? 1 : 0
    blackman(N) = [0.42 + 0.5 * cos((2 * π * n) / (2 * N + 1)) + 0.08 * cos((4 * π * n) / (2 * N + 1)) for n in -N:N]

    n = -order / 2 : order / 2
    fg = f0 / fp
    h = zeros(Float64, length(n))

    for i in 1:length(n)
        h[i] += δ(n[i]) - 2 * fg * sin(2 * π * fg * n[i]) / (2 * π * fg * n[i])
    end

    w = blackman(order / 2)
    hw = h .* w
    sum = 0
    for i in z
        sum += hw[i]
    end
    return sum
end

# 0.017749830924011178
rozwiazanie5()

# problem 11
# filtr górnoprzepustowy, okno trójkątne          
function rozwiazanie11(;
    order::Int = 90,
    fp::Float64 = 192.0,
    f0::Float64 = 53.76,
    z::Vector{Int} = [44, 16, 2, 61],
)
    barlett(N) = [1 - abs(n) / (N + 1) for n in -N:N]
    δ(n) = (n == 0) ? 1 : 0

    fg = f0 / fp
    n = -order / 2 : order / 2
    h = zeros(Float64, length(n))

    for i in 1:length(n)
        h[i] += δ(n[i]) - 2 * fg * sin(2 * π * fg * n[i]) / (2 * π * fg * n[i])
    end

    w = barlett(order / 2)
    hw = h .* w
    sum = 0
    for i in z
        sum += hw[i]
    end
    return sum
end

# 0.03998670645079684
rozwiazanie11()

# problem 23
# filtr górnoprzepustowy, okno trójkątne          
function rozwiazanie23(;
    order::Int = 22,
    fp::Float64 = 197.0,
    f0::Float64 = 33.49,
    z::Vector{Int} = [12, 8, 17, 2, 13, 11],
)
    barlett(N) = [1 - abs(n) / (N + 1) for n in -N:N]
    δ(n) = (n == 0) ? 1 : 0

    fg = f0 / fp
    n = -order / 2 : order / 2
    h = zeros(Float64, length(n))

    for i in 1:length(n)
        h[i] += δ(n[i]) - 2 * fg * sinc(2 * fg * n[i])
    end

    w = barlett(order / 2)
    hw = h .* w
    sum = 0
    for i in z
        sum += hw[i]
    end
    return sum
end

# 0.231707210826139
rozwiazanie23()

# problem 25
# filtr pasmowoprzepustowy, okno Hamminga          
function rozwiazanie25(;
    order::Int = 98,
    fp::Float64 = 194.0,
    f1::Float64 = 17.46,
    f2::Float64 = 67.9,
    z::Vector{Int} = [16, 29, 20, 8],
)
    hamming(N) = [0.54 + 0.46 * cos((2 * π * n) / (2 * N + 1)) for n in -N:N]
    δ(n) = (n == 0) ? 1 : 0

    fg1 = f1 / fp
    fg2 = f2 / fp
    n = -order / 2 : order / 2
    h = zeros(Float64, length(n))

    for i in 1:length(n)
        # górnoprzepustowy + dolnoprzepustowy
        h[i] += 2 * fg2 * sin(2 * π * fg2 * n[i]) / (2 * π * fg2 * n[i]) - 2 * fg1 * sin(2 * π * fg1 * n[i]) / (2 * π * fg1 * n[i])
    end

    w = hamming(order / 2)
    hw = h .* w
    sum = 0
    for i in z
        sum += hw[i]
    end
    return sum
end

# 0.015626661276241075
rozwiazanie25()

# problem 27
# filtr pasmowoprzepustowy, okno trójkątne          
function rozwiazanie27(;
    order::Int = 58,
    fp::Float64 = 198.0,
    f1::Float64 = 44.55,
    f2::Float64 = 82.17,
    z::Vector{Int} = [15, 37, 28],
)
    barlett(N) = [1 - abs(n) / (N + 1) for n in -N:N]
    fg1 = f1 / fp
    fg2 = f2 / fp
    n = -order / 2 : order / 2
    h = zeros(Float64, length(n))

    for i in 1:length(n)
        h[i] += 2 * fg2 * sin(2 * π * fg2 * n[i]) / (2 * π * fg2 * n[i]) - 2 * fg1 * sin(2 * π * fg1 * n[i]) / (2 * π * fg1 * n[i])
    end

    w = barlett(order / 2)
    hw = h .* w
    sum = 0
    for i in z
        sum += hw[i]
    end
    return sum
end

# -0.17686477353247373
rozwiazanie27()

# problem 36
# filtr pasmowozaporowy, okno trójkątne          
function rozwiazanie36(;
    order::Int = 22,
    fp::Float64 = 199.0,
    f1::Float64 = 58.7,
    f2::Float64 = 80.6,
    z::Vector{Int} = [18, 21, 6, 4, 22],
)
    barlett(N) = [1 - abs(n) / (N + 1) for n in -N:N]
    δ(n) = (n == 0) ? 1 : 0

    fg1 = f1 / fp
    fg2 = f2 / fp
    n = -order / 2 : order / 2
    h = zeros(Float64, length(n))

    for i in 1:length(n)
        h[i] += δ(n[i]) - 2 * fg2 * sin(2 * π * fg2 * n[i]) / (2 * π * fg2 * n[i]) + 2 * fg1 * sin(2 * π * fg1 * n[i]) / (2 * π * fg1 * n[i])
    end

    w = barlett(order / 2)
    hw = h .* w
    sum = 0
    for i in z
        sum += hw[i]
    end
    return sum
end

# -0.08179670265156189
rozwiazanie36()

# problem 39
# filtr pasmowozaporowy, okno Hamminga          
function rozwiazanie39(;
    order::Int = 64,
    fp::Float64 = 190.0,
    f1::Float64 = 44.65,
    f2::Float64 = 88.35,
    z::Vector{Int} = [20, 23, 58, 20],
)
    hamming(N) = [0.54 + 0.46 * cos((2 * π * n) / (2 * N + 1)) for n in -N:N]
    δ(n) = (n == 0) ? 1 : 0
    fg1 = f1 / fp
    fg2 = f2 / fp
    n = -order / 2 : order / 2
    h = zeros(Float64, length(n))

    for i in 1:length(n)
        h[i] += δ(n[i]) - 2 * fg2 * sin(2 * π * fg2 * n[i]) / (2 * π * fg2 * n[i]) + 2 * fg1 * sin(2 * π * fg1 * n[i]) / (2 * π * fg1 * n[i])
    end

    w = hamming(order / 2)
    hw = h .* w
    sum = 0
    for i in z
        sum += hw[i]
    end
    return sum
end

# 0.04326621551642356
rozwiazanie39()

# problem 54
# filtr dolnoprzepustowy, okno Hamminga          
function rozwiazanie54(;
    order::Int = 70,
    fp::Float64 = 192.0,
    f0::Float64 = 69.12,
    z::Vector{Int} = [68, 21, 60],
)
    hamming(N) = [0.54 + 0.46 * cos((2 * π * n) / (2 * N + 1)) for n in -N:N]
    fg = f0 / fp
    n = -order / 2 : order / 2
    h = zeros(Float64, length(n))

    for i in 1:length(n)
        h[i] += 2 * fg * sin(2 * π * fg * n[i]) / (2 * π * fg * n[i])
    end

    w = hamming(order / 2)
    hw = h .* w
    sum = 0
    for i in z
        sum += hw[i]
    end
    return sum
end

# 0.004942171716832566
rozwiazanie54()

# problem 56
# filtr górnoprzepustowy, okno trójkątne          
function rozwiazanie56(;
    order::Int = 60,
    fp::Float64 = 193.0,
    f0::Float64 = 82.99,
    z::Vector{Int} = [54, 56, 38, 45, 9],
)
    barlett(N) = [1 - abs(n) / (N + 1) for n in -N:N]
    δ(n) = (n == 0) ? 1 : 0

    fg = f0 / fp
    n = -order / 2 : order / 2
    h = zeros(Float64, length(n))

    for i in 1:length(n)
        h[i] += δ(n[i]) - 2 * fg * sin(2 * π * fg * n[i]) / (2 * π * fg * n[i])
    end

    w = barlett(order / 2)
    hw = h .* w
    sum = 0
    for i in z
        sum += hw[i]
    end
    return sum
end

# -7.697160426392655e-5
rozwiazanie56()

# problem 60
# filtr pasmowoprzepustowy, okno Blackmana          
function rozwiazanie60(;
    order::Int = 40,
    fp::Float64 = 194.0,
    f1::Float64 = 68.87,
    f2::Float64 = 78.57,
    z::Vector{Int} = [8, 13, 16, 8, 18],
)
    blackman(N) = [0.42 + 0.5 * cos((2 * π * n) / (2 * N + 1)) + 0.08 * cos((4 * π * n) / (2 * N + 1)) for n in -N:N]
    fg1 = f1 / fp
    fg2 = f2 / fp
    n = -order / 2 : order / 2
    h = zeros(Float64, length(n))

    for i in 1:length(n)
        h[i] += 2 * fg2 * sin(2 * π * fg2 * n[i]) / (2 * π * fg2 * n[i]) - 2 * fg1 * sin(2 * π * fg1 * n[i]) / (2 * π * fg1 * n[i])
    end

    w = blackman(order / 2)
    hw = h .* w
    sum = 0
    for i in z
        sum += hw[i]
    end
    return sum
end

# 0.16515848935509742
rozwiazanie60()

# problem 61
# filtr górnoprzepustowy, okno Hanninga          
function rozwiazanie61(;
    order::Int = 10,
    fp::Float64 = 193.0,
    f0::Float64 = 75.27,
    z::Vector{Int} = [6, 7, 6, 4],
)
    δ(n) = (n == 0) ? 1 : 0
    hanning(N) = [0.5 + 0.5 * cos((2 * π * n) / (2 * N + 1)) for n in -N:N]

    fg = f0 / fp
    n = -order / 2 : order / 2
    h = zeros(Float64, length(n))

    for i in 1:length(n)
        h[i] += δ(n[i]) - 2 * fg * sinc(2 * fg * n[i])
    end

    w = hanning(order / 2)
    hw = h .* w
    sum = 0
    for i in z
        sum += hw[i]
    end
    return sum
end

# 0.36384641089472525
rozwiazanie61()

# problem 65
# filtr pasmowoprzepustowy, okno Hamminga          
function rozwiazanie65(;
    order::Int = 98,
    fp::Float64 = 194.0,
    f1::Float64 = 7.76,
    f2::Float64 = 62.08,
    z::Vector{Int} = [10, 50, 46, 12],
)
    hamming(N) = [0.54 + 0.46 * cos((2 * π * n) / (2 * N + 1)) for n in -N:N]
    fg1 = f1 / fp
    fg2 = f2 / fp
    n = -order / 2 : order / 2
    h = zeros(Float64, length(n))

    for i in 1:length(n)
        h[i] += 2 * fg2 * sinc(2 * fg2 * n[i]) - 2 * fg1 * sinc(2 * fg1 * n[i])
    end

    w = hamming(order / 2)
    hw = h .* w
    sum =  0
    for i in z
        sum += hw[i]
    end
    return sum
end

# 0.5719524251777854
rozwiazanie65()

# problem 81
# filtr pasmowoprzepustowy, okno Hanninga          
function rozwiazanie81(;
    order::Int = 62,
    fp::Float64 = 190.0,
    f1::Float64 = 26.6,
    f2::Float64 = 72.2,
    z::Vector{Int} = [50, 50, 25, 21, 36],
)
    hanning(N) = [0.5 + 0.5 * cos((2 * π * n) / (2 * N + 1)) for n in -N:N]
    fg1 = f1 / fp
    fg2 = f2 / fp
    n = -order / 2 : order / 2
    h = zeros(Float64, length(n))

    for i in 1:length(n)
        h[i] += 2 * fg2 * sinc(2 * fg2 * n[i]) - 2 * fg1 * sinc(2 * fg1 * n[i])
    end

    w = hanning(order / 2)
    hw = h .* w
    sum = 0
    for i in z
        sum += hw[i]
    end
    return sum
end

# 0.004110508861511816
rozwiazanie81()