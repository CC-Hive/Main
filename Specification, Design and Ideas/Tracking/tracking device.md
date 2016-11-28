Data Format:

drone ID --fancy name of computer ID

location (and facing) stored in a table {x,y,z,f} --coordinates must match that of the way MC stores them in debug screen

status (can be task ID which means working, or ERROR, or IDLE)

messages --any special message from the drone, ERROR messages will go here, progress output too
	
This is a lot of information to send down rednet, best be infrequent
