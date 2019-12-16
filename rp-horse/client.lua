PlayerHorse = nil

function CreateHorseBlip(Promt, Name)
    local Horse = GetMount(PlayerPedId())
    local Group = Citizen.InvokeNative(0xB796970BD125FCE8, Horse, Citizen.ResultAsLong())
    PromptSetGroup(Name, Group, 0)
    SetPedPromptName(Horse, Name)
end

function CreatePlayerHorse(Model)
    if Horses[Model] ~= nil then
        local Model = GetHashKey(Model)
        RequestModel(Model)
        while not HasModelLoaded(Model) do
            Wait(0)
        end
        local PlayerPosition = GetEntityCoords(PlayerPedId(), false)
        local PlayerHeading = GetEntityHeading(PlayerPedId())
        PlayerHorse = CreatePed(Model, PlayerPosition.x, PlayerPosition.y, PlayerPosition.y, PlayerHeading, true, false, false, false)
        Citizen.InvokeNative(0x283978A15512B2FE, PlayerHorse, true)
        SetPedOnMount(PlayerPedId(), PlayerHorse, -1, false)
        CreateHorseBlip("Pepega Clap", "Pepega Clap")
    end
end
