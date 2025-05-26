module CPS

const author = Dict(
    "index" => "421551",
    "name" => "Kinga Olszewska",
    "email" => "kolszewska@student.agh.edu.pl",
)



###############################################################################
# Parametry sygnałów                                                          #
###############################################################################
mean(x::AbstractVector)::Number = sum(x) / length(x)
peak2peak(x::AbstractVector)::Real = maximum(x) - minimum(x)
energy(x::AbstractVector)::Real = sum(abs.(x).^2)
power(x::AbstractVector)::Real = sum(abs.(x).^2) / length(x)
rms(x::AbstractVector)::Real = sqrt(sum(abs.(x).^2) / length(x))

function running_mean(x::AbstractVector, M::Integer)::Vector
    N = length(x)
    mean = []
    for n = 1:N
        nmin = max(1, n - M)
        nmax = min(N, n + M)
        v = sum(x[nmin:nmax]) / (nmax - nmin + 1)
        append!(mean, v)
    end
    return mean
end

function running_energy(x::AbstractVector, M::Integer)::Vector
    N = length(x)
    energy = []
    for n = 1:N
        nmin = max(1, n - M)
        nmax = min(N, n + M)
        v = sum(abs.(x[nmin:nmax]).^2)
        append!(energy, v)
    end
    return energy
end

function running_power(x::AbstractVector, M::Integer)::Vector
    N = length(x)
    power = []
    for n = 1:N
        nmin = max(1, n - M)
        nmax = min(N, n + M)
        v = sum(abs.(x[nmin:nmax]).^2) / (nmax - nmin + 1)
        append!(power, v)
    end
    return power
end



###############################################################################
# Modelowanie sygnałów                                                        #
###############################################################################
ci_rectangular(t::Real; T::Real=1.0)::Real = (abs(t) < T / 2) ? 1.0 : ((abs(t) == T / 2) ? 0.5 : 0.0)
ci_triangle(t::Real; T::Real=1.0)::Real = (abs(t) < T) ? (1 - abs(t)) : 0.0
ci_literka_M(t::Real; T=1.0)::Real = (abs(t) <= T / 2) ? (abs(t) + 0.5) : 0.0
ci_literka_U(t::Real; T=1.0)::Real = (abs(t) <= T / 2) ? (4 * t^2) : 0.0

ramp_wave(t::Real)::Real = missing
sawtooth_wave(t::Real)::Real = missing
triangular_wave(t::Real)::Real = missing
square_wave(t::Real)::Real = sign(sin(2  * π * 1 * t))
pulse_wave(t::Real, ρ::Real=0.2)::Real = (mod(t, 1) > 0 && mod(t, 1) < ρ) ? 1.0 : 0.0

function impuse_repeater(g::Function, t0::Real, t1::Real)::Function 
    missing
end

function ramp_wave_bl(t; A=1.0, T=1.0, band=20.0)
    missing
end

function sawtooth_wave_bl(t; A=1.0, T=1.0, band=20.0)
    missing
end

function triangular_wave_bl(t; A=1.0, T=1.0, band=20.0)
    missing
end

function square_wave_bl(t; A=1.0, T=1.0, band=20.0)
    missing
end

function pulse_wave_bl(t; ρ=0.2, A=1.0, T=1.0, band=20.0)
    missing
end


function impuse_repeater_bl(g::Function, t0::Real, t1::Real, band::Real)::Function
    missing
end

function rand_siganl_bl(f1::Real, f2::Real)::Function
    missing
end



kronecker(n::Integer)::Real = (n == 0) ? 1.0 : 0.0
heaviside(n::Integer)::Real = (n >= 0) ? 1.0 : 0.0

# Dyskretne okna czasowe
rect(N::Integer) = (N > 0) ? ones(N) : 0.0
triang(N::Integer) = (N > 0) ? [1 - abs((n - (N - 1) / 2) / ((N - 1) / 2)) for n in 0:(N - 1)] : 0.0
hanning(N::Integer) = (N > 0) ? [0.5 * (1 - cos((2 * π * n) / (N - 1))) for n in 0:(N - 1)] : 0.0
hamming(N::Integer) = (N > 0) ? [0.53836 - 0.46164 * cos((2 * π * n) / (N - 1)) for n in 0:(N - 1)] : 0.0
blackman(N::Integer) = (N > 0) ? [0.42 - 0.5 * cos((2 * π * n) / (N - 1)) + 0.08 * cos((4 * π * n) / (N - 1)) for n in 0:(N - 1)] : 0.0

