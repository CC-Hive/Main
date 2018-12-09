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
    error("Arg[3] expected bool, got "..type(replaceIfExists))
  end
  if not replaceIfExists and daemons[newdaemonName] then
    error("daemon exists")
  end
  daemons[newdaemonName]={coroutine=coroutine.create(newdaemonFunc), eventFilter = nil}
end

local function remove(daemonName)
  if type(newdaemonName) ~= "string" then
    error("Arg[1] expected string, got "..type(newdaemonName))
  end
  daemons[daemonName] = nil
end

local function listdaemons()
  local list = {}
  for k,v in pairs(daemons) do
    table.add(list,k) -- users can list them all with ipairs
    list[k]=true -- or index by name to see if it's there
  end

end

local function daemonHost()
  local event = table.pack()
  for k, v in pairs(daemons)
    if coroutine.status(v) == "suspended" then
      if v.eventFilter == nil or v.eventFilter == event[1] then
        v.eventFilter = coroutine.resume(v, table.unpack(event))
      end
    end
  end
end

local daemonManager = {add=add,
remove=remove,
listdaemons=listdaemons,
daemonHost=daemonHost,
}

return daemonManager
