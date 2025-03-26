function asBoolean(a as dynamic) as boolean
    if isString(a)
        return LCase(a) = "true"
    else if isInteger(a) or isFloat(a)
        return a <> 0
    else if isBoolean(a)
        return a
    else
        return False
    end if
end function

function asString(a as dynamic) as string
    if isString(a)
        return a
    else if isInteger(a) or isFloat(a) or isDouble(a) or isBoolean(a) or isLongInteger(a)
        return a.ToStr()
    else
        return ""
    end if
end function

function asInteger(a as dynamic) as integer
    if isString(a)
        return a.ToInt()
    else if isInteger(a)
        return a
    else if isFloat(a) or isDouble(a) or isLongInteger(a)
        return Int(a)
    else
        return 0
    end if
end function

function asFloat(a as dynamic) as float
    if isString(a)
        return a.ToFloat()
    else if isInteger(a)
        return (a / 1)
    else if isFloat(a) or isDouble(a) or isLongInteger(a)
        return a
    else
        return 0.0
    end if
end function

function asDouble(a as dynamic) as double
    if isString(a)
        return asFloat(a)
    else if isInteger(a) or isLongInteger(a) or isFloat(a) or isDouble(a)
        return a
    else
        return 0.0
    end if
end function