RegisterServerEvent("Chat:OOC")
AddEventHandler("Chat:OOC", function(message)
    local author = GetPlayerName(source)
    TriggerClientEvent("chat:addMessage", -1, {color = {30, 144, 255}, multiline = true, args = {"^0[^3"..source.."^0]^8"..author, message}})
end)

function stringsplit(inputstr, sep)
    if sep == nil then
        sep = "%s"
    end
    local t={} ; i=1
    for str in string.gmatch(inputstr, "([^"..sep.."]+)") do
        t[i] = str
        i = i + 1
    end
    return t
end

AddEventHandler('chatMessage', function(source, author, message)
    local args = stringsplit(message, " ")
    CancelEvent()
    if args[1] then
        if not string.find(args[1], "/") then
            TriggerClientEvent("Chat:LOOC", -1, source, message)
        end
    end
end)
