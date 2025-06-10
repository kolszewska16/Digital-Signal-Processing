# problem 13
# suma amplitud składowych częstotliwościowych          
function rozwiazanie13(;
    fp::Int = 476,
    x::Vector{ComplexF64} = ComplexF64[-0.28 + 0.56im, 0.26 + 1.12im, -0.3 + 0.3im, -0.01 + 0.62im, -0.48 - 0.13im, -0.4 + 1.11im, 0.3 + 0.09im, -0.76 - 0.09im, -0.01 + 0.73im, 0.42 + 0.49im, -0.33 + 0.09im, 0.99 - 0.1im, -0.74 + 0.01im, -0.3 - 0.35im, 0.3 + 0.57im, -0.01 + 0.68im, -1.52 + 0.89im, 0.03 + 1.25im, -0.71 + 0.43im, 0.33 + 0.55im, 0.42 + 0.83im, 1.22 - 0.34im, -0.35 - 0.57im, 1.43 - 0.58im, -0.17 + 0.85im, 0.85 - 0.94im, -0.64 + 1.03im, 0.04 - 0.22im],
    f::Vector{Int} = [-102, -68, -34, -17, 102, 136, 153],
)
    N = length(x)
    sum = 0
    for fi in f
        X = 0
        for n in 0:(N - 1)
            X += x[n + 1] * exp(-2im * π * (fi / fp) * n)
        end
        sum += abs(X / N)
    end
    return sum
end

# 0.9225496857112364
rozwiazanie13()

# problem 15
# suma faz składowych częstotliwościowych          
function rozwiazanie15(;
    fp::Int = 713,
    x::Vector{ComplexF64} = ComplexF64[-0.57 - 1.42im, -0.72 + 1.33im, -0.2 - 1.11im, -1.27 - 1.22im, -1.2 - 0.32im, 0.35 + 0.69im, -0.19 - 0.9im, 0.36 + 0.84im, -0.06 - 0.51im, 1.12 + 0.09im, 0.92 + 0.15im, -0.36 + 0.17im, 0.11 - 0.77im, -0.49 - 0.49im, -1.84 + 0.06im, -0.97 - 0.91im, 0.71 + 0.05im, 0.67 + 0.42im, -0.23 + 0.03im, -0.73 + 0.94im, -0.24 + 0.07im, -0.25 + 0.56im, 0.2 - 0.01im, 1.24 - 0.71im, -0.87 - 0.08im, 0.65 + 0.18im, 0.16 + 1.1im, 0.01 - 0.43im, 0.25 + 0.27im, 0.49 - 0.15im, 0.37 - 0.94im],
    f::Vector{Int} = [-207, -115, -23, 0, 69, 253],
)
    N = length(x)
    sum = 0
    for fi in f
        X = 0
        for n in 0:(N - 1)
            X += x[n + 1] * exp(-2im * π * (fi / fp) * n)
        end
        sum += angle(X / N)
    end
    return sum
end

# -7.930611392350095
rozwiazanie15()

# problem 25
# suma amplitud składowych częstotliwościowych          
function rozwiazanie25(;
    fp::Int = 943,
    x::Vector{ComplexF64} = ComplexF64[0.4 - 0.32im, 0.31 + 0.45im, 1.35 - 0.46im, -0.3 - 0.46im, 0.6 - 0.28im, -0.05 + 0.08im, -0.47 + 0.35im, 1.29 - 0.16im, -1.09 + 0.93im, 0.41 - 0.9im, -0.69 - 0.46im, -0.61 - 0.55im, 0.09 - 1.79im, -0.39 - 1.93im, 0.84 + 0.25im, -0.55 + 0.8im, 0.11 + 1.47im, 0.49 - 0.04im, 1.27 + 0.78im, -0.67 - 1.43im, 1.56 + 0.61im, -0.04 - 0.41im, -0.09 - 0.04im, 0.91 + 0.23im, 0.63 + 0.49im, 0.5 - 0.1im, 0.02 - 0.22im, -0.6 - 0.77im, 0.3 + 0.42im, -0.4 - 0.02im, 0.65 - 0.57im, 0.22 + 0.98im, -0.42 - 1.81im, -0.21 + 0.24im, -0.79 + 0.86im, -0.15 - 0.33im, -0.73 + 0.1im, -0.21 + 0.44im, -0.48 - 0.7im, 0.25 - 1.73im, -0.08 + 0.68im],
    f::Vector{Int} = [-460, -276, -230, 46, 322],
)
    N = length(x)
    sum = 0
    for fi in f
        X = 0
        for n in 0:(N - 1)
            X += x[n + 1] * exp(-2im * π * (fi / fp) * n)
        end
        sum += abs(X / N)
    end
    return sum
