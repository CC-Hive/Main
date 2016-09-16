--this is the file that users will run to use hive, it will provide the last resort error handler

--this program is assigned to Lupus590

local helpPath = "Hive/src/Help/"
local helpDocs = {server = "server.txt", turtle = "turtle.txt", client = "client.txt"}
local fileNames = {server = "server.lua", turtle = "turtle.lua", client = "client.lua"}
local logPath = "Hive/src/Logs/"
local logNames = (server = "server.log", turtle = "turtle.log", client = "client.log"}
local errorLols = {[1] = "","",""}

local function clearScreen()
  term.setTextColour(colours.white)
  term.setTextBackground(colours.white)
  term.clear()
  term.setCursorPos(1,1)
end


local args = {...} --name of "component" to run

local ok, rValue --did the program return ok, and what did it return
if #args == 0 then
  --ask user what program to run and for parameters to pass
else
  local program = table.remove(args,1) --remove the program name from the args, args will be passed to the launched component
  if program == fileNames.surver then
    clearScreen()
    ok,rValue = pcall(shell.run,fileNames.server,unpack(args))
  elseif program == fileNames.turtle then
    clearScreen()
    ok,rValue = pcall(shell.run,fileNames.turtle,unpack(args))
  elseif program == fileNames.client then
    clearScreen()
    ok,rValue = pcall(shell.run,fileNames.client,unpack(args))
  elseif program == "help"
    --i have no idea what to put here
  elseif program == "update"
    --download latest files from github
  else
    error("First parameter is not the name of a hive component, if you renamed them then you need to update this script",2)
  end
  --error handling starts here
  if not ok then
    clearScreen()
    print("Something went horribly wrong!")
    print("Error: "..tostring(rValue))
    print("This was not meant to happen.")
    print("You found an error that Hive could not recover from, please report it on github https://github.com/lupus590/CC-Hive/issues/new or on the CC forum thread http://www.computercraft.info/forums2/index.php?/topic/22421-")
    print("Hive has been writing error logs while it was working, we can use these logs to track down where the error happened and what caused it.")
    print("The logs can be found at: "..logPath)
    if http then
      print("Would you like this program to upload the error logs to pastebin? [y/n]")
      local _, confirm
      while not (confirm == "y" or confirm =="Y" or confirm == "n" or conform == "N") do
        _, confirm = os.pullEvent("char")
        print("")
        if confirm:lower() == "y" then
          --TODO: integrate with github and auto post an issue (https://developer.github.com/v3/issues/#create-an-issue)
          --upload each log to pastebin (eventually returns pasteCodes or pasteURLs)
          print("The error logs were uploaded to: pastebin.com/"..pasteCodes)
        elseif confirm:lower() == "n" then
          print("Please upload the logs yourself, find them at: "..logPath)
        else
          --wait for proper confirmation
        end
      end
    else --no HTTP
      print("Please upload the logs yourself, find them at: "..logPath)
    end
  end
end
