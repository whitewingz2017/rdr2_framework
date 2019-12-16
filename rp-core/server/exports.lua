exports("GetCharacterName", function(Source)
	local Source = tonumber(Source)

	if Characters[Source] then
		return Characters[Source].first_name
	else
		return nil
	end
end)

exports("GetCharacterId", function(Source)
	local Source = tonumber(Source)
	
	if Characters[Source] then
		return Characters[Source].id
	else
		return nil
	end
end)

exports("GetCharacterCash", function(Source)
	local Source = tonumber(Source)
	
	if Characters[Source] then
		return Characters[Source].wallet
	else
		return nil
	end
end)

exports("GetCharacterBank", function(Source)
	local Source = tonumber(Source)
	
	if Characters[Source] then
		return Characters[Source].bank
	else
		return nil
	end
end)

exports("GetCharacterWeight", function(Source)
    local Source = tonumber(Source)
    if Characters[Source] then
        return Characters[Source].weight
    else
        return Config.Character.Weight
    end
end)

exports("SetCharacterCash", function(Source, Amount)
	local Source = tonumber(Source)
	
	if Characters[Source] then
		Characters[Source].wallet = Amount
	end
end)

exports("AddCharacterCash", function(Source, Amount)
	local Source = tonumber(Source)
	
	if Characters[Source] then
		Characters[Source].wallet = Characters[Source].wallet + Amount
	end
end)

exports("RemoveCharacterCash", function(Source, Amount)
	local Source = tonumber(Source)
	
    if Characters[Source] then
        Characters[Source].wallet = Characters[Source].wallet - Amount
        if Characters[Source].wallet < 0 then
            Characters[Source].wallet = 0
        end
	end
end)

exports("SetCharacterBank", function(Source, Amount)
	local Source = tonumber(Source)
	
	if Characters[Source] then
		Characters[Source].bank = Amount
	end
end)

exports("AddCharacterBank", function(Source, Amount)
	local Source = tonumber(Source)
	
	if Characters[Source] then
		Characters[Source].bank = Characters[Source].bank + Amount
	end
end)

exports("RemoveCharacterBank", function(Source, Amount)
	local Source = tonumber(Source)
	
	if Characters[Source] then
		Characters[Source].bank = Characters[Source].bank - Amount
	end
end)