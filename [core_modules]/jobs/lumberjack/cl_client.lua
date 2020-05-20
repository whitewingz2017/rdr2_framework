local Data = {
    Blips = {
        BlipName = "WoodC",
        Coords = vector3(-1398.54, -212.06, 102.4),
        Handle = nil,
    },
    Vehicle = {
        Model = "CART04",
        Handle = nil,
        Coords = vector4(-1400.41, -224.64, 100.68, 276.55)
    },
    Trees = {
        [1] = {Coords = vector3(-1460.49, -182.02, 105.20), Handle = nil, Model = "p_tree_pine_ponderosa_06"},
        [2] = {Coords = vector3(-1526.53, -188.28, 112.18), Handle = nil, Model = "p_tree_pine_ponderosa_06"},
        [3] = {Coords = vector3(-1503.47, -221.72, 112.6), Handle = nil, Model = "p_tree_pine_ponderosa_06"},
        [4] = {Coords = vector3(-1461.72, -211.45, 106.50), Handle = nil, Model = "p_tree_pine_ponderosa_06"},
    },
    Delivery = {
        Coords = vector3(-1748.06, -391.11, 156.35),
        Started = false,
        Finished = false,
        Tree1 = false,
        Tree2 = false,
        Tree3 = false,
        Tree4 = false,
        FinishedTrees = false,
    },
}

