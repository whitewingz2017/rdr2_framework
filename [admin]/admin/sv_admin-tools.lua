Cache = {}

--[[ Threads ]]--
Citizen.CreateThread(function()
	while true do
		Citizen.Wait(60000)

		for i = 1, GetNumPlayerIndices() do
			local source = tonumber(GetPlayerFromIndex(i - 1))
			if not source then goto continue end

			local user = exports.user:GetUser(source)
			if not user then goto continue end

			local cache = Cache[source]

			if not cache then
				cache = { responses = 0 }
				LogError(source, "Alpha")
				goto continue;
			end

			if cache.responses < ExpectedResponses - 2 or cache.responses > ExpectedResponses + 2 then
				local code = "Charlie"
				if cache.responses < ExpectedResponses then
					code = "Delta"
				end
				LogError(source, code, cache.responses)
			end

			if cache.powerLevel ~= user.power_level then
				LogError(source, "Beta", ("%s (actual: %s)"):format(cache.powerLevel, user.power_level))
			end

			cache.responses = 0

			::continue::
		end
	end
end)

--[[ Functions ]]--
function LogError(source, code, replace)
	local message = ("[%s] Anti-cheat error: %s ("):format(source, code)..Errors[code]..")"
	if replace then
		message = message:format(replace)
	end
	exports.log:Add(message)
end

--[[ Events ]]--
RegisterNetEvent("admin-tools:update")
AddEventHandler("admin-tools:update", function(powerLevel)
	local source = source
	local user = exports.user:GetUser(source)
	local cache = Cache[source]

	if not cache then
		cache = { responses = 0 }
		Cache[source] = cache
	end

	cache.powerLevel = powerLevel
	cache.responses = cache.responses + 1
end)