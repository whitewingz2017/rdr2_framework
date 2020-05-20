local Gender = nil
RegisterNetEvent("SetClothingGender")
AddEventHandler("SetClothingGender", function(_Gender)
    Gender = _Gender
    print(Gender)
end)

RegisterCommand("loadclothes", function(source, args)
    WarMenu.OpenMenu("clothingstore")
end, false)

local cam = nil

function CloseClothingStore()
    WarMenu.CloseMenu()
end

local ComboBoxValues = {
    ["Hats"] = {CurrentIndex = 0, SelectedIndex = 0},
    ["Masks"] = {CurrentIndex = 0, SelectedIndex = 0},
    ["Eyewear"] = {CurrentIndex = 0, SelectedIndex = 0},
    ["Shirts"] = {CurrentIndex = 0, SelectedIndex = 0},
    ["Vests"] = {CurrentIndex = 0, SelectedIndex = 0},
    ["Coats"] = {CurrentIndex = 0, SelectedIndex = 0},
    ["Belts"] = {CurrentIndex = 0, SelectedIndex = 0},
    ["Pants"] = {CurrentIndex = 0, SelectedIndex = 0},
    ["Boots"] = {CurrentIndex = 0, SelectedIndex = 0},
    ["Gloves"] = {CurrentIndex = 0, SelectedIndex = 0},
    ["Spurs"] = {CurrentIndex = 0, SelectedIndex = 0},
    ["Suspenders"] = {CurrentIndex = 0, SelectedIndex = 0},
    ["Armor"] = {CurrentIndex = 0, SelectedIndex = 0},
    ["Access"] = {CurrentIndex = 0, SelectedIndex = 0},
    ["Bracelets"] = {CurrentIndex = 0, SelectedIndex = 0},
    ["Badges"] = {CurrentIndex = 0, SelectedIndex = 0},
    ["BeltBuckles"] = {CurrentIndex = 0, SelectedIndex = 0},
    ["Cloaks"] = {CurrentIndex = 0, SelectedIndex = 0},
    ["Chaps"] = {CurrentIndex = 0, SelectedIndex = 0},
    ["Gauntlets"] = {CurrentIndex = 0, SelectedIndex = 0},
    ["Gunbelts"] = {CurrentIndex = 0, SelectedIndex = 0},
    ["Legats"] = {CurrentIndex = 0, SelectedIndex = 0},
    ["Neckties"] = {CurrentIndex = 0, SelectedIndex = 0},
    ["Offhand"] = {CurrentIndex = 0, SelectedIndex = 0},
    ["Ponchos"] = {CurrentIndex = 0, SelectedIndex = 0},
    ["Spats"] = {CurrentIndex = 0, SelectedIndex = 0},
    ["Skirts"] = {CurrentIndex = 0, SelectedIndex = 0},
    ["Satchels"] = {CurrentIndex = 0, SelectedIndex = 0},
    ["Teeth"] = {CurrentIndex = 0, SelectedIndex = 0},
}

function Camera(zoom, offset)
	DestroyAllCams(true)
    local playerPed = PlayerPedId()
    local coords    = GetEntityCoords(playerPed)
    local heading = 45.0
    local zoomOffset = zoom
    local camOffset = offset
    local angle = heading * math.pi / 180.0
    local theta = {
        x = math.cos(angle),
        y = math.sin(angle)
    }
    local pos = {
        x = coords.x + (zoomOffset * theta.x),
        y = coords.y + (zoomOffset * theta.y)
    }
    local angleToLook = heading - 140.0
    if angleToLook > 360 then
        angleToLook = angleToLook - 360
    elseif angleToLook < 0 then
        angleToLook = angleToLook + 360
    end
    angleToLook = angleToLook * math.pi / 180.0
    local thetaToLook = {
        x = math.cos(angleToLook),
        y = math.sin(angleToLook)
    }
    local posToLook = {
        x = coords.x + (zoomOffset * thetaToLook.x),
        y = coords.y + (zoomOffset * thetaToLook.y)
    }

    SetEntityHeading(playerPed, 334.00)
    cam = CreateCamWithParams("DEFAULT_SCRIPTED_CAMERA", pos.x-0.6, pos.y, coords.z + camOffset, 300.00,0.00,0.00, 40.00, false, 0)
    PointCamAtCoord(cam, posToLook.x, posToLook.y, coords.z + camOffset)
    SetCamActive(cam, true)
    RenderScriptCams(true, true, 500, true, true)
    DisplayHud(false)
    DisplayRadar(false)