Citizen.CreateThread(function()
    ChopPrompt = Citizen.InvokeNative(0x29FA7910726C3889, Keys["E"], CreateVarString(10, "LITERAL_STRING", "Chop Tree"), 6, 1, 1, -1)
    PromptSetEnabled(ChopPrompt, false)
    PromptSetVisible(ChopPrompt, false)
    Citizen.InvokeNative(0x74C7D7B72ED0D3CF, ChopPrompt, 2000)
    JobPrompt = Citizen.InvokeNative(0x29FA7910726C3889, Keys["E"], CreateVarString(10, "LITERAL_STRING", "Start Lumberjob"), 6, 1, 1, -1)
    PromptSetEnabled(JobPrompt, false)
    PromptSetVisible(JobPrompt, false)
    Citizen.InvokeNative(0x74C7D7B72ED0D3CF, JobPrompt, 2000)
    CarryPrompt = Citizen.InvokeNative(0x29FA7910726C3889, Keys["E"], CreateVarString(10, "LITERAL_STRING", "Store Wood"), 6, 1, 1, -1)
    PromptSetEnabled(CarryPrompt, false)
    PromptSetVisible(CarryPrompt, false)
    Citizen.InvokeNative(0x74C7D7B72ED0D3CF, CarryPrompt, 2000)
    DeliveryPrompt = Citizen.InvokeNative(0x29FA7910726C3889, Keys["E"], CreateVarString(10, "LITERAL_STRING", "Deliver Wood"), 6, 1, 1, -1)
    PromptSetEnabled(DeliveryPrompt, false)
    PromptSetVisible(DeliveryPrompt, false)
    Citizen.InvokeNative(0x74C7D7B72ED0D3CF, DeliveryPrompt, 2000)
    while true do
        Citizen.Wait(0)
        local PlayerPosition = GetEntityCoords(PlayerPedId(), false)
        if #(PlayerPosition - Data.Blips.Coords) < 3.0 then
            if Data.Delivery.Tree1 == false then
                PromptSetEnabled(JobPrompt, true)
                PromptSetVisible(JobPrompt, true)
                if Citizen.InvokeNative(0xE0F65F0640EF0617, JobPrompt, false) then
                    TriggerServerEvent('Lumberjack.StartJob')
                    PromptSetEnabled(JobPrompt, false)
                    PromptSetVisible(JobPrompt, false)
                    Citizen.Wait(2000)
                end
            end
        else
            if Citizen.InvokeNative(0x0D00EDDFB58B7F28, JobPrompt) then
                PromptSetEnabled(JobPrompt, false)
                PromptSetVisible(JobPrompt, false)
            end
        end
        if Data.Delivery.Tree1 == true then
            if  #(PlayerPosition - Data.Trees[1].Coords) < 3.0 then
                PromptSetEnabled(ChopPrompt, true)
                PromptSetVisible(ChopPrompt, true)
                if Citizen.InvokeNative(0xE0F65F0640EF0617, ChopPrompt, false) then
                    PlayChopAnimation()
                    PlayRotationAnimation(Data.Trees[1].Handle)
					RemoveBlip(Data.Blips.Handle)
					Data.Blips.Handle = Citizen.InvokeNative(0x554d9d53f696d002, 203020899, Data.Trees[2].Coords.x, Data.Trees[2].Coords.y, Data.Trees[2].Coords.z)
                    SetBlipSprite(Data.Blips.Handle, -570710357, 1)
					Data.Delivery.Tree1 = false
                    Data.Delivery.Tree2 = true
                    PromptSetEnabled(ChopPrompt, false)
                    PromptSetVisible(ChopPrompt, false)
                end
            else
                if Citizen.InvokeNative(0x0D00EDDFB58B7F28, ChopPrompt) then
                    PromptSetEnabled(ChopPrompt, false)
                    PromptSetVisible(ChopPrompt, false)
                end
            end
        elseif Data.Delivery.Tree2 == true then
            if  #(PlayerPosition - Data.Trees[2].Coords) < 3.0 then
                PromptSetEnabled(ChopPrompt, true)
                PromptSetVisible(ChopPrompt, true)
                if Citizen.InvokeNative(0xE0F65F0640EF0617, ChopPrompt, false) then
                    PlayChopAnimation()
                    PlayRotationAnimation(Data.Trees[2].Handle)
					RemoveBlip(Data.Blips.Handle)
                    Data.Blips.Handle = Citizen.InvokeNative(0x554d9d53f696d002, 203020899, Data.Trees[3].Coords.x, Data.Trees[3].Coords.y, Data.Trees[3].Coords.z)
                    SetBlipSprite(Data.Blips.Handle, -570710357, 1)
					Data.Delivery.Tree2 = false
                    Data.Delivery.Tree3 = true
                    PromptSetEnabled(ChopPrompt, false)
                    PromptSetVisible(ChopPrompt, false)
                end
            else
                if Citizen.InvokeNative(0x0D00EDDFB58B7F28, ChopPrompt) then
                    PromptSetEnabled(ChopPrompt, false)
                    PromptSetVisible(ChopPrompt, false)
                end
            end
        elseif Data.Delivery.Tree3 == true then
            if  #(PlayerPosition - Data.Trees[3].Coords) < 3.0 then
                PromptSetEnabled(ChopPrompt, true)
                PromptSetVisible(ChopPrompt, true)
                if Citizen.InvokeNative(0xE0F65F0640EF0617, ChopPrompt, false) then
                    PlayChopAnimation()
                    PlayRotationAnimation(Data.Trees[3].Handle)
					RemoveBlip(Data.Blips.Handle)
                    Data.Blips.Handle = Citizen.InvokeNative(0x554d9d53f696d002, 203020899, Data.Trees[4].Coords.x, Data.Trees[4].Coords.y, Data.Trees[4].Coords.z)
                    SetBlipSprite(Data.Blips.Handle, -570710357, 1)
					Data.Delivery.Tree3 = false
                    Data.Delivery.Tree4 = true
                    PromptSetEnabled(ChopPrompt, false)
                    PromptSetVisible(ChopPrompt, false)
                end
            else
                if Citizen.InvokeNative(0x0D00EDDFB58B7F28, ChopPrompt) then
                    PromptSetEnabled(ChopPrompt, false)
                    PromptSetVisible(ChopPrompt, false)
                end
            end
        elseif Data.Delivery.Tree4 == true then
            if  #(PlayerPosition - Data.Trees[4].Coords) < 3.0 then
                PromptSetEnabled(ChopPrompt, true)
                PromptSetVisible(ChopPrompt, true)
                if Citizen.InvokeNative(0xE0F65F0640EF0617, ChopPrompt, false) then
                    PlayChopAnimation()
                    PlayRotationAnimation(Data.Trees[1].Handle)
					RemoveBlip(Data.Blips.Handle)
                    Data.Blips.Handle = Citizen.InvokeNative(0x554d9d53f696d002, 203020899, Data.Vehicle.Coords.x, Data.Vehicle.Coords.y, Data.Vehicle.Coords.z)
                    SetBlipSprite(Data.Blips.Handle, -570710357, 1)
                    TriggerEvent('Lumberjack.SetFinalDestination')
                    Data.Delivery.Tree4 = false
                    Data.Delivery.FinishedTrees = true
                    PromptSetEnabled(ChopPrompt, false)
                    PromptSetVisible(ChopPrompt, false)
                end
            else
                if Citizen.InvokeNative(0x0D00EDDFB58B7F28, ChopPrompt) then
                    PromptSetEnabled(ChopPrompt, false)
                    PromptSetVisible(ChopPrompt, false)
                end
            end
        elseif Data.Delivery.FinishedTrees == true then
            if  #(PlayerPosition - vector3(Data.Vehicle.Coords.x, Data.Vehicle.Coords.y, Data.Vehicle.Coords.z)) < 3.0 then
                PromptSetEnabled(CarryPrompt, true)
                PromptSetVisible(CarryPrompt, true)
                if Citizen.InvokeNative(0xE0F65F0640EF0617, CarryPrompt, false) then
                    PlayStorageAnimation()
                    RemoveBlip(Data.Blips.Handle)
                    Data.Blips.Handle = Citizen.InvokeNative(0x554d9d53f696d002, 203020899, Data.Delivery.Coords.x, Data.Delivery.Coords.y, Data.Delivery.Coords.z)
                    SetBlipSprite(Data.Blips.Handle, -570710357, 1)
                    Data.Delivery.FinishedTrees = false
                    Data.Delivery.Finished = true
                    PromptSetEnabled(CarryPrompt, false)
                    PromptSetVisible(CarryPrompt, false)
                    TriggerEvent('Lumberjack.Timer')
                end
            else
                if Citizen.InvokeNative(0x0D00EDDFB58B7F28, CarryPrompt) then
                    PromptSetEnabled(CarryPrompt, false)
                    PromptSetVisible(CarryPrompt, false)
                end
            end
        elseif Data.Delivery.Finished == true then
            if  #(PlayerPosition - Data.Delivery.Coords) < 3.0 then
                PromptSetEnabled(DeliveryPrompt, true)
                PromptSetVisible(DeliveryPrompt, true)
                if Citizen.InvokeNative(0xE0F65F0640EF0617, DeliveryPrompt, false) then
                    if IsPedInAnyVehicle(PlayerPedId(), true) then
                        DeleteVehicle(GetVehiclePedIsIn(PlayerPedId()))
						RemoveBlip(Data.Blips.Handle)
						TriggerServerEvent('Lumberjack.RecieveWood', 0, 0)
                        Data.Delivery.Finished = false
                        Data.Delivery.Tree1 = false
                        ClearGpsMultiRoute()
                        PromptSetEnabled(DeliveryPrompt, false)
                        PromptSetVisible(DeliveryPrompt, false)
                    end
                end
            else
                if Citizen.InvokeNative(0x0D00EDDFB58B7F28, DeliveryPrompt) then
                    PromptSetEnabled(DeliveryPrompt, false)
                    PromptSetVisible(DeliveryPrompt, false)
                end
            end
        end
    end
end)

