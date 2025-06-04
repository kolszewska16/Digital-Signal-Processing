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

# 4.06.2025
# średnie przesunięcie fazowe
function rozwiazanie8(;
    zz::Vector{ComplexF64} = ComplexF64[0.618237344495477 + 0.7859914667928534im, 0.618237344495477 - 0.7859914667928534im, 0.7880749527481846 + 0.6155792953397204im, 0.7880749527481846 - 0.6155792953397204im, 1.0 + 0.0im],
    pp::Vector{ComplexF64} = ComplexF64[0.4289087685769398 + 0.8645008129514766im, 0.4289087685769398 - 0.8645008129514766im, 0.1483245154470054 + 0.7829549048618939im, 0.1483245154470054 - 0.7829549048618939im, -0.3639175917140422 + 0.0im],
    k::Float64 = 0.14804660838937625,
    F::Vector{Float64} = [0.14, 0.17, 0.22],
)
    out = zeros(Float64, length(F))
    for i in 1:length(F)
        num = 1
        denom = 1
        for z in 1:length(zz)
            num *= (1 - zz[z] * exp(-2im * π * F[i]))
        end
        for p in 1:length(pp)
            denom *= (1 - pp[p] * exp(-2im * π * F[i]))
        end
        out[i] += angle((k * num) / denom)
    end
    mean = sum(out) / length(out)
    return mean
end

# 0.2265263860426542
rozwiazanie8()

# wartość skuteczna       
function rozwiazanie9(;
    b::Vector{Float64} = [0.004262477289779243, -0.009198352988066403, 0.007421448096644399, 2.3661502145273754e-19, -0.0074214480966444, 0.009198352988066403, -0.004262477289779242],
    a::Vector{Float64} = [1.0, -3.717485611387743, 7.405375293261871, -8.885543194147186, 7.002666784025844, -3.323300419683556, 0.8455598080150633],
    x::Vector{Float64} = [-0.22, 0.27, -0.29, -0.09, -0.93, -0.5, 0.67, -0.24, 0.13, -0.22, 0.8, -0.88, 0.6, 0.84, 0.7, 0.14, 0.4, 0.43, -0.76, 0.14],
    L::Int = 47,
)
    N = length(x)
    M = length(b)
    K = length(a)
    y = zeros(Float64, L)

    for n in 1:L
        for m in 1:M
            if((n - m + 1) > 0 && (n - m + 1) <= N)
                y[n] += b[m] * x[n - m + 1]
            end
        end
        for k in 2:K
            if((n - k + 1) > 0 && (n - k + 1) <= L)
                y[n] -= a[k] * y[n - k + 1]
            end
        end
    end
    rms = sqrt(sum(abs.(y) .^ 2) / length(y))
    return rms
end

# 0.09298888276476627
rozwiazanie9()

# wartość skuteczna  
function rozwiazanie10(;
    b::Vector{Float64} = [0.17327242644714178, -0.8417443295265945, 1.8658198947340179, -2.3919295938041114, 1.8658198947340177, -0.8417443295265944, 0.17327242644714175],
    a::Vector{Float64} = [1.0, -1.9234073946110977, 2.3846685845801554, -1.7457173609326966, 0.836213821540958, -0.23354278972658468, 0.03005294382812647],
    x::Vector{Float64} = [-0.82, 0.05, -0.99, -0.94, 0.95, -0.05, -0.19, 0.54, 0.92, -0.18],
    L::Int = 33,
)
    N = length(x)
    M = length(b)
    K = length(a)
    y = zeros(Float64, L)

    for n in 1:L
        for m in 1:M
            if((n - m + 1) > 0 && (n - m + 1) <= N)
                y[n] += b[m] * x[n - m + 1]
            end
        end
        for k in 2:K
            if((n - k + 1) > 0 && n - k + 1 <= L)
                y[n] -= a[k] * y[n - k + 1]
            end
        end
    end

    rms = sqrt(sum(abs.(y) .^ 2) / L)
    return rms
end

# 0.3028891758471093
rozwiazanie10()

