# problem 11
# średnie przesunięcie fazowe
function rozwiazanie11(;
    b::Vector{Float64} = [0.4350720967813647, -2.2364422441016516, 7.400514067760954, -16.653968746894723, 29.202281485025942, -39.9845603573371, 44.64572022913194, -39.98456035733711, 29.202281485025942, -16.653968746894723, 7.400514067760954, -2.2364422441016516, 0.4350720967813649],
    a::Vector{Float64} = [1.0, -4.677290890500987, 14.076613587445543, -28.980718357501033, 46.693538472670426, -59.1315595393033, 61.44876946986736, -51.633674846105976, 35.66966639802992, -19.439240482279565, 8.337203907174908, -2.463730820529054, 0.4727214507516522],
    F::Vector{Float64} = [0.13, 0.18, 0.21, 0.45],
)
    out = zeros(Float64, length(F))
    for i in 1:length(F)
        num = 0
        denom = 0
        for l in 1:length(b)
            num += b[l] * exp(2im * π * F[i]) ^ (l - 1)
        end
        for m in 1:length(a)
            denom += a[m] * exp(2im * π * F[i]) ^ (m - 1)
        end
        out[i] = angle(num / denom)
    end
    mean = sum(out) / length(out)
    return mean
end

# 1.784544820157234
rozwiazanie11()

# problem 26
# średnie przesunięcie fazowe          
function rozwiazanie26(;
    zz::Vector{ComplexF64} = ComplexF64[0.5573240189479631 + 0.8302950908584794im, 0.5573240189479631 - 0.8302950908584794im, 0.641581324097754 + 0.7670550205617409im, 0.641581324097754 - 0.7670550205617409im, 0.9108080811536637 + 0.41283003682530284im, 0.9108080811536637 - 0.41283003682530284im],
    pp::Vector{ComplexF64} = ComplexF64[0.4993874939184289 + 0.8547042526469697im, 0.4993874939184289 - 0.8547042526469697im, 0.38514534634437164 + 0.8504041966418185im, 0.38514534634437164 - 0.8504041966418185im, -0.13863455368506164 + 0.6174786541025186im, -0.13863455368506164 - 0.6174786541025186im],
    k::Float64 = 0.1601205008772371,
    F::Vector{Float64} = [0.1, 0.1, 0.31, 0.44],
)
    out = zeros(Float64, length(F))
    for i in 1:length(F)
        num = 0
        denom = 0
        for l in 1:length(zz)
            num += cispi(2 * F[i]) - zz[l]
        end
        for m in 1:length(pp)
            denom += cispi(2 * F[i]) - pp[m]
        end
        out[i] = angle((k * num) / denom)
    end
    mean = sum(out) / length(out)
    return mean
end

# 0.37959139362866323
rozwiazanie26()

# problem 36
# średnie wzmocnienie          
function rozwiazanie36(;
    b::Vector{Float64} = [0.22382351930333216, -0.6714705579099964, 0.6714705579099964, -0.22382351930333216],
    a::Vector{Float64} = [1.0, -0.43796058675527194, 0.5255572503713333, 0.1729296826999481],
    F::Vector{Float64} = [0.1, 0.2, 0.29],
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

# 0.6173626121172346
rozwiazanie36()

# problem 53
# średnie wzmocnienie          
function rozwiazanie53(;
    b::Vector{Float64} = [0.6943140684289035, -4.0317533052338845, 13.920736629352877, -32.74646021423268, 58.57092087170866, -81.61766160802392, 91.25952384976976, -81.61766160802392, 58.57092087170866, -32.746460214232656, 13.920736629352858, -4.0317533052338765, 0.6943140684289022],
    a::Vector{Float64} = [1.0, -5.454495427473779, 17.6776250786568, -39.060382822698756, 65.64774130361086, -86.01547571391846, 90.47652832159771, -76.17016706675828, 51.478823082707144, -27.122082803064067, 10.86867717655984, -2.969146421067879, 0.4820720256185417],
    F::Vector{Float64} = [0.4, 0.41, 0.48],
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

# 0.9999999999999988
rozwiazanie53()

# problem 54
# średnie wzmocnienie          
function rozwiazanie54(;
    b::Vector{Float64} = [0.35298906219757203, -1.5029543299486194, 4.244802701055701, -7.98568860641915, 11.724259787937788, -13.076031142144508, 11.72425978793779, -7.98568860641915, 4.2448027010557015, -1.5029543299486194, 0.3529890621975721],
    a::Vector{Float64} = [1.0, -3.4015571371053914, 7.473704173229628, -11.18917360406491, 13.159821737868203, -11.9215302033898, 8.729094707146523, -4.903823310324632, 2.156886570610334, -0.6372327599953104, 0.1245959135274243],
    F::Vector{Float64} = [0.01, 0.11, 0.16, 0.18, 0.27, 0.39],
)
    out = zeros(Float64, length(F))
    for i in 1:length(F)
        num = 0
        denom = 0
        for l in 1:length(b)
            num += b[l] * cispi(2 * F[i]) ^ -(l - 1)
        end
        for m in 1:length(a)
            denom = a[m] * cispi(2 * F[i]) ^ -(m - 1)
        end
        out[i] = abs(num / denom)
    end
    mean = sum(out) / length(out)
    return mean
end

# 37.001556618699155
rozwiazanie54()