--Inventory - Server
rednet.open("right")

local turtles = {} --array of al turtle where the name is the key to a array 
local tasks = {} --array of tasks that can be assigned to a turtle the key is the name of the tasks
local dockStations = {} -- array of places where turtle can pick up and drop of items and ?fuel?

-- Assign a DockStation to a turtle
function assignDockStation(turtle, neededItems)
	local freeDockStation = getAvailableDockstation()
	if freeDockStation = nil then
		--wait?
	end
	local serializedStation = textutils.serializedItems(freeDockStation)
	local serializedItems = textutils.serializedItems(neededItems)
	
	-- Transmit the assignment
	rednet.send("Insufficient"..serializedItems..";"..serializedStation)
end

function getAvailableDockstation()  
	-- See if any dockstation are not occupied
	for i, #dockStations do
		if ~dockStations.occupied then
			dockStations.occupied = true
			return dockStations
		end
	end
	-- Looks like we couldn't find any free dockStations
	return nil
end

function compareItems(required, possesion)
	for i, #required do
		for j, #possesion do
			if required[i].name == possesion[j].name and required[i].damage == possesion[j].damage then
				if required[i].count > possesion[j].count then
					return "Insufficient"
				end
			end
		end
	end
	return "Sufficient"
end

print("Server started...")
local running = true
while running do
	id,msg = rednet.receive("Hive")
	print("message received")
	local message = {}
	count = 0
	if msg ~= nil then
        for word in string.gmatch(msg, '([^;]+)') do
			message[count] = word
			count = count + 1
        end
	end
	if message[0] == "InventoryCheck" then
		local turtle = turtles[message[1]]
		local task = tasks[turtle.task]
		local neededItems = task.items
		local turtleInventory = textutils.unserialize(message[2])
		
		local compareResult = compareItems(neededItems, turtleInventory)
		if compareResult == "Sufficient" then
			--neededItems is the same as turtleInventory
			rednet.send("Sufficient")
		elseif compareItems == "Insufficient" then
			--turtle laks the required items
			assignDockStation(turtle, neededItems)
		elseif compareResult "Excess" then
			--Not yet implement maybe idee for later
		end
	end
end

