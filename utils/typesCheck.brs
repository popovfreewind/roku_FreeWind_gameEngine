function isNumber(a as dynamic) as boolean
    return isInteger(a) or isFloat(a) or isDouble(a) or isLongInteger(a)
end function

function isArray(a as dynamic) as boolean
    return type(a) = "roArray" or type(a) = "roByteArray" or isList(a)
end function

function isList(a as dynamic) as boolean
    return type(a) = "roList" or type(a) = "roXMLList"
end function

function isAssociativeArray(a as dynamic) as boolean
    return isValid(a) and GetInterface(a, "ifAssociativeArray") <> invalid
end function

function isString(a as dynamic) as boolean
    return type(a) = "String" or type(a) = "roString"
end function

function isDateTime(a as dynamic) as boolean
    return type(a) = "roDateTime"
end function

function isFunction(a as dynamic) as boolean
    return type(a) = "Function" or type(a) = "roFunction"
end function

function isBoolean(a as dynamic) as boolean
    return type(a) = "Boolean" or type(a) = "roBoolean"
end function

function isInteger(a as dynamic) as boolean
    return type(a) = "Integer" or type(a) = "roInteger" or type(a) = "roInt"
end function

function isFloat(a as dynamic) as boolean
    return type(a) = "Float" or type(a) = "roFloat"
end function

function isDouble(a as dynamic) as boolean
    return type(a) = "Double" or type(a) = "roDouble"
end function

function isLongInteger(a as dynamic) as boolean
    return type(a) = "LongInteger" or type(a) = "roLongInteger"
end function

function isValid(a as dynamic) as boolean
    return Type(a) <> "<uninitialized>" and a <> invalid
end function