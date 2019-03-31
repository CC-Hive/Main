-- daemon manager
--
-- background process host
--
-- Licence: MIT Lupus590

local daemons = {}
local function add(newdaemonName, newdaemonFunc, replaceIfExists)
  if type(newdaemonName) ~= "string" then
    error("Arg[1] expected string, got "..type(newdaemonName))
  end
  if type(newdaemonFunc) ~= "function" then
    error("Arg[2] expected function, got "..type(newdaemonFunc))
  end
  if replaceIfExists and type(replaceIfExists) ~= "bool" then
    error("Arg[3] expected bool or nil, got "..type(replaceIfExists))
  end
  if not replaceIfExists and daemons[newdaemonName] then
    error("daemon with name "..newdaemonName.." exists - to overwrite set arg[3] to true")
  end
  daemons[newdaemonName]={coroutine=coroutine.create(newdaemonFunc), eventFilter = nil}
  local returnedValues = table.pack(coroutine.resume(daemons[newdaemonName].coroutine))
  local ok = table.remove(returnedValues, 1)
    if not ok then
      error(table.unpack(returnedValues, 1, returnedValues.n))
    end
    daemons[newdaemonName].eventFilter = returnedValues[1]
end

local function remove(daemonName)
  if type(newdaemonName) ~= "string" then
    error("Arg[1] expected string, got "..type(newdaemonName))
  end
  daemons[daemonName] = nil
end

local function getDaemonList()
  local list = {}
  for k,v in pairs(daemons) do
    table.add(list,k) -- users can list them all with ipairs
    list[k]=true -- or index by name to see if it's there
  end
  return list
end

local function daemonHost()
  local event = table.pack(os.pullEventRaw())
  if not doLoop then
    return
  end
  for k, v in pairs(daemons)
    if coroutine.status(v) == "suspended" then
      if v.eventFilter == nil or v.eventFilter == event[1] then
        local returnedValues = table.pack(coroutine.resume(daemons[newdaemonName].coroutine, table.unpack(event, 1, event.n)))
        local ok = table.remove(returnedValues, 1)
        if not ok then
          error(table.unpack(returnedValues, 1, returnedValues.n))
        end
        daemons[newdaemonName].eventFilter = returnedValues[1]
      end
    end
  end
end

local doLoop = true

local function exitLoop()
  exitLoop = false
end

local function enterLoop()
  while doLoop do
    daemonHost()
  end
end

local daemonManager = 
  add=add,
  remove=remove,
  getDaemonList=getDaemonList,
  daemonHost=daemonHost,
  exitLoop=exitLoop,
  enterLoop=enterLoop,
}

return daemonManager