end

# 0.664740038372966
rozwiazanie25()



# problem 6
# suma faz          
function rozwiazanie6(;
    fp::Int = 893,
    x::Vector{ComplexF64} = ComplexF64[-0.05 + 0.15im, -0.51 - 0.06im, 0.46 + 0.01im, 0.9 + 0.31im, -0.56 + 0.38im, 0.87 + 0.61im, 0.53 + 0.4im, -1.63 + 1.23im, 0.31 + 0.77im, 1.43 + 0.06im, 0.43 + 0.66im, -1.15 + 0.41im, -0.47 - 0.39im, -1.86 - 0.44im, 1.38 - 0.15im, 0.18 + 0.08im, 0.1 - 1.8im, -0.9 - 0.57im, -0.04 + 1.66im, -0.97 + 1.17im, -0.51 - 1.03im, 0.15 - 0.8im, -0.09 - 0.5im, -0.9 + 1.25im, -0.2 + 1.12im, -0.24 + 1.15im, 1.38 + 0.03im, 0.53 - 0.76im, 0.46 + 0.58im, 0.59 + 0.89im, -1.09 + 0.51im, 0.08 + 0.89im, -0.39 - 0.49im, 0.53 + 0.71im, -0.59 - 0.26im, -0.42 - 0.3im, 0.14 - 0.52im, 0.85 - 0.05im, -0.21 - 0.58im, -0.1 + 0.32im, 0.13 - 1.0im, 1.26 + 0.05im, 0.01 + 0.26im, -0.2 - 1.52im, -1.42 + 0.38im, -0.21 - 1.1im, 0.35 - 0.54im],
    f::Vector{Int} = [133, 171, 323, 418],
)
    N = length(x)
    sum = 0
    for fi in f
        X = 0
        for n in 0:(N - 1)
            X += x[n + 1] * exp(-2im * π * (fi / fp) * n)
        end
        sum += angle(X / N)
    end
    return sum
end

# -4.361081197373714
rozwiazanie6()

# problem 13
# suma amplitud          
function rozwiazanie13(;
    fp::Int = 940,
    x::Vector{ComplexF64} = ComplexF64[-0.65 - 0.67im, -0.29 - 1.34im, -1.28 + 0.2im, -0.44 + 0.15im, 1.0 + 0.05im, -0.66 - 0.1im, 0.08 + 0.24im, -1.17 + 0.43im, 0.05 + 0.85im, -0.5 - 0.46im, -0.24 + 0.16im, 0.76 - 0.29im, 0.35 + 0.09im, -1.85 + 1.1im, -0.51 - 0.12im, -0.29 + 1.02im, -0.31 + 1.76im, -0.55 - 0.15im, 0.1 - 0.7im, -0.0 + 0.52im, 1.2 - 1.01im, 0.45 + 0.71im, 1.73 + 0.9im, -0.54 + 1.56im, -0.22 + 0.4im, -0.16 - 0.44im, -0.78 + 0.24im, 0.52 + 1.06im, -0.8 - 0.85im, -0.2 - 1.5im, 0.81 - 0.95im, 0.91 + 0.35im, -0.18 - 0.57im, -0.66 + 0.81im, 1.14 + 0.02im, -0.65 + 1.58im, 0.06 - 0.47im, -0.46 + 0.35im, -0.48 - 0.18im, 0.5 - 0.68im, 0.02 - 1.54im, -1.47 - 1.26im, -0.37 - 1.14im, 0.08 - 0.32im, -1.19 - 1.9im, -0.04 - 0.37im, -1.39 - 1.23im],
    f::Vector{Int} = [-380, -360, -260, -60, -20, 180, 360],
)
    N = length(x)
    sum = 0
    for fi in f
        X = 0
        for n in 0:(N - 1)
            X += x[n + 1] * exp(-2im * π * (fi / fp) * n)
        end
        sum += abs(X / N)
    end
    return sum
