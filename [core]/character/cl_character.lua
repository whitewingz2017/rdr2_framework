Characters = {}
CharacterIndex = -1

--[[ Functions ]]--
function GetCharacter()
	return Characters[CharacterIndex]
end
exports("GetCharacter", GetCharacter)

function GetCharacters()
	return Characters
end
exports("GetCharacters", GetCharacters)

function Set(key, value)
	Characters[CharacterIndex][key] = value
end
exports("Set", Set)

--[[ Events ]]--
RegisterNetEvent("character:initialized")
AddEventHandler("character:initialized", function(data)
	Characters = data
end)

RegisterNetEvent("character:update")
AddEventHandler("character:update", function(data)
	Characters = data
end)

RegisterNetEvent("character:updateCurrent")
AddEventHandler("character:updateCurrent", function(data)
	Characters[CharacterIndex] = data
end)

RegisterNetEvent("character:select")
AddEventHandler("character:select", function(index, data)
	if data then
		Characters[index] = data
	end
	TriggerEvent("character:loaded", Characters[index])
	CharacterIndex = index
end)

RegisterNetEvent("character:switch")
AddEventHandler("character:switch", function()
	TriggerEvent("character:initialized", Characters)
	TriggerServerEvent("character:switch")
end)

--[[ Resource Events ]]--
AddEventHandler("onClientResourceStart", function(resourceName)
	if GetCurrentResourceName() ~= resourceName then return end

	Characters = exports.cache:Get("Characters")
	CharacterIndex = exports.cache:Get("CharacterIndex")
end)

AddEventHandler("onResourceStop", function(resourceName)
	if GetCurrentResourceName() ~= resourceName then return end
	
	exports.cache:Set("Characters", Characters)
	exports.cache:Set("CharacterIndex", CharacterIndex)
end)