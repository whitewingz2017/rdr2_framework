Weapons = {}

RegisterServerEvent("Retrieve.Weapons")
AddEventHandler("Retrieve.Weapons", function(Source)
    exports["GHMattiMySQL"]:QueryResultAsync("SELECT * FROM weapons WHERE character_id = @character_id", {["character_id"] = exports["rp-core"]:GetCharacterId(Source)}, function(result)
        if #result > 0 then
            Weapons[Source] = result
        else
            Weapons[Source] = {}
        end
        TriggerClientEvent("Load.Weapons", Source, Weapons[Source])
    end)
end)