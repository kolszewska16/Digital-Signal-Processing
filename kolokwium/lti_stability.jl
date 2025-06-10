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
    end
    for pole in p
        if(abs(pole) <= 1)
            return 1.0
        end
    end
end

# problem 19          
function rozwiazanie19(;
    z::Vector{ComplexF64} = ComplexF64[-1.0 + 0.0im, -1.0 + 0.0im, -1.0 + 0.0im, -1.0 + 0.0im, -1.0 + 0.0im, -1.0 + 0.0im],
    p::Vector{ComplexF64} = ComplexF64[0.7429205203933382 + 0.6097063740523192im, 0.7429205203933382 - 0.6097063740523192im, 0.7765792268889944 + 0.4383315460045222im, 0.7765792268889944 - 0.4383315460045222im, 1.963095084652674 + 0.38243651579381127im, 0.8314626107691075 - 0.1619797565392117im],
    k::Float64 = 8.064245488475155e-5,
)
    for pole in p
        if(abs(pole) > 1)
            return -1.0
        end
    end
    for pole in p
        if(abs(pole) <= 1)
            return 1.0
        end
    end
end

# -1.0
rozwiazanie19()

# problem 20          
function rozwiazanie20(;
    z::Vector{ComplexF64} = ComplexF64[0.7536982546482641 + 0.6572206181642208im, 0.7536982546482641 - 0.6572206181642208im, 1.0 + 0.0im],
    p::Vector{ComplexF64} = ComplexF64[-0.849268917184576 + 1.8107297717506434im, -0.26227461361720433 - 0.5591967887220513im, -0.18151342191567185 + 0.0im],
    k::Float64 = 0.0999877997747182,
)
    for pole in p
        if(abs(pole) > 1)
            return -1.0
        end
    end
    for pole in p
        if(abs(pole) <= 1)
            return 1.0
        end
    end
end

# -1.0
rozwiazanie20()

# problem 21          
function rozwiazanie21(;
    z::Vector{ComplexF64} = ComplexF64[1.0 + 0.0im, 1.0 + 0.0im, 1.0 + 0.0im, 1.0 + 0.0im, 1.0 + 0.0im],
    p::Vector{ComplexF64} = ComplexF64[0.4020915353457984 - 0.6466229977354765im, 0.4020915353457984 + 0.6466229977354765im, 0.3000795455376084 - 0.2982462344784136im, 0.3000795455376084 + 0.2982462344784136im, 0.27356904308223723 - 0.0im],
    k::Float64 = 0.1688067906886211,
)
    for pole in p
        if(abs(pole) > 1)
            return -1.0
        end
    end
    for pole in p
        if(abs(pole) <= 1)
            return 1.0
        end
    end
end

# 1.0
rozwiazanie21()

# problem 30          
function rozwiazanie30(;
    z::Vector{ComplexF64} = ComplexF64[1.0 + 0.0im, 1.0 + 0.0im, 1.0 + 0.0im, 1.0 + 0.0im, 1.0 + 0.0im, 1.0 + 0.0im],
    p::Vector{ComplexF64} = ComplexF64[0.3067437458214787 - 0.9134438158014485im, 0.3067437458214787 + 0.9134438158014485im, 0.13865891623216117 - 4.9980770007023025im, 0.02397538661163368 + 0.8642129310019667im, -0.5172242517216077 - 0.46948975979365626im, -0.5172242517216077 + 0.46948975979365626im],
    k::Float64 = 0.022893799811979896,
)
    for pole in p
        if(abs(pole) > 1)
            return -1.0
        end
    end
    for pole in p
        if(abs(pole) <= 1)
            return 1.0
        end
    end
end

# -1.0
rozwiazanie30()

# problem 37          
function rozwiazanie37(;
    z::Vector{ComplexF64} = ComplexF64[0.8044032046527437 + 0.59408373512864im, 0.8044032046527437 - 0.59408373512864im, 0.8044032046527437 + 0.59408373512864im, 0.8044032046527437 - 0.59408373512864im, 0.8044032046527437 + 0.59408373512864im, 0.8044032046527437 - 0.59408373512864im, 0.8044032046527437 + 0.59408373512864im, 0.8044032046527437 - 0.59408373512864im],
    p::Vector{ComplexF64} = ComplexF64[0.6391447688754189 - 0.7354123807356372im, 0.8793872599001731 + 0.4429065304332173im, 0.6391447688754189 + 0.7354123807356372im, 0.8793872599001731 - 0.4429065304332173im, 0.3855174610561706 - 0.6495410308825647im, 0.8390002549433014 + 0.3060920132414612im, 0.3855174610561706 + 0.6495410308825647im, 0.8390002549433014 - 0.3060920132414612im],
    k::Float64 = 0.4586408765804243,
)
    for pole in p
        if(abs(pole) > 1)
            return -1.0
        end
    end
    for pole in p
        if(abs(pole) <= 1)
            return 1.0
        end
    end