RegisterCommand("startjob", function(source, args)
    if string.lower(args[1]) == "lumberjack" then
        TriggerServerEvent("Lumberjack.StartJob")
    end
end, false)

RegisterNetEvent('Lumberjack.SetFinalDestination')
AddEventHandler('Lumberjack.SetFinalDestination', function()
	local Model = GetHashKey(Data.Vehicle.Model)
	RequestModel(Model)

	while not HasModelLoaded(Model) do
		Citizen.Wait(0)
	end

	Data.Vehicle.Handle = CreateVehicle(Model, Data.Vehicle.Coords.x, Data.Vehicle.Coords.y, Data.Vehicle.Coords.z, Data.Vehicle.Coords.w, true, false)
	SetVehicleOnGroundProperly(Data.Vehicle.Handle)
    SetModelAsNoLongerNeeded(Model)

    StartGpsMultiRoute(6, true, true)
        
    AddPointToGpsMultiRoute(Data.Delivery.Coords.x, Data.Delivery.Coords.y, Data.Delivery.Coords.z)
    AddPointToGpsMultiRoute(Data.Delivery.Coords.x, Data.Delivery.Coords.y, Data.Delivery.Coords.z)

    SetGpsMultiRouteRender(true)
    
end)

RegisterNetEvent('Lumberjack.Start')
AddEventHandler('Lumberjack.Start', function(source)
    Data.Blips.Handle = Citizen.InvokeNative(0x554d9d53f696d002, 203020899, -1460.49, -182.02, 105.20)
    SetBlipSprite(Data.Blips.Handle, -570710357, 1)
    Data.Delivery.Started = true
    Data.Delivery.Tree1 = true
    SpawnTrees(Data.Trees[1].Model)
end)

RegisterNetEvent('Lumberjack.Timer')
AddEventHandler('Lumberjack.Timer', function()
	local Timer = 210

	Citizen.CreateThread(function()
		while Timer > 0 and Data.Delivery.Started do
			Citizen.Wait(1000)

			if Timer > 0 then
				Timer = Timer - 1
			end
		end
	end)

	Citizen.CreateThread(function()
		while Data.Delivery.Started do
			Citizen.Wait(0)
			DrawTxt("TIMER: "..Timer.." REMAINING SECONDS", 0.4, 0.92, 0.4, 0.4, true, 255, 255, 255, 150, false)
            if Timer < 1 then
                exports["rp-notify"]:DisplayLeftNotification("Lumberjack", "You did not complete the job in time!", "HUD_TOASTS", "toast_player_deadeye", 10000)
				Data.Delivery.Tree1, Data.Delivery.Tree2, Data.Delivery.Tree3, Data.Delivery.Tree4, Data.Delivery.FinishedTrees, Data.Delivery.Started, Data.Delivery.Finished = false, false, false, false, false, false, false
				DeleteVehicle(Data.Vehicle.Handle)
				RemoveBlip(Data.Blips.Handle)
                SetEntityCoords(PlayerPedId(), Data.Vehicle.Coords.x, Data.Vehicle.Coords.y, Data.Vehicle.Coords.z)
			end
		end
	end)
end)

