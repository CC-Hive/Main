--Inventory - Api
local succes = false
local oldSlot = turtle.getSelectedSlot()

--Checks for a specific item in current slot and returns succes
local function checkItem(name)
        if turtle.getItemDetail() ~= nil then
                local data = turtle.getItemDetail()
                if data.name == name then
                        return true
                else
                        return false
                end
        end
        return false
end
 
--check if item is in inventory and returns succes
function checkInventory(name)
        oldSlot = turtle.getSelectedSlot()
        for i = 1,16 do
            turtle.select(i)
            if checkItem(name) then
                turtle.select(oldSlot)
                return true
            end
        end
        turtle.select(oldSlot)
        return false
end

--check if item is in inventory and returns numberSlot
function checkInventorySlot(name, excludeslot)
        oldSlot = turtle.getSelectedSlot()
        for i = 1,16 do
			if i ~= excludeslot then
				turtle.select(i)
				if checkItem(name) then
					turtle.select(oldSlot)
					return i
				end
			end
		end
        turtle.select(oldSlot)
        return nil
end

--move "amount(int)" of "name("minecraft:cobblestone")" items to slot "slot(int)" and returns succes
function placeItemInSlot(name, slot, amount)	
	if type(name) ~= "string" or type(slot) ~= "number" or type(amount) ~= "number" then
		return false
	else
		oldSlot = turtle.getSelectedSlot()
		local data = turtle.getItemDetail(slot)
		if data then
			if data.name == name then
				amount = amount-data.count
			else
				return false
			end
		
		end
		if amount > 0 then
			for j = 1, amount do
				local numberSlot = checkInventorySlot(name, slot)
				if numberSlot == nil then
					return false
				else
					local data = turtle.getItemDetail(numberSlot)
					turtle.select(numberSlot)
					if data.count < amount then
						if turtle.transferTo(slot) then
							amount = amount-data.count
						end
					else
						if turtle.transferTo(slot, amount) then
							amount = 0
							break
						end
					end
				end
			end
		end
		turtle.select(oldSlot)
		if amount == 0 then
			return true
		else 
			return false
		end
	end
end
 
--places any item in any direction and returns succes
function place(name ,dir)
        succes = false
        for i = 1,16 do
            turtle.select(i)
            if checkItem(name) then
                succes = true
            end
        end
        if succes then
                if dir == "up" then
                        return turtle.placeUp()
                elseif dir == "down" then
                        return turtle.placeDown()
                else
                        return turtle.place()
                end
        else      
            if checkInvetory then
                --print("Could not place any "..name.." "..dir)
            else
                --print("There is no "..name.." in inventory")
            end
        end
        return false
end

local result = placeItemInSlot("minecraft:cobblestone", 5, 7)
print(result)
local result = placeItemInSlot("minecraft:dirt", 16, 64)
print(result)