# Tasks

# Key
* Trigger: what starts the task, usually events
* Location: where the task starts
* Priority: high, normal, low

# Goals
* Interruptible tasks have checkpoints, task will be resumed from the checkpoint. Possible interruptions:
  * server/chunk unload
  * higher priority task is given

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
