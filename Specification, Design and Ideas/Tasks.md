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