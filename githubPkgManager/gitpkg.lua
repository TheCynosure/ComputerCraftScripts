args={...}
local repoURLBase = "https://raw.githubusercontent.com/TheCynosure/ComputerCraftScripts/master/"
local version = 1.0

function split(s, delim)
	split_s = {}
	split_index = 1
	i = 1
	if(delim ~= nil and s ~= nil) then
		while true do
			i = string.find(s, delim, 1, true)
			if(i == nil) then
				break
			end
			if(i > 1 and string.sub(s, 1, i - 1) ~= nil) then
				split_s[split_index] = string.sub(s, 1, i - 1)
				split_index = split_index + 1
			end
			s = string.sub(s, i + 1, string.len(s))
		end
		split_s[split_index] = s
	end
	return split_s
end

print("Getting " .. repoURLBase .. args[1] .. ".lua")
res = http.get(repoURLBase .. args[1] .. ".lua")
fName = split(args[1], "/")
fName = fName[#fName]
print("Writing " .. fName)
fHandle = fs.open(fName, "w")
fHandle.write(res.readAll())
fHandle.close()