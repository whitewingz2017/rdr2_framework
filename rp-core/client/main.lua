-- AddEventHandler("playerSpawned", function()
--     FreezeEntityPosition(PlayerPedId(), true)
--     NetworkSetTalkerProximity(10.0)
--     TriggerServerEvent("Retrieve.Characters")
-- end)
local firstSpawn = false
local CharacterLoaded = false
Citizen.CreateThread(function()
    while firstSpawn == false do
        Citizen.Wait(0)
        local spawned = Citizen.InvokeNative(0xB8DFD30D6973E135, PlayerPedId(), Citizen.ResultAsInteger())
        if spawned then
            TriggerServerEvent("Retrieve.Characters")
            Citizen.InvokeNative(0xF808475FA571D823, true)
            NetworkSetFriendlyFireOption(true)
            SetCanAttackFriendly(PlayerPedId(), true, true)
            firstSpawn = true
            TriggerEvent("Chat.StartTemplates")
        end
    end
end)

Character = {}
CharacterName = "John Marston"

local function open(_characters)
	SetPlayerControl(PlayerId(), 0, 0)
	SetNuiFocus(true, true)
	SendNUIMessage({open = true, characters = _characters})
end

local function close()
	SetNuiFocus(false, false)
	SendNUIMessage({open = false})
	SetPlayerControl(PlayerId(), 1, 0)
end

RegisterNetEvent("Load.Characters")
AddEventHandler("Load.Characters", function(_Characters)
	open(_Characters)
end)

RegisterNetEvent("Delete.Character")
AddEventHandler("Delete.Character", function(_Characters)
	open(_Characters)
end)

RegisterNetEvent("Edit.Character")
AddEventHandler("Edit.Character", function(_Characters)
	open(_Characters)
end)

RegisterNetEvent("Create.Character")
AddEventHandler("Create.Character", function(_Characters)
	open(_Characters)
end)

RegisterNetEvent("Select.Character")
AddEventHandler("Select.Character", function(Data)
    close()
    Citizen.InvokeNative(0xbc3422dc91667621, Data.cash, true)
    for Index = 0, 3 do
        Citizen.InvokeNative(0xC6258F41D86676E0, PlayerPedId(), Index, 100)
        SetAttributeBaseRank(PlayerPedId(), Index, 100)
    end
    SetMinimapHideFow(true)
    Character = Data
    CharacterName = Character.first_name.." "..Character.last_name
    CharacterLoaded = true
    SetPedMoney(PlayerPedId(), Data.cash)
end)

local function stringsplit(inputstr, sep)
    if sep == nil then
        sep = "%s"
    end
    local t={} ; i=1
    for str in string.gmatch(inputstr, "([^"..sep.."]+)") do
        t[i] = str
        i = i + 1
    end
    return t
end

RegisterNUICallback("Create.Character", function(data, cb)
	local split_dob = stringsplit(data.dob, "-")
	if #split_dob == 3 then
		data.dob = split_dob[1].."-"..split_dob[2].."-"..split_dob[3]
	end
	TriggerServerEvent("Create.Character", data)
end)

RegisterNUICallback("Edit.Character", function(data, cb)
	local split_dob = stringsplit(data.dob, "-")
	if #split_dob == 3 then
		data.dob = split_dob[1].."-"..split_dob[2].."-"..split_dob[3]
	end
	TriggerServerEvent("Edit.Character", data)
end)

RegisterNUICallback("Select.Character", function(data, cb)
	TriggerServerEvent("Select.Character", data.character)
end)

RegisterNUICallback("Delete.Character", function(data, cb)
	TriggerServerEvent("DeleteCharacter", data.character)
end)

local ImmersionBars = false

RegisterCommand("bars", function(source, args)
    if not ImmersionBars then
        Citizen.InvokeNative(0x69d65e89ffd72313, true)
    else
        Citizen.InvokeNative(0x69d65e89ffd72313, false)
    end
    ImmersionBars = not ImmersionBars
end)

RegisterCommand("slay", function(source, args)
    Citizen.InvokeNative(0x1CE875505D45338A, PlayerPedId(), 0, 0)
end)

function GetCoreValue(CoreNumber)
    return Citizen.InvokeNative(0x36731AC041289BB1, PlayerPedId(), CoreNumber)
end

function GetPlayerDollars()
    Citizen.InvokeNative(0xFA925AC00EB830B9, 10, "LITERAL_STRING", text, Citizen.ResultAsLong())
end

function GetPlayerCents()
    Citizen.InvokeNative(0xFA925AC00EB830B9, 2, "CASH_STRING", amountInCents, Citizen.ResultAsLong())
end

function DisplayTempeature()
    Citizen.InvokeNative(0xFA925AC00EB830B9, PlayerPedId())
    Citizen.InvokeNative(0xD05590C1AB38F068, PlayerPedId())
    local TempeatureAtCoords = Citizen.InvokeNative(0xB98B78C3768AF6E0, GetEntityCoords(PlayerPedId(), false))
end

function GetCharacterName()
    return Character.first_name.." "..Character.last_name
end