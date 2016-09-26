## Things to do
The other repositories will have their own to do lists, you may want to check those too
* Clean up to do lists from time to time (move compleated items to bottom)
* [ ] .gitignore for each repo - https://www.gitignore.io/api/linux%2Cmacos%2Cwindows
* [ ] gitter welcome screens
* [ ] additinal/better use cases
* [ ] Lupus590 has a bunch of bookmarks related to hive, need to sort them
* [ ] Add issue lables from main to other repos
* [ ] Howl prepends all resulting lua files with [license](https://github.com/CC-Hive/Main/blob/master/LICENSE.txt), preferably as a sting/table of strings so that it can be printed to the screen if a user requests an about page
* [ ] https://help.github.com/articles/helping-people-contribute-to-your-project/
* [ ] Expand with new things to do
* [ ] Create TODO.md for other repositories
* [ ] choose a path finding program, [starNav](http://www.computercraft.info/forums2/index.php?/topic/19491-) or [egps](http://www.computercraft.info/forums2/index.php?/topic/25856-un-official-egps-developement-mapping-pathfinding-api/)
* [ ] clean up md files
* [ ] [Others please review] local coorodinate system for task areas (off set from world coordinates by task location)
* [ ] https://github.com/chocolatey/choco/blob/master/COMMITTERS.md
* [ ] https://github.com/chocolatey/choco/blob/master/CONTRIBUTING.md
* [ ] add to contributing
 * [ ] Steps for creating good issues or pull requests.
 * [ ]Links to external documentation, mailing lists, or a code of conduct.
 * [ ] Community and behavioral expectations.
* [ ] other special files: https://en.wikipedia.org/wiki/README
* [ ] link map in readme, to aid navigation of visitors
* [ ] low priority: decide distribution method, github mile stones?

## Extended Goals
#### Don't work on these until the above are done
* [ ] base navigation? http://www.computercraft.info/forums2/index.php?/topic/11067-idea-exchange/page__view__findpost__p__251718 http://www.computercraft.info/forums2/index.php?/topic/27007-a-rather-dapper-mapper-%E2%80%93-satellite-gps-maps/
* [ ] tasks are represented by mini-tasks, some of these can depend on other mini-tasks being compleated before they can be done, some may be done in parallel (e.g. multiple turtles per tasks)
* [ ] Multiple turtles can cooperate on one large task - possible implementations:
 * a turtle acts as a server for other turtles - will make small tasks more usefull as turtles out of range of cental server can get new tasks without going all the way back to base; server-turtle will forward status updates back to cental 
 * ~~server manages everything~~
* [ ] metadata support https://github.com/lyqyd/metadata
* [ ] Turtles share pathfinding map data, data is stored on server and turtles pull copies of the map as needed and update the map if the world changes
* [ ] Multi language support, perhaps via a table
* [ ] Turtle Transportation Framework - A way to move turtles via a third party, think teleporting/trains/pipes anything which the turtle is inactive while being transported somewhere
* [ ] First time setup guidence, the different programs give instuctions to the user on required peripherals, how to connect a turtle, etc.
* [ ] Addon or plugin support, third-party code which can change the behavour of Hive in ways which a task can't (override how the server does things)
 * [ ] Plugin and Hive components subscribe to events handlers which use callback functions to notify things of events
* [ ] some programs can be loaded as an an API to access their functionality (example programs: http://pastebin.com/cUYTGbpb)
* [ ] stealth mode, turtles communicate to server via disks. good for pvp servers
* [ ] Package manager for addons/pugins and tasks
* [ ] http://www.computercraft.info/forums2/index.php?/topic/27038-generic-builder/
