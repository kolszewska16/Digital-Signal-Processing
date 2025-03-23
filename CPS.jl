module CPS

const author = Dict(
    "index" => "421551",
    "name" => "Kinga Olszewska",
    "email" => "kolszewska@student.agh.edu.pl",
)



###############################################################################
# Parametry sygnałów                                                          #
###############################################################################
mean(x::AbstractVector)::Number = sum(abs.(x) .* abs.(x)) / length(x)
peak2peak(x::AbstractVector)::Real = maximum(x) - minimum(x)
energy(x::AbstractVector)::Real = missing
power(x::AbstractVector)::Real = missing
rms(x::AbstractVector)::Real = missing

function running_mean(x::AbstractVector, M::Integer)::Vector
    missing
end

function running_energy(x::AbstractVector, M::Integer)::Vector
    missing
end

function running_power(x::AbstractVector, M::Integer)::Vector
     missing
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
pulse_wave(t::Real, ρ::Real=0.2)::Real = missing

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
rect(N::Integer) = ones(N)
triang(N::Integer) = [1 - abs((n - (N - 1) / 2) / ((N - 1) / 2)) for n in 0:(N - 1)]
hanning(N::Integer) = [0.5 * (1 - cos((2 * π * n) / (N - 1))) for n in 0:(N - 1)]
hamming(N::Integer) = [0.53836 - 0.46164 * cos((2 * π * n) / (N - 1)) for n in 0:(N - 1)]
blackman(N::Integer) = [0.42 - 0.5 * cos((2 * π * n) / (N - 1)) + 0.08 * cos((4 * π * n) / (N - 1)) for n in 0:(N - 1)]

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
SQNR(N::Integer)::Real = missing
SNR(Psignal::Real, Pnoise::Real)::Real = 10 * log10(Psignal / Pnoise)


function interpolate(
    m::AbstractVector,
    s::AbstractVector,
    kernel::Function=sinc
)::Function
    missing
end


end