end

Citizen.CreateThread(function()
    for Category, Data in pairs(Clothes.Female) do
        local CurrentCategory = tostring(Category)
        WarMenu.CreateSubMenu(string.lower(CurrentCategory), "clothingstore", CurrentCategory)
    end
    while true do
        Citizen.Wait(0)
        if WarMenu.IsMenuOpened("clothingstore") then
            if Gender == 2 then
                for Category, Data in pairs(Clothes.Female) do
                    local CurrentCategory = tostring(Category)
                    if WarMenu.Button(CurrentCategory) then
                        WarMenu.OpenMenu(string.lower(CurrentCategory))
                        print("Opening "..CurrentCategory)
                    end
                end
            else
                for Category, Data in pairs(Clothes.Male) do
                    local CurrentCategory = tostring(Category)
                    if WarMenu.Button(CurrentCategory) then
                        WarMenu.OpenMenu(string.lower(CurrentCategory))
                    end
                end
            end
            WarMenu.Display()
        end
        if Gender == 2 then
            for Category, Data in pairs(Clothes.Female) do
                local CurrentCategory = tostring(Category)
                if WarMenu.IsMenuOpened(string.lower(CurrentCategory)) then
                    for Type, Variant in pairs(Data) do
                        if WarMenu.ComboBox(Variant[1].Name, Variant, ComboBoxValues[CurrentCategory].CurrentIndex, ComboBoxValues[CurrentCategory].SelectedIndex, function(currentIndex, selectedIndex)
                            ComboBoxValues[CurrentCategory].CurrentIndex = currentIndex
                            ComboBoxValues[CurrentCategory].SelectedIndex = selectedIndex
                        end) then
                            if ComboBoxValues[CurrentCategory].CurrentIndex == 0 then
                                Citizen.InvokeNative(0xD710A5007C2AC539, PlayerPedId(), tonumber("0x"..Variant[1].Category), 0)
                                Citizen.InvokeNative(0xCC8CA3E88256E58F, PlayerPedId(), 0, 1, 1, 1, 0)
                            else
                                Citizen.InvokeNative(0xD710A5007C2AC539, PlayerPedId(), tonumber("0x"..Variant[1].Category), 0)
                                Citizen.InvokeNative(0xCC8CA3E88256E58F, PlayerPedId(), 0, 1, 1, 1, 0)
                                Citizen.InvokeNative(0xD3A7B003ED343FD9, PlayerPedId(), tonumber("0x"..Variant[ComboBoxValues[CurrentCategory].CurrentIndex].Hash),true,true,true)
                            end
                        end
                    end
                    WarMenu.Display()
                end
            end
        else
            for Category, Data in pairs(Clothes.Male) do
                local CurrentCategory = tostring(Category)
                if WarMenu.IsMenuOpened(string.lower(CurrentCategory)) then
                    for Type, Variant in pairs(Data) do
                        if WarMenu.ComboBox(Variant[1].Name, Variant, ComboBoxValues[CurrentCategory].CurrentIndex, ComboBoxValues[CurrentCategory].SelectedIndex, function(currentIndex, selectedIndex)
                            ComboBoxValues[CurrentCategory].CurrentIndex = currentIndex
                            ComboBoxValues[CurrentCategory].SelectedIndex = selectedIndex
                        end) then
                            if ComboBoxValues[CurrentCategory].CurrentIndex == 0 then
                                Citizen.InvokeNative(0xD710A5007C2AC539, PlayerPedId(), tonumber("0x"..Variant[1].Category), 0)
                                Citizen.InvokeNative(0xCC8CA3E88256E58F, PlayerPedId(), 0, 1, 1, 1, 0)
                            else
                                Citizen.InvokeNative(0xD710A5007C2AC539, PlayerPedId(), tonumber("0x"..Variant[1].Category), 0)
                                Citizen.InvokeNative(0xCC8CA3E88256E58F, PlayerPedId(), 0, 1, 1, 1, 0)
                                Citizen.InvokeNative(0xD3A7B003ED343FD9, PlayerPedId(), tonumber("0x"..Variant[ComboBoxValues[CurrentCategory].CurrentIndex].Hash),true,true,true)
                            end
                        end
                    end
                    WarMenu.Display()
                end
            end
        end
    end
end)
