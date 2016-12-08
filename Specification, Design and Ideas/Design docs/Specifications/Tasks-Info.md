# Tasks

# General:

* Tasks don't have access to fs api and file part of io api,
insead they should use the settings api which will be modified so that Hive knows when it is written to so that it can synchronise it with the server.
See [This](https://github.com/lupus590/CC-Hive_moved-see-readme/issues/23) for more information.

# Key
* Trigger: what starts the task, usually events
* Location: where the task starts
* Priority: high, normal, low
* drone requirements (pickaxe/hoe/fuel level/ect.) --blank for none
* drone ID (if a specific drone needs to do this task put the ID here) --blank for any drone, can be array so that one of the drones will do it

# Goals
* Interruptible tasks have checkpoints, task will be resumed from the checkpoint. Possible interruptions:
  * server/chunk unload
  * higher priority task is given

# Creating a task
* Task ID
* Description
* Location (and facing)
* File path
* Repeat trigger
 * Timer
 * Rednet message (optional sender ID and message contents)
 * Manual (task will be added to the task library but not the task queue)
 * none (task is added to the task queue and deleted when it compleates)
 * custom (user defines the trigger event and any paramiters)
* add to queue now OR add to library which will wait for trigger (some repeat triggers may limit the options)



### Different tasks:

## Clean Inventory
* Priority: high
* Trigger: user made task was finished
* Location: user defined junk drop-off point (can be an trash can or a sorting system input)
* Removes items from the turtle which don't belong

## Refuel
* Priority: high
* Location: user defined fuel collection point
* Restocks fuel if low
 
## Building Farm
* Priority: low
* Trigger: on user input
* Location: assigned by user 
* Run one of the many farm building programs, which will need a defined area (two world coordinates on the same y-level)

## Map World
* Priority: low
* Trigger: idle turtle
* Location: areas with old map data, or areas with no map
* Explores the world, taking notes of the terrain and reporting back to the server

## Harvesting Farm
* Priority: normal
* Trigger: by user or automatic recycle
* Location: farming station
* Performs one harvesting cycle on farm

## Mining 
* Priority: low
* Trigger: by user or automatic recycle
* Location: starts from bedrock and works up
* Mines until inventory is full, or if it has enderchest; until the job is finished
