args = {...}

function refuel()
	--Check whole inventory for fuel
	for i = 1, 16 do
		turtle.select(i)
		turtle.refuel()
	end
end

function move(block_num)
	for i = 1, block_num - 1 do
		while turtle.getFuelLevel() == 0 do
			refuel()
		end
		while(turtle.attack()) do end
		-- Check if we can move forward.
		if(not turtle.forward()) then
			-- If not dig forward then move again.
			turtle.dig()
			turtle.forward()
		end
	end
end

local width = args[1]
local height = args[2]

if tonumber(width) < 1 or tonumber(height) < 1 then
	print("Invalid Height or Width")
end

local turnCounter = 0
for h = 1, height do
	print("Moving to level " .. h)
	for j = 1, width do
		move(width)
		if(j < tonumber(width) and turnCounter % 2 == 0) then
			turtle.turnLeft()
			turtle.dig()
			turtle.forward()
			turtle.turnLeft()
			turnCounter = turnCounter + 1
		elseif(j < tonumber(width)) then
			turtle.turnRight()
			turtle.dig()
			turtle.forward()
			turtle.turnRight()
			turnCounter = turnCounter + 1
		end
	end
	if(h < tonumber(height)) then
		turtle.digDown()
		turtle.down()
		turtle.turnRight()
		turtle.turnRight()
	else
		for i = 1, height - 1 do
			turtle.up()
		end
	end
end