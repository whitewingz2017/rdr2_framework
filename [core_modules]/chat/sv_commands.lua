exports("RegisterCommand", function(name, callback, suggestion, arguments, powerLevel)
	if not Commands then
		Commands = exports.cache:Get("Commands") or {}
		Suggestions = exports.cache:Get("Suggestions") or {}
	end

	local command = {
		cmd = callback,
		arguments = arguments or -1,
		powerLevel = powerLevel or 0
	}
	
	Commands[name] = command

	if suggestion ~= nil then
		if not suggestion.params or not type(suggestion.params) == "table" then suggestion.params = {} end
		if not suggestion.help or not type(suggestion.help) == "string" then suggestion.help = "" end

		Suggestions[name] = suggestion
	end

	RegisterCommand(name, function(source, args, rawCommand)
		local isConsole = source == 0

		if not isConsole then
			local user = exports.user:GetUser(source)
			if not user then return end
			
			if user.power_level < command.powerLevel then
				TriggerEvent("chat:addMessage", source, "Insufficient power level!")
				return
			end
		end
		
		if command.arguments ~= -1 and #args ~= command.arguments then
			if isConsole then
				if suggestion then
					local argumentsText = ""
					for k, v in ipairs(suggestion.params) do
						if argumentsText ~= "" then
							argumentsText = argumentsText..", "
						end
						argumentsText = argumentsText..v.name:lower()
					end
					Citizen.Trace(name.." ("..argumentsText..")")
				else
					Citizen.Trace(name.." ("..tostring(command.arguments)..")")
				end
			else
				TriggerEvent("chat:addMessage", source, "Invalid number of arguments!")
				return
			end
		else
			callback(source, args, rawCommand)
		end
	end, false)
end)

-- exports.chat:RegisterCommand("test", function(source, args, command)
-- 	TriggerEvent("chat:addMessage", source, "This is a test with default system.")
-- 	TriggerEvent("chat:addMessage", source, "This is a test of the adverts.", "advert")
-- 	TriggerEvent("chat:addMessage", source, "This is a test of server messages.", "server")
-- 	TriggerEvent("chat:addMessage", source, "This is a test of emergency notifications.", "emergency")
-- 	TriggerEvent("chat:addMessage", source, "This is a test of \"non emergency\" notifications, whatever that means.", "nonemergency")
-- 	TriggerEvent("chat:addMessage", source, "This is a test of support releated messages.", "help")
-- end, {
-- 	help = "This is a test",
-- 	params = {
-- 		{ name = "Param 1", help = "Type something or else" }
-- 	}
-- }, 1)

-- exports.chat:RegisterCommand("test2", function(source, args, command)
-- 	TriggerEvent("chat:addMessage", source, "You did it. :)")
-- end, {}, -1, 999999)

-- exports.chat:RegisterCommand("test3", function(source, args, command)
-- 	TriggerEvent("chat:addMessage", source, "You did it. :)")
-- end, {}, -1, 45)

exports.chat:RegisterCommand("ooc", function(source, args, rawCommand)
	local message = rawCommand:sub(5)
	if message == "" then return end

	TriggerEvent("chat:addMessage", -1, ("(OOC) [%s] %s: %s"):format(source, GetPlayerName(source), message))
	exports.log:Add(("[%s] OOC: %s"):format(source, message))
end, {}, -1)