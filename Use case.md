# A basic multi farm set-up
A user has two turtles and many farms, some are tree farms other are wheat. A conventionsal farming program would have one turtle wait until the crop has grown and then harvest it and return to waiting. Hive provides a better way, which allows multiple turtles to monitor many farms and get fuel from a central location.

Each farm's maintanece operation is defined as a task (which is basically a lua program with some location data). Tasks get scheduled for exicution, when a task need to be ran the server (which stores the tasks) assigns it to a turtle.

Opon reciving a task, the turtle navigates to the task location as runs it. When the task ends the turtle fall back into control of the server, ready to recive a new task. If needed the turtle will gather more fuel and remove junk from its inventory. Idealy the task should have cleaned up the inventory before it finished.

At the same time the second turtle could be running a different task to tend to a different farm. Should all turtles be buzy when another task triggers, the server will queue it for as soon as possible (while still respecting priority ordering).

One of the major benifits of Hive is that one farm is not dependent on a single indevidual turtle. Any turtle connected to the server can maintain the farm if assigned to. When a task to check a farm the second time (or subserquent times), whichever turtle is free and closest to the task location will be assigned. This will not neciserily be the turtle that checked the farm the privious time. Said turtle could be refueling, tending to another task, or free but happened to be a bit further away than the newly assigned turtle.