# średnie przesunięcie fazowe
function rozwiazanie11(;
    zz::Vector{ComplexF64} = ComplexF64[-1.0 + 0.0im, -1.0 + 0.0im, -1.0 + 0.0im, -1.0 + 0.0im, -1.0 + 0.0im, -1.0 + 0.0im],
    pp::Vector{ComplexF64} = ComplexF64[0.4829321112470466 + 0.8373793951972854im, 0.4829321112470466 - 0.8373793951972854im, 0.6259309407570826 + 0.6473274226098389im, 0.6259309407570826 - 0.6473274226098389im, 0.8075750782653377 + 0.2579163503294173im, 0.8075750782653377 - 0.2579163503294173im],
    k::Float64 = 0.0006201142564604331,
    F::Vector{Float64} = [0.11, 0.23, 0.44, 0.46, 0.47],
)
    out = zeros(Float64, length(F))
    for i in 1:length(F)
        num = 1
        denom = 1
        for z in 1:length(zz)
            num *= (1 - zz[z] * exp(-2im * π * F[i]))
        end
        for p in 1:length(pp)
            denom *= (1 - pp[p] * exp(-2im * π * F[i]))
        end
        out[i] += angle((k * num) / denom)
    end
    mean = sum(out) / length(out)
    return mean
end

# -1.8088212192685045
rozwiazanie11()

# średnia dyskretnego sygnału  
# fala trójkątna: A = 1, T = 1s składowa stała: 0, g(0) = 0, dg/dt|t=0 = 4
function rozwiazanie12(;
    fp::Float64 = 348.34,
    t1::Float64 = 7.9,
    N::Int = 178,
)
    g(t) = 4 * abs(t - floor(t + 3 / 4) + 1 / 4) - 1
    x = range(start = t1, step = 1 / fp, length = N)
    y = [3.5 * g(2.0 * t - 2.6) for t in x]

    mean = sum(y) / length(y)
    return mean
end

# 0.06267523722464141
rozwiazanie12()

# suma wartości
function rozwiazanie13(;
    m::Vector{Float64} = [1.5, 1.5013, 1.5026, 1.5039, 1.5052, 1.5065, 1.5078, 1.5091, 1.5104, 1.5117, 1.513, 1.5143, 1.5156, 1.5169, 1.5182, 1.5195, 1.5208, 1.5221, 1.5234, 1.5247, 1.526, 1.5273, 1.5286, 1.5299, 1.5312, 1.5325, 1.5338, 1.5351, 1.5364, 1.5377, 1.539, 1.5403, 1.5416, 1.5429, 1.5442, 1.5455, 1.5468, 1.5481, 1.5494, 1.5507, 1.552, 1.5533, 1.5546, 1.5559, 1.5572, 1.5585, 1.5598, 1.5611, 1.5624, 1.5637, 1.565, 1.5663, 1.5676, 1.5689, 1.5702, 1.5715, 1.5728, 1.5741, 1.5754, 1.5767, 1.578, 1.5793, 1.5806, 1.5819, 1.5832, 1.5845, 1.5858, 1.5871, 1.5884, 1.5897, 1.591, 1.5923, 1.5936, 1.5949, 1.5962, 1.5975, 1.5988, 1.6001, 1.6014, 1.6027, 1.604, 1.6053, 1.6066, 1.6079, 1.6092, 1.6105, 1.6118, 1.6131, 1.6144, 1.6157, 1.617, 1.6183, 1.6196, 1.6209, 1.6222],
    s::Vector{Float64} = [0.4453, 0.2384, 0.1678, 0.1146, 0.71, 0.8255, 0.5802, 0.127, 0.0629, 0.6115, 0.7163, 0.7815, 0.0352, 0.0009, 0.7175, 0.7398, 0.5994, 0.0879, 0.044, 0.441, 0.4491, 0.5701, 0.5553, 0.9446, 0.8127, 0.961, 0.8036, 0.7106, 0.9178, 0.8439, 0.5502, 0.8021, 0.6898, 0.2453, 0.8076, 0.929, 0.3281, 0.4846, 0.3781, 0.7229, 0.6809, 0.0386, 0.2428, 0.4211, 0.1225, 0.4613, 0.0937, 0.3703, 0.0686, 0.1241, 0.5614, 0.7369, 0.8523, 0.2, 0.2596, 0.0351, 0.7437, 0.1516, 0.9754, 0.7624, 0.6226, 0.7022, 0.0028, 0.052, 0.4161, 0.5086, 0.5203, 0.0388, 0.057, 0.9251, 0.2985, 0.6042, 0.1906, 0.7473, 0.8802, 0.0169, 0.7574, 0.8897, 0.4282, 0.9628, 0.8803, 0.543, 0.1947, 0.1676, 0.1536, 0.025, 0.6971, 0.0958, 0.0351, 0.858, 0.0551, 0.8112, 0.6127, 0.6489, 0.8762],
    t::Vector{Float64} = [1.61375, 1.50533, 1.50767, 1.58736, 1.61154, 1.58567, 1.61518, 1.52938, 1.55954, 1.61193, 1.50156, 1.56786, 1.50481, 1.50988],
)
    T = m[2] - m[1]
    y = zeros(Float64, length(t))

    for i in 1:length(t)
        for n in 1:length(s)
            y[i] += sinc((t[i] - m[n]) / T) * s[n]
        end
    end
    return sum(y)
