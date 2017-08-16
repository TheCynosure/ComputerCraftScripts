local repoURLBase = "https://raw.githubusercontent.com/TheCynosure/ComputerCraftScripts/master/"
local version = 1.0

function get(args) {
	res = http.get(repoURLBase .. args[1])
	fName = split(args[1], "/")
	fName = fName[table.getn(fName) - 1]
	fHandle = io.open(fName, "w")
	fHandle.write(res.readAll())
}

function help() {
	print("")
	print(" -- Command -- ")
	print("get - Download a file based on its path")
	print("exit - Exits the program")
}

function exit() {
	
}

print("Git Pkg Manager V" .. version .. " by TheCynosure")
while true do
	--Check for commands
	write("> ")
	local command = read()
	if(command == "get") then
		get(split(command, " "))
	elseif(command == "help") then
		help()
	elseif(command == "exit") then
		exit()
	end
end