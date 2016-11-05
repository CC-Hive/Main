-- this is the CI file which will be run
if not howlci then
  error("This file requires howlci, for a self build use howl manually.")
end

if not shell.run("pastebin run LYAxmSby get 703e2f46ce68c2ca158673ff0ec4208c/Howl.min.lua Howl") then
  howlci.status("fail","failed to get Howl")
end

shell.setDir("Code")
if not shell.run("Howl") then
  howlci.status("fail","failed to call Howl")
end