function chebwin(N; α=-100)
    missing
end

function kaiser(N; β=0, K=20)
    missing
end

end


###############################################################################
# Próbkowanie i kwantyzacja                                                   #
###############################################################################

quantize(L::AbstractVector)::Function = missing
SQNR(N::Integer)::Real = (N > 0) ? 10 * log10(3 * 2^(2 * N)) : 0.0
SNR(Psignal::Real, Pnoise::Real)::Real = 10 * log10(Psignal / Pnoise)


function interpolate(
    m::AbstractVector,
    s::AbstractVector,
    kernel::Function=sinc
)::Function
    missing
end


###############################################################################
# Obliczanie dyskretnej transformacji Fouriera                                #
###############################################################################

function dtft(x::AbstractVector, f::Real, fs::Real)
    T = 1 / fs
    L = length(x)
    dtft = 0
    for n = 0:(L - 1)
        for i = 0:(L - 1)
            dtft += x[i + 1] * exp(-im * 2 * π * f * i * T)
        end
    end
    return dtft
end

function dft(x::Vector)::Vector
    N = length(x)
    X = []
    for k = 0:(N - 1)
        sum_k = 0
        for n in 0:(N - 1)
            sum_k += x[n + 1] * exp(-im * (2 * π / N) * k * n)
        end
        append!(X, sum_k)
    end
    return X
end

function idft(x::Vector)::Vector
    N = length(X)
    x = []
    for n = 0:(N - 1)
        sum_n = 0
        for k in 0:(N - 1)
            sum_n += X[k + 1] * exp(im * (2 * π / N) * k * n)
        end
        append!(x, (1 / N) * sum_n)
    end
    return x
end

function goertzel(x::Vector, k::Integer)::Complex
    N = length(x)
    ω = (2 * π * k) / N
    a = 2 * cos(ω)

    s_prev = 0
    s_prev2 = 0

    for i in 1:N
        s = x[i] + a * s_prev - s_prev2
        s_prev2 = s_prev
        s_prev = s
    end

    real = s_prev - cos(ω) * s_prev2
    imag = sin(ω) * s_prev2

    return real + im * imag
end

function recursiv_dft(N::Integer)::Function
    missing
end

function exp_recursiv_dft(N::Integer, a::Number)::Function
    missing
end

function cos_recursiv_dft(N::Integer, a::Vector)::Function
    missing
end

function rdft(x::Vector)::Vector
    N = length(x)
    output_length = floor(N / 2) + 1
    X = []

    for k in 0:(output_length - 1)
        sum = 0
        for n in 0:(N - 1)
            sum += x[n + 1] * exp((-im * 2 * π * k * n) / N)
        end
        append!(X, sum)
    end
    return X
end

function irdft(X::Vector, N::Integer)::Vector
    L = length(X)
    expectedL = floor(Int, N / 2) + 1
    if L != expectedL
        error("Invalid value")
    end

    X_full = zeros(ComplexF64, N)
    X_full[1] = X[1]

    for k in 1:(L - 1)
        X_full[k + 1] = X[k + 1]
    end

    for k in 1:(L - 1)
        if N % 2 == 0 && k == N ÷ 2
            continue
        end
        X_full[N - k + 1] = conj(X[k + 1])
    end

    x = []
    for n in 0:(N - 1)
        sum = 0
        for k in 0:(N - 1)
            sum += (1 / N) * X_full[k + 1] * exp((im * 2 * π * k * n) / N)
        end
        v = real(sum)
        append!(x, v)
    end

    return x
end

function fft_radix2_dit_r(x::Vector)::Vector
    missing
end

function ifft_radix2_dif_r(x::Vector)::Vector
    missing
end

function fft(x::Vector)::Vector
    missing
end

function ifft(x::Vector)::Vector
    missing
end

function rfft(x::Vector)::Vector
    missing
end

function irfft(x::Vector, N::Integer)::Vector
    missing
end


###############################################################################
# Analiza częstotliwościowa sygnałów dyskretnych                              #
###############################################################################

fftfreq(N::Integer, fs::Real) = [(k * fs) / N for k in 0:(N - 1)]
rfftfreq(N::Integer, fs::Real) = missing

amplitude_spectrum(x::Vector, w::Vector=rect(length(x)))::Vector = [abs(dft(x .* w)[i]) for i in 1:length(x)]
power_spectrum(x::Vector, w::Vector=rect(length(x)))::Vector = [abs(dft(x .* w)[i])^2 for i in 1:length(x)]
psd(x::Vector, w::Vector=rect(length(x)), fs::Real=1.0)::Vector = missing

