User = {}

--[[ Functions ]]--
function GetUser(source)
	if type(source) ~= "number" then source = tonumber(source) end

	return User
end
exports("GetUser", GetUser)

--[[ Events ]]--
RegisterNetEvent("user:ready")
AddEventHandler("user:ready", function(data)
	User = data
end)

--[[ Resource Events ]]--
AddEventHandler("onResourceStart", function(resourceName)
	if GetCurrentResourceName() ~= resourceName then return end
	if GetResourceState("cache") ~= "started" then return end

	User = exports.cache:Get("User")
end)

AddEventHandler("onResourceStop", function(resourceName)
	if GetCurrentResourceName() ~= resourceName then return end
	if GetResourceState("cache") ~= "started" then return end

	exports.cache:Set("User", User)
end)