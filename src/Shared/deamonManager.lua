-- deamon manager
--
-- background process host
--
-- Licence: MIT Lupus590

local deamons = {}
local function add(newDeamonName, newDeamonFunc, replaceIfExists)
  if type(newDeamonName) ~= "string" then
    error("Arg[1] expected string, got "..type(newDeamonName))
  end
  if type(newDeamonFunc) ~= "function" then
    error("Arg[2] expected function, got "..type(newDeamonFunc))
  end
  if replaceIfExists and type(replaceIfExists) ~= "bool" then
    error("Arg[3] expected bool, got "..type(replaceIfExists))
  end
  if not replaceIfExists and deamons[newDeamonName] then
    error("Deamon exists")
  end
  deamons[newDeamonName]={coroutine=coroutine.create(newDeamonFunc), eventFilter = nil}
end

local function remove(deamonName)
  if type(newDeamonName) ~= "string" then
    error("Arg[1] expected string, got "..type(newDeamonName))
  end
  deamons[deamonName] = nil
end

local function listDeamons()
  local list = {}
  for k,v in pairs(deamons) do
    table.add(list,k) -- users can list them all with ipairs
    list[k]=true -- or index by name to see if it's there
  end

end

local function deamonHost()
  local event = table.pack()
  for k, v in pairs(deamons)
    if coroutine.status(v) == "suspended" then
      if v.eventFilter == nil or v.eventFilter == event[1] then
        v.eventFilter = coroutine.resume(v, table.unpack(event))
      end
    end
  end
end

local deamonManager = {add=add,
remove=remove,
listDeamons=listDeamons,
deamonHost=deamonHost,
}

return deamonManager
