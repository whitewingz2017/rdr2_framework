-- Character Creation
WarMenu.CreateMenu("charactercreator", "Appearance")
WarMenu.CreateSubMenu("advanced", "charactercreator", "      Advanced")
WarMenu.CreateSubMenu("eyebrows", "advanced", "      Eyebrows")
WarMenu.CreateSubMenu("ears", "advanced", "            Ears")
WarMenu.CreateSubMenu("cheekbones", "advanced", "    Cheekbones")
WarMenu.CreateSubMenu("jaw", "advanced", "            Jaw")
WarMenu.CreateSubMenu("chin", "advanced", "            Chin")
WarMenu.CreateSubMenu("eyes", "advanced", "            Eyes")
WarMenu.CreateSubMenu("nose", "advanced", "            Nose")
WarMenu.CreateSubMenu("mouth", "advanced", "            Mouth")
WarMenu.CreateSubMenu("lips", "advanced", "            Lips")

local FacialStructures = {
    ["head"] = {
        ["0x84D6"] = {CurrentIndex = 0.0, SelectedIndex = 0.0}, --head width
    },
    ["eyebrows"] = {
        ["0x3303"] = {CurrentIndex = 0.0, SelectedIndex = 0.0}, --eyebrow height
        ["0x2FF9"] = {CurrentIndex = 0.0, SelectedIndex = 0.0}, --eyebrow width
        ["0x4AD1"] = {CurrentIndex = 0.0, SelectedIndex = 0.0}, --eyebrow depth
    },
    ["ears"] = {
        ["0xC04F"] = {CurrentIndex = 0.0, SelectedIndex = 0.0}, --ears width
        ["0xB6CE"] = {CurrentIndex = 0.0, SelectedIndex = 0.0}, --ears angle
        ["0x2844"] = {CurrentIndex = 0.0, SelectedIndex = 0.0}, --ears height
        ["0xED30"] = {CurrentIndex = 0.0, SelectedIndex = 0.0}, --earlobe size
    },
    ["cheekbones"] = {
        ["0x6A0B"] = {CurrentIndex = 0.0, SelectedIndex = 0.0}, --cheekbones height
        ["0xABCF"] = {CurrentIndex = 0.0, SelectedIndex = 0.0}, --cheekbones width
        ["0x358D"] = {CurrentIndex = 0.0, SelectedIndex = 0.0}, --cheekbones depth
    },
    ["jaw"] = {
        ["0x8D0A"] = {CurrentIndex = 0.0, SelectedIndex = 0.0}, --jaw height
        ["0xEBAE"] = {CurrentIndex = 0.0, SelectedIndex = 0.0}, --jaw width
        ["0x1DF6"] = {CurrentIndex = 0.0, SelectedIndex = 0.0}, --jaw depth
    },
    ["chin"] = {
        ["0x3C0F"] = {CurrentIndex = 0.0, SelectedIndex = 0.0}, --chin height
        ["0xC3B2"] = {CurrentIndex = 0.0, SelectedIndex = 0.0}, --chin width
        ["0xE323"] = {CurrentIndex = 0.0, SelectedIndex = 0.0}, --chin depth
    },
    ["eyes"] = {
        ["0x8B2B"] = {CurrentIndex = 0.0, SelectedIndex = 0.0}, --eyelid height
        ["0x1B6B"] = {CurrentIndex = 0.0, SelectedIndex = 0.0}, --eyelid width
        ["0xEE44"] = {CurrentIndex = 0.0, SelectedIndex = 0.0}, --eyes depth
        ["0xD266"] = {CurrentIndex = 0.0, SelectedIndex = 0.0}, --eyes angle
        ["0xA54E"] = {CurrentIndex = 0.0, SelectedIndex = 0.0}, --eyes distance
        ["0xDDFB"] = {CurrentIndex = 0.0, SelectedIndex = 0.0}, --eyes height
    },
    ["nose"] = {
        ["0x6E7F"] = {CurrentIndex = 0.0, SelectedIndex = 0.0}, --nose width
        ["0x3471"] = {CurrentIndex = 0.0, SelectedIndex = 0.0}, --nose size
        ["0x03F5"] = {CurrentIndex = 0.0, SelectedIndex = 0.0}, --nose height
        ["0x34B1"] = {CurrentIndex = 0.0, SelectedIndex = 0.0}, --nose angle
        ["0xF156"] = {CurrentIndex = 0.0, SelectedIndex = 0.0}, --nose curvature
        ["0x561E"] = {CurrentIndex = 0.0, SelectedIndex = 0.0}, --nostrils distance
    },
    ["mouth"] = {
        ["0xF065"] = {CurrentIndex = 0.0, SelectedIndex = 0.0}, --mouth width
        ["0xAA69"] = {CurrentIndex = 0.0, SelectedIndex = 0.0}, --mouth depth
        ["0x7AC3"] = {CurrentIndex = 0.0, SelectedIndex = 0.0}, --mouth x pos
        ["0x410D"] = {CurrentIndex = 0.0, SelectedIndex = 0.0}, --mouth y pos
    },
    ["lips"] = {
        ["0x1A00"] = {CurrentIndex = 0.0, SelectedIndex = 0.0}, --upper lip height
        ["0x91C1"] = {CurrentIndex = 0.0, SelectedIndex = 0.0}, --upper lip width
        ["0xC375"] = {CurrentIndex = 0.0, SelectedIndex = 0.0}, --upper lip depth
        ["0xBB4D"] = {CurrentIndex = 0.0, SelectedIndex = 0.0}, --lower lip height
        ["0xB0B0"] = {CurrentIndex = 0.0, SelectedIndex = 0.0}, --lower lip width
        ["0x5D16"] = {CurrentIndex = 0.0, SelectedIndex = 0.0}, --lower lip depth
    },
    ["horse"] = {
        ["0xA28B"] = {CurrentIndex = 0.0, SelectedIndex = 0.0}, --horse gender (0.0 = female, 1.0 = male)
    },
}

FacialValues = {0.01, 0.02, 0.03, 0.04, 0.05, 0.06, 0.07, 0.08, 0.09, 0.1, 0.11, 0.12, 0.13, 0.14, 0.15, 0.16, 0.17, 0.18, 0.19, 0.2, 0.21, 0.22, 0.23, 0.24, 0.25, 0.26, 0.27, 0.28, 0.29, 0.3, 0.31, 0.32, 0.33, 0.34, 0.35, 0.36, 0.37, 0.38, 0.39, 0.4, 0.41, 0.42, 0.43, 0.44, 0.45, 0.46, 0.47, 0.48, 0.49, 0.5, 0.51, 0.52, 0.53, 0.54, 0.55, 0.56, 0.57, 0.58, 0.59, 0.6, 0.61, 0.62, 0.63, 0.64, 0.65, 0.66, 0.67, 0.68, 0.69, 0.7, 0.71, 0.72, 0.73, 0.74, 0.75, 0.76, 0.77, 0.78, 0.79, 0.8, 0.81, 0.82, 0.83, 0.84, 0.85, 0.86, 0.87, 0.88, 0.89, 0.9, 0.91, 0.92, 0.93, 0.94, 0.95, 0.96, 0.97, 0.98, 0.99, 1}
local cam = nil
RegisterNetEvent('RP-Customization.OpenCreator')
AddEventHandler('RP-Customization.OpenCreator', function(source)
	Wait(2000)
    local ped = PlayerPedId()
    SetEntityCoords(ped, -329.24, 775.37, 120.65)
    SetEntityHeading(ped, 245.05)
    cam = CreateCamWithParams("DEFAULT_SCRIPTED_CAMERA", -326.12,774.84,121.64, 300.00,0.00,0.00, 40.00, false, 0)
    PointCamAtCoord(cam, -329.24, 775.37, 121.53)
    SetCamActive(cam, true)
    RenderScriptCams(true, false, 1, true, true)
    DisplayHud(false)
    DisplayRadar(false)
    FreezeEntityPosition(ped, true)
    WarMenu.OpenMenu("charactercreator")
    WarMenu.Display()
    print(GetLabelTextByHash(0x7AAF0757))
end)

function CloseCustomization()
    WarMenu.CloseMenu()
    FreezeEntityPosition(PlayerPedId(), false)
    DisplayHud(true)
    DisplayRadar(true)
    SetCamActive(cam, false)
    DestroyCam(cam, true)
    DestroyAllCams()
end