end

# 1.2450510907042156
rozwiazanie13()

# problem 24 
# suma amplitud         
function rozwiazanie24(;
    fp::Int = 572,
    x::Vector{ComplexF64} = ComplexF64[-0.29 - 1.49im, 0.89 - 0.61im, -0.44 + 0.09im, -0.06 + 0.79im, -0.31 - 0.94im, -1.8 + 0.46im, -1.77 - 0.6im, -0.19 - 0.2im, -0.66 + 0.55im, 0.75 + 0.67im, 0.93 - 0.33im, 0.18 - 0.59im, -0.14 - 0.33im, -1.45 + 0.12im, -0.24 + 1.02im, 0.11 - 0.62im, -0.17 + 0.46im, -0.28 + 1.28im, 0.86 + 0.39im, 0.59 - 0.52im, -0.72 + 0.53im, -0.48 + 0.68im, -0.04 - 0.76im, -0.41 + 0.22im, 0.93 + 0.23im, 0.42 - 0.03im],
    f::Vector{Int} = [-220, -198, -154, -110, -44, 132, 220, 242],
)
    N = length(x)
    sum = 0
    for fi in f
        X = 0
        for n in 0:(N - 1)
            X += x[n + 1] * exp(-2im * π * (fi / fp) * n)
        end
        sum += abs(X / N)
    end
    return sum
end

# 1.5763478290386577
rozwiazanie24() 

# problem 31
# suma faz          
function rozwiazanie31(;
    fp::Int = 987,
    x::Vector{ComplexF64} = ComplexF64[0.8 - 0.62im, 0.68 + 0.19im, -0.06 + 0.05im, -0.23 + 0.4im, 0.17 - 0.23im, 0.43 + 0.15im, -0.93 - 0.33im, 0.81 + 0.06im, -1.37 - 0.23im, -0.78 + 0.4im, 0.13 - 0.62im, 1.91 - 0.61im, -0.63 + 0.37im, -1.69 - 0.31im, 0.05 - 0.87im, 0.87 + 0.07im, -0.62 + 0.44im, -0.78 - 0.88im, 0.51 - 0.92im, 1.11 + 0.63im, 0.73 - 0.0im, -0.39 + 0.8im, -1.32 - 0.67im, 0.43 + 0.0im, 0.1 - 0.51im, 1.2 + 0.01im, -0.17 - 0.22im, 0.15 + 0.41im, -0.17 + 0.47im, -0.67 + 0.81im, -0.13 - 0.06im, -0.23 + 0.31im, -0.01 + 0.57im, 1.42 - 0.27im, 0.74 - 0.14im, -0.1 + 1.28im, 0.59 - 0.48im, -0.42 - 1.0im, 0.04 - 0.1im, 0.09 + 0.78im, 1.38 - 0.14im, -0.61 + 0.15im, -1.36 - 0.02im, 0.5 - 1.12im, 0.65 - 0.75im, 0.63 - 0.87im, 0.32 + 0.89im],
    f::Vector{Int} = [-441, -420, -63, -42, -21, 210, 462],
)
    N = length(x)
    sum = 0
    for fi in f
        X = 0
        for n in 0:(N - 1)
            X += x[n + 1] * exp(-2im * π * (fi / fp) * n)
        end
        sum += angle(X / N)
    end
    return sum
end

# -5.0544845519588435
rozwiazanie31()

