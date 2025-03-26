function CreateObject_GameTimeSpan() as object
	timer = {
		internal_roku_timer: CreateObject("roTimespan")
		total_milliseconds_modifier: 0
	}
	timer.Mark = function()
		m.internal_roku_timer.Mark()
		m.total_milliseconds_modifier = 0
	end function

	timer.TotalMilliseconds = function()
		return m.internal_roku_timer.TotalMilliseconds() + m.total_milliseconds_modifier
	end function

	timer.TotalSeconds = function()
		return m.internal_roku_timer.TotalSeconds() + cint(m.total_milliseconds_modifier / 1000)
	end function

	timer.GetSecondsToISO8601Date = function(date as string)
		return m.internal_roku_timer.GetSecondsToISO8601Date(date)
	end function

	timer.AddTime = function(milliseconds as integer)
		m.total_milliseconds_modifier += milliseconds
	end function

	timer.RemoveTime = function(milliseconds as integer)
		m.total_milliseconds_modifier -= milliseconds
	end function

	return timer
end function

function textureParker_getRegionsConfigFromAtlasAA(atlas as object) as object
	if not isAssociativeArray(atlas.frames)
		print_error("texturePacker - invalid atlas")
		return invalid
	end if

	res = {}
	for each key in atlas.frames
		item = atlas.frames[key]
		regionName = key.split(".")[0]
		res[regionName] = item
	end for

	return res
end function

function textureParker_getRegionsConfigFromAtlasArray(atlas as object) as object
	if not isArray(atlas.frames)
		print_error("texturePacker - invalid atlas")
		return invalid
	end if

	res = {}
	for i = 0 to atlas.frames.count() - 1
		item = atlas.frames[i]
		item.index = i
		key = item.filename
		regionName = key.split(".")[0]
		res[regionName] = item
	end for

	return res
end function

function ifElse(condition as boolean, ifTrueResult as dynamic, ifFalseResult as dynamic) as dynamic
	if condition
		return ifTrueResult
	else
		return ifFalseResult
	end if
end function

function GetRandomHexString(length as integer) as string
	hexChars = "0123456789ABCDEF"
	hexString = ""
	for i = 1 to length
		hexString += hexChars.Mid(Rnd(16) - 1, 1)
	end for
	return hexString
end function

function wrapTextByMaxWidth(font as object, text as string, maxWidth = 100, newLineChr = "\n") as string
	words = text.split(" ")
	result = ""
	line = ""

	for i = 0 to words.count() - 1
		word = words[i]
		testLine = line + word + " "
		lineWidth = font.GetOneLineWidth(testLine, 10000)

		if lineWidth < maxWidth
			line = testLine
		else
			result += line.trim() + newLineChr
			line = word + " "
		end if
	end for

	if line.len() > 0 then result += line.trim()

	return result
end function

function addOpacityToHEXColor(hexColor, opacity)
	return (hexColor << 8) + int(opacity * 255)
end function
