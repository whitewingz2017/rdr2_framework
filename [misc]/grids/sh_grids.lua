function GetWidth(size)
	return math.floor(Config.Size.x / size)
end

function OffsetCoords(coords)
	return vector3(coords.x + Config.Offset.x, coords.y + Config.Offset.y, coords.z)
end

function GetGrid(coords, size, keepSize)
	coords = OffsetCoords(coords)
	if not keepSize then
		size = Config.Sizes[size]
	end
	return math.floor(coords.x / size) * GetWidth(size) + math.floor(coords.y / size)
end
exports("GetGrid", GetGrid)

function GetPos(grid, size, keepSize)
	if not keepSize then
		size = Config.Sizes[size]
	end
	return vector3(grid / GetWidth(size) * size - Config.Offset.x, grid % GetWidth(size) * size - Config.Offset.y, 0)
end
exports("GetPos", GetPos)

function GetNearbyGrids(coords, size, keepSize)
	if not size then return {} end
	if not keepSize then
		size = Config.Sizes[size]
	end

	local width = GetWidth(size)
	local grid = coords
	if type(coords) == "vector3" then
		coords = GetGrid(coords, size, true)
	end

	return {
		grid,
		grid - 1,
		grid + 1,
		grid - width,
		grid - width - 1,
		grid - width + 1,
		grid + width,
		grid + width - 1,
		grid + width + 1
	}
end
exports("GetNearbyGrids", GetNearbyGrids)