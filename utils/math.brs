function Math_Clamp(number, min, max)
	if number < min
		return min
	else if number > max
		return max
	else
		return number
	end if
end function

function Math_min(a as float, b as float) as float
	if a < b then return a
	return b
end function

function Math_max(a as float, b as float) as float
	if a > b then return a
	return b
end function

function Math_PI()
	return 3.1415926535897932384626433832795
end function

function Math_Atan2(y as float, x as float)
	if x > 0
		angle = Atn(y / x)
	else if y >= 0 and x < 0
		angle = Atn(y / x) + Math_PI()
	else if y < 0 and x < 0
		angle = Atn(y / x) - Math_PI()
	else if y > 0 and x = 0
		angle = Math_PI() / 2
	else if y < 0 and x = 0
		angle = (Math_PI() / 2) * -1
	else
		angle = 0
	end if

	return angle
end function

function Math_Asin(x as float) as float
	if x < -1.0 or x > 1.0 then return 0.0
	return 2.0 * atn(x / (1.0 + Sqr(1.0 - x * x)))
end function

function Math_IsIntegerEven(number as integer) as boolean
	return (number mod 2 = 0)
end function

function Math_IsIntegerOdd(number as integer) as boolean
	return (number mod 2 <> 0)
end function

function Math_DegreesToRadians(degrees as float) as float
	return (degrees / 180) * Math_PI()
end function

function Math_RadiansToDegrees(radians as float) as float
	return (180 / Math_PI()) * radians
end function

function Math_RandomRange(lowest_int as integer, highest_int as integer) as integer
	return rnd(highest_int - (lowest_int - 1)) + (lowest_int - 1)
end function

' https://stackoverflow.com/questions/2259476/rotating-a-point-about-another-point-2d
function Math_RotateVectorAroundVector(vector1 as object, vector2 as object, radians as float) as object
	v = Math_NewVector(vector1.x, vector1.y)
	s = sin(radians)
	c = cos(radians)

	v.x -= vector2.x
	v.y -= vector2.y

	new_x = v.x * c - v.y * s
	new_y = v.x * s + v.y * c

	v.x = new_x + vector2.x
	v.y = new_y + vector2.y

	return v
end function

function Math_NewVector(x = 0, y = 0)
	return {
		x: x, y: y

		set: function(other)
			m.x = other.getX()
			m.y = other.getY()
			return m
		end function

		setX: sub(x) : m.x = x : end sub

		setY: sub(y) : m.y = y : end sub

		moveX: sub(x) : m.x += x : end sub

		moveY: sub(y) : m.y += y : end sub

		getX: function()
			return m.x
		end function

		getY: function()
			return m.y
		end function

		length: function()
			return Sqr(m.x ^ 2 + m.y ^ 2)
		end function

		normalize: function()
			length = m.length()
			if length > 0
				return Math_NewVector(m.x / length, m.y / length)
			else
				return Math_NewVector()
			end if
		end function

		normalizeThis: function()
			length = m.length()
			if length > 0
				m.x = m.x / length : m.y = m.y / length
				return m
			else
				m.x = 0 : m.y = 0
				return m
			end if
		end function

		dot: function(other)
			return m.x * other.x + m.y * other.y
		end function

		multiplyScalar: function(scalar)
			return Math_NewVector(m.x * scalar, m.y * scalar)
		end function

		multiplyScalarBy: function(scalar)
			m.x = m.x * scalar : m.y = m.y * scalar
			return m
		end function

		add: function(other)
			return Math_NewVector(m.x + other.x, m.y + other.y)
		end function

		addBy: function(other)
			m.x = m.x + other.x : m.y = m.y + other.y
			return m
		end function

		subtract: function(other)
			return Math_NewVector(m.x - other.x, m.y - other.y)
		end function

		subtractBy: function(other)
			m.x = m.x - other.x : m.y = m.y - other.y
			return m
		end function

		rotate: function(angle)
			cosTheta = Cos(angle)
			sinTheta = Sin(angle)
			return Math_NewVector(m.x * cosTheta - m.y * sinTheta, m.x * sinTheta + m.y * cosTheta)
		end function

		rotateBy: function(angle)
			cosTheta = Cos(angle)
			sinTheta = Sin(angle)
			newX = m.x * cosTheta - m.y * sinTheta
			newY = m.x * sinTheta + m.y * cosTheta
			m.x = newX
			m.y = newY
			return m
		end function

		clone: function()
			return Math_NewVector(m.x, m.y)
		end function
	}
end function

function Math_NewRectangle(x as integer, y as integer, width as integer, height as integer) as object
	rect = {
		x: x
		y: y
		width: width
		height: height
	}

	rect.Right = function() as integer
		return m.x + m.width
	end function

	rect.Left = function() as integer
		return m.x
	end function

	rect.Top = function() as integer
		return m.y
	end function

	rect.Bottom = function() as integer
		return m.y + m.height
	end function

	rect.Center = function() as object
		return { x: m.x + m.width / 2, y: m.y + m.height / 2 }
	end function

	rect.Copy = function() as object
		return Math_NewRectangle(m.x, m.y, m.width, m.height)
	end function

	return rect
end function

function Math_NewCircle(x as integer, y as integer, radius as float) as object
	return { x: x, y: y, radius: radius }
end function

function Math_TotalDistance(vector1 as object, vector2 as object) as object
	x_distance = vector1.x - vector2.x
	y_distance = vector1.y - vector2.y
	total_distance = Sqr(x_distance * x_distance + y_distance * y_distance)
	return total_distance
end function

function Math_GetAngle(vector1 as object, vector2 as object) as float
	x_distance = vector1.x - vector2.x
	y_distance = vector1.y - vector2.y
	return Math_Atan2(y_distance, x_distance) + Math_PI()
end function

function Math_ceil(x as float) as integer
	' Get the integer part by truncating toward zero
	intPart = Fix(x)
	fraction = x - intPart

	' If there is no fractional part, x is already an integer
	if fraction = 0 then return x

	' For positive numbers, add 1 to the truncated value.
	' For negatives, truncation already gives the ceiling.
	if x > 0 then
		return intPart + 1
	else
		return intPart
	end if
end function

function Math_floor(number as float) as integer
	return int(number)
end function

function Math_round(number as float) as integer
	return int(number + 0.5)
end function
