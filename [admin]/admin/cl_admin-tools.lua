PowerLevel = 0
Functions = {}

--[[ Threads ]]--
Citizen.CreateThread(function()
	while true do
		Citizen.Wait(1000)

		UpdateUser()
	end
end)

Citizen.CreateThread(function()
	while true do
		while PowerLevel < Config.MinPowerLevel do
			Citizen.Wait(1000)
		end

		Citizen.Wait(0)

		Ped = PlayerPedId()
		for name, func in pairs(Functions) do
			func()
		end
	end
end)

--[[ Functions ]]--
function UpdateUser()
	PowerLevel = exports.user:GetUser().power_level

	TriggerServerEvent("admin-tools:update", PowerLevel)
end

function DrawText(title, text, yOrder, xOrder)
	local pos = vector2(0.05 + (xOrder or 0.0) * 0.4, 0.05 + (yOrder or 0) * 0.03)
	_DrawText(title, pos)
	_DrawText(text, pos + vector2(0.1, 0.0))
end

function _DrawText(text, pos)
	SetTextFont(6)
	SetTextProportional(1)
	SetTextScale(0.5, 0.5)
	SetTextColour(255, 255, 255, 255)
	SetTextDropShadow(0, 0, 0, 0, 255)
	SetTextEdge(1, 0, 0, 0, 255)
	SetTextDropShadow()
	SetTextOutline()
	BeginTextCommandDisplayText("string")
	AddTextComponentSubstringPlayerName(tostring(text))
	EndTextCommandDisplayText(pos.x, pos.y)
end