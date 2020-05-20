-- Gunsmith
local Gunsmiths = {
    [1] = {Coords = vector3(-281.33264160156, 780.70416259766, 119.52701568604)},
}

-- local Weapons = exports["core"]:GetWeaponTable()

RegisterCommand("giveweapon", function(source, args)
    GivePlayerWeapon(tostring(args[1]))
end, false)

RegisterCommand("removeweapons", function(source, args)
    RemoveAllPedWeapons(PlayerPedId(), true, true)
end, false)

RegisterNetEvent("RP-Gunsmith.PurchaseWeapon")
AddEventHandler("RP-Gunsmith.PurchaseWeapon", function(Weapon)
    GivePlayerWeapon(Weapon)
end)

Citizen.CreateThread(function()
    Prompt = Citizen.InvokeNative(0x29FA7910726C3889, 0xCEFD9220, CreateVarString(10, "LITERAL_STRING", "Open Shop"), 6, 1, 1, -1)
    PromptSetEnabled(Prompt, false)
    PromptSetVisible(Prompt, false)
    Citizen.InvokeNative(0x74C7D7B72ED0D3CF, Prompt, 2000)
    while true do
        Citizen.Wait(0)
        local Player = PlayerPedId()
        local PlayerPosition = GetEntityCoords(Player, false)
        for Index = 1, #Gunsmiths do
            if #(PlayerPosition - Gunsmiths[Index].Coords) < 2.0 then
                PromptSetEnabled(Prompt, true)
                PromptSetVisible(Prompt, true)
                if Citizen.InvokeNative(0xE0F65F0640EF0617, Prompt, false) then
                    WarMenu.OpenMenu("gunsmith")
                    WarMenu.Display()
                    -- Citizen.InvokeNative(0xAE72E7DF013AAA61 , PlayerPedId(), 1807503187, -2005122350, 1, 0, -1082130432)
                    -- Citizen.InvokeNative(0x75CFAC49301E134F, false, 0)
                end
            else
                if Citizen.InvokeNative(0x0D00EDDFB58B7F28, Prompt) then
                    PromptSetEnabled(Prompt, false)
                    PromptSetVisible(Prompt, false)
                end
            end
        end
    end
end)

Citizen.CreateThread(function()
    while true do
        Citizen.Wait(0)
        if WarMenu.IsMenuOpened("gunsmith") then
            WarMenu.MenuButton("Revolvers", "revolvers")
            WarMenu.MenuButton("Repeaters", "repeaters")
            WarMenu.MenuButton("Rifles", "rifles")
            WarMenu.MenuButton("Shotguns", "shotguns")
            WarMenu.MenuButton("Bow", "bow")
            WarMenu.Display()
        else
            -- if WarMenu.IsMenuOpened("revolvers") then
            --     TriggerServerEvent("RP-Gunsmith.PurchaseWeapon")
            --     WarMenu.Display()
            -- elseif WarMenu.IsMenuOpened("repeaters") then
            --     TriggerServerEvent("RP-Gunsmith.PurchaseWeapon")
            --     WarMenu.Display()
            -- elseif WarMenu.IsMenuOpened("rifles") then
            --     TriggerServerEvent("RP-Gunsmith.PurchaseWeapon")
            --     WarMenu.Display()
            -- elseif WarMenu.IsMenuOpened("shotguns") then
            --     TriggerServerEvent("RP-Gunsmith.PurchaseWeapon")
            --     WarMenu.Display()
            -- elseif WawrMenu.IsMenuOpened("bow") then
            --     if WarMenu.Button("Bow") then 
            --         TriggerServerEvent("RP-Gunsmith.PurchaseWeapon")
            --         WarMenu.Display()
            --     end
            -- end
            -- WarMenu.Display()
        end
    end
end)