Path = GetResourcePath(GetCurrentResourceName()).."/logs"
File = nil

--[[ Functions ]]--
function Add(text)
	local resource = GetInvokingResource() or ""
	local message = "["..resource:upper().."] "..text

	print(message)

	if not File then return end
	
	io.output(File)
	io.write(message.."\n")
	
	File:flush()
end
exports("Add", Add)

function GetPath()
	return GetResourcePath(GetCurrentResourceName())
end

function CreateCache(fileName)
	local file = io.open(Path.."/log-cache.txt", "r")

	if file then
		io.input(file)

		UploadCache(io.read())

		io.close(file)
	end

	file = io.open(Path.."/log-cache.txt", "w")

	io.output(file)

	io.write(fileName)

	io.close(file)
end

function UploadCache(fileName)
	-- local file = io.open(Path.."/"..fileName, "r")
	-- if not file then return end

	-- io.input(file)

	-- print(io.read())

	-- io.close(file)
end

function CreateFile()
	local fileName = "log-"..tostring(os.time())..".txt"
	File = io.open(Path.."/"..fileName, "a")
	CreateCache(fileName)
end

function Init()
	CreateFile()
end

--[[ Events ]]--
AddEventHandler("onResourceStart", function(resourceName)
	if GetCurrentResourceName() ~= resourceName then return end

	Init()

end)


AddEventHandler("onResourceStop", function(resourceName)
	if GetCurrentResourceName() ~= resourceName then return end

	if File then
		io.close(File)
	end
end)