local PlayerCount = 0
local list = {}


RegisterServerEvent("train:playerActivated")

function ActivateTrain()
		TriggerClientEvent('Trainroute', GetHostId())
end

AddEventHandler('train:playerActivated', function()
  ActivateTrain()
end)

AddEventHandler('playerDropped', function()
  if list[source] then
    PlayerCount = PlayerCount - 1
    print(PlayerCount)
    list[source] = nil
  end
end)
