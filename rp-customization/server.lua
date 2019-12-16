RegisterServerEvent("Retrieve.Character.Customization")
AddEventHandler("Retrieve.Character.Customization", function(Source)
    local Character = {}
    exports["GHMattiMySQL"]:QueryResultAsync("SELECT * FROM customization WHERE character_id = @character_id", {["character_id"] = exports["rp-core"]:GetCharacterId(Source)}, function(result)
        if #result > 0 then
            Character = result[1]
        end
        TriggerClientEvent("Load.Character.Customization", Source, Character)
    end)
end)