function welch(x::Vector, w::Vector=rect(length(x)), L::Integer=1, fs::Real=1.0)::Vector
    missing
end

# Modelowanie sygnałów niestacjonarnych
chirp_lin(t, f0, f1, T, ϕ=0) = missing
chirp_exp(t, f0, f1, T, ϕ=0) = missing

function stft(x::Vector, w::Vector, L::Integer)::Matrix
    missing
end

function istft(
    X::AbstractMatrix{<:Complex},
    w::AbstractVector{<:Real},
    L::Integer = 0,
    N::Integer = length(w);
)::AbstractVector{<:Real}
    missing
end


"""
Inputs:
    * X - spectrogram
    * w - STFT window
    * L - STFT overlap
    * N - number of Griffin-Lim iterations

Outputs:
    * Y - estimated STFT representation (amplitude + phase)
    * loss_values - a vector with reconsturction loss values (optional, recommended for dev)
"""
function phase_retrieval(X, w, L, N)
    missing, missing
end


###############################################################################
# Systemy dyskretne                                                           #
###############################################################################

function lti_amp(f::Real; b::Vector, a::Vector)::Real
    missing
end

function lti_phase(f::Real; b::Vector, a::Vector)::Real
    missing
end

function conv(f::Vector, g::Vector)::Vector
    missing
end

function fast_conv(f::Vector, g::Vector)::Vector
    missing
end

function overlap_add(f::Vector, g::Vector, L::Integer)::Vector
    missing
end

function overlap_save(f::Vector, g::Vector, L::Integer)::Vector
    missing
end

function lti_filter(b::Vector, a::Vector, x::Vector)::Vector
    missing
end

function filtfilt(b::Vector, a::Vector, x::Vector)::Vector
    missing
end

###############################################################################
# Projektowanie filtrÃ³w                                                       #
###############################################################################

function firwin_lp_I(M::Integer, F0::Real)::Vector
    length = M + 1
    L = M / 2

    h = zeros(Float64, length)
    n = collect(-L:L)
    
    for i in eachindex(n)
        if n[i] != 0
            h[i] = 2 * F0 * (sin(2 * π * F0 * n[i])) / (2 * π * F0 * n[i])
        else
            h[i] = 2 * F0
        end
    end
    return h
end

function firwin_hp_I(M::Integer, F0::Real)::Vector
    length = M + 1
    L = M / 2

    h = zeros(Float64, length)
    n = collect(-L:L)

    for i in eachindex(n)
        if n[i] != 0
            h[i] = -2 * F0 * (sin(2 * π * F0 * n[i])) / (2 * π * F0 * n[i])
        else
            h[i] = 1 - 2 * F0
        end
    end
    return h
end

function firwin_bp_I(M::Integer, F1::Real, F2::Real)
    length = M + 1
    L = M / 2

    h = zeros(Float64, length)
    n = collect(-L:L)

    for i in eachindex(n)
        if n[i] != 0
            h[i] = 2 * F2 * (sin(2 * π * F2 * n[i])) / (2 * π * F2 * n[i]) - 2 * F1 * (sin(2 * π * F1 * n[i])) / (2 * π * F1 * n[i])
        else
            h[i] = 2 * F2 - 2 * F1
        end
    end
    return h
end

function firwin_bs_I(M::Int, F1::Real, F2::Real)::Vector
    length = M + 1
    L = M / 2

    h = zeros(Float64, length)
    n = collect(-L:L)

    for i in eachindex(n)
        if n[i] != 0
            h[i] = -2 * F1 * (sin(2 * π * F1 * n[i])) / (2 * π * F1 * n[i]) - (-2 * F2 * (sin(2 * π * F2 * n[i])) / (2 * π * F2 * n[i]))
        else
            h[i] = 1 - (2 * F2 - 2 * F1)
        end
    end
    return h
end


function firwin_lp_II(M::Integer, F0::Real)::Vector
    missing
end

function firwin_bp_II(M::Integer, F1::Real, F2::Real)::Vector
    missing
end

function firwin_diff(M)
    missing
end

function fir_I_LS(N::Integer, freq::Vector, amp::Vector, w::Vector)::Vector
    missing
end

function fir_I_remez(M::Integer, A::Function, W::Function)
    missing
end

function firwin_lp_kaiser_lp(f0, Δf, δ)
    missing
end
