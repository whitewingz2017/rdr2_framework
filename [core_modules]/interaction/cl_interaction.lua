Interactions = {}
IsPressing = false
TimeHeld = 0
Initialized = false

--[[ Commands ]]--
RegisterKeyMapping("interactionwheel", "Interaction Wheel", "keyboard", "lmenu")
RegisterCommand("interactionwheel", function()
	if not Initialized then
		SendNUIMessage({
			interactions = Interactions
		})
		Initialized = true
	end
end)

--[[ Functions ]]--
function AddInteraction(parent, interaction)
	if parent == nil then
		parent = "root"
	end

	if not Interactions[parent] then
		Interactions[parent] = {}
	end

	Interactions[parent][interaction] = {}
end
exports("AddInteraction", AddInteraction)

--[[ Debug ]]--
AddInteraction(nil, "Admin")
AddInteraction(nil, "Emotes")
AddInteraction(nil, "Open Inventory")
-- AddInteraction(nil, "Test4")
-- AddInteraction(nil, "Test5")
-- AddInteraction(nil, "Test6")