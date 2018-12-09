--Author: Lupus590
--License: MIT

local description = {
  "This script is designed to be run on startup and checks if computers have a label.",
  "If it does not then it makes one based on several pieces of data which can help identify the computer.",
  "The format of the resulting label is '<Advanced|Normal><Turtle|Pocket|Computer><ID>' all within 2 characters (plus id)",
  "If the computer already has a label and you want this script to assign a new one then you can run the script with the argument f",
}


local function genLabel()
	local advance --is the computer an advanced golden computer?
	local _type --is the computer a turtle, pocketPC or just a computer?
	
	if term.isColour() then --advanced colour PC?
		advance = "A"
	else --must be not advanced
		advance = "N"
	end

	
	if turtle then --turtle?
		_type = "T"
	elseif pocket then --pocketPC?
		_type = "P"
	else --must be normal computer
		_type = "C"
	end
	
	if commands then --command computer?
		os.setComputerLabel("Com"..tostring(os.getComputerID()))
	else
		os.setComputerLabel(advance.._type..tostring(os.getComputerID())) --append the id do that the computer has a unique label
	end
end

local function printArgs()
	print("Welcome to lupus590's automatic label setting script!")
	print(table.concat(description, "\n"))
end


-- main
-- TODO: handle multiple args (should print args and exit)
local args = {...} or nil
if args[1] == nil then
	--normal mode
	if os.getComputerLabel() == nil then
		genLabel()
	end
elseif args[1] == "f" or args[1] == "F" then
	--force a re-gen
	genLabel()
	print("Label set to "..os.getComputerLabel())
else
	printArgs();
end
