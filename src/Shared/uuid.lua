-- TODO: I'me starting to think that Hive will want this but Tree Farm will not need it

-- TODO: remove this from here. (Hive may still want it so put it there) #homeOnly #high


-- https://www.google.com/search?q=uuid+v4+spec

-- TODO: rename as we can't keep to the spec?
  -- spec seems to say that one of the numbers are not random to dictate the spec, how do we handle this if we can't keep the spec? should we change it?
    -- I think one of the older specs used time and the mac address, maybe we should mimic that using the computer id, os.day() and os.time() as the mac address? I think that one expected millisecond clock though.

-- NOTE: rednet uses math.random( 1, 2147483647 ) for it's message IDs

-- https://repl.it/languages/lua
local ids = {}
local count = 0
local function genNewID()
  return 0
end
while true do
  local new = genNewID()
  if ids[new] then
    print(count)
    error()
  end
  count = count + 1
  ids[new] = true
end
-- testing = count before collision
-- math.random( 1, 2147483647 ) = 15257
-- ("%08x"):format(math.random( 1, 2^31-2 )) = 15357
-- ("%08x"):format(math.random( 1, 2^31-2 ))..("%08x"):format(math.random( 1, 2^31-2 )) = process killed by repl, got to 4194305
-- TODO: test on CC #homeOnly

-- NOTE: the main (only?) issue is making sure that two computers don't get the same seed







-- NOTE: OS.time may not be accurate enough for unique ids
  -- ingame time definatly wont
-- TODO: implement above note and investigate other methods
  -- can I find a way to identify servers?
  -- old CC will be hard
    -- maybe just make something that is garanteed to be random in CC?

-- no license :(
-- https://gist.github.com/jrus/3197011

-- things which could be used to seed random
  -- os.time() -- ingame time
  -- os.getComputerID()
  -- os.clock() -- amount of time since computer started
  -- os.day() -- ingame days since world started
  -- gps.locate()
  -- commands.??? -- could we take the uuid of a player or mob? (do all mobs of the sametype have the same id? I.E. do all pigs have the same id?)
    -- block id of some kind?
  -- os.epoch("utc") -- best one, may allow keeping to spec (I think) doesn't exist in old CC
  -- shell.getRunningProgram() -- no shell for API and can't eaisly convert to number (asci numbers?)
  -- tutle.getFuelLevel()
  -- could we listen to rednet traffic?
  -- os.pullEventRaw() will need to override or have a daemon

-- from discord https://discordapp.com/channels/477910221872824320/477911902152949771/577959903499386894
-- NOTE: would this work, there won't be alot of different events
if not SHA then
  os.loadLib("SHA");
end

local oldPullEvent = os.pullEvent;
local oldPullEventRaw = os.pullEvent;

local epool = "";

local function storeAll(...)
  for _,v in ipairs({...}) do
   epool = epool..v
  end
  return ...
end

function os.pullEvent(event)
return storeAll(oldPullEvent(event));
end

function os.pullEventRaw(event)
 return storeAll(oldPullEventRaw(event));
end

function randomBits()
  while #epool < 1024 do
    os.sleep(1)
  end
  local hash = SHA.SHA256(epool);
  epool = hash:sub(5,-1);
  local a,b,c,d = hash:sub(1,4);
  return a*16777216+b*65536+c*256+d;
end
