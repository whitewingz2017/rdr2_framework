local Blips = {}
local BlipsData = {
    -- Default/Base Index Structure
    --[1] = {BlipName = , Hash = , Colour = , Coords = vector3()},
    -- GunSmiths -145868367
    --GeneralStores 1475879922
    --ClothingStores 1195729388
    --Doctors -1739686743
    --SheriffsOffices 1322310532
    --Saloons 1879260108
    --Saloons 1879260108
    --Banks -2128054417
    --PostOffices 1861010125
    --Barbers -2090472724
    --Hotels/Motels -211556852
    --Photographers 1364029453
    --Butcher -1665418949
    --Stable 1938782895
    -- [[ Valentine ]] --
    [1] = {BlipName = "Gunsmith", Hash = -145868367, Colour = 25, Coords = vector3(-281.33264160156, 780.70416259766, 119.52701568604)},
    [2] = {BlipName = "General Store", Hash = 1475879922, Colour = 25, Coords = vector3(-322.36367797852,804.21844482422,117.881690979)},
    [3] = {BlipName = "Clothing Store", Hash = 1195729388, Colour = 25, Coords = vector3(0,0,0)},
    [4] = {BlipName = "Doctors", Hash = -1739686743, Colour = 25, Coords = vector3(-286.1969909668,804.41027832031,119.38594055176)},
    [5] = {BlipName = "Sheriffs Office", Hash = 1322310532, Colour = 25, Coords = vector3(-276.10342407227,805.32165527344,119.38005065918)},
    [6] = {BlipName = "Saloon", Hash = 1879260108, Colour = 25, Coords = vector3(-311.76751708984,807.00170898438,118.98001861572)},
    [7] = {BlipName = "Bank", Hash = -2128054417, Colour = 25, Coords = vector3(0,0,0)},
    [8] = {BlipName = "Post Office", Hash = 1861010125, Colour = 25, Coords = vector3(-178.82794189453,626.69915771484,114.08962249756)},
    [9] = {BlipName = "Barber", Hash = -2090472724, Colour = 25, Coords = vector3(0,0,0)},
    [10] = {BlipName = "Motel", Hash = -211556852, Colour = 25, Coords = vector3(-325.76068115234,774.50207519531,117.45771026611)},
    [11] = {BlipName = "Photographer", Hash = 1364029453, Colour = 25, Coords = vector3(0,0,0)},
    [12] = {BlipName = "Butcher", Hash = -1665418949, Colour = 25, Coords = vector3(-341.09973144531,767.39978027344,116.69506072998)},
    [13] = {BlipName = "Stables", Hash = 1938782895, Colour = 25, Coords = vector3(-368.82473754883,787.07891845703,116.16126251221)},
    -- -- [[ Strawberry ]] --
    -- [1] = {BlipName = "Gunsmith", Hash = -145868367, Colour = 25, Coords = },
    -- [2] = {BlipName = "General Store", Hash = 1475879922, Colour = 25, Coords = },
    -- [3] = {BlipName = "Clothing Store", Hash = 1195729388, Colour = 25, Coords = },
    -- [4] = {BlipName = "Doctors", Hash = -1739686743, Colour = 25, Coords = },
    -- [5] = {BlipName = "Sheriffs Office", Hash = 1322310532, Colour = 25, Coords = },
    -- [6] = {BlipName = "Saloon", Hash = 1879260108, Colour = 25, Coords = },
    -- [7] = {BlipName = "Bank", Hash = -2128054417, Colour = 25, Coords = },
    -- [8] = {BlipName = "Post Office", Hash = 1861010125, Colour = 25, Coords = },
    -- [9] = {BlipName = "Barber", Hash = -2090472724, Colour = 25, Coords = },
    -- [10] = {BlipName = "Motel", Hash = -211556852, Colour = 25, Coords = },
    -- [11] = {BlipName = "Photographer", Hash = 1364029453, Colour = 25, Coords = },
    -- [12] = {BlipName = "Butcher", Hash = -1665418949, Colour = 25, Coords = },
    -- [13] = {BlipName = "Stables", Hash = 1938782895, Colour = 25, Coords = },
    -- -- [[ Tumbleweed ]] --
    -- [1] = {BlipName = "Gunsmith", Hash = -145868367, Colour = 25, Coords = },
    -- [2] = {BlipName = "General Store", Hash = 1475879922, Colour = 25, Coords = },
    -- [3] = {BlipName = "Clothing Store", Hash = 1195729388, Colour = 25, Coords = },
    -- [4] = {BlipName = "Doctors", Hash = -1739686743, Colour = 25, Coords = },
    -- [5] = {BlipName = "Sheriffs Office", Hash = 1322310532, Colour = 25, Coords = },
    -- [6] = {BlipName = "Saloon", Hash = 1879260108, Colour = 25, Coords = },
    -- [7] = {BlipName = "Bank", Hash = -2128054417, Colour = 25, Coords = },
    -- [8] = {BlipName = "Post Office", Hash = 1861010125, Colour = 25, Coords = },
    -- [9] = {BlipName = "Barber", Hash = -2090472724, Colour = 25, Coords = },
    -- [10] = {BlipName = "Motel", Hash = -211556852, Colour = 25, Coords = },
    -- [11] = {BlipName = "Photographer", Hash = 1364029453, Colour = 25, Coords = },
    -- [12] = {BlipName = "Butcher", Hash = -1665418949, Colour = 25, Coords = },
    -- [13] = {BlipName = "Stables", Hash = 1938782895, Colour = 25, Coords = },
    -- -- [[ Blackwater ]] --
    -- [1] = {BlipName = "Gunsmith", Hash = -145868367, Colour = 25, Coords = },
    -- [2] = {BlipName = "General Store", Hash = 1475879922, Colour = 25, Coords = },
    -- [3] = {BlipName = "Clothing Store", Hash = 1195729388, Colour = 25, Coords = },
    -- [4] = {BlipName = "Doctors", Hash = -1739686743, Colour = 25, Coords = },
    -- [5] = {BlipName = "Sheriffs Office", Hash = 1322310532, Colour = 25, Coords = },
    -- [6] = {BlipName = "Saloon", Hash = 1879260108, Colour = 25, Coords = },
    -- [7] = {BlipName = "Bank", Hash = -2128054417, Colour = 25, Coords = },
    -- [8] = {BlipName = "Post Office", Hash = 1861010125, Colour = 25, Coords = },
    -- [9] = {BlipName = "Barber", Hash = -2090472724, Colour = 25, Coords = },
    -- [10] = {BlipName = "Motel", Hash = -211556852, Colour = 25, Coords = },
    -- [11] = {BlipName = "Photographer", Hash = 1364029453, Colour = 25, Coords = },
    -- [12] = {BlipName = "Butcher", Hash = -1665418949, Colour = 25, Coords = },
    -- [13] = {BlipName = "Stables", Hash = 1938782895, Colour = 25, Coords = },
    -- -- [[ Annesburg ]] --
    -- [1] = {BlipName = "Gunsmith", Hash = -145868367, Colour = 25, Coords = },
    -- [2] = {BlipName = "General Store", Hash = 1475879922, Colour = 25, Coords = },
    -- [3] = {BlipName = "Clothing Store", Hash = 1195729388, Colour = 25, Coords = },
    -- [4] = {BlipName = "Doctors", Hash = -1739686743, Colour = 25, Coords = },
    -- [5] = {BlipName = "Sheriffs Office", Hash = 1322310532, Colour = 25, Coords = },
    -- [6] = {BlipName = "Saloon", Hash = 1879260108, Colour = 25, Coords = },
    -- [7] = {BlipName = "Bank", Hash = -2128054417, Colour = 25, Coords = },
    -- [8] = {BlipName = "Post Office", Hash = 1861010125, Colour = 25, Coords = },
    -- [9] = {BlipName = "Barber", Hash = -2090472724, Colour = 25, Coords = },
    -- [10] = {BlipName = "Motel", Hash = -211556852, Colour = 25, Coords = },
    -- [11] = {BlipName = "Photographer", Hash = 1364029453, Colour = 25, Coords = },
    -- [12] = {BlipName = "Butcher", Hash = -1665418949, Colour = 25, Coords = },
    -- [13] = {BlipName = "Stables", Hash = 1938782895, Colour = 25, Coords = },
    -- -- [[ Van Horn ]] --
    -- [1] = {BlipName = "Gunsmith", Hash = -145868367, Colour = 25, Coords = },
    -- [2] = {BlipName = "General Store", Hash = 1475879922, Colour = 25, Coords = },
    -- [3] = {BlipName = "Clothing Store", Hash = 1195729388, Colour = 25, Coords = },
    -- [4] = {BlipName = "Doctors", Hash = -1739686743, Colour = 25, Coords = },
    -- [5] = {BlipName = "Sheriffs Office", Hash = 1322310532, Colour = 25, Coords = },
    -- [6] = {BlipName = "Saloon", Hash = 1879260108, Colour = 25, Coords = },
    -- [7] = {BlipName = "Bank", Hash = -2128054417, Colour = 25, Coords = },
    -- [8] = {BlipName = "Post Office", Hash = 1861010125, Colour = 25, Coords = },
    -- [9] = {BlipName = "Barber", Hash = -2090472724, Colour = 25, Coords = },
    -- [10] = {BlipName = "Motel", Hash = -211556852, Colour = 25, Coords = },
    -- [11] = {BlipName = "Photographer", Hash = 1364029453, Colour = 25, Coords = },
    -- [12] = {BlipName = "Butcher", Hash = -1665418949, Colour = 25, Coords = },
    -- [13] = {BlipName = "Stables", Hash = 1938782895, Colour = 25, Coords = },
    -- -- [[ Saint Denis ]] --
    -- [1] = {BlipName = "Gunsmith", Hash = -145868367, Colour = 25, Coords = },
    -- [2] = {BlipName = "General Store", Hash = 1475879922, Colour = 25, Coords = },
    -- [3] = {BlipName = "Clothing Store", Hash = 1195729388, Colour = 25, Coords = },
    -- [4] = {BlipName = "Doctors", Hash = -1739686743, Colour = 25, Coords = },
    -- [5] = {BlipName = "Sheriffs Office", Hash = 1322310532, Colour = 25, Coords = },
    -- [6] = {BlipName = "Saloon", Hash = 1879260108, Colour = 25, Coords = },
    -- [7] = {BlipName = "Bank", Hash = -2128054417, Colour = 25, Coords = },
    -- [8] = {BlipName = "Post Office", Hash = 1861010125, Colour = 25, Coords = },
    -- [9] = {BlipName = "Barber", Hash = -2090472724, Colour = 25, Coords = },
    -- [10] = {BlipName = "Motel", Hash = -211556852, Colour = 25, Coords = },
    -- [11] = {BlipName = "Photographer", Hash = 1364029453, Colour = 25, Coords = },
    -- [12] = {BlipName = "Butcher", Hash = -1665418949, Colour = 25, Coords = },
    -- [13] = {BlipName = "Stables", Hash = 1938782895, Colour = 25, Coords = },
    -- -- [[ Rhodes ]] --
    -- [1] = {BlipName = "Gunsmith", Hash = -145868367, Colour = 25, Coords = },
    -- [2] = {BlipName = "General Store", Hash = 1475879922, Colour = 25, Coords = },
    -- [3] = {BlipName = "Clothing Store", Hash = 1195729388, Colour = 25, Coords = },
    -- [4] = {BlipName = "Doctors", Hash = -1739686743, Colour = 25, Coords = },
    -- [5] = {BlipName = "Sheriffs Office", Hash = 1322310532, Colour = 25, Coords = },
    -- [6] = {BlipName = "Saloon", Hash = 1879260108, Colour = 25, Coords = },
    -- [7] = {BlipName = "Bank", Hash = -2128054417, Colour = 25, Coords = },
    -- [8] = {BlipName = "Post Office", Hash = 1861010125, Colour = 25, Coords = },
    -- [9] = {BlipName = "Barber", Hash = -2090472724, Colour = 25, Coords = },
    -- [10] = {BlipName = "Motel", Hash = -211556852, Colour = 25, Coords = },
    -- [11] = {BlipName = "Photographer", Hash = 1364029453, Colour = 25, Coords = },
    -- [12] = {BlipName = "Butcher", Hash = -1665418949, Colour = 25, Coords = },
    -- [13] = {BlipName = "Stables", Hash = 1938782895, Colour = 25, Coords = },
    -- -- [[ Armadillo ]] --
    -- [1] = {BlipName = "Gunsmith", Hash = -145868367, Colour = 25, Coords = },
    -- [2] = {BlipName = "General Store", Hash = 1475879922, Colour = 25, Coords = },
    -- [3] = {BlipName = "Clothing Store", Hash = 1195729388, Colour = 25, Coords = },
    -- [4] = {BlipName = "Doctors", Hash = -1739686743, Colour = 25, Coords = },
    -- [5] = {BlipName = "Sheriffs Office", Hash = 1322310532, Colour = 25, Coords = },
    -- [6] = {BlipName = "Saloon", Hash = 1879260108, Colour = 25, Coords = },
    -- [7] = {BlipName = "Bank", Hash = -2128054417, Colour = 25, Coords = },
    -- [8] = {BlipName = "Post Office", Hash = 1861010125, Colour = 25, Coords = },
    -- [9] = {BlipName = "Barber", Hash = -2090472724, Colour = 25, Coords = },
    -- [10] = {BlipName = "Motel", Hash = -211556852, Colour = 25, Coords = },
    -- [11] = {BlipName = "Photographer", Hash = 1364029453, Colour = 25, Coords = },
    -- [12] = {BlipName = "Butcher", Hash = -1665418949, Colour = 25, Coords = },
    -- [13] = {BlipName = "Stables", Hash = 1938782895, Colour = 25, Coords = },
}

