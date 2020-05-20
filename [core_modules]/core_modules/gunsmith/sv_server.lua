local Weapons = {

}

RegisterServerEvent("RP-Gunsmith.PurchaseWeapon")
AddEventHandler("RP-Gunsmith.PurchaseWeapon", function(Weapon)
    local Source = source
    TriggerClientEvent("RP-Gunsmith.PurchaseWeapon", Source, Weapon)
end)