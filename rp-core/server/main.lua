Users = {

}

function OnPlayerConnecting(name, setKickReason, deferrals)
    local Source = source
    print('Player ' .. GetPlayerName(source) .. ' connecting!')
    local steamid  = false
    local license  = false
    local discord  = false
    local xbl      = false
    local liveid   = false
    local ip       = false
    deferrals.defer()

    deferrals.update(string.format("Hello %s. Your steam id is being checked.", name))

    for k, v in pairs(GetPlayerIdentifiers(source)) do
        if string.sub(v, 1, string.len("steam:")) == "steam:" then
            steamid = v
        elseif string.sub(v, 1, string.len("license:")) == "license:" then
            license = v
        elseif string.sub(v, 1, string.len("xbl:")) == "xbl:" then
            xbl  = v
        elseif string.sub(v, 1, string.len("ip:")) == "ip:" then
            ip = v
        elseif string.sub(v, 1, string.len("discord:")) == "discord:" then
            discord = v
        elseif string.sub(v, 1, string.len("live:")) == "live:" then
            liveid = v
        end
    end

    if not steamid then
        deferrals.done("%s, you are not connected to steam.", name)
    else
        exports['GHMattiMySQL']:QueryResultAsync("SELECT * FROM players WHERE steam = @steam", {["@steam"] = steamid}, function(result)
            if #result <= 0 then
                exports['GHMattiMySQL']:QueryAsync("INSERT INTO players (`steam`, `ip`) VALUES (@steam, @ip)", {
                    ["@steam"] = steamid,
                    ["@ip"] = ip,
                })
                deferrals.done()
            else
                exports['GHMattiMySQL']:QueryAsync("UPDATE players SET last_seen = CURRENT_TIMESTAMP WHERE steam = @steam", {
                    ["@steam"] = steamid,
                })
                deferrals.done()
            end
        end)
    end
end

AddEventHandler("playerConnecting", OnPlayerConnecting)

AddEventHandler('playerDropped', function(reason)
    print('Player ' .. GetPlayerName(source) .. ' dropped (Reason: ' .. reason .. '')
    table.remove(Users, source)
end)