-- this is the CI file which will be run
if not howlci then
  error("This file requires howlci, for a self build use howl manually.")
end

-- compied from https://github.com/SquidDev-CC/Howl/blob/954d89371cf3ceeca2b26ec8c690d6540b818a59/.build.lua
if _HOST then howlci.log("info", "Host: " .. _HOST) end
if _CC_VERSION then howlci.log("info", "CC Version" .. _CC_VERSION) end
if _MC_VERSION then howlci.log("info", "MC Version" .. _MC_VERSION) end
if _LUAJ_VERSION then howlci.log("info", "LuaJ Version " .. _LUAJ_VERSION) end


--if not shell.run("pastebin run LYAxmSby get 703e2f46ce68c2ca158673ff0ec4208c/Howl.min.lua Howl") then
--  howlci.status("fail","failed to get Howl")
--end

--print("root files")
--shell.run("ls")

--shell.setDir("Code")
if not shell.run("Howl.min.lua", "Code/HowlFile.lua") then
  howlci.status("fail","failed to call Howl")
end