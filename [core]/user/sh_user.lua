exports("IsGroup", function(user, group)
	return user["power_level"] or 0 >= exports.user:GetPower(group)
end)

exports("GetGroup", function(powerLevel)
	local group = "User"
	for k, v in pairs(Groups) do
		if tonumber(powerLevel) >= tonumber(v) and Groups[group] < v then
			group = k
		end
	end
	
	return group
end)

exports("GetPower", function(group)
	return Groups[group] or 0
end)