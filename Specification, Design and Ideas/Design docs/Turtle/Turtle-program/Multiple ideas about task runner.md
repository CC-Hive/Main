task files have three functions
 * init - optional, hive will pass no args
 * cleanup - also optional and no args from hive
 * run - required, hive will give checkpoint name as arg or no arg for 

checkpoints - hive.checkpoint(uniqueID:anyType) uniqueID will be passed to run if task is interrupted and resumed, it's up to the task to recover partual progress from there

allow simple scripting in tasks? if this sub task returns this then do this, else do that...
