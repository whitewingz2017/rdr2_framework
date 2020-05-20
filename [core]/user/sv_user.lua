exports.cache:Init("Users")

Users = {}
Rows = {}

--[[ Functions ]]--
function GetUser(source)
	if type(source) ~= "number" then source = tonumber(source) end

	if source == 0 then
		return { name = "CONSOLE", power_level = 9999 }
	end

	return Users[source]
end
exports("GetUser", GetUser)

function SetupUser(source, data)
	data.group = exports.user:GetGroup(data.power_level)

	if data.group then
		ExecuteCommand("add_principal identifier."..data.identifier.." group."..data.group:gsub("%s+", "_"):lower())
	end

	Users[source] = data
	exports.cache:Sync("User", source, data)

	TriggerEvent("user:ready", source, data)
	TriggerClientEvent("user:ready", source, data)
end

--[[ Events ]]--
RegisterServerEvent("core:initialize")
AddEventHandler("core:initialize", function()
	local source = source
	if not source then return end
	
	local data = {
		identifier = exports.main:GetIdentifier(source, "steam"),
		license = exports.main:GetIdentifier(source, "license"),
		ip = exports.main:GetIdentifier(source, "ip"),
		name = GetPlayerName(source),
		last_played = os.time(),
	}

	if not data.ip then
		data.ip = "ip:"..GetPlayerEndpoint(source)
	end

	if not data.license or not data.identifier or not data.ip then
		exports.main:Drop(source, "[USER] Unable to authenticate.")
		exports.log:Add("Authentication failed ["..tostring(source).."] "..tostring(data.name).."@"..tostring(data.ip))
		
		return
	end

	exports.log:Add("Authenticated ["..tostring(source).."] "..tostring(data.name).."@"..tostring(data.ip))

	local source = source
	local result = exports.GHMattiMySQL:QueryResult("SELECT * FROM users WHERE identifier=@identifier", {
		["@identifier"] = data.identifier
	})[1]

	if result then
		exports.GHMattiMySQL:QueryResultAsync("UPDATE users SET ip=@ip, name=@name, last_played=@last_played WHERE identifier=@identifier", {
			["@ip"] = data.ip,
			["@name"] = data.name,
			["@last_played"] = data.last_played,
			["@identifier"] = data.identifier,
		})

		for k, v in pairs(result) do
			data[k] = data[k] or v
		end
		
		SetupUser(source, data)
	else
		data.first_joined = os.time()
		data.last_played = os.time()

		exports.GHMattiMySQL:Insert("users", { data }, function(id)
			data.id = id

			for k, v in pairs(Rows) do
				data[k] = data[k] or v.default
			end
			
			SetupUser(source, data)
		end, true)
	end
end)

--[[ Resource Events ]]--
AddEventHandler("onResourceStart", function(resourceName)
	if GetCurrentResourceName() ~= resourceName then return end

	Users = exports.cache:Get("Users") or {}
	Rows = exports.utils:DescribeTable("users")
end)

AddEventHandler("onResourceStop", function(resourceName)
	if GetCurrentResourceName() ~= resourceName then return end

	exports.cache:Set("Users", Users)
end)

AddEventHandler("playerDropped", function(reason)
	if source ~= nil and Users[source] ~= nil then
		Users[source] = nil
	end
end)