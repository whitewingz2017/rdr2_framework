local Debugging = false
local Dimensions = {}
local Entity = nil

function Functions:ProcessDebugger()
	if PowerLevel < Config.Debugger.PowerLevel then return end

	-- if IsDisabledControlJustPressed(0, Config.Debugger.Key) then
	-- 	Debugging = not Debugging
	-- end

	if not Debugging then return end

	-- Crosshair.
	EnableCrosshairThisFrame()
	DisplaySniperScopeThisFrame()

	-- Objects.
	local objects = exports.utils:GetObjects()
	local pedCoords = GetEntityCoords(Ped)

	for k, object in ipairs(objects) do
		if #(GetEntityCoords(object) - pedCoords) > 50.0 then
			goto skip
		end
		local model = GetEntityModel(object)
		local min, max

		if not Dimensions[model] then
			min, max = GetModelDimensions(model)
			Dimensions[model] = { min = min, max = max }
		else
			min = Dimensions[model].min
			max = Dimensions[model].max
		end

		min = GetOffsetFromEntityInWorldCoords(object, min.x, min.y, min.z)
		max = GetOffsetFromEntityInWorldCoords(object, max.x, max.y, max.z)
		
		SetScriptGfxDrawOrder(9999)
		SetBackfaceculling(false)
		DrawBox(min.x, min.y, min.z, max.x, max.y, max.z, 255, 0, 0, 128)
		::skip::
	end

	-- Current object.
	local isAiming, entity = GetEntityPlayerIsFreeAimingAt(PlayerId())
	if (isAiming and entity) or Entity then
		if DoesEntityExist(entity) then
			Entity = entity
		end

		local speed = GetEntitySpeed(entity)
		local types = {
			[0] = "None",
			[1] = "Ped",
			[2] = "Vehicle",
			[3] = "Object",
		}

		local data = {
			{ "Entity", Entity },
			{ "Model", GetEntityModel(Entity) },
			{ "Type", types[GetEntityType(Entity) or 0] },
			{},
			{ "Coords", GetEntityCoords(Entity) },
			{ "Rotation", GetEntityRotation(Entity) },
			{},
			{ "Health", ("%s/%s"):format(GetEntityHealth(Entity), GetEntityMaxHealth(Entity)) },
			{ "Speed (KMH)", speed * 3.6 },
			{ "Speed (MPH)", speed * 2.236936 },
			{},
			{ "Attached To", GetEntityAttachedTo(Entity) },
			{ "Has Collision", not GetEntityCollisionDisabled(Entity) },
			{ "Invincible", not GetEntityCanBeDamaged(Entity) },
			{ "Is Upright", IsEntityUpright(Entity) },
			{ "Submerged Level", GetEntitySubmergedLevel(Entity) },
			{ "Script", GetEntityScript(Entity) },
			{ "Owner", GetPlayerServerId(NetworkGetEntityOwner(Entity)) },
			{},
		}

		local retval, bulletProof, fireProof, explosionProof, collisionProof, meleeProof, p6, p7, drownProof = GetEntityProofs(Entity)
		local proofsAt = 24

		if retval then
			table.insert(data, {"Bullet Proof", bulletProof})
			table.insert(data, {"Fire Proof", fireProof})
			table.insert(data, {"Explosion Proof", explosionProof})
			table.insert(data, {"Collision Proof", collisionProof})
			table.insert(data, {"Melee Proof", meleeProof})
			table.insert(data, {"Drown Proof", drownProof})
		end

		for k, v in ipairs(data) do
			if v[1] ~= nil then
				DrawText(v[1], v[2], k)
			end
		end
	end
end