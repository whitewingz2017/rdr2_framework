exports("Drop", function(target, reason)
	DropPlayer(target, reason)
end)

exports("Encode", function(table)
	if table then
		local string = json.encode(table)
		return string:sub(2, string:len() - 1)
	end
	return ""
end)

exports("Decode", function(string)
	if string then
		return json.decode("["..string.."]")
	end
	return {}
end)

-- RegisterServerEvent("main:drop")
-- AddEventHandler("main:drop", function(reason)
-- end)