end

# 1.0
rozwiazanie37()

# problem 55          
function rozwiazanie55(;
    z::Vector{ComplexF64} = ComplexF64[0.6820815970748586 + 0.7312760729928267im, 0.6820815970748586 - 0.7312760729928267im, 0.9371815015523546 + 0.34884213212866627im, 0.9371815015523546 - 0.34884213212866627im],
    p::Vector{ComplexF64} = ComplexF64[-0.004443246769102389 + 0.6977543542665294im, -0.004443246769102389 - 0.6977543542665294im, 0.04092877936868938 + 0.2214748649623988im, 0.72689599059405 - 3.933398304120534im],
    k::Float64 = 0.12842979268538263,
)
    for pole in p
        if(abs(pole) > 1)
            return -1.0
        end
    end
    for pole in p
        if(abs(pole) <= 1)
            return 1.0
        end
    end
end

# -1.0
rozwiazanie55()



# 1.0
rozwiazanie14()

# problem 28
function rozwiazanie28(;
    z::Vector{ComplexF64} = ComplexF64[-1.0 + 0.0im, -1.0 + 0.0im, -1.0 + 0.0im, -1.0 + 0.0im, -1.0 + 0.0im],
    p::Vector{ComplexF64} = ComplexF64[0.26243533330430674 + 0.693265210762646im, 0.26243533330430674 - 0.693265210762646im, 1.5669479036478788 + 2.5582560988402854im, 0.19233484328103675 - 0.3140128556269943im, 0.17452793889436508 + 0.0im],
    k::Float64 = 0.019847795197400566,
)
    for pole in p
        if(abs(pole) > 1)
            return -1.0
        end
    end
    for pole in p
        if(abs(pole) <= 1)
            return 1.0
        end
    end
end

# -1.0
rozwiazanie28()

# problem 29          
function rozwiazanie29(;
    z::Vector{ComplexF64} = ComplexF64[0.9721760424122519 + 0.23425145156359484im, 0.9721760424122519 - 0.23425145156359484im, 1.0 + 0.0im],
    p::Vector{ComplexF64} = ComplexF64[0.5965368607763569 + 0.6348609655672041im, 0.5965368607763569 - 0.6348609655672041im, -0.041727054633867645 + 0.0im],
    k::Float64 = 0.3585888086159829,
)
    for pole in p
        if(abs(pole) > 1)
            return -1.0
        end
    end
    for pole in p
        if(abs(pole) <= 1)
            return 1.0
        end
    end
end

# 1.0
rozwiazanie29()

# problem 43          
function rozwiazanie43(;
    z::Vector{ComplexF64} = ComplexF64[-1.0 + 0.0im, -1.0 + 0.0im, -1.0 + 0.0im],
    p::Vector{ComplexF64} = ComplexF64[0.43933548561598673 + 0.4905063056423592im, 3.335919704955171 - 3.724465024952148im, 0.3423765257286831 + 0.0im],
    k::Float64 = 0.045617789533833566,
)
    for pole in p
        if(abs(pole) > 1)
            return -1.0
        end
    end
    for pole in p
        if(abs(pole) <= 1)
            return 1.0
        end
    end
end

# -1.0
rozwiazanie43()

# problem 46          
function rozwiazanie46(;
    z::Vector{ComplexF64} = ComplexF64[1.0 + 0.0im, 1.0 + 0.0im, 1.0 + 0.0im, 1.0 + 0.0im, -1.0 + 0.0im, -1.0 + 0.0im, -1.0 + 0.0im, -1.0 + 0.0im],
    p::Vector{ComplexF64} = ComplexF64[4.9999787849080635 - 0.01456538599878037im, 0.7512947997608432 + 0.3674310723252597im, 0.9988050552502091 + 0.0029096085789731907im, 0.7512947997608432 - 0.3674310723252597im, 0.9970749584795174 - 0.0012252438866903255im, 0.6208158918571303 + 0.12562989857539014im, 0.9970749584795174 + 0.0012252438866903255im, 0.6208158918571303 - 0.12562989857539014im],
    k::Float64 = 0.0019551556590637824,
)
    for pole in p
        if(abs(pole) > 1)
            return -1.0
        end
    end
    for pole in p
        if(abs(pole) <= 1)
            return 1.0
        end
    end
end

# -1.0
rozwiazanie46()

