--[[ Functions ]]--
function GetIdentifier(source, identifier)
	for k, v in ipairs(GetPlayerIdentifiers(source)) do
		if identifier == "steam" and string.sub(tostring(v), 1, 6) == "steam:" or
		identifier == "license" and string.sub(tostring(v), 1, 8) == "license:" or 
		identifier == "ip" and string.sub(tostring(v), 1, 3) == "ip:" then
			return v
		end
	end

	return nil
end
exports("GetIdentifier", GetIdentifier)

--[[ Resource Events ]]--
AddEventHandler("onResourceStart", function(resourceName)
	TriggerEvent(resourceName..":start")
end)

AddEventHandler("onResourceStop", function(resourceName)
	TriggerEvent(resourceName..":stop")
end)