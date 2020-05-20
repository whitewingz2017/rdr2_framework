exports("GetName", function(source)
	local character = exports.character:GetCharacter(source)
	return character["first_name"].." "..character["last_name"]
end)

exports("CheckName", function(name)
	if not name or type(name) ~= "string" or name == "" then
		return false
	end

	for c in name:gmatch(".") do
		if not ("QWERTYUIOPASDFGHJKLZXCVBNM"):find(c:upper()) then
			return false
		end
	end

	return true
end)

exports("FixName", function(name)
	if not name or type(name) ~= "string" or name == "" then
		return name
	end

	local output = ""
	for i = 1, #name do
		local c = name:sub(i, i)
		local allowUpper = i == 3 and name:sub(1, 2):lower() == "mc"

		if i == 1 then
			output = output..c:upper()
		elseif not allowUpper then
			output = output..c:lower()
		else
			output = output..c
		end
	end
	
	return output
end)