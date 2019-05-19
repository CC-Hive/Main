-- status updater
--
-- recives status updates from turtles and displays them
--
-- Licence: MIT Lupus590

-- TODO: thing to listen for updates in background
local heartBeatTimer = settings.get("Hive.Status.HeartBeatTimer",10) -- if this expires then turtle is MIA
local turtlesLastKnownStatus = {}
-- needs to update turtlesLastKnownStatus table

-- TODO: get_status_function (optional_arg turtle = allTurtles)
local function getStatus(turtle)
  if turtle == nil 
end

-- TODO: subscribe_status_function (optional_arg turtle = allTurtles)
