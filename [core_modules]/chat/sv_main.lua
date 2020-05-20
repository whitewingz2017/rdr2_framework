-- MYTH = MYTH or {}
-- MYTH.Chat = MYTH.Chat or {}
Chat = {}
Commands = nil
Suggestions = nil

function stringsplit(inputstr, sep)
	if sep == nil then
		sep = "%s"
	end
	local t={} ; i=1
	for str in string.gmatch(inputstr, "([^"..sep.."]+)") do
		t[i] = str
		i = i + 1
	end
	return t
end

AddEventHandler("chatMessage", function(source, n, message)
	local user = exports.user:GetUser(source)
	local char = exports.character:GetCharacter(source)

	if user ~= nil and char ~= nil then
		if starts_with(message, '/') then
			local command_args = stringsplit(message, " ")

			command_args[1] = string.gsub(command_args[1], '/', "")

			local commandName = command_args[1]

			if Commands[commandName] ~= nil then
				if command then
					local Source = source
					CancelEvent()
					table.remove(command_args, 1)
				end
			end
		end
	end
	CancelEvent()
end)

AddEventHandler("chat:addMessage", function(source, message, typeof)
	TriggerClientEvent("chat:addMessage", source, message, typeof)
	CancelEvent()
end)

--[[ Resource Events ]]--
AddEventHandler("onResourceStart", function(resourceName)
	if GetCurrentResourceName() ~= resourceName then return end

	if not Commands then
		Commands = exports.cache:Get("Commands") or {}
		Suggestions = exports.cache:Get("Suggestions") or {}
	end
end)

AddEventHandler("onResourceStop", function(resourceName)
	if GetCurrentResourceName() ~= resourceName then return end

	exports.cache:Set("Commands", Commands)
	exports.cache:Set("Suggestions", Suggestions)
end)