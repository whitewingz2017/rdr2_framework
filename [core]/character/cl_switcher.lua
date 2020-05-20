--[[ Config ]]--
local Locations = {
	-- Pink Cage (DEBUG)
	vector3(339.67291259766, -204.59007263184, 54.226440429688),
	-- Motel
	vector3(154.87289733887, -1004.5447998047, -98.919219970703),
	-- Low-End Apartment
	vector3(262.65444946289, -1004.2366943359, -98.968058776855),
	-- MRPD.
	vector3(459.73257446289, -992.46661376953, 30.689590454102),
}

local Config = {
	Text = "Switch Character",
	DrawRadius = 4.0,
	Radius = 2.0,
}

--[[ Cache ]]--
local markers = {}

--[[ Events ]]--
AddEventHandler("markers:use_CharacterSwitch", function()
	TriggerEvent("character:switch")
end)

--[[ Resource Events ]]--
AddEventHandler("onClientResourceStart", function(resourceName)
	if GetCurrentResourceName() ~= resourceName then return end

	for k, pos in ipairs(Locations) do
		local marker = exports.markers:CreateUsable(pos, "CharacterSwitch", Config.Text, drawRadius, radius)
	
		table.insert(markers, marker)
	end
end)

AddEventHandler("onResourceStop", function(resourceName)
	if GetCurrentResourceName() ~= resourceName then return end

	-- Remove old markers.
	for k, v in pairs(markers) do
		exports.markers:Remove(v)
	end
end)