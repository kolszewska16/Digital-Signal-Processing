# problem 13
# 28-punktowe DFT
# suma amplitud składowych częstotliwościowych          
function rozwiazanie13(;
    fp::Int = 476,
    x::Vector{ComplexF64} = ComplexF64[-0.28 + 0.56im, 0.26 + 1.12im, -0.3 + 0.3im, -0.01 + 0.62im, -0.48 - 0.13im, -0.4 + 1.11im, 0.3 + 0.09im, -0.76 - 0.09im, -0.01 + 0.73im, 0.42 + 0.49im, -0.33 + 0.09im, 0.99 - 0.1im, -0.74 + 0.01im, -0.3 - 0.35im, 0.3 + 0.57im, -0.01 + 0.68im, -1.52 + 0.89im, 0.03 + 1.25im, -0.71 + 0.43im, 0.33 + 0.55im, 0.42 + 0.83im, 1.22 - 0.34im, -0.35 - 0.57im, 1.43 - 0.58im, -0.17 + 0.85im, 0.85 - 0.94im, -0.64 + 1.03im, 0.04 - 0.22im],
    f::Vector{Int} = [-102, -68, -34, -17, 102, 136, 153],
)
    function dft(x)
        N = length(x)
        X = zeros(ComplexF64, N)
        for k in 1:N
            for n in 1:N
                X[k] += x[n] * cispi((-2 * (n - 1) * (k - 1)) / N)
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

# 0.9225496857112374
rozwiazanie13()

# problem 15
# 31-punktowe DFT
# suma faz składowych częstotliwościowych          
function rozwiazanie15(;
    fp::Int = 713,
    x::Vector{ComplexF64} = ComplexF64[-0.57 - 1.42im, -0.72 + 1.33im, -0.2 - 1.11im, -1.27 - 1.22im, -1.2 - 0.32im, 0.35 + 0.69im, -0.19 - 0.9im, 0.36 + 0.84im, -0.06 - 0.51im, 1.12 + 0.09im, 0.92 + 0.15im, -0.36 + 0.17im, 0.11 - 0.77im, -0.49 - 0.49im, -1.84 + 0.06im, -0.97 - 0.91im, 0.71 + 0.05im, 0.67 + 0.42im, -0.23 + 0.03im, -0.73 + 0.94im, -0.24 + 0.07im, -0.25 + 0.56im, 0.2 - 0.01im, 1.24 - 0.71im, -0.87 - 0.08im, 0.65 + 0.18im, 0.16 + 1.1im, 0.01 - 0.43im, 0.25 + 0.27im, 0.49 - 0.15im, 0.37 - 0.94im],
    f::Vector{Int} = [-207, -115, -23, 0, 69, 253],
)
    function dft(x)
        N = length(x)
        X = zeros(ComplexF64, N)
        for k in 1:N
            for n in 1:N
                X[k] += x[n] * cispi((-2 * (n - 1) * (k - 1)) / N)
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
            out += angle(X[i])
        end
    end
    return out
end

# -7.930611392350108
rozwiazanie15()

# problem 25
# 41-punktowe DFT
# suma amplitud składowych częstotliwościowych          
function rozwiazanie25(;
    fp::Int = 943,
    x::Vector{ComplexF64} = ComplexF64[0.4 - 0.32im, 0.31 + 0.45im, 1.35 - 0.46im, -0.3 - 0.46im, 0.6 - 0.28im, -0.05 + 0.08im, -0.47 + 0.35im, 1.29 - 0.16im, -1.09 + 0.93im, 0.41 - 0.9im, -0.69 - 0.46im, -0.61 - 0.55im, 0.09 - 1.79im, -0.39 - 1.93im, 0.84 + 0.25im, -0.55 + 0.8im, 0.11 + 1.47im, 0.49 - 0.04im, 1.27 + 0.78im, -0.67 - 1.43im, 1.56 + 0.61im, -0.04 - 0.41im, -0.09 - 0.04im, 0.91 + 0.23im, 0.63 + 0.49im, 0.5 - 0.1im, 0.02 - 0.22im, -0.6 - 0.77im, 0.3 + 0.42im, -0.4 - 0.02im, 0.65 - 0.57im, 0.22 + 0.98im, -0.42 - 1.81im, -0.21 + 0.24im, -0.79 + 0.86im, -0.15 - 0.33im, -0.73 + 0.1im, -0.21 + 0.44im, -0.48 - 0.7im, 0.25 - 1.73im, -0.08 + 0.68im],
    f::Vector{Int} = [-460, -276, -230, 46, 322],
)
    function dft(x)
        N = length(x)
        X = zeros(ComplexF64, N)
        for k in 1:N
            for n in 1:N
                X[k] += x[k] * cispi((-2 * (n - 1) * (k - 1)) / N)
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

# 1.3330525617185013e-15
rozwiazanie25()