local Noclip = false
local WasNoclip = false
local Camera = nil
local Rotation = nil
local MoveSpeed = 0.2
local Vehicle = nil

function Functions:ProcessNoclip()
	if PowerLevel < Config.Noclip.PowerLevel then return end

	-- if IsDisabledControlJustPressed(0, Config.Noclip.Key) then
	-- 	Noclip = not Noclip
	-- end

	if Noclip ~= WasNoclip then
		SetEntityVisible(Ped, not Noclip)
		NetworkSetEntityInvisibleToNetwork(Ped, Noclip)
		SetPlayerControl(PlayerId(), not Noclip)
		FreezeEntityPosition(Ped, Noclip)
		SetEntityCollision(Ped, not Noclip, not Noclip)
		ClearPedTasksImmediately()
		
		if Noclip then
			Camera = exports.utils:CreateCam()
			Rotation = GetGameplayCamRot()
			Coords = GetGameplayCamCoord()
			
			Camera:Set("pos", Coords)
			Camera:Set("rot", Rotation)
			Camera:Set("fov", 60.0)
			Camera:Set("shake", 0.0)
			Camera:Activate()
			
			Horse = GetMount(Ped)
			if DoesEntityExist(Horse) then
				SetEntityAsMissionEntity(Horse)
			end
		else
			Camera:Deactivate()

			SetEntityHeading(Ped, Rotation.z)
			SetGameplayCamRelativeRotation(0, 0, 0)

			if DoesEntityExist(Horse) then
				SetPedOnMount(Ped, Horse, -1, true)
				SetEntityCoords(Horse, Coords.x, Coords.y, Coords.z)
				SetEntityHeading(Horse, Rotation.z)
				SetEntityAsNoLongerNeeded(Horse)
			end
			Horse = nil
		end
	end

	if Noclip then
		local lookX, lookY = GetDisabledControlUnboundNormal(0, 0x1788C283), GetDisabledControlUnboundNormal(0, 0xF9781997)
		local moveX, moveY, moveZ = GetDisabledControlUnboundNormal(0, 0x4D8FB4C1), GetDisabledControlUnboundNormal(0, 0xFDA83190), 0
		local right, forward, up = GetCamMatrix(Camera:Get("cam"))
		
		if IsDisabledControlPressed(0, 0x05CA7C52) then
			moveZ = -1
		elseif IsDisabledControlPressed(0, 0x6319DB71) then
			moveZ = 1
		end

		if IsDisabledControlPressed(0, 0x62800C92) then
			MoveSpeed = math.min(MoveSpeed + 0.1, 10.0)
		elseif IsDisabledControlPressed(0, 0x8BDE7443) then
			MoveSpeed = math.max(MoveSpeed - 0.1, 0.05)
		end
		
		local speed = MoveSpeed

		if IsDisabledControlPressed(0, 0x8FFC75D6) then
			speed = speed * 2.0
		end

		Rotation = vector3(math.min(math.max(Rotation.x - lookY * Config.Noclip.Sensitivity, -90), 90), 0, Rotation.z - lookX * Config.Noclip.Sensitivity)
		Coords = Coords - forward * moveY * speed + right * moveX * speed + up * moveZ * speed

		Camera:Set("rot", Rotation)
		Camera:Set("pos", Coords)

		SetEntityCoords(Ped, Coords)
	end

	WasNoclip = Noclip
end