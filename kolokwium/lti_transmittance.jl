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
            num += b[l] * exp(2im * π * F[i]) ^ -(l - 1)
        end
        for m in 2:length(a)
            denom += a[m] * exp(2im * π * F[i]) ^ -(m - 1)
        end
        out[i] = angle(num / (1 + denom))
    end
    mean = sum(out) / length(out)
    return mean
end

# -1.784544820157234
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
        num = 1
        denom = 1
        for z in 1:length(zz)
            num *= (1 - zz[z] * exp(-2im * π * F[i]))
        end
        for p in 1:length(pp)
            denom *= (1 - pp[p] * exp(-2im * π * F[i]))
        end
        out[i] = angle((k * num) / denom)
    end
    mean = sum(out) / length(out)
    return mean
end

# 1.761200337022805
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
        for m in 2:length(a)
            denom += a[m] * cispi(2 * F[i]) ^ -(m - 1)
        end
        out[i] = abs(num / (1 + denom))
    end
    mean = sum(out) / length(out)
    return mean
end

# 0.6173626121172345
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
        for m in 2:length(a)
            denom += a[m] * cispi(2 * F[i]) ^ -(m - 1)
        end
        out[i] = abs(num / (1 + denom))
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
        for m in 2:length(a)
            denom = a[m] * cispi(2 * F[i]) ^ -(m - 1)
        end
        out[i] = abs(num / (1 + denom))
    end
    mean = sum(out) / length(out)
    return mean
end

# 4.188687069532564
rozwiazanie54()   



# średnie wzmocnienie
function rozwiazanie8(;
    b::Vector{Float64} = [0.6668547023844128, -1.720764471909391, 3.4806618241912046, -3.8658925116288825, 3.4806618241912037, -1.720764471909391, 0.6668547023844127],
    a::Vector{Float64} = [1.0, -2.2575274288819127, 3.948876910415752, -3.813445803637163, 2.951472093696976, -1.2364482229285918, 0.3946840490385092],
    F::Vector{Float64} = [0.14, 0.43, 0.48, 0.5],
)
    out = zeros(Float64, length(F))
    for i in 1:length(F)
        num = 0
        denom = 0
        for n in 1:length(b)
            num += b[n] * exp(2im * π * F[i]) ^ -(n - 1)
        end
        for m in 2:length(a)
            denom += a[m] * exp(2im * π * F[i]) ^ -(m - 1)
        end
        out[i] += abs(num / (1 + denom))
    end
    mean = sum(out) / length(out)
    return mean
end

# 0.9475142159299257
rozwiazanie8()

# problem 9
# średnie wzmocnienie          
function rozwiazanie9(;
    b::Vector{Float64} = [5.566396272183253e-7, 0.0, -3.339837763309952e-6, 0.0, 8.34959440827488e-6, 0.0, -1.1132792544366507e-5, 0.0, 8.34959440827488e-6, 0.0, -3.339837763309952e-6, 0.0, 5.566396272183253e-7],
    a::Vector{Float64} = [1.0, -6.312470431235184, 22.280704254930217, -53.26748029453974, 95.22115428099832, -131.95980405673234, 145.1934458068807, -127.20440344811901, 88.48086156410804, -47.71128142721598, 19.236501494991767, -5.2531773469685685, 0.802333642696997],
    F::Vector{Float64} = [0.0, 0.06, 0.24, 0.34, 0.35, 0.41],
)
    out = zeros(Float64, length(F))
    for i in 1:length(F)
        num = 0
        denom = 0
        for n in 1:length(b)
            num += b[n] * exp(2im * π * F[i]) ^ -(n - 1)
        end
        for m in 2:length(a)
            denom += a[m] * exp(2im * π * F[i]) ^ -(m - 1)
        end
        out[i] = abs(num / (1 + denom))
    end
    mean = sum(out) / length(out)
    return mean
end

# 1.0454564436439928e-5
rozwiazanie9()

