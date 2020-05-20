exports("GetDirection", function(heading)
	local rad = (heading % 360.0) / 180.0 * math.pi
	return vector3(math.cos(rad), math.sin(rad), 0)
end)

exports("Normalize", function(vector)
	if type(vector) == "vector3" then
		-- local norm = math.sqrt(vector.x^2, vector.y^2, vector.z^2)
		local norm = Vmag(vector)
		return vector3(vector.x / norm, vector.y / norm, vector.z / norm)
	end
end)

exports("Lerp", function(a, b, t)
	return a + math.min(math.max(t, 0), 1) * (b - a)
end)

exports("NumberTable", function(from, to, increment)
	local value = {}
	if increment == nil then increment = 1 end
	for i = from, to, increment do
		table.insert(value, tostring(i))
	end
	return value
end)

exports("FormatNumber", function(number)
	return tostring(number):reverse():gsub("%d%d%d", "%1,"):reverse():gsub("^,", "")
end)