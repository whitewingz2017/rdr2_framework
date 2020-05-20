RegisterServerEvent("chat:addTemplate")
RegisterServerEvent("chat:addMessage")
RegisterServerEvent("chat:addSuggestion")
RegisterServerEvent("chat:removeSuggestion")
RegisterServerEvent("_chat:messageEntered")
RegisterServerEvent("__cfx_internal:commandFallback")

AddEventHandler("_chat:messageEntered", function(author, color, message)
	if not message or not author then
		return
	end

	TriggerEvent("chatMessage", source, author, message)

	if not WasEventCanceled() then
		TriggerClientEvent("chatMessage", -1, author,  { 255, 255, 255 }, message)
	end
end)

AddEventHandler("__cfx_internal:commandFallback", function(command)
	local name = GetPlayerName(source)

	TriggerEvent("chatMessage", source, name, "/" .. command)

	if not WasEventCanceled() then
		TriggerClientEvent("chatMessage", -1, name, { 255, 255, 255 }, "/" .. command) 
	end

	CancelEvent()
end)

-- command suggestions for clients
local function refreshCommands(player)
	local user = exports.user:GetUser(player)

	if user then
		for k, suggestion in pairs(Suggestions) do
			if IsPlayerAceAllowed(player, ("command.%s"):format(k)) then
				local command = Commands[k]
				if command then
					if command.group then
						-- if mData.perm == "admin" then
						-- 	TriggerClientEvent("chat:addSuggestion", player, "/" .. k, suggestion.help, suggestion.params)
						-- else
						-- 	TriggerClientEvent("chat:removeSuggestion", player, "/" .. k)
						-- end
					elseif command.job then
						-- for k2, v2 in pairs(command.job) do
						-- 	if v2["base"] == cData.job.base then
						-- 		if tonumber(v2["grade"]) <= cData.job.grade then
						-- 			TriggerClientEvent("chat:addSuggestion", player, "/" .. k, suggestion.help, suggestion.params)
						-- 			break
						-- 		else
						-- 			TriggerClientEvent("chat:removeSuggestion", player, "/" .. k)
						-- 		end
						-- 	else
						-- 		TriggerClientEvent("chat:removeSuggestion", player, "/" .. k)
						-- 	end
						-- end
					else
						TriggerClientEvent("chat:addSuggestion", player, "/" .. k, suggestion.help, suggestion.params)
					end
				end
			end
		end
	end
end

AddEventHandler("chat:refreshCommands", function()
	refreshCommands(source)
end)

RegisterServerEvent("user:ready")
AddEventHandler("user:ready", function(source, user)
	refreshCommands(source)
end)

--[[ Resource Events ]]--
AddEventHandler("onResourceStart", function(resourceName)
	Wait(500)
	for _, player in ipairs(GetPlayers()) do
		refreshCommands(player)
	end
end)