RegisterNetEvent("RP-Notify.DisplayLeftNotification")
AddEventHandler("RP-Notify.DisplayLeftNotification", function(Title, Body, IconDic, IconTex, Duration)
    exports["rp-notify"]:DisplayLeftNotification(Title, Body, IconDic, IconTex, Duration)
end)