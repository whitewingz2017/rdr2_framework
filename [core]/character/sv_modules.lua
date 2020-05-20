Modules = { Load = {} }

--[[ Functions ]]--
function AddModule(source, table, data, callback)
	local character = GetCharacter(source)
	if not character then return end
	if not table then return end
	if not data then return end

	if not data.character_id then
		data.character_id = character.id
	end

	exports.GHMattiMySQL:Insert(table, {
		data
	}, function()
		if callback then
			pcall(callback)
		end
	end)
end
exports("AddModule", AddModule)

function RemoveModule(source, table, conditions, callback)
	local character = GetCharacter(source)
	if not character then return end
	if not table then return end
	if not conditions then return end

	local conditionQuery = "WHERE character_id=@character_id"
	local data = {
		["@character_id"] = character.id
	}

	for k, v in pairs(conditions) do
		conditionQuery = ("%s AND %s=@%s"):format(conditionQuery, k, k)
		data["@"..k] = v
	end

	exports.GHMattiMySQL:QueryAsync("DELETE FROM `"..table.."` "..conditionQuery, data, function()
		if callback then
			pcall(callback)
		end
	end)
end
exports("RemoveModule", RemoveModule)

function LoadModules(source, character)
	local loadedModules = 0
	for _, reference in ipairs(References) do
		exports.GHMattiMySQL:QueryResultAsync("SELECT * FROM `"..reference.table.."` WHERE character_id=@character_id", {
			["@character_id"] = character.id,
		}, function(result)
			for __, row in ipairs(result) do
				for key, column in pairs(row) do
					if type(column) == "string" and column:sub(1, 1) == "[" and column:sub(#column, #column) == "]" then
						row[key] = json.decode(column)
					end
				end
			end
			loadedModules = loadedModules + 1
			if Modules.Load[reference.table] then
				local output = Modules.Load[reference.table](result)
				if output ~= nil then
					result = output
				end
			end
			character[reference.table] = result
		end)
	end

	while loadedModules < #References do Wait(20) end
end