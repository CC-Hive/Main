* Done something? Tick it off.
* Current goals all checked? Message @Lupus590 to update the todo list. (You can also have your pick of the backlog)
* Got a comment on something here? If it's short then add it (don't forget to sign your username)

## Priority Goal
#### If you can do this then please do it
* [ ] todo to issues? use github project? each item to do will be a seperate issue (thats a lot of issues)
 * will need a priority system
 * how to do sub tasks? issues are for big tasks? several seperate github projects?
 * can have tags (design/coding/bug/etc)

## Current Goals
* [ ] check links in all documents
* [ ] Move docs to wiki?
* [ ] apply this: https://en.wikipedia.org/wiki/MoSCoW_method
* [ ] implement Hive turtle tracking
* [ ] Howl-CI caches howl code builder download
* [ ] organise documentation
 * [ ] contents section for https://github.com/CC-Hive/Main/blob/master/Specification,%20Design%20and%20Ideas/Misc/Misc%20Links.md
 * [ ] cleanup useless info on links in https://github.com/CC-Hive/Main/blob/master/Specification,%20Design%20and%20Ideas/Misc/Misc%20Links.md
 * [ ] merge map.md into https://github.com/CC-Hive/Main/blob/master/Specification,%20Design%20and%20Ideas/Misc/Misc%20Links.md
 * [ ] make sections subfolders and have multiple smaller files https://github.com/CC-Hive/Main/blob/master/Specification,%20Design%20and%20Ideas/Misc/Misc%20Links.md
 * [ ] finish contributing.md - needs lua code presentation guidlines
 * [ ] copy link into file https://github.com/CC-Hive/Main/blob/master/Specification%2C%20Design%20and%20Ideas/Misc/help%20docs.md

## Backlog Goals
* [ ] additinal/better use cases
* [ ] Howl prepends all resulting lua files with [license](https://github.com/CC-Hive/Main/blob/master/LICENSE.txt), preferably as a sting/table of strings so that it can be printed to the screen if a user requests an about page
* [ ] https://help.github.com/articles/helping-people-contribute-to-your-project/
* [ ] Expand with new things to do
* [ ] choose a path finding program, [starNav](http://www.computercraft.info/forums2/index.php?/topic/19491-) or [egps](http://www.computercraft.info/forums2/index.php?/topic/25856-un-official-egps-developement-mapping-pathfinding-api/) - things like this should be in specification folder
* [ ] clean up md files
* [ ] [Others please review] local coorodinate system for task areas (off set from world coordinates by task location)
* [ ] https://github.com/chocolatey/choco/blob/master/COMMITTERS.md
* [ ] https://github.com/chocolatey/choco/blob/master/CONTRIBUTING.md
* [ ] add to contributing
 * [ ] Steps for creating good issues or pull requests.
 * [ ] Links to external documentation, mailing lists, or a code of conduct.
 * [ ] Community and behavioral expectations.
* [ ] other special files: https://en.wikipedia.org/wiki/README
* [ ] link map in readme, to aid navigation of visitors
* [ ] low priority: decide distribution method, github mile stones? is this possible via a script on pastebin?

## Extended Goals
#### Don't work on these until the above are done
* [ ] GUI scales
 * [ ] all GUIs scale to fit screen size 
 * [ ] all GUIs work on a pocket computer (with multishell being used)
 * [ ] all GUIs rescale when screen size changes
* [ ] base navigation? http://www.computercraft.info/forums2/index.php?/topic/11067-idea-exchange/page__view__findpost__p__251718 http://www.computercraft.info/forums2/index.php?/topic/27007-a-rather-dapper-mapper-%E2%80%93-satellite-gps-maps/
* [ ] tasks are represented by mini-tasks, some of these can depend on other mini-tasks being compleated before they can be done, some may be done in parallel (e.g. multiple turtles per tasks)
* [ ] Multiple turtles can cooperate on one large task - possible implementations:
 * a turtle acts as a server for other turtles - will make small tasks more usefull as turtles out of range of cental server can get new tasks without going all the way back to base; server-turtle will forward status updates back to cental
  * server-turtle can work too, but what if it runs out of fuel? can't go get more as other turtles need his server part?
   * migrate server to new turtle?
   * wait until no dependents?
   * ask dependent to get fuel for server?
 * peer-to-peer, turtles all have task list and ask eachother "Has anyone done this yet, I'd like to do it?"
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
* [ ] port to OpenComputers? make a CC compatability layer first?