function SetSkin(Data)
    local Model = "mp_male"
    if Data.Sex == 1 then
        Model = "mp_male"
    else
        Model = "mp_female"
    end
    Citizen.CreateThread(function()
        local model = GetHashKey(tostring(Model))

        RequestModel(model)
        while not HasModelLoaded(model) do
            Citizen.Wait(1)
        end

        SetPlayerModel(PlayerId(), model, false)
        SetEntityVisible(PlayerPedId(), true, 0)
        Citizen.InvokeNative(0x283978A15512B2FE, PlayerPedId(), true)
        if Data.Sex == 1 then
            Citizen.InvokeNative(0xA5BAE410B03E7371 ,PlayerPedId(),math.floor(Data.FaceSize + 109),true,true)
            Citizen.InvokeNative(0xD3A7B003ED343FD9, PlayerPedId(), tonumber("0x"..Data.Face),true,true,true)
            Citizen.Wait(300)
            Citizen.InvokeNative(0xA5BAE410B03E7371 ,PlayerPedId(),math.floor(Data.BodySize + 123),true,true)
            Citizen.InvokeNative(0xD3A7B003ED343FD9, PlayerPedId(), tonumber("0x"..Data.Face),true,true,true)
            Citizen.Wait(500)
            Citizen.InvokeNative(0xD3A7B003ED343FD9, PlayerPedId(), tonumber("0x"..Data.Eyes),true,true,true)
            Citizen.Wait(500)
            Citizen.InvokeNative(0xD3A7B003ED343FD9, PlayerPedId(), tonumber("0x"..Data.Hair),true,true,true)
            Citizen.Wait(500)
            Citizen.InvokeNative(0xD3A7B003ED343FD9, PlayerPedId(), tonumber("0x"..Data.FacialHair),true,true,true)
            Citizen.Wait(500)
            Citizen.InvokeNative(0xD3A7B003ED343FD9, PlayerPedId(), tonumber(MaleSkins[Data.Skin].Torso),true,true,true)
            Citizen.Wait(500)
            Citizen.InvokeNative(0xD3A7B003ED343FD9, PlayerPedId(), tonumber(MaleSkins[Data.Skin].Legs),true,true,true)
        else
            Citizen.InvokeNative(0xA5BAE410B03E7371 ,PlayerPedId(),math.floor(Data.FaceSize + 95),true,true)
            Citizen.InvokeNative(0xD3A7B003ED343FD9, PlayerPedId(), tonumber("0x"..Data.Face),true,true,true)
            Citizen.Wait(300)
            Citizen.InvokeNative(0xA5BAE410B03E7371 ,PlayerPedId(),math.floor(Data.BodySize + 109),true,true)
            Citizen.InvokeNative(0xD3A7B003ED343FD9, PlayerPedId(), tonumber("0x"..Data.Face),true,true,true)
            Citizen.Wait(500)
            Citizen.InvokeNative(0xD3A7B003ED343FD9, PlayerPedId(), tonumber("0x"..Data.Eyes),true,true,true)
            Citizen.Wait(500)
            Citizen.InvokeNative(0xD3A7B003ED343FD9, PlayerPedId(), tonumber("0x"..Data.Hair),true,true,true)
            Citizen.Wait(500)
            Citizen.InvokeNative(0xD3A7B003ED343FD9, PlayerPedId(), tonumber(FemaleSkins[Data.Skin].Torso),true,true,true)
            Citizen.Wait(500)
            Citizen.InvokeNative(0xD3A7B003ED343FD9, PlayerPedId(), tonumber(FemaleSkins[Data.Skin].Legs),true,true,true)
        end
        for Key, Component in pairs(Data.Eyebrows) do
            for k, v in pairs(Component) do
                Citizen.InvokeNative(0x5653AB26C82938CF, Player, tonumber(v.Hash), v.Value)
                Citizen.InvokeNative(0xCC8CA3E88256E58F, Player, false, true, true, true, false)
            end
        end
        for Key, Component in pairs(Data.Ears) do
            for k, v in pairs(Component) do
                Citizen.InvokeNative(0x5653AB26C82938CF, Player, tonumber(v.Hash), v.Value)
                Citizen.InvokeNative(0xCC8CA3E88256E58F, Player, false, true, true, true, false)
            end
        end
        for Key, Component in pairs(Data.Cheekbones) do
            for k, v in pairs(Component) do
                Citizen.InvokeNative(0x5653AB26C82938CF, Player, tonumber(v.Hash), v.Value)
                Citizen.InvokeNative(0xCC8CA3E88256E58F, Player, false, true, true, true, false)
            end
        end
        for Key, Component in pairs(Data.Jaw) do
            for k, v in pairs(Component) do
                Citizen.InvokeNative(0x5653AB26C82938CF, Player, tonumber(v.Hash), v.Value)
                Citizen.InvokeNative(0xCC8CA3E88256E58F, Player, false, true, true, true, false)
            end
        end
        for Key, Component in pairs(Data.Chin) do
            for k, v in pairs(Component) do
                Citizen.InvokeNative(0x5653AB26C82938CF, Player, tonumber(v.Hash), v.Value)
                Citizen.InvokeNative(0xCC8CA3E88256E58F, Player, false, true, true, true, false)
            end
        end
        for Key, Component in pairs(Data.Eyes2) do
            for k, v in pairs(Component) do
                Citizen.InvokeNative(0x5653AB26C82938CF, Player, tonumber(v.Hash), v.Value)
                Citizen.InvokeNative(0xCC8CA3E88256E58F, Player, false, true, true, true, false)
            end
        end
        for Key, Component in pairs(Data.Nose) do
            for k, v in pairs(Component) do
                Citizen.InvokeNative(0x5653AB26C82938CF, Player, tonumber(v.Hash), v.Value)
                Citizen.InvokeNative(0xCC8CA3E88256E58F, Player, false, true, true, true, false)
            end
        end
        for Key, Component in pairs(Data.Mouth) do
            for k, v in pairs(Component) do
                Citizen.InvokeNative(0x5653AB26C82938CF, Player, tonumber(v.Hash), v.Value)
                Citizen.InvokeNative(0xCC8CA3E88256E58F, Player, false, true, true, true, false)
            end
        end
        for Key, Component in pairs(Data.Lips) do
            for k, v in pairs(Component) do
                Citizen.InvokeNative(0x5653AB26C82938CF, Player, tonumber(v.Hash), v.Value)
                Citizen.InvokeNative(0xCC8CA3E88256E58F, Player, false, true, true, true, false)
            end
        end
    end)
end

RegisterNetEvent("RP-Customization.LoadSkin")
AddEventHandler("RP-Customization.LoadSkin", function(Data)
    local CharacterSkin = json.decode(Data)
    SetSkin(CharacterSkin)
    TriggerEvent("RP-Core_Modules.SetClothingGender", CharacterSkin.Sex)
end)

function SetGender(Sex)
    local Model = "mp_male"
    if Sex == 1 then
        Model = "mp_male"
    else
        Model = "mp_female"
    end
    Citizen.CreateThread(function()
        local model = GetHashKey(tostring(Model))

        RequestModel(model)
        while not HasModelLoaded(model) do
            Citizen.Wait(1)
        end

        SetPlayerModel(PlayerId(), model, false)
        SetEntityVisible(PlayerPedId(), true, 0)
        Citizen.InvokeNative(0x283978A15512B2FE, PlayerPedId(), true)
        Citizen.Wait(1000)
        -- Citizen.InvokeNative(0xD3A7B003ED343FD9, PlayerPedId(), 0x10F5497A,true,true,true)  --PANTS
        -- Citizen.InvokeNative(0xD3A7B003ED343FD9, PlayerPedId(), 0x14511493,true,true,true)  --COAT
    end)
end

local ComboBoxValues = {
    Sex = {
        CurrentIndex = 1,
        SelectedIndex = 1,
    },
    Male = {

        Hair = {
            CurrentIndex = 1,
            SelectedIndex = 1,
        },
        Eyes = {
            CurrentIndex = 1,
            SelectedIndex = 1,
        },
        Face = {
            CurrentIndex = 1,
            SelectedIndex = 1,
        },
        FacialHair = {
            CurrentIndex = 1,
            SelectedIndex = 1,
        },
        SkinColor = {
            CurrentIndex = 1,
            SelectedIndex = 1,
        },
        BodyWeight = {
            CurrentIndex = 1,
            SelectedIndex = 1,
        },
        FaceSize = {
            CurrentIndex = 1,
            SelectedIndex = 1,
        },
    },
    Female = {
        Hair = {
            CurrentIndex = 1,
            SelectedIndex = 1,
        },
        Eyes = {
            CurrentIndex = 1,
            SelectedIndex = 1,
        },
        Face = {
            CurrentIndex = 1,
            SelectedIndex = 1,
        },
        FacialHair = {
            CurrentIndex = 1,
            SelectedIndex = 1,
        },
        SkinColor = {
            CurrentIndex = 1,
            SelectedIndex = 1,
        },
        BodyWeight = {
            CurrentIndex = 1,
            SelectedIndex = 1,
        },
        FaceSize = {
            CurrentIndex = 1,
            SelectedIndex = 1,
        },
    },
    All = {
        
    }
}

local Sex = {
    "Male",
    "Female"
}

local FaceSize = {
    1,2,3,4,5,6,7,8,9,10,11,12,13
}

