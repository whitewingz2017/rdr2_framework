UserWeapons = {}

RegisterNetEvent("Load.Weapons")
AddEventHandler("Load.Weapons", function(Weapons)
    UserWeapons = Weapons
    Citizen.CreateThread(function()
        Citizen.Wait(0)
        for Index = 1, #UserWeapons do
            Citizen.InvokeNative(0xB282DC6EBD803C75, PlayerPedId(), GetHashKey(UserWeapons[Index].model), UserWeapons[Index].ammo, true, 0)
        end
    end)
end)