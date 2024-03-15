local StringUtil = {}

function StringUtil.ToUpperCase(a)
    return string.upper(a)
end

function StringUtil.ToLowerCase(a)
    return string.lower(a)
end

function StringUtil.GetLenght(a)
    return string.len(a)
end

function StringUtil.Trim(a)
    return string.gsub(a, "%s+", "")
end

return StringUtil