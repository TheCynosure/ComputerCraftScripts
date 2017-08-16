function tabLength(T) 
	local count = 0
	for _ in pairs(T) do count = count + 1 end
	return count
end


if(tabLength(arg)  < 3) then
	print("This program requires three arguments.")	
else
	print(arg[1] .. " " .. arg[2])
end