function PlayChopAnimation()
    local PlayerPed = PlayerPedId()
    local PlayerPosition = GetEntityCoords(PlayerPed, false)
    local PropModel = 'p_axe02x'
    local Prop = CreateObject(GetHashKey(PropModel), PlayerPosition.x, PlayerPosition.y, PlayerPosition.z + 0.2, true, true, true)
    local BoneIndex = GetEntityBoneIndexByName(PlayerPed, "SKEL_R_Finger12")

    RequestAnimDict("amb_work@world_human_tree_chop@male_a@idle_b")
    while not HasAnimDictLoaded("amb_work@world_human_tree_chop@male_a@idle_b") do
        Citizen.Wait(100)
    end
    TaskPlayAnim(PlayerPed, "amb_work@world_human_tree_chop@male_a@idle_b", "idle_f", 8.0, -8.0, 10000, 0, 0, true, 0, false, 0, false)
    AttachEntityToEntity(Prop, PlayerPed, BoneIndex, 0.200, -0.0, 0.5010, 1.024, -160.0, -70.0, true, true, false, true, 1, true)

    exports['rp-progressbars']:startUI(10000, "Cutting the wood")
    Wait(10000)
    ClearPedSecondaryTask(PlayerPed)
    DeleteObject(Prop)
end

function PlayStorageAnimation()
    TaskStartScenarioInPlace(PlayerPedId(), 'PROP_HUMAN_SACK_STORAGE_IN', 7000, true, false, false, false)
    exports['rp-progressbars']:startUI(7000, "Placing the bag")
    Wait(7000)
    ClearPedTasksImmediately(PlayerPedId())
end

function PlayRotationAnimation(Handle)
    local Rotation = 1.01
    while true do
        Wait(10)
        Rotation = Rotation + 1
        SetEntityRotation(Handle, Rotation, 0.0, 0.0, 1, true)
        if(Rotation >= 90) then
            break
        end

    end
    DeleteObject(Handle)
end

function SpawnTrees(Hash)
    local Model = GetHashKey(Hash)
    RequestModel(Model)

    while not HasModelLoaded(Model) do 
        Citizen.Wait(0) 
    end

    Data.Trees[1].Handle = CreateObject(Model, Data.Trees[1].Coords - 1.1, true, true, true)
    Data.Trees[2].Handle = CreateObject(Model, Data.Trees[2].Coords - 1.1, true, true, true)
    Data.Trees[3].Handle = CreateObject(Model, Data.Trees[3].Coords - 1.1, true, true, true)
    Data.Trees[4].Handle = CreateObject(Model, Data.Trees[4].Coords - 1.1, true, true, true)
    PlaceObjectOnGroundProperly(Data.Trees[1].Handle)
    PlaceObjectOnGroundProperly(Data.Trees[2].Handle)
    PlaceObjectOnGroundProperly(Data.Trees[3].Handle)
    PlaceObjectOnGroundProperly(Data.Trees[4].Handle)
    SetEntityAsMissionEntity(Data.Trees[1].Handle, true)
    SetEntityAsMissionEntity(Data.Trees[2].Handle, true)
    SetEntityAsMissionEntity(Data.Trees[3].Handle, true)
    SetEntityAsMissionEntity(Data.Trees[4].Handle, true)
end

function DrawTxt(str, x, y, w, h, enableShadow, col1, col2, col3, a, centre)
    local str = CreateVarString(10, "LITERAL_STRING", str)
    SetTextScale(w, h)
    SetTextColor(math.floor(col1), math.floor(col2), math.floor(col3), math.floor(a))
	SetTextCentre(centre)
    if enableShadow then SetTextDropshadow(1, 0, 0, 0, 255) end
	Citizen.InvokeNative(0xADA9255D, 1);
    DisplayText(str, x, y)
end

function CreateVarString(p0, p1, variadic)
    return Citizen.InvokeNative(0xFA925AC00EB830B9, p0, p1, variadic, Citizen.ResultAsLong())
end