# problem 52
# suma faz
function rozwiazanie52(;
    fp::Int = 858,
    x::Vector{ComplexF64} = ComplexF64[-0.39 - 0.57im, 0.22 + 0.36im, 0.97 - 0.31im, -0.2 + 0.28im, -0.8 - 1.34im, 0.8 + 0.26im, 0.63 + 0.21im, -0.4 + 0.71im, 0.93 + 0.04im, 0.02 - 0.47im, 0.07 + 1.91im, 0.14 + 0.23im, 0.56 + 0.79im, 0.73 + 0.13im, 0.35 - 0.81im, -0.12 - 0.53im, 1.15 - 0.43im, 0.03 - 1.24im, 0.87 + 0.3im, -0.06 - 0.34im, 0.04 + 0.5im, 0.35 + 1.21im, 0.37 - 0.73im, 0.05 + 0.54im, 0.03 + 0.78im, 0.15 + 0.02im, -0.17 - 0.17im, 0.32 + 0.49im, -0.01 + 0.63im, 1.27 - 0.59im, -1.07 - 0.34im, 2.2 + 0.5im, 0.26 - 0.67im, 0.27 + 0.44im, -0.82 + 0.64im, -0.62 - 0.96im, -0.03 - 0.25im, -1.35 + 0.14im, 0.16 + 0.3im],
    f::Vector{Int} = [-308, -286, -242, -154, -66, 242, 330],
)
    N = length(x)
    sum = 0
    for fi in f
        X = 0
        for n in 0:(N - 1)
            X += x[n + 1] * exp(-2im * π * (fi / fp) * n)
        end
        sum += angle(X / N)
    end
    return sum
end

# 1.6220899975110736
rozwiazanie52()

# problem 62
# suma amplitud          
function rozwiazanie62(;
    fp::Int = 494,
    x::Vector{ComplexF64} = ComplexF64[0.45 - 1.75im, 0.47 + 0.96im, 0.14 + 0.2im, -0.33 - 1.36im, 0.13 + 0.39im, 1.02 + 0.53im, 0.38 + 0.4im, -0.43 - 0.32im, 0.74 + 1.19im, 0.05 + 0.89im, 0.14 - 0.44im, 0.13 - 0.96im, 1.63 + 2.29im, 0.59 + 0.91im, -1.53 + 0.06im, 0.36 - 0.3im, -0.6 - 0.03im, -0.04 + 0.13im, -0.42 + 0.29im, -0.08 + 0.26im, 1.32 - 0.83im, -0.96 - 0.77im, 0.41 + 0.18im, 0.73 - 0.19im, 0.3 - 0.77im, -0.44 + 1.46im],
    f::Vector{Int} = [-171, -152, -76, 0, 57, 114],
)
    N = length(x)
    sum = 0
    for fi in f
        X = 0
        for n in 0:(N - 1)
            X += x[n + 1] * exp(-2im * π * (fi / fp) * n)
        end
        sum += abs(X / N)
    end
    return sum
end

# 1.133243167099808
rozwiazanie62()

# problem 66
# suma faz          
function rozwiazanie66(;
    fp::Int = 551,
    x::Vector{ComplexF64} = ComplexF64[1.0 - 0.82im, -0.95 - 0.0im, -0.22 + 0.58im, -0.25 - 1.63im, -0.42 + 0.58im, 0.14 + 0.53im, 0.33 + 0.06im, -0.56 - 0.34im, 0.23 - 0.8im, 0.72 - 0.78im, 1.22 + 0.19im, 0.8 + 1.06im, -1.18 - 0.64im, -0.06 + 0.63im, 0.79 + 0.07im, 1.74 + 0.62im, -0.12 - 0.36im, 0.18 - 0.45im, 0.27 + 0.61im, -0.25 + 0.25im, -1.45 - 1.02im, 0.19 - 1.13im, 1.23 - 0.3im, -1.0 + 0.14im, -1.74 + 0.47im, 0.31 + 0.08im, 0.72 + 0.66im, -1.15 + 1.2im, -0.79 + 0.32im],
    f::Vector{Int} = [-76, -38, 114, 228],
)
    N = length(x)
    sum = 0
    for fi in f
        X = 0
        for n in 0:(N - 1)
            X += x[n + 1] * exp(-2im * π * (fi / fp) * n)
        end
        sum += angle(X / N)
    end
    return sum
end

# -1.6906996445607905
rozwiazanie66()