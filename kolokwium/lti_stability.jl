# problem 14
function rozwiazanie14(;
    z::Vector{ComplexF64} = ComplexF64[1.0 + 0.0im, 1.0 + 0.0im, 1.0 + 0.0im, 1.0 + 0.0im],
    p::Vector{ComplexF64} = ComplexF64[0.8522925660496932 - 0.4000755282309536im, 0.8522925660496932 + 0.4000755282309536im, 3.9163850758069665 - 3.108364190051813im, 0.4780265719941804 + 0.37940106744323937im],
    k::Float64 = 0.4657779560999565,
)
    for pole in p
        if(abs(pole) > 1)
            return -1.0
        end
        if(abs(pole) <= 1)
            return 1.0
        end
    end
end

# 1.0
rozwiazanie14()