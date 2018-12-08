--Inventory - Turle
rednet.open("right")

local inventory = {}
local turteName = "Donna"

--fills the inventory array with the inventory's data
function CheckInventory() 
	for i = 1, 16 do
		local data = turtle.getItemDetail(i)
		if data then
			--check if this item is all ready in the table
			local place = inventoryContains(data.name, data.damage)
			if place > 0 then
				inventory[place].count = inventory[place].count+data.count
			else
				local Item = {}
				Item.name = data.name
				Item.damage = data.damage
				Item.count = data.count
				table.insert(inventory,Item)
			end
		end
	end
end

--check if there already is that item in the inventory
function inventoryContains(name, damage)
	for i=1, #inventory do
		if inventory[i].name == name and inventory[i].damage == damage then
			return i
		end
	end
	return 0
end

function printInventory()
	for i=1, #inventory do
		print(inventory[i].name)
		print(inventory[i].damage)
		print(inventory[i].count)
	end
end

--send information to server and wait for respons
--main program
function main() 
	CheckInventory()
	--printInventory()
	--send information
	local serializedTable = textutils.serialize(inventory)
	rednet.broadcast("InventoryCheck;"..turteName..";"..serializedTable,"Hive")

	--wait for respons
	id, msg = rednet.recieve("Hive")
	print("message received")
	local message = {}
	count = 0
	if msg ~= nil then
		for word in string.gmatch(msg, '([^;]+)') do
			message[count] = word
			count = count + 1
		end
	end

	if message[0] == "Sufficient" then 
		--Nothing is needed
	elseif message[0] == "Insufficient" then
		local requiredItems = textutils.unserialize(message[1])
		local dockStation = textutils.unserialize(message[2])
		goTo(dockStation.position)
	end
end

main()