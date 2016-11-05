-- this is the CI file which will be run
if not howlci then
  error("This file requires howlci, for a self build use howl manually.")
end

shell.setDir("Code")
if shell.run("howl") then
  howlci.status("ok","shell.run is ok")
else
  howlci.status("fail","shell.run failed")
end