# problem 19
# średnie przesunięcie fazowe          
function rozwiazanie19(;
    zz::Vector{ComplexF64} = ComplexF64[1.0 + 0.0im, 1.0 + 0.0im, 1.0 + 0.0im, 1.0 + 0.0im, 1.0 + 0.0im, 1.0 + 0.0im, -1.0 + 0.0im, -1.0 + 0.0im, -1.0 + 0.0im, -1.0 + 0.0im, -1.0 + 0.0im, -1.0 + 0.0im],
    pp::Vector{ComplexF64} = ComplexF64[0.543701277994591 - 0.8319925555042785im, 0.29457887606763117 + 0.9483370303390719im, 0.543701277994591 + 0.8319925555042785im, 0.29457887606763117 - 0.9483370303390719im, 0.508848478970115 - 0.8409843938995955im, 0.3274254690915373 + 0.9249844307416222im, 0.508848478970115 + 0.8409843938995955im, 0.3274254690915373 - 0.9249844307416222im, 0.45219457592657175 - 0.864724019694428im, 0.3858890222126597 + 0.8953357230268396im, 0.45219457592657175 + 0.864724019694428im, 0.3858890222126597 - 0.8953357230268396im],
    k::Float64 = 2.9839279959995376e-7,
    F::Vector{Float64} = [0.13, 0.22, 0.43, 0.48],
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

# -1.520911895001745
rozwiazanie19()

# problem 21
# średnie wzmocnienie          
function rozwiazanie21(;
    zz::Vector{ComplexF64} = ComplexF64[0.5653138377631579 + 0.8248759087483948im, 0.5653138377631579 - 0.8248759087483948im, 0.9090424796534677 + 0.41670345593176317im, 0.9090424796534677 - 0.41670345593176317im],
    pp::Vector{ComplexF64} = ComplexF64[-0.27610745027671657 + 0.6519220973669482im, -0.27610745027671657 - 0.6519220973669482im, -0.1706544392027319 + 0.2080237764058478im, -0.1706544392027319 - 0.2080237764058478im],
    k::Float64 = 0.05804559733761661,
    F::Vector{Float64} = [0.01, 0.44, 0.46],
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
        out[i] += abs((k * num) / denom)
    end
    mean = sum(out) / length(out)
    return mean
end

# 0.6676898085110857
rozwiazanie21()

# problem 44
# średnie przesunięcie fazowe          
function rozwiazanie44(;
    b::Vector{Float64} = [0.04314525874746985, -0.2588715524848191, 0.6471788812120477, -0.862905174949397, 0.6471788812120477, -0.2588715524848191, 0.04314525874746985],
    a::Vector{Float64} = [1.0, -0.38574424913684624, 1.3013655603245946, 0.13270353683808567, 0.5561248128464324, 0.17251600265356282, 0.160210615122618],
    F::Vector{Float64} = [0.15, 0.16, 0.24],
)
    out = zeros(Float64, length(F))
    for i in 1:length(F)
        num = 0
        denom = 0
        for n in 1:length(b)
            num += b[n] * exp(2im * π * F[i]) ^ -(n - 1)
        end
        for m in 2:length(a)
            denom += a[m] * exp(2im * π * F[i]) ^ -(m - 1)
        end
        out[i] += angle(num / (1 + denom))
    end
    mean = sum(out) / length(out)
    return mean
end

# 0.4520467406199364
rozwiazanie44()

# problem 50
# średnie wzmocnienie          
function rozwiazanie50(;
    b::Vector{Float64} = [0.009835403572646848, -1.875671518477884e-5, 0.010373051324321612, 0.010373051324321616, -1.8756715184778463e-5, 0.009835403572646846],
    a::Vector{Float64} = [1.0, -3.043987586489922, 3.967544846014289, -2.6908248277859954, 0.9430865718564958, -0.13543960723130033],
    F::Vector{Float64} = [0.01, 0.03, 0.11, 0.29],
)
    out = zeros(Float64, length(F))
    for i in 1:length(F)
        num = 0
        denom = 0
        for n in 1:length(b)
            num += b[n] * exp(2im * π * F[i]) ^ -(n - 1)
        end
        for m in 2:length(a)
            denom += a[m] * exp(2im * π * F[i]) ^ -(m - 1)
        end
        out[i] += abs(num / (1 + denom))
    end
    mean = sum(out) / length(out)
    return mean
end

# 0.5752523511562753
rozwiazanie50()

# problem 69
# średnie wzmocnienie          
function rozwiazanie69(;
    b::Vector{Float64} = [0.0036995705131426322, -0.006588701086142232, 0.005123154642098176, -2.0536741824576278e-19, -0.005123154642098175, 0.006588701086142232, -0.003699570513142633],
    a::Vector{Float64} = [1.0, -2.978210743260216, 5.773741495194624, -6.608511452910479, 5.494231273099657, -2.69585928272244, 0.8614467267882088],
    F::Vector{Float64} = [0.22, 0.23, 0.24, 0.31, 0.32, 0.36],
)
    out = zeros(Float64, length(F))
    for i in 1:length(F)
        num = 0
        denom = 0
        for m in 1:length(b)
            num += b[m] * exp(2im * π * F[i]) ^ -(m - 1)
        end
        for n in 2:length(a)
            denom += a[n] * exp(2im * π * F[i]) ^ -(n - 1)
        end
        out[i] += abs(num/ (1 + denom))
    end
    mean = sum(out) / length(out)
    return mean
end

# 0.0024863282001466856
rozwiazanie69()

# problem 72
# średnie wzmocenienie          
function rozwiazanie72(;
    b::Vector{Float64} = [0.09690588994826067, -0.4004081385768237, 0.8184157087376562, -1.0223679701595116, 0.8184157087376562, -0.40040813857682367, 0.09690588994826065],
    a::Vector{Float64} = [1.0, -0.6592300629638518, 1.1219500725455562, -0.5095075748876536, 0.28631368108070654, -0.06709412594593915, 0.009731927261286931],
    F::Vector{Float64} = [0.01, 0.08, 0.2, 0.31],
)
    out = zeros(Float64, length(F))
    for i in 1:length(F)
        num = 0
        denom = 0
        for n in 1:length(b)
            num += b[n] * exp(2im * π * F[i]) ^ -(n - 1)
        end
        for m in 2:length(a)
            denom += a[m] * exp(2im * π * F[i]) ^ -(m - 1)
        end
        out[i] += abs(num / (1 + denom))
    end
    mean = sum(out) / length(out)
    return mean
end

# 0.2717036005165451
rozwiazanie72()

# problem 73
# średnie wzmocnienie          
function rozwiazanie73(;
    zz::Vector{ComplexF64} = ComplexF64[-1.0 + 0.0im, -1.0 + 0.0im, -1.0 + 0.0im],
    pp::Vector{ComplexF64} = ComplexF64[0.4978837005263824 + 0.6901410648428219im, 0.4978837005263824 - 0.6901410648428219im, 0.662772422800638 + 0.0im],
    k::Float64 = 0.03070522291579536,
    F::Vector{Float64} = [0.08, 0.4, 0.43, 0.44],
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
        out[i] += abs((k * num) / denom)
    end
    mean = sum(out) / length(out)
    return mean
end

# 0.1997750764874741
rozwiazanie73()

# problem 74
# średnie przesunięcie fazowe          
function rozwiazanie74(;
    b::Vector{Float64} = [6.238698354847942e-5, 0.0, -0.00024954793419391767, 0.0, 0.0003743219012908765, 0.0, -0.00024954793419391767, 0.0, 6.238698354847942e-5],
    a::Vector{Float64} = [1.0, -3.6330270926156896, 8.463618351718203, -12.591890016179114, 14.06407276350723, -11.131225695520087, 6.6138091257372205, -2.5089273284907283, 0.6105348075612239],
    F::Vector{Float64} = [0.02, 0.05, 0.12, 0.26, 0.39],
)
    out = zeros(Float64, length(F))
    for i in 1:length(F)
        num = 0
        denom = 0
        for n in 1:length(b)
            num += b[n] * exp(2im * π * F[i]) ^ -(n - 1)
        end
        for m in 2:length(a)
            denom += a[m] * exp(2im * π * F[i]) ^ -(m - 1)
        end
        out[i] += angle(num / (1 + denom))
    end
    mean = sum(out) / length(out)
    return mean
end

# -0.06859026075133033
rozwiazanie74()

# problem 80
# średnie przesunięcie fazowe          
function rozwiazanie80(;
    zz::Vector{ComplexF64} = ComplexF64[1.0 + 0.0im, 1.0 + 0.0im, 1.0 + 0.0im, 1.0 + 0.0im, 1.0 + 0.0im, 1.0 + 0.0im],
    pp::Vector{ComplexF64} = ComplexF64[0.44827249582137546 - 0.8556007217889913im, 0.44827249582137546 + 0.8556007217889913im, 0.17291160541979061 - 0.8495953651002048im, 0.17291160541979061 + 0.8495953651002048im, -0.4296758972867222 - 0.5095435898474966im, -0.4296758972867222 + 0.5095435898474966im],
    k::Float64 = 0.03839993839240795,
    F::Vector{Float64} = [0.0, 0.09, 0.14, 0.18, 0.48],
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

# 1.0662389322114278
rozwiazanie80()

# problem 82
# średnie wzmocnienie          
function rozwiazanie82(;
    b::Vector{Float64} = [0.0002920559985013768, 0.0, -0.001460279992506884, 0.0, 0.002920559985013768, 0.0, -0.002920559985013768, 0.0, 0.001460279992506884, 0.0, -0.0002920559985013768],
    a::Vector{Float64} = [1.0, -4.27873053791316, 11.381121502447208, -20.47448992085821, 28.259053063626872, -29.903354686564448, 25.143512583322384, -16.197863802503313, 8.002781734385405, -2.6684604055166647, 0.5558040758834096],
    F::Vector{Float64} = [0.12, 0.32, 0.44],
)
    out = zeros(Float64, length(F))
    for i in 1:length(F)
        num = 0
        denom = 0
        for n in 1:length(b)
            num += b[n] * exp(2im * π * F[i]) ^ -(n - 1)
        end
        for m in 2:length(a)
            denom += a[m] * exp(2im * π * F[i]) ^ -(m - 1)
        end
        out[i] += abs(num / (1 + denom))
    end
    mean = sum(out) / length(out)
    return mean
end

# 0.09879945622914792
rozwiazanie82()