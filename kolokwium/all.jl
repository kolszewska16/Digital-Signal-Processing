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

# 3.06.2025
# średnia sygnału wyjściowego         
function rozwiazanie4(;
    x::Vector{Float64} = [-4.2, -4.49, -4.35, -2.19, -1.85, -2.99, 0.31, -1.75, 4.71, -2.75, -4.91, 0.09, 3.68, 3.28, -4.33, 2.79, 3.46, -3.34, 4.66, -1.41, 0.05, -0.37, -1.7, 4.39, -0.39, -3.74, -4.55, -1.81, -0.25, 2.29, 1.45, -2.97, 2.15, -2.55, -0.87, 3.58, 3.75, 2.53, -4.03, -3.78, 3.09, -3.2, 3.98, -3.69, 0.24, -0.55, -3.82, 2.35, 1.73, 4.02, -3.96, -4.14, 2.55, -0.73, 1.55, -0.49, 0.88, -0.65, 1.95, 4.88, 2.74, -1.43],
    h::Vector{Float64} = [-0.47, -1.2, 0.0, 4.28, 2.82, -2.73, -0.58, -4.44, -2.55, -1.91, 1.56, 0.98, -0.17, 0.15],
)
    function conv(x, h)
        N = length(x)
        M = length(h)
        K = N + M - 1
        y = zeros(Float64, K)

        for n in 1:K
            for m in 1:M
                if(n - m > 0 && n - m + 1 <= N)
                    y[n] += h[m] * x[n - m + 1]
                end
            end
        end
        return y
    end

    y = conv(x, h)
    mean = sum(y) / length(y)
    return mean 
end

# 0.6191199999999998
rozwiazanie4()

# średnie wzmocnienie 
function rozwiazanie5(;
    b::Vector{Float64} = [0.20589786767603166, -1.0861272640549327, 3.6226396155444696, -8.22906790017682, 14.482720679302624, -19.905487411076226, 22.227044074733804, -19.905487411076216, 14.482720679302618, -8.229067900176823, 3.622639615544471, -1.0861272640549329, 0.20589786767603174],
    a::Vector{Float64} = [1.0, -4.1018701585332575, 10.455001599833523, -18.605035749010852, 26.070359755268754, -29.249185399188946, 27.385569042192053, -21.411122854097236, 14.268286978394032, -7.919156210490829, 3.6616776168783667, -1.264252062931731, 0.2863185566670542],
    F::Vector{Float64} = [0.07, 0.09, 0.15, 0.2, 0.32],
)
    out = zeros(Float64, length(F))
    for i in 1:length(F)
        num = 0
        denom = 0
        for l in 1:length(b)
            num += b[l] * cispi(2 * F[i]) ^ -(l - 1)
        end
        for m in 1:length(a)
            denom += a[m] * cispi(2 * F[i]) ^ -(m - 1)
        end
        out[i] = abs(num / denom)
    end
    mean = sum(out) / length(out)
    return mean
end

# 0.5797457895466975
rozwiazanie5()

# 40-punktowe DFT
# suma amplitud składowych częstotliwościowych
function rozwiazanie6(;
    fp::Int = 840,
    x::Vector{ComplexF64} = ComplexF64[-1.42 - 1.3im, -0.86 + 0.71im, -0.61 + 0.32im, 0.74 - 0.46im, 0.13 - 0.22im, -0.46 - 1.2im, 0.85 + 0.14im, -0.3 - 0.4im, 1.4 + 1.36im, 0.74 - 0.19im, -0.23 - 2.32im, -0.65 + 1.46im, 0.03 + 0.88im, 0.06 - 0.24im, -0.05 - 0.96im, 0.18 - 0.67im, 0.77 - 0.16im, -0.04 + 0.5im, -0.55 + 1.21im, -0.53 + 0.44im, 0.57 + 0.59im, 0.02 + 0.32im, 0.08 + 1.05im, 0.42 + 0.72im, -0.46 - 1.27im, -0.22 - 0.5im, -0.32 - 0.49im, -0.19 + 0.22im, -0.12 + 0.67im, -1.19 - 1.4im, 0.29 - 0.39im, 0.57 + 0.65im, -0.64 - 0.25im, -0.46 - 0.97im, -0.86 - 0.39im, -0.25 - 0.27im, -0.37 - 1.16im, -0.09 + 0.59im, 0.4 + 1.06im, -0.51 + 0.53im],
    f::Vector{Int} = [-294, -273, -168, 0, 42, 273, 336],
)
    function dft(x)
        N = length(x)
        X = zeros(ComplexF64, N)
        for k in 1:N
            for n in 1:N
                X[k] += x[n] * cispi(-2 * (n - 1) * (k - 1) / N)
            end
        end
        return X / N
    end

    N = length(x)
    Δf = fp / N
    X = dft(x)
    F = zeros(Float64, N)
    F[Int(floor(N / 2) + 2)] = -(floor((N - 1) / 2)) * Δf
    out = 0

    for i in 1:(N - 1)
        if((i + 1) != floor(N / 2) + 2)
            F[i + 1] = F[i] + Δf
        end
    end

    for i in 1:N
        if(F[i] in f)
            out += abs(X[i])
        end
    end
    return out
end

# 1.001621818267306
rozwiazanie6()

# filtr dolnoprzepustowy, okno Hamminga     
function rozwiazanie7(;
    order::Int = 44,
    fp::Float64 = 190.0,
    f0::Float64 = 17.1,
    z::Vector{Int} = [20, 12, 6],
)
    hamming(N) = [0.54 + 0.46 * cos((2 * π * n) / (2 * N + 1)) for n in -N:N]
    n = -order / 2 : order / 2
    fg = f0 / fp
    h = zeros(Float64, length(n))

    for i in 1:length(n)
        h[i] = 2 * fg * sin(2 * π * fg * n[i]) / (2 * π * fg * n[i])
    end

    w = hamming(order / 2)
    hw = h .* w

    sum = 0
    for i in z
        sum += hw[i]
    end
    return sum
end

# 0.0993362886073199
rozwiazanie7()