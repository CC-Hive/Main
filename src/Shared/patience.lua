--
-- Copyright 2019 Lupus590
--
-- Permission is hereby granted, free of charge, to any person obtaining a copy
-- of this software and associated documentation files (the "Software"), to
--  deal in the Software without restriction, including without limitation the
--  rights to use, copy, modify, merge, publish, distribute, sublicense, and/or
--  sell copies of the Software, and to permit persons to whom the Software is
--  furnished to do so, subject to the following conditions: The above
--  copyright notice and this permission notice shall be included in all copies
--  or substantial portions of the Software.
--
-- THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
-- IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
-- FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
-- AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
-- LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING
-- FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS
-- IN THE SOFTWARE.
--

local function argChecker(position, value, validTypesList, level)
  -- check our own args first, sadly we can't use ourself for this
  if type(position) ~= "number" then
    error("argChecker: arg[1] expected number got "..type(position),2)
  end
  -- value could be anything, it's what the caller wants us to check for them
  if type(validTypesList) ~= "table" then
    error("argChecker: arg[3] expected table got "..type(validTypesList),2)
  end
  if not validTypesList[1] then
    error("argChecker: arg[3] table must contain at least one element",2)
  end
  for k, v in ipairs(validTypesList) do
    if type(v) ~= "string" then
      error("argChecker: arg[3]["..tostring(k).."] expected string got "..type(v),2)
    end
  end
  if type(level) ~= "nil" and type(level) ~= "number" then
    error("argChecker: arg[4] expected number or nil got "..type(level),2)
  end
  level = level and level + 1 or 3

  -- check the client's stuff
  for k, v in ipairs(validTypesList) do
    if type(value) == v then
      return
    end
  end

  local expectedTypes
  if #validTypesList == 1 then
      expectedTypes = validTypesList[1]
  else
      expectedTypes = table.concat(validTypesList, ", ", 1, #validTypesList - 1) .. " or " .. validTypesList[#validTypesList]
  end

  error("arg["..tostring(position).."] expected "..expectedTypes
  .." got "..type(value), level)
end

local config = require("treeFarm.libs.config")

local running = false

local oldError = error
local function error(mess, level)
  running = false
  return oldError(mess, (level or 1) +1)
end

local timers = {}

local function startTimer(secondsToWait)
  argChecker(1, secondsToWait, {"number"})
  if not running then
    error("patience is not running yet, have you called enterLoop?")
  end

  -- add to list
  local timerId = string.format("%08x", math.random(1, 2147483647))
  timers[timerId] = secondsToWait

  return timerId
end

local function cancelTimer(timerId)
  argChecker(1, timerId, {"string"})
  if not running then
    error("patience is not running yet, have you called enterLoop?")
  end

  timers[timerId] = nil
end

local doLoop = true
local function exitLoop()
  doLoop = false
end

local function enterLoop(patienceFileName, updateInterval)
  argChecker(1, patienceFileName, {"string", "nil"})
  patienceFileName = patienceFileName or ".patience"
  argChecker(2, updateInterval, {"number", "nil"})
  updateInterval = updateInterval or 5 -- TODO: is there a way to get this more accurate without hammering the HDD?

  if running then
    return false, "already running"
  end
  running = true
  doLoop = true

  -- read the file
  local ok, data = config.load(patienceFileName)
  if ok then
    timers = data
  else
    if data == "not a file" then
      timers = {}
    else
      error("patience couldn't load file with name: "..patienceFileName
      .."\ngot error: "..data)
    end
  end
  while doLoop do
    for timerId, timeRemaining in pairs(timers) do
      -- queue events if expired
      if timeRemaining <= 0 then
        os.queueEvent("patienceTimer", timerId)
        timers[timerId] = nil
      end
    end
    -- decrement the timeRemaining
    for k, timeRemaining in pairs(timers) do
      timers[k] = timeRemaining - updateInterval
    end
    local ok, err = config.save(patienceFileName, timers)
    if not ok then
      error("patience couldn't save file, got error: "..err)
    end
    if doLoop then -- quick exit
      sleep(updateInterval)
    end
  end
  running = false -- just in case people want to start us again
  return true
end

local function isRunning()
  return running
end

local patience = {
  startTimer = startTimer,
  cancelTimer = cancelTimer,
  exitLoop = exitLoop,
  enterLoop = enterLoop,
  run = enterLoop,
  start = enterLoop,
  stop = exitLoop,
  isRunning = isRunning,
  hasStarted = isRunning,
}

return patience
