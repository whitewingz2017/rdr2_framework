RegisterServerEvent("Horse.Add.Inventory")
AddEventHandler("Horse.Add.Inventory", function(HorseID, Data)
    local Source = source
    exports["GHMattiMySQL"]:QueryResult("SELECT * FROM horse_inventory WHERE id = @horseid", {}, function()
        
    end)
end)

RegisterServerEvent("Horse.Remove.Inventory")
AddEventHandler("Horse.Remove.Inventory", function(HorseID, Data)
    local Source = source
    exports["GHMattiMySQL"]:QueryResult("SELECT * FROM horse_inventory WHERE id = @horseid", {}, function()
        
    end)
end)

RegisterServerEvent("Horse.Sync.Inventory")
AddEventHandler("Horse.Sync.Inventory", function(HorseID, Data)
    local Source = source
    exports["GHMattiMySQL"]:QueryResult("UPDATE FROM horse_inventory WHERE id = @horiseid", {}, function()
        
    end)
end)

RegisterServerEvent("Horse.Request.Inventory")
AddEventHandler("Horse.Request.Inventory", function(HorseID)
    local Source = source
    exports["GHMattiMySQL"]:QueryResult("SELECT * FROM horse_inventory WHERE id = @horseid", {}, function()
        
    end)
end)
