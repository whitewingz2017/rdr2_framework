DrawContext = exports.utils.DrawContext
Markers = {}
TextEntries = {}

--[[ Threads ]]--
Citizen.CreateThread(function()
	while true do
		Citizen.Wait(0)
		local ped = PlayerPedId()
		for k, v in pairs(Markers) do
			if v then
				local dist = #(GetEntityCoords(ped) - v.pos)
				if dist < v.drawRadius then
					local floatCoords = nil
					local floatId = 1
					local canActivate = dist < v.radius and (v.useWhileInVehicle or not IsPedInAnyVehicle(ped, true))

					if v.float then
						floatCoords = v.pos
						showContext = true
						if not canActivate then
							floatId = 2
						end
					end
					
					local activated = DrawContext(nil, v.helpText, floatCoords, floatId)

					-- Usable markers.
					if v.id ~= nil and activated and canActivate then
						TriggerEvent("markers:use_"..v.id)
					end

					-- Draw marker if not hidden.
					if not v.hidden and not v.float then
						local pos = v.pos
						if not v.keepZ then
							local hasGround, groundZ = GetGroundZFor_3dCoord(pos.x, pos.y, pos.z)
							if hasGround then
								pos = vector3(pos.x, pos.y, groundZ)
							end
						end

						DrawMarker(
							v.type,
							pos.x, pos.y, pos.z,
							v.dir.x, v.dir.y, v.dir.z,
							v.rot.x, v.rot.y, v.rot.z,
							v.scale.x, v.scale.y, v.scale.z,
							v.col.r, v.col.g, v.col.b, v.col.a,
							v.bobUpAndDown,
							v.faceCamera, 2,
							v.rotate,
							v.textureDict,
							v.textureName,
							v.drawOnEnts
						)
					end
				end
			end
		end
	end
end)

--[[ Functions ]]--
function CreateBlip(data)
	local blip = AddBlipForCoord(data.pos.x, data.pos.y, data.pos.z)
	SetBlipSprite(blip, data.blip.id or 66)
	SetBlipAsShortRange(blip, true)
	SetBlipScale(blip, data.blip.scale or 1.0)
	SetBlipColour(blip, data.blip.color or 0)

	local label = data.blip.name or "Unknown"
	local key = "Markers_"..label

	if not TextEntries[label] then
		TextEntries[key] = label
		AddTextEntry(key, label)
	end

	BeginTextCommandSetBlipName(key)
	EndTextCommandSetBlipName(blip)

	return blip
end

function Create(data)
	local handle = (exports.cache:Get("MarkersCount") or 0) + 1
	exports.cache:Set("MarkersCount", handle)
	
	-- Default for help text.
	if not data.helpText and data.callback then
		data.helpText = "use"
	end

	-- Default for the color's alpha channel.
	if data.col and not data.col.a then
		data.col.a = 255
	end
	
	-- Defaults for the marker info.
	if not data.hidden and not data.float then
		data.type = data.type or 0
		data.pos = data.pos or vector3(0, 0, 0)
		data.dir = data.dir or vector3(0, 0, 0)
		data.rot = data.rot or vector3(0, 0, 0)
		data.scale = data.scale or vector3(1, 1, 1)
		data.col = data.col or { r = 255, g = 255, b = 255, a = 255 }
		data.bobUpAndDown = data.bobUpAndDown or false
		data.faceCamera = data.faceCamera or false
		data.rotate = data.rotate or false
		data.textureDict = data.textureDict or nil
		data.textureName = data.textureName or nil
		data.drawOnEnts = data.drawOnEnts or false
	end
	
	-- Default for other settings.
	data.callback = data.callback or nil
	data.radius = data.radius or 1.0
	data.drawRadius = data.drawRadius or 10.0

	-- Create a blip.
	if data.blip then
		data.blip.handle = CreateBlip(data)
	end

	-- Cache the marker.
	Markers[handle] = data
	
	return handle
end
exports("Create", Create)

function Remove(handle)
	local marker = Markers[handle]
	if not marker then return end

	if marker.blip and DoesBlipExist(marker.blip.handle) then
		RemoveBlip(marker.blip.handle)
	end

	Markers[handle] = nil
end
exports("Remove", Remove)

function CreateUsable(pos, id, helpText, drawRadius, radius, blip, data)
	if type(pos) == "vector4" then
		pos = vector3(pos.x, pos.y, pos.z)
	end
	
	data = data or {}
	data.blip = blip
	data.col = data.col or { r = 25, g = 146, b = 245 }
	data.drawRadius = data.drawRadius or drawRadius or 10.0
	data.float = data.float or true
	data.helpText = helpText
	data.id = id
	data.pos = pos
	data.radius = data.radius or radius or 2.0
	data.type = data.type or 25
	
	return exports.markers:Create(data)
end
exports("CreateUsable", CreateUsable)

--[[ Resource Events ]]--
AddEventHandler("onResourceStart", function(resourceName)
	if GetCurrentResourceName() ~= resourceName then return end
	if GetResourceState("cache") ~= "started" then return end

	Markers = exports.cache:Get("Markers") or Markers

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
	
	exports.cache:Set("Markers", Markers)
end)

-- local t = {x = 313.65426635742, y = -278.70379638672, z = 54.17077255249, h = 335.43649291992}
-- TriggerEvent("marker:createUsable", vector3(t.x,t.y,t.z), function() print("WOWWW") end, "view your account", { hidden = true })