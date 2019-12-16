Characters = {}
Config = {
    Character = {
        Wallet = 30.0,
        Bank = 100.0,
        Weight = 160.0,
        Coordinates = vector3(0.0, 0.0, 0.0),
    }
}

RegisterServerEvent("Retrieve.Characters")
AddEventHandler("Retrieve.Characters", function()
    local Source = source
    if Characters[Source] == nil then
        Characters[Source] = {}
    end
    if Users[Source] == nil then
        Users[Source] = {}
    end
    local steamid = false

    for k, v in pairs(GetPlayerIdentifiers(source)) do
        if string.sub(v, 1, string.len("steam:")) == "steam:" then
            steamid = v
        end
    end

    exports['GHMattiMySQL']:QueryResultAsync("SELECT * FROM players WHERE steam = @steam", {["@steam"] = steamid}, function(result)
        if #result > 0 then
            Users[Source] = result[1]
            exports["GHMattiMySQL"]:QueryResultAsync("SELECT * FROM characters WHERE player_id = @player_id", {["@player_id"] = Users[Source].id}, function(result)
                Characters[Source] = result
                TriggerClientEvent("Load.Characters", Source, Characters[Source])
            end)
        end
    end)
end)

function RetrieveNewCharactersList(Source)
    Characters[Source] = {}
    exports["GHMattiMySQL"]:QueryResultAsync("SELECT * FROM characters WHERE player_id = @player_id", {["@player_id"] = Users[Source].id}, function(result)
        Characters[Source] = result
        TriggerClientEvent("Create.Character", Source, Characters[Source])
    end)
end

RegisterServerEvent("Delete.Character")
AddEventHandler("Delete.Character", function(Data)
    local Source = source
    if Characters[Source].id == Data.id then
        exports["GHMattiMySQL"]:QueryResult("UPDATE characters SET deleted = @deleted WHERE id = @id", {["@deleted"] = 1, ["@id"] = Data.id})
        RetrieveNewCharactersList(Source)
    end
end)

RegisterServerEvent("Edit.Character")
AddEventHandler("Edit.Character", function(Data)
    local Source = source
    if Characters[Source].id == Data.id then
        exports["GHMattiMySQL"]:QueryResult("UPDATE characters SET first_name = @first_name, last_name = @last_name, dateofbirth = @dob, sex = @gender WHERE id = @id", {
            ["@first_name"] = Data.first_name,
            ["@last_name"] = Data.last_name,
            ["@dob"] = Data.dob,
            ["@gender"] = Data.sex,
            ["@id"] = Data.id
        })
        RetrieveNewCharactersList(Source)
    end
end)

RegisterServerEvent("Create.Character")
AddEventHandler("Create.Character", function(Data)
    local Source = source
    if Characters[Source].id == Data.id and Users[Source] then
        exports["GHMattiMySQL"]:Insert("characters", {
            {
                ["player_id"] = Users[Source].id,
                ["first_name"] = Data.first_name,
                ["last_name"] = Data.last_name,
                ["dob"] = Data.dob,
                ["sex"] = Data.sex,
                ["cash"] = Config.Character.Wallet,
                ["bank"] = Config.Character.Bank,
                ["coordinates_x"] = Config.Character.Coordinates.x,
                ["coordinates_y"] = Config.Character.Coordinates.y,
                ["coordinates_z"] = Config.Character.Coordinates.z,
            }
        }, function(character_id)
            RetrieveNewCharactersList(Source)
        end, true)
    end
end)

RegisterServerEvent("Select.Character")
AddEventHandler("Select.Character", function(Character)
    local Source = source
    for Index = 1, #Characters[Source] do
        if Characters[Source][Index].id == Character.id then
            Characters[Source] = Characters[Source][Index]
            TriggerEvent("Retrieve.Character.Customization", Source)
            TriggerEvent("Retrieve.Weapons", Source)
            TriggerEvent("Retrieve.Inventory", Source)
            TriggerClientEvent("Select.Character", Source, Characters[Source])
        end
    end
end)