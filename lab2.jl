# problem 2.1
function factorial_rec(n)
    if(n <= 1)
        return 1
    else
        return n * factorial_rec(n - 1)
    end
end

factorial_rec(5)

# problem 2.2
function factorial_ite(n)
    if(n <= 1)
        return 1
    else
        result = 1
        for i = 1:n
            result = result * i
        end
        return result
    end
end

factorial_ite(5)

# problem 2.3
function parity(N)
    if(N % 2 == 0)
        return true
    else
        return false
    end
end

parity(16)
parity(1)

# problem 2.4
function prime_number(N)
    if(N == 2)
        return true
    else
        num = []
        for i = 1:1:sqrt(N)
            if(N % i == 0)
                append!(num, i)
            end
        end

        append!(num, N)
        
        if(num[1] == 1 && num[2] == N)
            return true
        else
            return false
        end
    end
end

prime_number(16)
prime_number(59)

# problem 2.5
function rev_string(s)
    str = []
    for i = length(s):-1:1
        append!(str, s[i])
    end

    for char in str
        println(char)
    end
end

rev_string("rocket")

# problem 2.6
function palindrom(a)
    str = []
    for i = length(a):-1:1
        append!(str, a[i])
    end

    result = false
    for i = 1: length(a)
        if(a[i] == str[i])
            result = true
        else
            result = false
        end
    end
    return result
end

palindrom("radar")
palindrom("space")

# problem 2.7
function sierpinski_area(N)
    area = 3^N * 0.5^2N
    return area
end

sierpinski_area(4)

# problem 2.8
function newton(a)
    eps = 0.0000000001
    iter = 1000

    if(a < 0)
        println("error")
    elseif(a == 0)
        return 0
    else
        xk = 1
        for i = 1:iter
            xk1 = 0.5 * (xk + a / xk)

            if(abs(xk1 - xk) <= eps)
                return xk1
            end

            xk = xk1
        end
    end
end

newton(3)
newton(16)

# problem 2.10
function sum_of_fifth_power()
    limit = 6 * 9^5
    total = 0
    num = []
    for i = 10:limit
        digits = [parse(Int, d) for d in string(i)]

        power_sum = 0
        for d in digits
            power_sum += d^5
        end

        if(power_sum == i)
            total += i
            append!(num, i)
        end
    end
    return total
end

sum_of_fifth_power()