end

# 5.870904229699802
rozwiazanie13()

# energia sygnału  
function rozwiazanie14(;
    b::Vector{Float64} = [0.005457396672935736, 0.021829586691742946, 0.032744380037614415, 0.021829586691742946, 0.005457396672935736],
    a::Vector{Float64} = [1.0, -2.6276616653091582, 3.169793721187013, -1.954960370796703, 0.5227556005796439],
    x::Vector{Float64} = [-0.78, -0.73, 0.47, -0.27, 0.58, 0.02, 0.41, 0.18, -0.24, -0.49, -0.05],
    L::Int = 50,
)
    N = length(x)
    M = length(b)
    K = length(a)
    y = zeros(Float64, L)

    for n in 1:L
        for m in 1:M
            if((n - m + 1) > 0 && (n - m + 1) <= N)
                y[n] += b[m] * x[n - m + 1]
            end
        end
        for k in 2:K
            if((n - k + 1) > 0 && (n - k + 1) <= L)
                y[n] -= a[k] * y[n - k + 1]
            end
        end
    end
    energy = sum(abs.(y) .^ 2)
    return energy
end

# 0.7464999967458876
rozwiazanie14()

# moc sygnału   
function rozwiazanie15(;
    b::Vector{Float64} = [0.0008063598650371028, 0.0, -0.003225439460148411, 0.0, 0.004838159190222617, 0.0, -0.003225439460148411, 0.0, 0.0008063598650371028],
    a::Vector{Float64} = [1.0, -4.015578080544881, 9.09469400165136, -13.299885407632388, 13.924302253227685, -10.381407931114726, 5.539287414559344, -1.905951341846375, 0.3708142159294545],
    x::Vector{Float64} = [-0.6, -0.76, 0.79, -0.13, -0.22, -0.82, -0.87, -0.34, -0.27, -0.62, -0.17, 0.19, 0.29, -0.4, 0.21, 0.57, 0.28, 0.21, 0.39, 0.09, 0.92, -0.66, -0.96, 0.52, 0.85, 0.84, -0.71, -0.8, 0.34, -0.39, -0.93, 0.97],
    L::Int = 62,
)
    N = length(x)
    M = length(b)
    K = length(a)
    y = zeros(Float64, L)

    for n in 1:L
        for m in 1:M
            if((n - m + 1) > 0 && (n - m + 1) <= N)
                y[n] += b[m] * x[n - m + 1]
            end
        end
        for k in 2:K
            if((n - k + 1) > 0 && (n - k + 1) <= L)
                y[n] -= a[k] * y[n - k + 1]
            end
        end
    end
    power = sum(abs.(y) .^ 2) / length(y)
    return power
end

# 0.030509866008322437
rozwiazanie15()

# wartość skuteczna sygnału
function rozwiazanie16(;
    b::Vector{Float64} = [0.018945298254741224, -0.017696236459281253, 0.034190475470654035, -0.01607593466612105, 0.03419047547065405, -0.01769623645928126, 0.01894529825474123],
    a::Vector{Float64} = [1.0, -3.272200970340843, 4.873632202004644, -4.057766231471863, 1.9796674599629442, -0.5296289800279481, 0.06109965973917386],
    x::Vector{Float64} = [-0.46, -0.99, 0.0, 0.42, 0.57, 0.96, 0.66, -0.15, -0.26, -0.3, 0.04, -0.93, 0.09, -0.39, 0.65, 0.04, -0.76, 0.3, -0.46, -0.37, -0.49, 0.82, -0.93, -0.21, 0.47, 0.07, -0.59, 0.54, 0.98, 0.87, -0.26, -0.32, -0.38, 0.66, 0.27, 0.25, 0.96, -0.48, -0.39, 0.25, -0.14, -0.52, -0.22],
    L::Int = 60,
)
    N = length(x)
    M = length(b)
    K = length(a)
    y = zeros(Float64, L)

    for n in 1:L
        for m in 1:M
            if((n - m + 1) > 0 && (n - m + 1) <= N)
                y[n] += b[m] * x[n - m + 1]
            end
        end
        for k in 2:K
            if((n - k + 1) > 0 && (n - k + 1) <= L)
                y[n] -= a[k] * y[n - k + 1]
            end
        end
    end
    rms = sqrt(sum(abs.(y) .^ 2) / length(y))
    return rms
end        

# 0.20785572155324977
rozwiazanie16()