Citizen.CreateThread(function()
    for Index = 1, #BlipsData do
        exports.blips:DrawBlip(BlipsData[Index].BlipName, BlipsData[Index].Hash, BlipsData[Index].Colour, BlipsData[Index].Coords)
    end
end)

exports("DrawBlip", function(BlipName, BlipHash, BlipColour, BlipCoords)
    local Blip = N_0x554d9d53f696d002(1664425300, BlipCoords.x, BlipCoords.y, BlipCoords.z)
    SetBlipSprite(Blip, BlipHash, 1)
    SetBlipScale(Blip, 0.2)
    Citizen.InvokeNative(0x9CB1A1623062F402, Blip, BlipName)
    table.insert(Blips, Blip)
end

--[[ Resource Events ]]--
AddEventHandler("onResourceStart", function(resourceName)
	if GetCurrentResourceName() ~= resourceName then return end
	if GetResourceState("cache") ~= "started" then return end

	Blips = exports.cache:Get("Blips") or Blips

	-- Update blips.
	-- for _, marker in ipairs(Markers) do
	-- 	if marker.blip and not DoesBlipExist(marker.blip.handle) then
	-- 		CreateBlip(marker)
	-- 	end
	-- end
end)

AddEventHandler("onResourceStop", function(resourceName)
	if GetCurrentResourceName() ~= resourceName then return end
	if GetResourceState("cache") ~= "started" then return end
	
	exports.cache:Set("Blips", Blips)
end)

-- local t = {x = 313.65426635742, y = -278.70379638672, z = 54.17077255249, h = 335.43649291992}
-- TriggerEvent("marker:createUsable", vector3(t.x,t.y,t.z), function() print("WOWWW") end, "view your account", { hidden = true })