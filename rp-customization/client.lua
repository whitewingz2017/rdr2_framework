local Character = {}

function SetModel(Model)
    Citizen.CreateThread(function()
        local model = GetHashKey(tostring(Model))
    
        RequestModel(model)
           while not HasModelLoaded(model) do
            Citizen.Wait(1)
        end
    
        SetPlayerModel(PlayerId(), model, false)
        Citizen.InvokeNative(0x283978A15512B2FE, PlayerPedId(), true)
        Playing with weird native 0xA5BAE410B03E7371, found out that it can be "stacked", changing mp ped face and body type. For example:

    Citizen.InvokeNative(0x283978A15512B2FE, PlayerPedId(), true)      -- reset model 
    Citizen.InvokeNative(0xA5BAE410B03E7371 ,PlayerPedId(),param,0,0,0)   -- param - add body shape for mp_male from 124 to 128 (110 - 115 for mp_female)
    Citizen.InvokeNative(0xA5BAE410B03E7371 ,PlayerPedId(),param,0,0,0)   -- param - add face shape for mp_male from 110 to 123 (96 - 109 for mp_female)
    Citizen.InvokeNative(0xA5BAE410B03E7371 ,PlayerPedId(),param,0,0,0)   -- param - add cloth type for mp_male from 0 to 109  (0-95 for mp_female).  -- not all work
    end)
end

RegisterNetEvent("Load.Character.Customization")
AddEventHandler("Load.Character.Customization", function(Data)
    Character = Data
    SetModel(Character.model)
    --SetClothing(Character.Clothes)
end)
 
--[[
0x923583741DC87BCE = {
    "default",
    "gold_panner",
    "lone_prisoner",
    "lost_Man",
    "rally",
    "default_female",
    "murfree",
    "angry_female",
    "primate",
    "old_female",
    "algie",
    "waiter",
    "lilly_millet",
    "casual",
    "john_marston",
    "guard_lantern",
    "free_slave_01",
    "free_slave_02",
    "war_veteran",
    "arthur_healthy"
}
--]]

function MovementClipsetStory(Clipset)
    Citizen.InvokeNative(0x923583741DC87BCE, PlayerPedId(), Clipset)
end

--[[
0x89F5E7ADECCCB49C = {
    "depressed",
    "spool",
    "stealth",
    "panic",
    "intimidate",
    "brace",
    "angry",
    "normal_basic_idle",
    "default",
    "action",
    "nervous",
    "injured_left_leg"
    "injured_general",
    "injured_right_leg",
    "directional_nervous"
    "scared",
    "very_drunk",
    "default_brave",
    "injured_left_arm",
    "injured_right_arm",
    "default_nervous",
    "agitated",
    "normal",
    "chain_gang_legs",
    "sad",
    "cry",
    "injured_torso",
    "lost_man_normal",
    "cautious",
    "piss_pot_b",
    "piss_pot_a",
    "combat",
    "rally_sad",
    "intimidated_on_feet",
    "intimidated_on_feet_reaction",
    "shocked",
    "searching_high_energy_indirect",
    "searching_low_energy_indirect",
    "cower_known",
    "slightly drunk",
    "chain_gang_catchup",
    "chain_gang_normal",
    "dehydrated_unarmed",
    "bucking_high",
    "carry_pitchfork",
    "moderate_drunk",
    "normal_town",
    "incombat_low_intensity_longarm",
    "incombat_zero_intensity",
    "marston_cautious",
    "snow"
}
--]]

function MovementClipsetEffects(Effect)
    Citizen.InvokeNative(0x89F5E7ADECCCB49C, PlayerPedId(), Effect)
end