# problem 47          
function rozwiazanie47(;
    z::Vector{ComplexF64} = ComplexF64[0.9770662345700633 + 0.2129356082553556im, 0.9770662345700633 - 0.2129356082553556im, 0.9953653495144525 + 0.09616559148662007im, 0.9953653495144525 - 0.09616559148662007im],
    p::Vector{ComplexF64} = ComplexF64[0.8992055821204713 + 0.37055050212774043im, 0.8992055821204713 - 0.37055050212774043im, 2.3126784767056856 + 1.9108946238299669im, 0.5631173337373035 - 0.4652864185240649im],
    k::Float64 = 0.4468062264882645,
)
    for pole in p
        if(abs(pole) > 1)
            return -1.0
        end
    end
    for pole in p
        if(abs(pole) <= 1)
            return 1.0
        end
    end
end

# -1.0
rozwiazanie47()

# problem 48          
function rozwiazanie48(;
    z::Vector{ComplexF64} = ComplexF64[0.9520284098320231 + 0.3060096516005816im, 0.9520284098320231 - 0.3060096516005816im, 1.0 + 0.0im],
    p::Vector{ComplexF64} = ComplexF64[0.5024662850787857 + 0.6973016918012107im, 2.9230906804775745 - 4.056542970770203im, -0.12090431928185404 + 0.0im],
    k::Float64 = 0.308898848873926,
)
    for pole in p
        if(abs(pole) > 1)
            return -1.0
        end
    end
    for pole in p
        if(abs(pole) <= 1)
            return 1.0
        end
    end
end

# -1.0
rozwiazanie48()

# problem 58          
function rozwiazanie58(;
    z::Vector{ComplexF64} = ComplexF64[-1.0 + 0.0im, -1.0 + 0.0im, -1.0 + 0.0im, -1.0 + 0.0im, -1.0 + 0.0im, -1.0 + 0.0im],
    p::Vector{ComplexF64} = ComplexF64[4.661130082386245 + 1.8093828658064588im, 0.9162239951193701 - 0.3556648213432879im, 0.9178658426254936 + 0.2566400603460595im, 0.9178658426254936 - 0.2566400603460595im, 0.9307294155233051 + 0.09374688066621499im, 0.9307294155233051 - 0.09374688066621499im],
    k::Float64 = 1.6348215201772598e-6,
)
    for pole in p
        if(abs(pole) > 1)
            return -1.0
        end
    end
    for pole in p
        if(abs(pole) <= 1)
            return 1.0
        end
    end
end

rozwiazanie58()

# problem 75          
function rozwiazanie75(;
    z::Vector{ComplexF64} = ComplexF64[1.0 + 0.0im, 1.0 + 0.0im, 1.0 + 0.0im, -1.0 + 0.0im, -1.0 + 0.0im, -1.0 + 0.0im],
    p::Vector{ComplexF64} = ComplexF64[0.3797788385813316 - 0.8467121324981864im, 0.13538094673207834 + 0.9121887587192452im, 0.3797788385813316 + 0.8467121324981864im, 0.13538094673207834 - 0.9121887587192452im, 0.24384716803568696 - 0.8167503208731152im, 0.24384716803568696 + 0.8167503208731152im],
    k::Float64 = 0.0028981946337214245,
)
    for pole in p
        if(abs(pole) > 1)
            return -1.0
        end
    end
    for pole in p
        if(abs(pole) <= 1)
            return 1.0
        end
    end
end

# 1.0
rozwiazanie75()

# problem 85
function rozwiazanie85(;
    z::Vector{ComplexF64} = ComplexF64[0.30991120298280067 - 0.9507655054038052im, 0.08021044372924231 + 0.9967779515603052im, 0.30991120298280067 + 0.9507655054038052im, 0.08021044372924231 - 0.9967779515603052im, 0.275214132764519 - 0.9613829523798899im, 0.11778447385247545 + 0.9930391823685989im, 0.275214132764519 + 0.9613829523798899im, 0.11778447385247545 - 0.9930391823685989im, 0.19777426571323 + 0.9802475910817596im, 0.19777426571323 - 0.9802475910817596im],
    p::Vector{ComplexF64} = ComplexF64[0.03110136373427766 + 0.9894250301255929im, 1.7674279976474567 - 4.677199832499345im, 0.03110136373427766 - 0.9894250301255929im, 0.3501476893358895 + 0.9266067506522119im, -0.01624671056027947 + 0.9332849891220417im, 0.3719094739732236 - 0.861868689804545im, -0.01624671056027947 - 0.9332849891220417im, 0.3719094739732236 + 0.861868689804545im, 0.13450673065688945 - 0.5849038517485297im, 0.13450673065688945 + 0.5849038517485297im],
    k::Float64 = 0.5570296077642386,
)
    for pole in p
        if(abs(pole) > 1)
            return -1.0
        end
    end
    for pole in p
        if(abs(pole) <= 1)
            return 1.0
        end
    end
end

# -1.0
rozwiazanie85()