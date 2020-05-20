exports.cache:Init("Characters")
exports.cache:Init("ActiveCharacters")

Characters = {}
ActiveCharacters = {}
Rows = {}
References = {}
ReferencedRows = {}

--[[ Functions ]]--
function GetCharacters(source)
	return Characters[source]
end
exports("GetCharacters", GetCharacters)

function GetCharacter(source)
	return Characters[source][ActiveCharacters[source]]
end
exports("GetCharacter", GetCharacter)

function SetCharacter(source, character)
	Characters[source][ActiveCharacters[source]] = character
	TriggerClientEvent("character:updateCurrent", source, character)
end
exports("SetCharacter", SetCharacter)

function Get(source, key)
	return Characters[source][ActiveCharacters[source]][key]
end
exports("Get", Get)

function Set(source, key, value)
	Characters[source][ActiveCharacters[source]][key] = value
	TriggerClientEvent("character:updateCurrent", source, GetCharacter(source))
end
exports("Set", Set)

function Save(source, ...)
	local character = Characters[source][ActiveCharacters[source]]
	local args = {...}
	local query = ""
	for k, v in ipairs(args) do
		if k ~= 1 then
			query = query..", "
		end

		local row = Rows[v]
		local dataValue = character[v]
		if type(dataValue) == "table" then
			dataValue = "'"..json.encode(dataValue).."'"
		elseif type(dataValue) == "string" then
			dataValue = "'"..dataValue.."'"
		end

		query = query..v.."="..dataValue
	end
	if query ~= "" then
		exports.GHMattiMySQL:QueryAsync("UPDATE characters SET "..query.." WHERE id=@id", {
			["@id"] = character.id
		})
	end
end
exports("Save", Save)

function CanCreate(source)
	if source == nil then return false end

	local characters = GetCharacters(source)
	if characters == nil then return false end

	return #characters < 7
end

function LoadCharacters(source, user)
	if not user then return end
	local source = source
	local characters = exports.GHMattiMySQL:QueryResult("SELECT * FROM characters WHERE user_id=@user_id AND dead=0", {
		["@user_id"] = exports.user:GetUser(source).id
	})
	
	for _, character in ipairs(characters) do
		character.appearance = json.decode(character.appearance)
	end
	
	Characters[source] = characters
	TriggerClientEvent("character:initialized", source, characters)
end

function CheckName(name)
	if not name or type(name) ~= "string" or name == "" then
		return false
	end

	for match in name:gmatch(".") do
		if not ("QWERTYUIOPASDFGHJKLZXCVBNM"):find(match:upper()) then
			return false
		end
	end

	return true
end

function CreateCharacter(source, data)
	local appearance = data.appearance
	data.appearance = json.encode(data.appearance)

	exports.GHMattiMySQL:Insert("characters", {
		data
	}, function(id)
		data.appearance = appearance
		data.id = id
		
		exports.log:Add(("[%s] created their character: %s %s (%s)"):format(source, data.first_name, data.last_name, id))

		Characters[source][#Characters[source] + 1] = data
		TriggerClientEvent("character:update", source, Characters[source])
		TriggerEvent("character:created", source, id)
	end, true)
end

--[[ Events ]]--
RegisterServerEvent("character:create")
AddEventHandler("character:create", function(data)
	local source = source
	local user = exports.user:GetUser(source)
	local errorMessage = nil
	
	if not user then errorMessage = "User doesn't exist" end
	if not CanCreate(source) then errorMessage = "Shouldn't be able to create" end
	if not CheckName(data.firstName) then errorMessage = "First name is invalid" end
	if not CheckName(data.lastName) then errorMessage = "Last name is invalid" end
	if data.gender ~= 0 and data.gender ~= 1 then errorMessage = "Gender is not binary" end
	if type(data.dobYear) ~= "number" then errorMessage = "DOB year is not a number" end
	if type(data.dobMonth) ~= "number" then errorMessage = "DOB month is not a number" end
	if type(data.dobDay) ~= "number" then errorMessage = "DOB day is not a number" end
	if type(data.appearance) ~= "table" then errorMessage = "Appearance isn't a table" end
	
	if errorMessage then
		print("["..tostring(source).."] Chracter creation returned an exception: "..errorMessage)
		return
	end

	local character = {
		["user_id"] = user.id,
		["first_name"] = data.firstName,
		["last_name"] = data.lastName,
		["bank"] = 2000,
		["dob"] = os.time{year=data.dobYear, month=data.dobMonth, day=data.dobDay},
		["gender"] = data.gender,
		["appearance"] = data.appearance,
	}
	
	CreateCharacter(source, character)
end)

RegisterServerEvent("character:select")
AddEventHandler("character:select", function(index)
	local source = source
	local character = Characters[source][index]
	if character == nil then return end

	ActiveCharacters[source] = index
	LoadModules(source, character)

	exports.log:Add(("[%s] selected their character: %s %s (%s)"):format(source, character.first_name, character.last_name, character.id))
	
	-- TriggerClientEvent("character:update", source, character, index)
	TriggerClientEvent("character:select", source, index, character)
	TriggerEvent("character:loaded", source, character)
end)

--[[ User Events ]]--
AddEventHandler("user:ready", function(source, user)
	LoadCharacters(source, user)
end)

--[[ Resource Events ]]--
AddEventHandler("onResourceStart", function(resourceName)
	if GetCurrentResourceName() ~= resourceName then return end

	Characters = exports.cache:Get("Characters") or {}
	ActiveCharacters = exports.cache:Get("ActiveCharacters") or {}
	Rows = exports.utils:DescribeTable("characters")
	References = exports.utils:GetTableReferences("characters")

	for k, v in ipairs(References) do
		if not ReferencedRows[v.table] then
			ReferencedRows[v.table] = exports.utils:DescribeTable(v.table)
			if not ReferencedRows[v.table]["character_id"] then
				print("`"..v.table.."` has a foreign key referencing `characters` but is missing `character_id`!")
			end
		end
	end
end)

AddEventHandler("onResourceStop", function(resourceName)
	if GetCurrentResourceName() ~= resourceName then return end

	exports.cache:Set("Characters", Characters)
	exports.cache:Set("ActiveCharacters", ActiveCharacters)
end)

AddEventHandler("playerDropped", function(reason)
	if source ~= nil and Characters[source] ~= nil then
		Characters[source] = nil
		ActiveCharacters[source] = nil
	end
end)