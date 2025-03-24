# problem 5.2
function SQNR(N::Integer)::Real
    if(N > 0)
        sqnr = 10 * log10(3 * 2^(2 * N))
        return sqnr
    else 
        return 0.0
    end
end

# SQNR(N::Integer)::Real = (N > 0) ? 10 * log10(3 * 2^(2 * N)) : 0.0
SQNR(4)

# problem 5.3
function SNR(Psignal::Real, Pnoise::Real)::Real
    snr = 10 * log10(Psignal / Pnoise)
    return snr
end

# SNR(Psignal::Real, Pnoise::Real)::Real = 10 * log10(Psignal / Pnoise)
SNR(8.21, 4.3)