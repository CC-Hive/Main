# The turtle information consist of:
* turtle-ID
* turtle-label
* type of turtle (pickaxeturtle)

Alterable turtle information:
* location (and facing) stored in a table {x,y,z,f} --coordinates must match that of the way MC stores them in debug screen
* status (can be task ID which means working, or ERROR, or IDLE or MIA)
* fuel count
* inventory (inventory won't always be send)


# function psudocode for turtle:

```
on timer
  send message with state, location
```

```
on register
  send all data
```

```
on data change
  send changed data 
```