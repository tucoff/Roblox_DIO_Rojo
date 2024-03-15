local MathUtil = {}

function MathUtil.Sum (...): number
    local total = 0
    for _, x in {...} do
        total += x
    end
    return total
end

function MathUtil.Multiply (...): number
    local total = 1
    for _, x in {...} do
        total *= x
    end
    return total
end

function MathUtil.Minus (...): number
    local total = 0
    for _, x in {...} do
        total -= x
    end
    return total
end

function MathUtil.Divide (a,b): number
    return a/b
end

function MathUtil.Square (a,b): number
    return (a ^ (1 / b))
end

function MathUtil.Mod (a,b): number
    return a%b
end

return MathUtil