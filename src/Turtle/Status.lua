-- status updater
--
-- sends status updates about the turtle to the server
--
-- Licence: MIT Lupus590

-- TODO: launch damon function
local deamonManager = require("deamonManager") -- TODO: check require path

local heartBeatTimer = settings.get("Hive.Status.HeartBeatTimer",10) -- TODO: custom settings API? CC built in doesn't do well with multiple files and programs
deamonManager.add(function()
  -- TODO: periodically send updates
  -- TODO: detect changes in state and update
end)
