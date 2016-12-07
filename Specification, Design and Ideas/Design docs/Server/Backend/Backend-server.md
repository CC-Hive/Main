The server computer will consist of two parts the interface which the user can interact with, and the server that will manage the turtles.
This will probably be one computer but it could be two.

## General:
The server will need to comunicate with the turtles there may be a api for this.
Implementation should be built on top of rednet using the Hive protocol.
For more detailed information see Server-Info, best to also see Task-Info to know what a task contains.

## Required components:
* It will send tasks to the turtles, this will be from the user through the interface or automatic tasks like harvesting a farm.
* The server will also keep track of all the turles and what they are doing(see turtle-status), the interface will use this information.
* If a turtle is stuck or MIA then, the server will send information of the last known position to the interface so the user can check it out, or maybe an other turtle.
If a turtle doesn't send any information to the server in the timelimit, than the turtle will be marked MIA.


## Ideas List:
* (your idea here)


## Rejected Idea:
* Encryption is a no, it is unnecessary for this project


## Other information:


Todo
* how do files get between server and turtle
* how does the user use the server (Dedicated client or [vncd/nsh](https://github.com/CC-Hive/cc-netshell)) - Htis line should be in interface I think - @Lupus590

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

# Register
* Turtle -> Server
* Turtle asks to join a server's turtle pool
* blocking: true
* arg: server to join as string (rednet host name)
* returns: true (if joined)
 * else false with reason string ("server not found", "rejected by server")
* this can't handle multiple protocol hosts with the same name
* collects: turtle name, equipped items, fuel count, location, inventory list and count
* 

# Assign Task
* Server -> Turtle
* Server sends a task to a Turtle
* blocking: true
* arg: taskID
* arg (optional): turtle
* collects: task data, task files
* 

# Update State
* Turtle -> Surver
* turtle sends information to the surver about itself
* blocking: false
* collects: fuel value, inventory, equipped items, label (computer/turtle label), 
