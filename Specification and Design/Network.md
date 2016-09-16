# The Interface Specification
This may be turned into an API, maybe two parts (one for server and one for turtle)
Implementation should be built on top of rednet using the Hive protocol.
http://computercraft.info/wiki/Rednet_%28API%29
Message information in this document assumes that rednet will add/has removed it's headers.

Encryption is a no, it is unnecessary for this project

todo
* how do files get between server and turtle
* how does the user use the server (Dedicated client or [vncd/nsh](https://github.com/CC-Hive/cc-netshell))

Protocals:
* Hive-Tasks
* Hive-InventoryManager
* Hive-Mapping
* Hive-Status

Key:
* (note: headings are proposed names, they may not be the end function name)
* if any of the below are not listed then it implies nil or false
* arg: function takes an argument as defined
* returns: function returns this data
* blocking: function discards events until it gets the one it wants
* collects: function gathers listed data for it's use

## Register
* Turtle -> Server
* Turtle asks to join a server's turtle pool
* blocking: true
* arg: server to join as string (rednet host name)
* returns: true (if joined)
 * else false with reason string ("server not found", "rejected by server")
* this can't handle multiple protocol hosts with the same name
* collects: turtle name, equipped items, fuel count, location, inventory list and count
* 

## Assign Task
* Server -> Turtle
* Server sends a task to a Turtle
* blocking: true
* arg: taskID
* arg (optional): turtle
* collects: task data, task files
* 

## Update State
* Turtle -> Surver
* turtle sends information to the surver about itself
* blocking: false
* collects: fuel value, inventory, equipped items, label (computer/turtle label), 
