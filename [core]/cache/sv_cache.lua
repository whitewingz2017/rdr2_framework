Cache = {}

exports("Init", function(t)
	if Cache[t] == nil then
		Cache[t] = {}
	end
end)

exports("GetFromTable", function(t, k)
	return Cache[t][k]
end)

exports("SetTableValue", function(t, k, v)
	Cache[t][k] = v

	return v
end)

exports("Get", function(t)
	return Cache[t]
end)

exports("Set", function(t, v)
	Cache[t] = v

	return v
end)

exports("Insert", function(t, k, v)
	if v == nil then
		table.insert(Cache[t], k)
	else
		table.insert(Cache[t][k], v)
	end

	return v
end)

exports("Remove", function(t, v)
	table.remove(Cache[t], v)
end)

exports("Sync", function(k, source, v)
	TriggerClientEvent("cache:sync", source, k, v)
end)