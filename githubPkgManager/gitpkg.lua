local repoURLBase = "https://raw.githubusercontent.com/TheCynosure/ComputerCraftScripts/master/"
local version = 1.0

function get(args)
	res = http.get(repoURLBase .. args[1] .. ".lua")
	fName = split(args[1], "/")
	fName = fName[table.getn(fName) - 1]
	print("")
	print("Writing " .. fName)
	fHandle = fs.open(fName, "w")
	fHandle.write(res.readAll())
end

function help()
	print("")
	print(" -- Command -- ")
	print("get - Download a file based on its path")
	print("exit - Exits the program")
end


print("Git Pkg Manager V" .. version .. " by TheCynosure")
while true do
	--Check for commands
	write("> ")
	local command = read()
	if(command == "get") then
		get(split(command, " "))
	elseif(command == "help") then
		help()
	elseif(command == "exit") then break end
end