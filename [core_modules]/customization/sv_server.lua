RegisterServerEvent("RP-Customization.SaveSkin")
AddEventHandler("RP-Customization.SaveSkin", function(Data)
    local Source = source
    TriggerEvent("RP-Core.GetUser", Source, function(User)
        exports["GHMattiMySQL"]:QueryResultAsync("SELECT * FROM skins WHERE character_id = @character_id", {["@character_id"] = User.character_id}, function(result) 
            if #result == 0 and result ~= nil then
                exports["GHMattiMySQL"]:Insert("skins", {
                    {
                        ["character_id"] = User.character_id,
                        ["skin"] = Data,
                    }
                }, function(Result)
                end, true)
            else
                exports['GHMattiMySQL']:QueryAsync("UPDATE skins SET skin = @skin WHERE character_id = @character_id", {
                    ["@character_id"] = User.character_id,
                    ["@skin"] = Data,
                })
            end
        end)
    end)
end)

RegisterServerEvent("RP-Customization.LoadSkin")
AddEventHandler("RP-Customization.LoadSkin", function()
    local Source = source
    TriggerEvent("RP-Core.GetUser", Source, function(User)
        exports["GHMattiMySQL"]:QueryResultAsync("SELECT * FROM skins WHERE character_id = @character_id", {["character_id"] = User.character_id}, function(Results)
            TriggerClientEvent("RP-Customization.LoadSkin", Results[1].skin)
        end)
    end)
end)