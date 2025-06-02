mean(x::AbstractVector)::Number = sum(x) / length(x)
energy(x::AbstractVector)::Real = sum(abs.(x).^2)
power(x::AbstractVector)::Real = sum(abs.(x).^2) / length(x)
rms(x::AbstractVector)::Real = sqrt(sum(abs.(x).^2) / length(x))

# problem 9
# wartość skuteczna sygnału wyjściowego
function rozwiazanie9(;
    x::Vector{Float64} = [-3.13, 0.21, -0.38, 2.88, 3.52, 4.82, -1.36, 1.78, 4.91, 0.32, -3.82, -3.69, -1.3, -3.25, 3.14, 2.7, -0.45, -1.48, 4.24, -3.02, -2.76, 3.61, 4.89, 1.96, 3.57, 0.71, -0.99, 0.51, 1.24, -0.01, -4.88, -4.58, 1.61, -3.2, 1.68, -4.35, 1.15, -0.73, -3.12, -1.26, -4.01, -0.14, -0.46, 1.17, 2.09, -2.2, 1.7, 3.11, -1.87, -0.75, 1.4, 1.4, 0.01, 0.55, -1.21, 0.35, 0.12, 0.42, 4.8, -4.44, 3.27, -0.6, -1.63, 3.81],
    h::Vector{Float64} = [3.75, -0.41, -2.15, -0.71, -0.41, 3.45, 3.61, -2.06, -3.83, 0.2, 1.07, 1.45, -0.27, -2.56, 1.72, 3.0, 4.16, 1.46, 4.76, 0.61, 4.5, 1.19, -3.78],
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
    rms = sqrt((sum(abs.(y) .^ 2)) / length(y))
    return rms
end

# 29.807344933357662
rozwiazanie9()

# problem 28
# średnia sygnału wyjściowego
function rozwiazanie28(;
    x::Vector{Float64} = [-0.13, 1.11, -3.66, 0.23, -0.53, 2.05, -3.07, -0.05, -4.0, 0.09, 4.04, 2.8, 0.29, -1.62, -3.94, 0.77, 4.08, 0.15, -4.02, -4.45, 4.15, 1.05, -3.71, -4.94, 4.8, -0.78, 0.76, -3.04, -0.26, -2.24, 0.33, 3.94, 4.18, 4.1, 1.91, 3.26, -3.88, -2.77, -1.83, -1.7, -1.7, -4.94, 2.68, -4.34, -0.44, 4.11, -2.49, 2.69, 4.64, -1.3, 2.78, -3.24, -2.1, 4.95, -3.16, -1.93, 3.3, 1.24, 4.6, -1.48, 0.01, 1.62],
    h::Vector{Float64} = [1.77, -2.69, 4.24, 4.68, 0.34, 4.58, 1.46, -3.54, 4.34, -3.33, -2.63, -1.68, -3.58, -2.48, 4.04, 2.9, 4.67, -3.02, 2.19, -2.74, -4.17, -3.34],
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

# -0.021795180722891258
rozwiazanie28()

# problem 29
# średnia sygnały wyjściowego
function rozwiazanie29(;
    x::Vector{Float64} = [3.62, -2.0, -0.06, -3.17, -2.66, -0.26, -3.97, 3.92, 3.11, 0.23, -0.57, 4.59, 2.44, -1.66, -2.15, 4.54, 0.49, -4.14, 0.98, 3.68, 0.43, 4.36, -4.25, 0.4, 0.54, 4.21, -0.52, -2.29, 2.08, -3.47, 4.65, -3.48, 2.52, -2.1, -0.67, 1.79, 4.91, -3.18, 0.57, -3.17, 3.43, -2.31, 0.71, -2.48, 4.18, -1.23, 3.56, 3.48, 4.62, 4.94, 0.53, 1.07, 0.76, 1.78, 0.05, -3.56, 3.82, 2.7, 0.52, 3.8, 2.14, -2.81, -1.45, -1.49],
    h::Vector{Float64} = [-3.92, -0.29, -1.82, -0.82, -0.64, 2.01, 3.94, 1.54, -2.66, -2.66, -2.85, -0.69, 0.93, 0.34, -4.5],
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

# -5.181650000000001
rozwiazanie29()

# problem 39
# energia sygnału wyjściowego          
function rozwiazanie39(;
    x::Vector{Float64} = [0.64, -2.88, 2.72, -3.81, -0.23, -0.79, 2.51, -3.96, -2.15, -4.77, -1.27, 0.17, 4.68, -3.5, -0.1, 3.19, 0.26, -1.06, -0.7, 1.59, 0.82, 3.63, -3.78, -4.16, -0.23, 1.55, 1.56, -0.7, 1.7, -4.86, -1.22, 3.76, 4.85, 2.23, -1.43, 0.17, 1.14, 0.25, -0.04, 0.88, 4.06, 4.58, -0.96, 0.69, 0.86, 1.78, 0.85, -1.24, 0.61, -2.79, -0.4, -2.73, -1.96, -4.09, -2.7, 3.46, 4.38, -2.62, 2.18, 1.04, -1.52, 1.94, 0.45],
    h::Vector{Float64} = [-0.59, -1.0, 2.35, 3.62, 4.66, 4.69, -1.01, 2.05, -1.0, -1.11, -2.13, 4.41, -2.77, -1.04, -3.25, -0.13],
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
    energy = sum(abs.(y) .^ 2)
    return energy
end

# 50725.77597545001
rozwiazanie39()

# problem 43
# moc sygnału wyjściowego
function rozwiazanie43(;
    x::Vector{Float64} = [2.3, 4.44, 2.78, -0.33, 0.15, -1.73, -4.14, -1.83, 0.43, 0.03, 4.43, -1.78, -2.94, -0.43, -4.91, 2.93, 4.94, -0.65, -2.3, -3.27, 3.3, -0.29, 1.53, -3.33, -1.47, -4.56, 3.57, 0.86, -3.69, -2.64, -4.29, -2.4, -1.21, 0.72, -1.04, -0.58, -4.71, 4.76, -0.51, -4.85, 1.08, -2.02, -3.22, 2.15, -1.46, -0.48, 2.26, -4.26, 3.41, -2.22, -3.28, -0.6, -2.55, 3.39, 1.01, 3.87, 1.16, -2.24, -1.35, -1.35, 1.7, -4.45],
    h::Vector{Float64} = [0.85, -1.46, -0.28, 0.33, 1.87, 3.79, 2.53, 4.69, 3.03, 4.8, -1.64, -4.35, -2.39, -0.94, -4.79, 2.02, 0.23, 3.56, -0.42],
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
    power = sum(abs.(y) .^ 2) / length(y)
    return power
end

# 676.1974333409999
rozwiazanie43()

# problem 46
# wartość skuteczna sygnału wyjściowego          
function rozwiazanie46(;
    x::Vector{Float64} = [-2.66, 0.0, -1.62, 3.19, 5.0, 4.3, -0.97, -4.16, -0.07, 3.14, -3.77, -3.6, 0.29, -4.45, 3.73, 3.57, -3.77, -3.15, -1.0, 3.35, 2.93, 2.38, 4.89, -2.85, 3.22, 1.4, 3.77, -1.73, -1.51, -1.53, -3.36, -2.71, 4.31, -4.77, -3.19, -3.77, 4.29, -1.8, 1.3, 3.16, 1.32, 4.04, -2.7, -0.06, 2.66, 3.15, 0.14, -1.09, 3.68, 4.12, -3.34, -4.24, -3.28, -1.83, 4.79, -4.15, 4.04, 0.33, -4.02, -0.93, -3.13],
    h::Vector{Float64} = [0.4, -0.35, -0.3, 0.18, 1.8, 4.11, 3.26, 1.69, 1.16, -2.37, -4.75],
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
    rms = sqrt(sum(abs.(y) .^ 2) / length(y))
    return rms
end

# 22.785397867741253
rozwiazanie46()