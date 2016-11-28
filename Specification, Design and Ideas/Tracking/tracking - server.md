Turtle states:
* Ready for task
* On task <taskID> - special taskID = 0 turtle is track only - doesn't request tasks from this hive (such as a player controlled turtle)
* Errored
* Unknown - the expected update timer expired before an update was recived from the turtle

Display headings for the summary table:
* ID - the turtle's id
* Label - the turtle's label
* State - the last known status of the turtle, or unknown if the timer expired
* Last Known Location

Selecting a turtle in this view (via keyboard or mouse) provides a detailed view:
* all the above information from the summary table
* the old state if the current state is unknown or errored
* details on the error is it's erroed
* its last reported inventory and equipped items
* its last reported fuel count
* 


Function psudocode:
```
On turtle register
  recive abilities (the turtles equipped peripherals and managed inventory)
  add to list of known turtles
  send timer length so turtle knows how frequently to send updates
```

```
on turtle unregister
  remove turtle from list
```

```
on message from unregistered turtle
  add turtle to list of known turtles
  list turtle state as errored
  set error info to "unregistered turtle"
  store data as normal, except state goes into old state of error
```

```
on message from turtle
  reset timer till unkown state
  update info with recived data
```