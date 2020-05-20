-- RegisterNetEvent("core.main:drop")
-- AddEventHandler("core.main:drop", function(reason)
-- 	TriggerServerEvent("core.main:drop", reason)
-- end)

-- Initialization.
Citizen.CreateThread(function()
	while true do
		Citizen.Wait(0)
		if NetworkIsSessionStarted() then
			NetworkSetTalkerProximity(10.0)
			TriggerServerEvent("core:initialize")

			return
		end
	end
end)

--[[ Events ]]--
AddEventHandler("playerSpawned", function(control, coords)--, model)
	-- Fallbacks.
	if not coords then coords = vector4(394.99826049805, -984.61370849609, 118.63548278809, 0) end
	
	-- Get values.
	local player = PlayerId()
	
	-- Set model.
	-- if type(model) == "string" then
	-- 	model = GetHashKey(model)
	-- end

	-- if model then
	-- 	model = GetHashKey(model)
	-- 	RequestModel(model)
		
	-- 	while not HasModelLoaded(model) do
	-- 		RequestModel(model)
	-- 		Citizen.Wait(0)
	-- 	end

	-- 	SetPlayerModel(player, model)
	-- 	SetModelAsNoLongerNeeded(model)
	-- end

	local ped = PlayerPedId()

	-- SetPedDefaultComponentVariation(ped)
	
	-- Set position.
	SetEntityCoordsNoOffset(ped, coords.x, coords.y, coords.z, false, false, false)

	-- Base stuff.
	NetworkResurrectLocalPlayer(coords.x, coords.y, coords.z, coords.w, true, true, false)
	ClearPedTasksImmediately(ped)
	RemoveAllPedWeapons(ped)
	ClearPlayerWantedLevel(player)
	
	-- Controls related.
	SetPlayerControl(player, control, false)
	SetEntityCollision(ped, control)
	FreezeEntityPosition(ped, not control)
	SetPlayerInvincible(ped, not control)
	
	-- Other stuff.
	ShutdownLoadingScreen()

	exports.utils:SetPlayersVisible(control, true)
end)

--[[ Resource Events ]]--
AddEventHandler("onClientResourceStart", function(resourceName)
	TriggerEvent(resourceName..":clientStart")
end)

AddEventHandler("onClientResourceStop", function(resourceName)
	TriggerEvent(resourceName..":clientStop")
end)