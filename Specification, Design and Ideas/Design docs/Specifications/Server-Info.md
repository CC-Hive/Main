# Information viewed on the interface: (fuel count and inventory will be let out if there isn't enough space)
* all the above information from the summary table
* the old state if the current state is MIA or errored
* details on the error is it's erroed
* its last reported inventory and equipped items
* its last reported fuel count

# Function psudocode for server:

```
On turtle register
  recieve all information (see Turtle-Info)
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
  update info with received data
```