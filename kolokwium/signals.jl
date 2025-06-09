mean(x::AbstractVector)::Number = sum(x) / length(x)
energy(x::AbstractVector)::Real = sum(abs.(x).^2)
power(x::AbstractVector)::Real = sum(abs.(x).^2) / length(x)
rms(x::AbstractVector)::Real = sqrt(sum(abs.(x).^2) / length(x))

# problem 3
# średnia dyskretnego sygnału
# fala trójkątna: A = 1, T = 1s składowa stała: 0, g(0) = 0, dg/dt|t=0 = 4
function rozwiazanie3(;
    fp::Float64 = 441.89,
    t1::Float64 = 5.63,
    N::Int = 428,
)
    g(t) = 4 * abs(t - floor(t + 3 / 4) + 1 / 4) - 1
    x = range(start = t1, step = 1 / fp, length = N)
    y = [1.2 * g(3.4 * t - 1.5) for t in x]
    mean = sum(y) / length(y)
    return mean
end

-0.07376461626281178
rozwiazanie3()

# problem 4
# średnia dyskretnego sygnału
# bipolarna fala prostokątna: A = 1, T = 1s, składowa stała: 0, g(0) = 0, g(t) = 1 dla 0 < t < 0.5
function rozwiazanie4(;
    fp::Float64 = 219.95,
    t1::Float64 = -7.63,
    N::Int = 125,
)
    g(t) = sign(sin(2 * π * t))
    x = range(start = t1, step = 1 / fp, length = N)
    y = [0.5 * g(4.9 * t - 3.6) for t in x]
    mean = sum(y) / length(y)
    return mean
end

# 0.028
rozwiazanie4()

# problem 7
# średnia dyskretnego sygnału
# fala piłokształtna o opadającym zboczu: A = 1, T = 1s, składowa stała: 0, g(0) = 0, dg/dt|t=0 = -2
function rozwiazanie7(;
    fp::Float64 = 476.14,
    t1::Float64 = 5.65,
    N::Int = 676,
)
    g(t) = -2 * (t - floor(t + 0.5))
    x = range(start = t1, step = 1 / fp, length = N)
    y = [0.4 * g(3.8 * t - 0.4) for t in x]
    mean = sum(y) / length(y)
    return mean
end

# -0.015562139622304506
rozwiazanie7()

# problem 8
# średnia dyskretnego sygnału
# fala piłokształtna o opadającym zboczu: A = 1, T = 1s, składowa stała: 0, g(0) = 0, dg/dt|t=0 = -2
function rozwiazanie8(;
    fp::Float64 = 445.28,
    t1::Float64 = 1.84,
    N::Int = 774,
)
    g(t) = -2 * (t - floor(t + 0.5))
    x = range(start = t1, step = 1 / fp, length = N)
    y = [1.2 * g(1.8 * t - 4.4) for t in x]
    mean = sum(y) / length(y)
    return mean
end

# 0.0025547646703273402
rozwiazanie8()

# problem 10
# średnia dyskretnego sygnału
# bipolarna fala prostokątna: A = 1, T = 1s, składowa stała: 0, g(0) = 0, g(t) = 1 dla 0 < t < 0.5
function rozwiazanie10(;
    fp::Float64 = 468.7,
    t1::Float64 = -5.99,
    N::Int = 733,
)
    g(t) = sign(sin(2 * π * t))
    x = range(start = t1, step = 1 / fp, length = N)
    y = [1.6 * g(4.3 * t - 1.1) for t in x]
    mean = sum(y) / length(y)
    return mean
end

# -0.015279672578444745
rozwiazanie10()

# problem 24
# średnia dyskretnego sygnału
# fala piłokształtna o opadającym zboczu: A = 1, T = 1s, składowa stała: 0, g(0) = 0, dg/dt|t=0 = -2
function rozwiazanie24(;
    fp::Float64 = 183.98,
    t1::Float64 = 8.28,
    N::Int = 424,
)
    g(t) = -2 * (t - floor(t + 0.5))
    x = range(start = t1, step = 1 / fp, length = N)
    y = [1.4 * g(4.8 * t - 2.5) for t in x]
    mean = sum(y) / length(y)
    return mean
end

-0.0071599464256741205
rozwiazanie24()

# problem 31
# średnia dyskretnego sygnału
# fala trójkątna: A = 1, T = 1s składowa stała: 0, g(0) = 0, dg/dt|t=0 = 4
function rozwiazanie31(;
    fp::Float64 = 189.7,
    t1::Float64 = -0.1,
    N::Int = 632,
)
    g(t) = 4 * abs(t - floor(t + 3/4) + 1/4) - 1
    x = range(start = t1, step = 1 / fp, length = N)
    y = [2.2 * g(3.1 * t - 3.3) for t in x]
    mean = sum(y) / length(y)
    return mean
end

# -0.012776068809512712
rozwiazanie31()

# problem 32
# średnia dyskretnego sygnału
# fala piłokształtna o opadającym zboczu: A = 1, T = 1s, składowa stała: 0, g(0) = 0, dg/dt|t=0 = -2          
function rozwiazanie32(;
    fp::Float64 = 256.7,
    t1::Float64 = -2.27,
    N::Int = 935,
)
    g(t) = -2 * (t - floor(t + 0.5))
    x = range(start = t1, step = 1 / fp, length = N)
    y = [4.6 * g(0.8 * t - 4.6) for t in x]
    mean = sum(y) / length(y)
    return mean
end

# -0.10660883238304775
rozwiazanie32()

# problem 40
# średnia dyskretnego sygnału
# fala piłokształtna o narastającym zboczu: A = 1, T = 1s, składowa stała: 0, g(0) = 0, dg/dt|t=0 = 2          
function rozwiazanie40(;
    fp::Float64 = 314.92,
    t1::Float64 = 2.72,
    N::Int = 389,
)
    g(t) = 2 * (t - floor(t + 0.5))
    x = range(start = t1, step = 1 / fp, length = N)
    y = [1.0 * g(3.8 * t - 1.7) for t in x]
    mean = sum(y) / length(y)
    return mean
end

# -0.005044939311309727
rozwiazanie40()

# problem 57
# średnia dyskretnego sygnału 
# fala piłokształtna o narastającym zboczu: A = 1, T = 1s, składowa stała: 0, g(0) = 0, dg/dt|t=0 = 2           
function rozwiazanie57(;
    fp::Float64 = 498.99,
    t1::Float64 = 9.38,
    N::Int = 504,
)
    g(t) = 2 * (t - floor(t + 0.5))
    x = range(start = t1, step = 1 / fp, length = N)
    y = [3.4 * g(3.6 * t - 3.0) for t in x]
    mean = sum(y) / length(y)
    return mean
end

# 0.10203333552825061
rozwiazanie57()