local BodyWeight = {
    1,2,3,4,5
}

 Citizen.CreateThread(function()
    while true do
        Citizen.Wait(0)
        local Player = PlayerPedId()
        if WarMenu.IsMenuOpened("charactercreator") then
            if ComboBoxValues.Sex.CurrentIndex == 1 then
                if WarMenu.ComboBox("Sex", Sex, ComboBoxValues.Sex.CurrentIndex, ComboBoxValues.Sex.SelectedIndex, "Choose your sex.", false, function(currentIndex, selectedIndex)
                    ComboBoxValues.Sex.CurrentIndex = currentIndex
                    ComboBoxValues.Sex.SelectedIndex = selectedIndex
                end) then
                    SetGender(ComboBoxValues.Sex.CurrentIndex)
                end
                if WarMenu.ComboBox("Heritage", MaleFaces, ComboBoxValues.Male.Face.CurrentIndex, ComboBoxValues.Male.Face.SelectedIndex, "Select your heritage as a base.", false, function(currentIndex, selectedIndex)
                    ComboBoxValues.Male.Face.CurrentIndex = currentIndex
                    ComboBoxValues.Male.Face.SelectedIndex = selectedIndex
                end) then
                    Citizen.InvokeNative(0xD3A7B003ED343FD9, Player, tonumber("0x"..MaleFaces[ComboBoxValues.Male.Face.CurrentIndex]), true, true, true)
                end
                if WarMenu.ComboBox("Face Size", FaceSize, ComboBoxValues.Male.FaceSize.CurrentIndex, ComboBoxValues.Male.FaceSize.SelectedIndex, "Select your base face structure.", false, function(currentIndex, selectedIndex)
                    ComboBoxValues.Male.FaceSize.CurrentIndex = currentIndex
                    ComboBoxValues.Male.FaceSize.SelectedIndex = selectedIndex
                end) then
                    Citizen.InvokeNative(0xA5BAE410B03E7371, Player, math.floor(ComboBoxValues.Male.FaceSize.CurrentIndex + 109),true,true)
                    Citizen.InvokeNative(0xD3A7B003ED343FD9, Player, tonumber("0x"..MaleFaces[ComboBoxValues.Male.Face.CurrentIndex]), true, true, true)
                end
                if WarMenu.ComboBox("Body Build", BodyWeight, ComboBoxValues.Male.BodyWeight.CurrentIndex, ComboBoxValues.Male.BodyWeight.SelectedIndex, "Select your body build.", false, function(currentIndex, selectedIndex)
                    ComboBoxValues.Male.BodyWeight.CurrentIndex = currentIndex
                    ComboBoxValues.Male.BodyWeight.SelectedIndex = selectedIndex
                end) then
                    Citizen.InvokeNative(0xA5BAE410B03E7371, Player, math.floor(ComboBoxValues.Male.BodyWeight.CurrentIndex + 123),true,true)
                    Citizen.InvokeNative(0xD3A7B003ED343FD9, Player, tonumber("0x"..MaleFaces[ComboBoxValues.Male.Face.CurrentIndex]), true, true, true)
                end
                if WarMenu.ComboBox("Skin Color", MaleSkins, ComboBoxValues.Male.SkinColor.CurrentIndex, ComboBoxValues.Male.SkinColor.SelectedIndex, "Select your skin tone.", false, function(currentIndex, selectedIndex)
                    ComboBoxValues.Male.SkinColor.CurrentIndex = currentIndex
                    ComboBoxValues.Male.SkinColor.SelectedIndex = selectedIndex
                end) then
                    Citizen.InvokeNative(0xD3A7B003ED343FD9, Player,tonumber(MaleSkins[ComboBoxValues.Male.SkinColor.CurrentIndex].Torso),true,true,true)
                    Citizen.InvokeNative(0xD3A7B003ED343FD9, Player,tonumber(MaleSkins[ComboBoxValues.Male.SkinColor.CurrentIndex].Legs),true,true,true)
                end
                if WarMenu.ComboBox("Eyes", MaleEyes, ComboBoxValues.Male.Eyes.CurrentIndex, ComboBoxValues.Male.Eyes.SelectedIndex, "Select your eye color", false, function(currentIndex, selectedIndex)
                    ComboBoxValues.Male.Eyes.CurrentIndex = currentIndex
                    ComboBoxValues.Male.Eyes.SelectedIndex = selectedIndex
                end) then
                    Citizen.InvokeNative(0xD3A7B003ED343FD9, Player, tonumber("0x"..MaleEyes[ComboBoxValues.Male.Eyes.CurrentIndex]), true, true, true)
                end
                if WarMenu.ComboBox("Facial Hair", MaleFacialHairs, ComboBoxValues.Male.FacialHair.CurrentIndex, ComboBoxValues.Male.FacialHair.SelectedIndex, "Select your facial hair style and color.", false, function(currentIndex, selectedIndex)
                    ComboBoxValues.Male.FacialHair.CurrentIndex = currentIndex
                    ComboBoxValues.Male.FacialHair.SelectedIndex = selectedIndex
                end) then
                    Citizen.InvokeNative(0xD3A7B003ED343FD9, Player, tonumber("0x"..MaleFacialHairs[ComboBoxValues.Male.FacialHair.CurrentIndex]), true, true, true)
                end
                if WarMenu.ComboBox("Hair", MaleHairs, ComboBoxValues.Male.Hair.CurrentIndex, ComboBoxValues.Male.Hair.SelectedIndex, "Select your hair style and color.", false, function(currentIndex, selectedIndex)
                    ComboBoxValues.Male.Hair.CurrentIndex = currentIndex
                    ComboBoxValues.Male.Hair.SelectedIndex = selectedIndex
                end) then
                    Citizen.InvokeNative(0xD3A7B003ED343FD9, Player, tonumber("0x"..MaleHairs[ComboBoxValues.Male.Hair.CurrentIndex]), true, true, true)
                end
            else
                if WarMenu.ComboBox("Sex", Sex, ComboBoxValues.Sex.CurrentIndex, ComboBoxValues.Sex.SelectedIndex, "Choose your sex.", false, function(currentIndex, selectedIndex)
                    ComboBoxValues.Sex.CurrentIndex = currentIndex
                    ComboBoxValues.Sex.SelectedIndex = selectedIndex
                end) then
                    SetGender(ComboBoxValues.Sex.CurrentIndex)
                end
                if WarMenu.ComboBox("Heritage", FemaleFaces, ComboBoxValues.Female.Face.CurrentIndex, ComboBoxValues.Female.Face.SelectedIndex, "Select your heritage as a base.", false, function(currentIndex, selectedIndex)
                    ComboBoxValues.Female.Face.CurrentIndex = currentIndex
                    ComboBoxValues.Female.Face.SelectedIndex = selectedIndex
                end) then
                    Citizen.InvokeNative(0xD3A7B003ED343FD9, Player, tonumber("0x"..FemaleFaces[ComboBoxValues.Female.Face.CurrentIndex]), true, true, true)
                end
                if WarMenu.ComboBox("Face Size", FaceSize, ComboBoxValues.Female.FaceSize.CurrentIndex, ComboBoxValues.Female.FaceSize.SelectedIndex, "Select your base face structure.", false, function(currentIndex, selectedIndex)
                    ComboBoxValues.Female.FaceSize.CurrentIndex = currentIndex
                    ComboBoxValues.Female.FaceSize.SelectedIndex = selectedIndex
                end) then
                    Citizen.InvokeNative(0xA5BAE410B03E7371, Player, math.floor(ComboBoxValues.Female.FaceSize.CurrentIndex + 95),true,true)
                    Citizen.InvokeNative(0xD3A7B003ED343FD9, Player, tonumber("0x"..FemaleFaces[ComboBoxValues.Female.Face.CurrentIndex]), true, true, true)
                end
                if WarMenu.ComboBox("Body Build", BodyWeight, ComboBoxValues.Female.BodyWeight.CurrentIndex, ComboBoxValues.Female.BodyWeight.SelectedIndex, "Select your body build.", false, function(currentIndex, selectedIndex)
                    ComboBoxValues.Female.BodyWeight.CurrentIndex = currentIndex
                    ComboBoxValues.Female.BodyWeight.SelectedIndex = selectedIndex
                end) then
                    Citizen.InvokeNative(0xA5BAE410B03E7371, Player, math.floor(ComboBoxValues.Female.BodyWeight.CurrentIndex + 109),true,true)
                    Citizen.InvokeNative(0xD3A7B003ED343FD9, Player, tonumber("0x"..FemaleFaces[ComboBoxValues.Female.Face.CurrentIndex]), true, true, true)
                end
                if WarMenu.ComboBox("Skin Color", FemaleSkins, ComboBoxValues.Female.SkinColor.CurrentIndex, ComboBoxValues.Female.SkinColor.SelectedIndex, "Select your skin tone.", false, function(currentIndex, selectedIndex)
                    ComboBoxValues.Female.SkinColor.CurrentIndex = currentIndex
                    ComboBoxValues.Female.SkinColor.SelectedIndex = selectedIndex
                end) then
                    Citizen.InvokeNative(0xD3A7B003ED343FD9, Player,tonumber(FemaleSkins[ComboBoxValues.Female.SkinColor.CurrentIndex].Torso),true,true,true)
                    Citizen.InvokeNative(0xD3A7B003ED343FD9, Player,tonumber(FemaleSkins[ComboBoxValues.Female.SkinColor.CurrentIndex].Legs),true,true,true)
                    Citizen.InvokeNative(0xD3A7B003ED343FD9, Player, 0x10F5497A,true,true,true)
                    Citizen.InvokeNative(0xD3A7B003ED343FD9, Player, 0x14511493,true,true,true)
                end
                if WarMenu.ComboBox("Eyes", FemaleEyes, ComboBoxValues.Female.Eyes.CurrentIndex, ComboBoxValues.Female.Eyes.SelectedIndex, "Select your eye color", false, function(currentIndex, selectedIndex)
                    ComboBoxValues.Female.Eyes.CurrentIndex = currentIndex
                    ComboBoxValues.Female.Eyes.SelectedIndex = selectedIndex
                end) then
                    Citizen.InvokeNative(0xD3A7B003ED343FD9, Player, tonumber("0x"..FemaleEyes[ComboBoxValues.Female.Eyes.CurrentIndex]), true, true, true)
                end
                if WarMenu.ComboBox("Hair", FemaleHairs, ComboBoxValues.Female.Hair.CurrentIndex, ComboBoxValues.Female.Hair.SelectedIndex, "Select your hair style and color.", false, function(currentIndex, selectedIndex)
                    ComboBoxValues.Female.Hair.CurrentIndex = currentIndex
                    ComboBoxValues.Female.Hair.SelectedIndex = selectedIndex
                end) then
                    Citizen.InvokeNative(0xD3A7B003ED343FD9, Player, tonumber("0x"..FemaleHairs[ComboBoxValues.Female.Hair.CurrentIndex]), true, true, true)
                end
            end
            if WarMenu.Button("Advanced") then
                WarMenu.OpenMenu("advanced")
                SetCamCoord(cam, -328.73945922852, 774.89464111328, 121.63385772705 + 0.4)
                PointCamAtCoord(cam, -329.24, 775.37, 121.53 + 0.7)
            end
            if WarMenu.Button("Finish") then
                WarMenu.CloseMenu()
                FreezeEntityPosition(Player, false)
                DisplayHud(true)
                DisplayRadar(true)
                SetCamActive(cam, false)
                DestroyCam(cam, true)
                DestroyAllCams()
                local Data = {}
                if ComboBoxValues.Sex.CurrentIndex == 1 then
                    Data = {
                        ["Sex"] = 1,
                        ["Face"] = MaleFaces[ComboBoxValues.Male.Face.CurrentIndex],
                        ["Skin"] = ComboBoxValues.Male.SkinColor.CurrentIndex,
                        ["Eyes"] = MaleEyes[ComboBoxValues.Male.Eyes.CurrentIndex],
                        ["FacialHair"] = MaleFacialHairs[ComboBoxValues.Male.FacialHair.CurrentIndex],
                        ["Hair"] = MaleHairs[ComboBoxValues.Male.Hair.CurrentIndex],
                        ["BodySize"] = ComboBoxValues.Male.BodyWeight.CurrentIndex,
                        ["FaceSize"] = ComboBoxValues.Male.FaceSize.CurrentIndex,
                        ["Eyebrows"] = {
                            ["One"] = {["Hash"] = "0x3303", ["Value"] = FacialStructures["eyebrows"]["0x3303"]},
                            ["Two"] = {["Hash"] = "0x2FF9", ["Value"] = FacialStructures["eyebrows"]["0x2FF9"]},
                            ["Three"] = {["Hash"] = "0x4AD1", ["Value"] = FacialStructures["eyebrows"]["0x4AD1"]},
                        },
                        ["Ears"] = {
                            ["One"] = {["Hash"] = "0xC04F", ["Value"] = FacialStructures["ears"]["0xC04F"]},
                            ["Two"] = {["Hash"] = "0xB6CE", ["Value"] = FacialStructures["ears"]["0xB6CE"]},
                            ["Three"] = {["Hash"] = "0x2844", ["Value"] = FacialStructures["ears"]["0x2844"]},
                            ["Four"] = {["Hash"] = "0xED30", ["Value"] = FacialStructures["ears"]["0xED30"]},
                        },
                        ["Cheekbones"] = {
                            ["One"] = {["Hash"] = "0x6A0B", ["Value"] = FacialStructures["cheekbones"]["0x6A0B"]},
                            ["Two"] = {["Hash"] = "0xABCF", ["Value"] = FacialStructures["cheekbones"]["0xABCF"]},
                            ["Three"] = {["Hash"] = "0x358D", ["Value"] = FacialStructures["cheekbones"]["0x358D"]},
                        },
                        ["Jaw"] = {
                            ["One"] = {["Hash"] = "0x8D0A", ["Value"] = FacialStructures["jaw"]["0x8D0A"]},
                            ["Two"] = {["Hash"] = "0xEBAE", ["Value"] = FacialStructures["jaw"]["0xEBAE"]},
                            ["Three"] = {["Hash"] = "0x1DF6", ["Value"] = FacialStructures["jaw"]["0x1DF6"]},
                        },
                        ["Chin"] = {
                            ["One"] = {["Hash"] = "0x3C0F", ["Value"] = FacialStructures["chin"]["0x3C0F"]},
                            ["Two"] = {["Hash"] = "0xC3B2", ["Value"] = FacialStructures["chin"]["0xC3B2"]},
                            ["Three"] = {["Hash"] = "0xE323", ["Value"] = FacialStructures["chin"]["0xE323"]},
                        },
                        ["Eyes2"] = {
                            ["One"] = {["Hash"] = "0x8B2B", ["Value"] = FacialStructures["eyes"]["0x8B2B"]},
                            ["Two"] = {["Hash"] = "0x1B6B", ["Value"] = FacialStructures["eyes"]["0x1B6B"]},
                            ["Three"] = {["Hash"] = "0xEE44", ["Value"] = FacialStructures["eyes"]["0xEE44"]},
                            ["Four"] = {["Hash"] = "0xD266", ["Value"] = FacialStructures["eyes"]["0xD266"]},
                            ["Five"] = {["Hash"] = "0xA54E", ["Value"] = FacialStructures["eyes"]["0xA54E"]},
                            ["Six"] = {["Hash"] = "0xDDFB", ["Value"] = FacialStructures["eyes"]["0xDDFB"]},
                        },
                        ["Nose"] = {
                            ["One"] = {["Hash"] = "0x6E7F", ["Value"] = FacialStructures["nose"]["0x6E7F"]},
                            ["Two"] = {["Hash"] = "0x3471", ["Value"] = FacialStructures["nose"]["0x3471"]},
                            ["Three"] = {["Hash"] = "0x03F5", ["Value"] = FacialStructures["nose"]["0x03F5"]},
                            ["Four"] = {["Hash"] = "0x34B1", ["Value"] = FacialStructures["nose"]["0x34B1"]},
                            ["Five"] = {["Hash"] = "0xF156", ["Value"] = FacialStructures["nose"]["0xF156"]},
                            ["Six"] = {["Hash"] = "0x561E", ["Value"] = FacialStructures["nose"]["0x561E"]},
                        },
                        ["Mouth"] = {
                            ["One"] = {["Hash"] = "0xF065", ["Value"] = FacialStructures["mouth"]["0xF065"]},
                            ["Two"] = {["Hash"] = "0xAA69", ["Value"] = FacialStructures["mouth"]["0xAA69"]},
                            ["Three"] = {["Hash"] = "0x7AC3", ["Value"] = FacialStructures["mouth"]["0x7AC3"]},
                            ["Four"] = {["Hash"] = "0x410D", ["Value"] = FacialStructures["mouth"]["0x410D"]},
                        },
                        ["Lips"] = {
                            ["One"] = {["Hash"] = "0x1A00", ["Value"] = FacialStructures["lips"]["0x1A00"]},
                            ["Two"] = {["Hash"] = "0x91C1", ["Value"] = FacialStructures["lips"]["0x91C1"]},
                            ["Three"] = {["Hash"] = "0xC375", ["Value"] = FacialStructures["lips"]["0xC375"]},
                            ["Four"] = {["Hash"] = "0xBB4D", ["Value"] = FacialStructures["lips"]["0xBB4D"]},
                            ["Five"] = {["Hash"] = "0xB0B0", ["Value"] = FacialStructures["lips"]["0xB0B0"]},
                            ["Six"] = {["Hash"] = "0x5D16", ["Value"] = FacialStructures["lips"]["0x5D16"]},
                        },
                    }
                else
                    Data = {
                        ["Sex"] = 2,
                        ["Face"] = FemaleFaces[ComboBoxValues.Female.Face.CurrentIndex],
                        ["Skin"] = ComboBoxValues.Female.SkinColor.CurrentIndex,
                        ["Eyes"] = FemaleEyes[ComboBoxValues.Female.Eyes.CurrentIndex],
                        ["Hair"] = FemaleHairs[ComboBoxValues.Female.Hair.CurrentIndex],
                        ["BodySize"] = ComboBoxValues.Female.BodyWeight.CurrentIndex,
                        ["FaceSize"] = ComboBoxValues.Female.FaceSize.CurrentIndex,
                        ["Eyebrows"] = {
                            ["One"] = {["Hash"] = "0x3303", ["Value"] = FacialStructures["eyebrows"]["0x3303"]},
                            ["Two"] = {["Hash"] = "0x2FF9", ["Value"] = FacialStructures["eyebrows"]["0x2FF9"]},
                            ["Three"] = {["Hash"] = "0x4AD1", ["Value"] = FacialStructures["eyebrows"]["0x4AD1"]},
                        },
                        ["Ears"] = {
                            ["One"] = {["Hash"] = "0xC04F", ["Value"] = FacialStructures["ears"]["0xC04F"]},
                            ["Two"] = {["Hash"] = "0xB6CE", ["Value"] = FacialStructures["ears"]["0xB6CE"]},
                            ["Three"] = {["Hash"] = "0x2844", ["Value"] = FacialStructures["ears"]["0x2844"]},
                            ["Four"] = {["Hash"] = "0xED30", ["Value"] = FacialStructures["ears"]["0xED30"]},
                        },
                        ["Cheekbones"] = {
                            ["One"] = {["Hash"] = "0x6A0B", ["Value"] = FacialStructures["cheekbones"]["0x6A0B"]},
                            ["Two"] = {["Hash"] = "0xABCF", ["Value"] = FacialStructures["cheekbones"]["0xABCF"]},
                            ["Three"] = {["Hash"] = "0x358D", ["Value"] = FacialStructures["cheekbones"]["0x358D"]},
                        },
                        ["Jaw"] = {
                            ["One"] = {["Hash"] = "0x8D0A", ["Value"] = FacialStructures["jaw"]["0x8D0A"]},
                            ["Two"] = {["Hash"] = "0xEBAE", ["Value"] = FacialStructures["jaw"]["0xEBAE"]},
                            ["Three"] = {["Hash"] = "0x1DF6", ["Value"] = FacialStructures["jaw"]["0x1DF6"]},
                        },
                        ["Chin"] = {
                            ["One"] = {["Hash"] = "0x3C0F", ["Value"] = FacialStructures["chin"]["0x3C0F"]},
                            ["Two"] = {["Hash"] = "0xC3B2", ["Value"] = FacialStructures["chin"]["0xC3B2"]},
                            ["Three"] = {["Hash"] = "0xE323", ["Value"] = FacialStructures["chin"]["0xE323"]},
                        },
                        ["Eyes2"] = {
                            ["One"] = {["Hash"] = "0x8B2B", ["Value"] = FacialStructures["eyes"]["0x8B2B"]},
                            ["Two"] = {["Hash"] = "0x1B6B", ["Value"] = FacialStructures["eyes"]["0x1B6B"]},
                            ["Three"] = {["Hash"] = "0xEE44", ["Value"] = FacialStructures["eyes"]["0xEE44"]},
                            ["Four"] = {["Hash"] = "0xD266", ["Value"] = FacialStructures["eyes"]["0xD266"]},
                            ["Five"] = {["Hash"] = "0xA54E", ["Value"] = FacialStructures["eyes"]["0xA54E"]},
                            ["Six"] = {["Hash"] = "0xDDFB", ["Value"] = FacialStructures["eyes"]["0xDDFB"]},
                        },
                        ["Nose"] = {
                            ["One"] = {["Hash"] = "0x6E7F", ["Value"] = FacialStructures["nose"]["0x6E7F"]},
                            ["Two"] = {["Hash"] = "0x3471", ["Value"] = FacialStructures["nose"]["0x3471"]},
                            ["Three"] = {["Hash"] = "0x03F5", ["Value"] = FacialStructures["nose"]["0x03F5"]},
                            ["Four"] = {["Hash"] = "0x34B1", ["Value"] = FacialStructures["nose"]["0x34B1"]},
                            ["Five"] = {["Hash"] = "0xF156", ["Value"] = FacialStructures["nose"]["0xF156"]},
                            ["Six"] = {["Hash"] = "0x561E", ["Value"] = FacialStructures["nose"]["0x561E"]},
                        },
                        ["Mouth"] = {
                            ["One"] = {["Hash"] = "0xF065", ["Value"] = FacialStructures["mouth"]["0xF065"]},
                            ["Two"] = {["Hash"] = "0xAA69", ["Value"] = FacialStructures["mouth"]["0xAA69"]},
                            ["Three"] = {["Hash"] = "0x7AC3", ["Value"] = FacialStructures["mouth"]["0x7AC3"]},
                            ["Four"] = {["Hash"] = "0x410D", ["Value"] = FacialStructures["mouth"]["0x410D"]},
                        },
                        ["Lips"] = {
                            ["One"] = {["Hash"] = "0x1A00", ["Value"] = FacialStructures["lips"]["0x1A00"]},
                            ["Two"] = {["Hash"] = "0x91C1", ["Value"] = FacialStructures["lips"]["0x91C1"]},
                            ["Three"] = {["Hash"] = "0xC375", ["Value"] = FacialStructures["lips"]["0xC375"]},
                            ["Four"] = {["Hash"] = "0xBB4D", ["Value"] = FacialStructures["lips"]["0xBB4D"]},
                            ["Five"] = {["Hash"] = "0xB0B0", ["Value"] = FacialStructures["lips"]["0xB0B0"]},
                            ["Six"] = {["Hash"] = "0x5D16", ["Value"] = FacialStructures["lips"]["0x5D16"]},
                        },
                    }
                end
                local Json = json.encode(Data)
                TriggerServerEvent("RP-Customization.SaveSkin", Json)
            end
            WarMenu.Display()
        end
        if WarMenu.IsMenuOpened('advanced') then
            if WarMenu.Button("Eyebrows") then
                WarMenu.OpenMenu("eyebrows")
            elseif WarMenu.Button("Ears") then
                WarMenu.OpenMenu("ears")
            elseif WarMenu.Button("Cheekbones") then
                WarMenu.OpenMenu("cheekbones")
            elseif WarMenu.Button("Jaw") then
                WarMenu.OpenMenu("jaw")
            elseif WarMenu.Button("Chin") then
                WarMenu.OpenMenu("chin")
            elseif WarMenu.Button("Eyes") then
                WarMenu.OpenMenu("eyes")
            elseif WarMenu.Button("Nose") then
                WarMenu.OpenMenu("nose")
            elseif WarMenu.Button("Mouth") then
                WarMenu.OpenMenu("mouth")
            elseif WarMenu.Button("Lips") then
                WarMenu.OpenMenu("lips")
            end
            WarMenu.Display()
        end
        if WarMenu.IsMenuOpened("eyebrows") then
            if WarMenu.ComboBox("Height", FacialValues, FacialStructures["eyebrows"]["0x3303"].CurrentIndex, FacialStructures["eyebrows"]["0x3303"].SelectedIndex, "Change your eyebrow height.", true, function(currentIndex, selectedIndex)
                FacialStructures["eyebrows"]["0x3303"].CurrentIndex = currentIndex
                FacialStructures["eyebrows"]["0x3303"].SelectedIndex = selectedIndex
            end) then
                Citizen.InvokeNative(0x5653AB26C82938CF, Player, tonumber("0x3303"), FacialStructures["eyebrows"]["0x3303"].CurrentIndex)
                Citizen.InvokeNative(0xCC8CA3E88256E58F, Player, false, true, true, true, false)
            end
            if WarMenu.ComboBox("Width", FacialValues, FacialStructures["eyebrows"]["0x2FF9"].CurrentIndex, FacialStructures["eyebrows"]["0x2FF9"].SelectedIndex, "Change your eyebrow width.", true, function(currentIndex, selectedIndex)
                FacialStructures["eyebrows"]["0x2FF9"].CurrentIndex = currentIndex
                FacialStructures["eyebrows"]["0x2FF9"].SelectedIndex = selectedIndex
            end) then
                Citizen.InvokeNative(0x5653AB26C82938CF, Player, tonumber("0x2FF9"), FacialStructures["eyebrows"]["0x2FF9"].CurrentIndex)
                Citizen.InvokeNative(0xCC8CA3E88256E58F, Player, false, true, true, true, false)
            end
            -- if WarMenu.ComboBox("Depth", FacialValues, FacialStructures["eyebrows"]["0x4AD1"].CurrentIndex, FacialStructures["eyebrows"]["0x4AD1"].SelectedIndex, "Change your eyebrow depth.", true, function(currentIndex, selectedIndex)
            --     FacialStructures["eyebrows"]["0x4AD1"].CurrentIndex = currentIndex
            --     FacialStructures["eyebrows"]["0x4AD1"].SelectedIndex = selectedIndex
            -- end) then
            --     Citizen.InvokeNative(0x5653AB26C82938CF, Player, tonumber("0x4AD1"), FacialStructures["eyebrows"]["0x4AD1"].CurrentIndex)
            --     Citizen.InvokeNative(0xCC8CA3E88256E58F, Player, false, true, true, true, false)
            -- end
            WarMenu.Display()
        end
        if WarMenu.IsMenuOpened("ears") then
            if WarMenu.ComboBox("Width", FacialValues, FacialStructures["ears"]["0xC04F"].CurrentIndex, FacialStructures["ears"]["0xC04F"].SelectedIndex, "Change your ear width.", true, function(currentIndex, selectedIndex)
                FacialStructures["ears"]["0xC04F"].CurrentIndex = currentIndex
                FacialStructures["ears"]["0xC04F"].SelectedIndex = selectedIndex
            end) then
                Citizen.InvokeNative(0x5653AB26C82938CF, Player, tonumber("0xC04F"), FacialStructures["ears"]["0xC04F"].CurrentIndex)
                Citizen.InvokeNative(0xCC8CA3E88256E58F, Player, false, true, true, true, false)
            end
            if WarMenu.ComboBox("Angle", FacialValues, FacialStructures["ears"]["0xB6CE"].CurrentIndex, FacialStructures["ears"]["0xB6CE"].SelectedIndex, "Change your ear angle.", true, function(currentIndex, selectedIndex)
                FacialStructures["ears"]["0xB6CE"].CurrentIndex = currentIndex
                FacialStructures["ears"]["0xB6CE"].SelectedIndex = selectedIndex
            end) then
                Citizen.InvokeNative(0x5653AB26C82938CF, Player, tonumber("0xB6CE"), FacialStructures["ears"]["0xB6CE"].CurrentIndex)
                Citizen.InvokeNative(0xCC8CA3E88256E58F, Player, false, true, true, true, false)
            end
            if WarMenu.ComboBox("Height", FacialValues, FacialStructures["ears"]["0x2844"].CurrentIndex, FacialStructures["ears"]["0x2844"].SelectedIndex, "Change your ear height.", true, function(currentIndex, selectedIndex)
                FacialStructures["ears"]["0x2844"].CurrentIndex = currentIndex
                FacialStructures["ears"]["0x2844"].SelectedIndex = selectedIndex
            end) then
                Citizen.InvokeNative(0x5653AB26C82938CF, Player, tonumber("0x2844"), FacialStructures["ears"]["0x2844"].CurrentIndex)
                Citizen.InvokeNative(0xCC8CA3E88256E58F, Player, false, true, true, true, false)
            end
            if WarMenu.ComboBox("Earlobe Size", FacialValues, FacialStructures["ears"]["0xED30"].CurrentIndex, FacialStructures["ears"]["0xED30"].SelectedIndex, "Change your earlobe size.", true, function(currentIndex, selectedIndex)
                FacialStructures["ears"]["0xED30"].CurrentIndex = currentIndex
                FacialStructures["ears"]["0xED30"].SelectedIndex = selectedIndex
            end) then
                Citizen.InvokeNative(0x5653AB26C82938CF, Player, tonumber("0xED30"), FacialStructures["ears"]["0xED30"].CurrentIndex)
                Citizen.InvokeNative(0xCC8CA3E88256E58F, Player, false, true, true, true, false)
            end
            WarMenu.Display()
        end
        if WarMenu.IsMenuOpened("cheekbones") then
            if WarMenu.ComboBox("Height", FacialValues, FacialStructures["cheekbones"]["0x6A0B"].CurrentIndex, FacialStructures["cheekbones"]["0x6A0B"].SelectedIndex, "Change your cheekbone height.", true, function(currentIndex, selectedIndex)
                FacialStructures["cheekbones"]["0x6A0B"].CurrentIndex = currentIndex
                FacialStructures["cheekbones"]["0x6A0B"].SelectedIndex = selectedIndex
            end) then
                Citizen.InvokeNative(0x5653AB26C82938CF, Player, tonumber("0x6A0B"), FacialStructures["cheekbones"]["0x6A0B"].CurrentIndex)
                Citizen.InvokeNative(0xCC8CA3E88256E58F, Player, false, true, true, true, false)
            end
            if WarMenu.ComboBox("Width", FacialValues, FacialStructures["cheekbones"]["0xABCF"].CurrentIndex, FacialStructures["cheekbones"]["0xABCF"].SelectedIndex, "Change your cheekbone width.", true, function(currentIndex, selectedIndex)
                FacialStructures["cheekbones"]["0xABCF"].CurrentIndex = currentIndex
                FacialStructures["cheekbones"]["0xABCF"].SelectedIndex = selectedIndex
            end) then
                Citizen.InvokeNative(0x5653AB26C82938CF, Player, tonumber("0xABCF"), FacialStructures["cheekbones"]["0xABCF"].CurrentIndex)
                Citizen.InvokeNative(0xCC8CA3E88256E58F, Player, false, true, true, true, false)
            end
            if WarMenu.ComboBox("Depth", FacialValues, FacialStructures["cheekbones"]["0x358D"].CurrentIndex, FacialStructures["cheekbones"]["0x358D"].SelectedIndex, "Change your cheekbone depth.", true, function(currentIndex, selectedIndex)
                FacialStructures["cheekbones"]["0x358D"].CurrentIndex = currentIndex
                FacialStructures["cheekbones"]["0x358D"].SelectedIndex = selectedIndex
            end) then
                Citizen.InvokeNative(0x5653AB26C82938CF, Player, tonumber("0x358D"), FacialStructures["cheekbones"]["0x358D"].CurrentIndex)
                Citizen.InvokeNative(0xCC8CA3E88256E58F, Player, false, true, true, true, false)
            end
            WarMenu.Display()
        end
        if WarMenu.IsMenuOpened("jaw") then
            if WarMenu.ComboBox("Height", FacialValues, FacialStructures["jaw"]["0x8D0A"].CurrentIndex, FacialStructures["jaw"]["0x8D0A"].SelectedIndex, "Change your jaw height.", true, function(currentIndex, selectedIndex)
                FacialStructures["jaw"]["0x8D0A"].CurrentIndex = currentIndex
                FacialStructures["jaw"]["0x8D0A"].SelectedIndex = selectedIndex
            end) then
                Citizen.InvokeNative(0x5653AB26C82938CF, Player, tonumber("0x8D0A"), FacialStructures["jaw"]["0x8D0A"].CurrentIndex)
                Citizen.InvokeNative(0xCC8CA3E88256E58F, Player, false, true, true, true, false)
            end
            if WarMenu.ComboBox("Width", FacialValues, FacialStructures["jaw"]["0xEBAE"].CurrentIndex, FacialStructures["jaw"]["0xEBAE"].SelectedIndex, "Change your jaw width.", true, function(currentIndex, selectedIndex)
                FacialStructures["jaw"]["0xEBAE"].CurrentIndex = currentIndex
                FacialStructures["jaw"]["0xEBAE"].SelectedIndex = selectedIndex
            end) then
                Citizen.InvokeNative(0x5653AB26C82938CF, Player, tonumber("0xEBAE"), FacialStructures["jaw"]["0xEBAE"].CurrentIndex)
                Citizen.InvokeNative(0xCC8CA3E88256E58F, Player, false, true, true, true, false)
            end
            if WarMenu.ComboBox("Depth", FacialValues, FacialStructures["jaw"]["0x1DF6"].CurrentIndex, FacialStructures["jaw"]["0x1DF6"].SelectedIndex, "Change your jaw depth.", true, function(currentIndex, selectedIndex)
                FacialStructures["jaw"]["0x1DF6"].CurrentIndex = currentIndex
                FacialStructures["jaw"]["0x1DF6"].SelectedIndex = selectedIndex
            end) then
                Citizen.InvokeNative(0x5653AB26C82938CF, Player, tonumber("0x1DF6"), FacialStructures["jaw"]["0x1DF6"].CurrentIndex)
                Citizen.InvokeNative(0xCC8CA3E88256E58F, Player, false, true, true, true, false)
            end
            WarMenu.Display()
        end
        if WarMenu.IsMenuOpened("chin") then
            if WarMenu.ComboBox("Height", FacialValues, FacialStructures["chin"]["0x3C0F"].CurrentIndex, FacialStructures["chin"]["0x3C0F"].SelectedIndex, "Change your chin height.", true, function(currentIndex, selectedIndex)
                FacialStructures["chin"]["0x3C0F"].CurrentIndex = currentIndex
                FacialStructures["chin"]["0x3C0F"].SelectedIndex = selectedIndex
            end) then
                Citizen.InvokeNative(0x5653AB26C82938CF, Player, tonumber("0x3C0F"), FacialStructures["chin"]["0x3C0F"].CurrentIndex)
                Citizen.InvokeNative(0xCC8CA3E88256E58F, Player, false, true, true, true, false)
            end
            if WarMenu.ComboBox("Width", FacialValues, FacialStructures["chin"]["0xC3B2"].CurrentIndex, FacialStructures["chin"]["0xC3B2"].SelectedIndex, "Change your chin width.", true, function(currentIndex, selectedIndex)
                FacialStructures["chin"]["0xC3B2"].CurrentIndex = currentIndex
                FacialStructures["chin"]["0xC3B2"].SelectedIndex = selectedIndex
            end) then
                Citizen.InvokeNative(0x5653AB26C82938CF, Player, tonumber("0xC3B2"), FacialStructures["chin"]["0xC3B2"].CurrentIndex)
                Citizen.InvokeNative(0xCC8CA3E88256E58F, Player, false, true, true, true, false)
            end
            if WarMenu.ComboBox("Depth", FacialValues, FacialStructures["chin"]["0xE323"].CurrentIndex, FacialStructures["chin"]["0xE323"].SelectedIndex, "Change your chin depth.", true, function(currentIndex, selectedIndex)
                FacialStructures["chin"]["0xE323"].CurrentIndex = currentIndex
                FacialStructures["chin"]["0xE323"].SelectedIndex = selectedIndex
            end) then
                Citizen.InvokeNative(0x5653AB26C82938CF, Player, tonumber("0xE323"), FacialStructures["chin"]["0xE323"].CurrentIndex)
                Citizen.InvokeNative(0xCC8CA3E88256E58F, Player, false, true, true, true, false)
            end
            WarMenu.Display()
        end
        if WarMenu.IsMenuOpened("eyes") then
            if WarMenu.ComboBox("Eyelid Height", FacialValues, FacialStructures["eyes"]["0x8B2B"].CurrentIndex, FacialStructures["eyes"]["0x8B2B"].SelectedIndex, "Change your eyelid height.", true, function(currentIndex, selectedIndex)
                FacialStructures["eyes"]["0x8B2B"].CurrentIndex = currentIndex
                FacialStructures["eyes"]["0x8B2B"].SelectedIndex = selectedIndex
            end) then
                Citizen.InvokeNative(0x5653AB26C82938CF, Player, tonumber("0x8B2B"), FacialStructures["eyes"]["0x8B2B"].CurrentIndex)
                Citizen.InvokeNative(0xCC8CA3E88256E58F, Player, false, true, true, true, false)
            end
            if WarMenu.ComboBox("Eyelid Width", FacialValues, FacialStructures["eyes"]["0x1B6B"].CurrentIndex, FacialStructures["eyes"]["0x1B6B"].SelectedIndex, "Change your eyelid width.", true, function(currentIndex, selectedIndex)
                FacialStructures["eyes"]["0x1B6B"].CurrentIndex = currentIndex
                FacialStructures["eyes"]["0x1B6B"].SelectedIndex = selectedIndex
            end) then
                Citizen.InvokeNative(0x5653AB26C82938CF, Player, tonumber("0x1B6B"), FacialStructures["eyes"]["0x1B6B"].CurrentIndex)
                Citizen.InvokeNative(0xCC8CA3E88256E58F, Player, false, true, true, true, false)
            end
            if WarMenu.ComboBox("Eye Depth", FacialValues, FacialStructures["eyes"]["0xEE44"].CurrentIndex, FacialStructures["eyes"]["0xEE44"].SelectedIndex, "Change your eye depth.", true, function(currentIndex, selectedIndex)
                FacialStructures["eyes"]["0xEE44"].CurrentIndex = currentIndex
                FacialStructures["eyes"]["0xEE44"].SelectedIndex = selectedIndex
            end) then
                Citizen.InvokeNative(0x5653AB26C82938CF, Player, tonumber("0xEE44"), FacialStructures["eyes"]["0xEE44"].CurrentIndex)
                Citizen.InvokeNative(0xCC8CA3E88256E58F, Player, false, true, true, true, false)
            end
            if WarMenu.ComboBox("Eye Angle", FacialValues, FacialStructures["eyes"]["0xD266"].CurrentIndex, FacialStructures["eyes"]["0xD266"].SelectedIndex, "Change your eye angle.", true, function(currentIndex, selectedIndex)
                FacialStructures["eyes"]["0xD266"].CurrentIndex = currentIndex
                FacialStructures["eyes"]["0xD266"].SelectedIndex = selectedIndex
            end) then
                Citizen.InvokeNative(0x5653AB26C82938CF, Player, tonumber("0xD266"), FacialStructures["eyes"]["0xD266"].CurrentIndex)
                Citizen.InvokeNative(0xCC8CA3E88256E58F, Player, false, true, true, true, false)
            end            
            if WarMenu.ComboBox("Eye Distance", FacialValues, FacialStructures["eyes"]["0xA54E"].CurrentIndex, FacialStructures["eyes"]["0xA54E"].SelectedIndex, "Change your eye distance.", true, function(currentIndex, selectedIndex)
                FacialStructures["eyes"]["0xA54E"].CurrentIndex = currentIndex
                FacialStructures["eyes"]["0xA54E"].SelectedIndex = selectedIndex
            end) then
                Citizen.InvokeNative(0x5653AB26C82938CF, Player, tonumber("0xA54E"), FacialStructures["eyes"]["0xA54E"].CurrentIndex)
                Citizen.InvokeNative(0xCC8CA3E88256E58F, Player, false, true, true, true, false)
            end
            if WarMenu.ComboBox("Eye Height", FacialValues, FacialStructures["eyes"]["0xDDFB"].CurrentIndex, FacialStructures["eyes"]["0xDDFB"].SelectedIndex, "Change your eye height.", true, function(currentIndex, selectedIndex)
                FacialStructures["eyes"]["0xDDFB"].CurrentIndex = currentIndex
                FacialStructures["eyes"]["0xDDFB"].SelectedIndex = selectedIndex
            end) then
                Citizen.InvokeNative(0x5653AB26C82938CF, Player, tonumber("0xDDFB"), FacialStructures["eyes"]["0xDDFB"].CurrentIndex)
                Citizen.InvokeNative(0xCC8CA3E88256E58F, Player, false, true, true, true, false)
            end
            WarMenu.Display()
        end
        if WarMenu.IsMenuOpened("nose") then
            if WarMenu.ComboBox("Width", FacialValues, FacialStructures["nose"]["0x6E7F"].CurrentIndex, FacialStructures["nose"]["0x6E7F"].SelectedIndex, "Change your nose width.", true, function(currentIndex, selectedIndex)
                FacialStructures["nose"]["0x6E7F"].CurrentIndex = currentIndex
                FacialStructures["nose"]["0x6E7F"].SelectedIndex = selectedIndex
            end) then
                Citizen.InvokeNative(0x5653AB26C82938CF, Player, tonumber("0x6E7F"), FacialStructures["nose"]["0x6E7F"].CurrentIndex)
                Citizen.InvokeNative(0xCC8CA3E88256E58F, Player, false, true, true, true, false)
            end
            if WarMenu.ComboBox("Size", FacialValues, FacialStructures["nose"]["0x3471"].CurrentIndex, FacialStructures["nose"]["0x3471"].SelectedIndex, "Change your nose size.", true, function(currentIndex, selectedIndex)
                FacialStructures["nose"]["0x3471"].CurrentIndex = currentIndex
                FacialStructures["nose"]["0x3471"].SelectedIndex = selectedIndex
            end) then
                Citizen.InvokeNative(0x5653AB26C82938CF, Player, tonumber("0x3471"), FacialStructures["nose"]["0x3471"].CurrentIndex)
                Citizen.InvokeNative(0xCC8CA3E88256E58F, Player, false, true, true, true, false)
            end
            if WarMenu.ComboBox("Height", FacialValues, FacialStructures["nose"]["0x03F5"].CurrentIndex, FacialStructures["nose"]["0x03F5"].SelectedIndex, "Change your nose height.", true, function(currentIndex, selectedIndex)
                FacialStructures["nose"]["0x03F5"].CurrentIndex = currentIndex
                FacialStructures["nose"]["0x03F5"].SelectedIndex = selectedIndex
            end) then
                Citizen.InvokeNative(0x5653AB26C82938CF, Player, tonumber("0x03F5"), FacialStructures["nose"]["0x03F5"].CurrentIndex)
                Citizen.InvokeNative(0xCC8CA3E88256E58F, Player, false, true, true, true, false)
            end
            if WarMenu.ComboBox("Angle", FacialValues, FacialStructures["nose"]["0x34B1"].CurrentIndex, FacialStructures["nose"]["0x34B1"].SelectedIndex, "Change your nose angle.", true, function(currentIndex, selectedIndex)
                FacialStructures["nose"]["0x34B1"].CurrentIndex = currentIndex
                FacialStructures["nose"]["0x34B1"].SelectedIndex = selectedIndex
            end) then
                Citizen.InvokeNative(0x5653AB26C82938CF, Player, tonumber("0x34B1"), FacialStructures["nose"]["0x34B1"].CurrentIndex)
                Citizen.InvokeNative(0xCC8CA3E88256E58F, Player, false, true, true, true, false)
            end            
            if WarMenu.ComboBox("Distance", FacialValues, FacialStructures["nose"]["0xF156"].CurrentIndex, FacialStructures["nose"]["0xF156"].SelectedIndex, "Change your nose distance.", true, function(currentIndex, selectedIndex)
                FacialStructures["nose"]["0xF156"].CurrentIndex = currentIndex
                FacialStructures["nose"]["0xF156"].SelectedIndex = selectedIndex
            end) then
                Citizen.InvokeNative(0x5653AB26C82938CF, Player, tonumber("0xF156"), FacialStructures["nose"]["0xF156"].CurrentIndex)
                Citizen.InvokeNative(0xCC8CA3E88256E58F, Player, false, true, true, true, false)
            end
            if WarMenu.ComboBox("Nostrils Distance", FacialValues, FacialStructures["nose"]["0x561E"].CurrentIndex, FacialStructures["nose"]["0x561E"].SelectedIndex, "Change your nostrils distance.", true, function(currentIndex, selectedIndex)
                FacialStructures["nose"]["0x561E"].CurrentIndex = currentIndex
                FacialStructures["nose"]["0x561E"].SelectedIndex = selectedIndex
            end) then
                Citizen.InvokeNative(0x5653AB26C82938CF, Player, tonumber("0x561E"), FacialStructures["nose"]["0x561E"].CurrentIndex)
                Citizen.InvokeNative(0xCC8CA3E88256E58F, Player, false, true, true, true, false)
            end
            WarMenu.Display()
        end
        if WarMenu.IsMenuOpened("mouth") then
            if WarMenu.ComboBox("Width", FacialValues, FacialStructures["mouth"]["0xF065"].CurrentIndex, FacialStructures["mouth"]["0xF065"].SelectedIndex, "Change your mouth width.", true, function(currentIndex, selectedIndex)
                FacialStructures["mouth"]["0xF065"].CurrentIndex = currentIndex
                FacialStructures["mouth"]["0xF065"].SelectedIndex = selectedIndex
            end) then
                Citizen.InvokeNative(0x5653AB26C82938CF, Player, tonumber("0xF065"), FacialStructures["mouth"]["0xF065"].CurrentIndex)
                Citizen.InvokeNative(0xCC8CA3E88256E58F, Player, false, true, true, true, false)
            end
            if WarMenu.ComboBox("Depth", FacialValues, FacialStructures["mouth"]["0xAA69"].CurrentIndex, FacialStructures["mouth"]["0xAA69"].SelectedIndex, "Change your mouth depth.", true, function(currentIndex, selectedIndex)
                FacialStructures["mouth"]["0xAA69"].CurrentIndex = currentIndex
                FacialStructures["mouth"]["0xAA69"].SelectedIndex = selectedIndex
            end) then
                Citizen.InvokeNative(0x5653AB26C82938CF, Player, tonumber("0xAA69"), FacialStructures["mouth"]["0xAA69"].CurrentIndex)
                Citizen.InvokeNative(0xCC8CA3E88256E58F, Player, false, true, true, true, false)
            end
            if WarMenu.ComboBox("Horiztonal Placement", FacialValues, FacialStructures["mouth"]["0x7AC3"].CurrentIndex, FacialStructures["mouth"]["0x7AC3"].SelectedIndex, "Change your mouth placement(x-axis).", true, function(currentIndex, selectedIndex)
                FacialStructures["mouth"]["0x7AC3"].CurrentIndex = currentIndex
                FacialStructures["mouth"]["0x7AC3"].SelectedIndex = selectedIndex
            end) then
                Citizen.InvokeNative(0x5653AB26C82938CF, Player, tonumber("0x7AC3"), FacialStructures["mouth"]["0x7AC3"].CurrentIndex)
                Citizen.InvokeNative(0xCC8CA3E88256E58F, Player, false, true, true, true, false)
            end
            if WarMenu.ComboBox("Vertical Placement", FacialValues, FacialStructures["mouth"]["0x410D"].CurrentIndex, FacialStructures["mouth"]["0x410D"].SelectedIndex, "Change your mouth placement(y-axis).", true, function(currentIndex, selectedIndex)
                FacialStructures["mouth"]["0x410D"].CurrentIndex = currentIndex
                FacialStructures["mouth"]["0x410D"].SelectedIndex = selectedIndex
            end) then
                Citizen.InvokeNative(0x5653AB26C82938CF, Player, tonumber("0x410D"), FacialStructures["mouth"]["0x410D"].CurrentIndex)
                Citizen.InvokeNative(0xCC8CA3E88256E58F, Player, false, true, true, true, false)
            end   
            WarMenu.Display()         
        end
        if WarMenu.IsMenuOpened("lips") then
            if WarMenu.ComboBox("Upper Lip Height", FacialValues, FacialStructures["lips"]["0x1A00"].CurrentIndex, FacialStructures["lips"]["0x1A00"].SelectedIndex, "Change your upper lip width.", true, function(currentIndex, selectedIndex)
                FacialStructures["lips"]["0x1A00"].CurrentIndex = currentIndex
                FacialStructures["lips"]["0x1A00"].SelectedIndex = selectedIndex
            end) then
                Citizen.InvokeNative(0x5653AB26C82938CF, Player, tonumber("0x1A00"), FacialStructures["lips"]["0x1A00"].CurrentIndex)
                Citizen.InvokeNative(0xCC8CA3E88256E58F, Player, false, true, true, true, false)
            end
            if WarMenu.ComboBox("Upper Lip Width", FacialValues, FacialStructures["lips"]["0x91C1"].CurrentIndex, FacialStructures["lips"]["0x91C1"].SelectedIndex, "Change your mouth depth.", true, function(currentIndex, selectedIndex)
                FacialStructures["lips"]["0x91C1"].CurrentIndex = currentIndex
                FacialStructures["lips"]["0x91C1"].SelectedIndex = selectedIndex
            end) then
                Citizen.InvokeNative(0x5653AB26C82938CF, Player, tonumber("0x91C1"), FacialStructures["lips"]["0x91C1"].CurrentIndex)
                Citizen.InvokeNative(0xCC8CA3E88256E58F, Player, false, true, true, true, false)
            end
            if WarMenu.ComboBox("Upper Lip Depth", FacialValues, FacialStructures["lips"]["0xC375"].CurrentIndex, FacialStructures["lips"]["0xC375"].SelectedIndex, "Change your mouth placement(x-axis).", true, function(currentIndex, selectedIndex)
                FacialStructures["lips"]["0xC375"].CurrentIndex = currentIndex
                FacialStructures["lips"]["0xC375"].SelectedIndex = selectedIndex
            end) then
                Citizen.InvokeNative(0x5653AB26C82938CF, Player, tonumber("0xC375"), FacialStructures["lips"]["0xC375"].CurrentIndex)
                Citizen.InvokeNative(0xCC8CA3E88256E58F, Player, false, true, true, true, false)
            end
            if WarMenu.ComboBox("Lower Lip Height", FacialValues, FacialStructures["lips"]["0xBB4D"].CurrentIndex, FacialStructures["lips"]["0xBB4D"].SelectedIndex, "Change your mouth placement(y-axis).", true, function(currentIndex, selectedIndex)
                FacialStructures["lips"]["0xBB4D"].CurrentIndex = currentIndex
                FacialStructures["lips"]["0xBB4D"].SelectedIndex = selectedIndex
            end) then
                Citizen.InvokeNative(0x5653AB26C82938CF, Player, tonumber("0xBB4D"), FacialStructures["lips"]["0xBB4D"].CurrentIndex)
                Citizen.InvokeNative(0xCC8CA3E88256E58F, Player, false, true, true, true, false)
            end            
            if WarMenu.ComboBox("Lower Lip Width", FacialValues, FacialStructures["lips"]["0xB0B0"].CurrentIndex, FacialStructures["lips"]["0xB0B0"].SelectedIndex, "Change your mouth width.", true, function(currentIndex, selectedIndex)
                FacialStructures["lips"]["0xB0B0"].CurrentIndex = currentIndex
                FacialStructures["lips"]["0xB0B0"].SelectedIndex = selectedIndex
            end) then
                Citizen.InvokeNative(0x5653AB26C82938CF, Player, tonumber("0xB0B0"), FacialStructures["lips"]["0xB0B0"].CurrentIndex)
                Citizen.InvokeNative(0xCC8CA3E88256E58F, Player, false, true, true, true, false)
            end
            if WarMenu.ComboBox("Lower Lip Depth", FacialValues, FacialStructures["lips"]["0x5D16"].CurrentIndex, FacialStructures["lips"]["0x5D16"].SelectedIndex, "Change your mouth depth.", true, function(currentIndex, selectedIndex)
                FacialStructures["lips"]["0x5D16"].CurrentIndex = currentIndex
                FacialStructures["lips"]["0x5D16"].SelectedIndex = selectedIndex
            end) then
                Citizen.InvokeNative(0x5653AB26C82938CF, Player, tonumber("0x5D16"), FacialStructures["lips"]["0x5D16"].CurrentIndex)
                Citizen.InvokeNative(0xCC8CA3E88256E58F, Player, false, true, true, true, false)
            end
            WarMenu.Display()
        end
    end
end)