#To Do List
####Meta
* [ ] move bonus tasks to bottom of their sections
* [ ] move scraped ideas to bottom of their sections
* [ ] move compleate tasks to bottom of their sections
* [ ] move maybe tasks (?) to top of their sections

####Turtle Stuff
* [x] Update lama (last forum post said that it was buggy/not working in CC1.63) Re-writing it works too.
* [ ] ~~Combine lama with starNav?~~
* [ ] ~~turtle movement api - make it emit turtle_moved event?~~
* [ ] bonus: http://www.computercraft.info/forums2/index.php?/topic/11067-idea-exchange/page__view__findpost__p__224637
* [ ] bonus: Check points for turtle tasks, continue a task if interrupted or on reboot (May cause problems with ccDocker)
* [ ] turtle task requester
* [ ] tracking reporter
* [ ] ~~tasks run in a sandbox, file access is done in a folder (some tasks may need to see rom, so we will have to emulate it) (https://github.com/lupus590/CC-Hive/issues/23 www.computercraft.info/forums2/index.php?/topic/23361- )~~ using ccDocker
* [ ] ~~sudo mode to escape sandbox (I have no idea where scripts may need this "super user" access, but someone may want to escape the sandbox and this will provide a way that is plesent for both the turtle and user)~~ see above

####Server Stuff
* [ ] task master
* [ ] turtle watcher

####Client
* [ ] API
* [ ] Command Line Interface (should use api) Bonus, if api is ran as a program it provides the command line
* [ ] Graphical User Interface (should use the api)
* [ ] Turtle inventory viewer (over rednet)

####Shared/Other
* [ ] Auto Label Program, optional character for first letter of owners username
* [ ] Peripheral storage, turtles can swap their peripherals here, only packing what they need for a task
* [ ] BONUS: Item crafting, hive will craft items required for tasks. (or even allow item crafting tasks)
* [ ] BOONUS: support [this](http://www.computercraft.info/forums2/index.php?/topic/18646-rfc-metadata-file-structure-compatible-with-all-file-types) if .meta/ folder is found
* [ ] BONUS: Cooperative turtles, a task can take mulitple turtles which will work on the same task at the same time, however this task could also be done with a single turtle. (Master turtle and slave turtle/s?, muliple task files, one per turtle?)
* [ ] BONUS: CC 1.74 auto-complete support
* [ ] remote connect - control computers like you are there, using Lyquds' nsh and vncd, still have to get the launcher to use this thing
* [ ] lua table for storing user settings/gui skins
* [ ] BONUS: plugin system? have a folder that Hive loads them from on startup; plugin can register callbacks for events and choose whether callback is called before, after or overrides original behavour; how to handle multiple plugins modifying the same event, particularly if they all want to override? 
* [ ] an issue is opened on github when Hive crashes [github api reference](https://developer.github.com/v3/issues/#create-an-issue)

####Installer/Distribution
* [ ] (?) Use [Howl] (http://www.computercraft.info/forums2/index.php?/topic/21254-howl-lua-build-system/)
* [ ] CC 1.74 auto-complete support
* [ ] choose a directory to install too (based of location of installer?)
* [ ] package system
* [x] independent from repo folder structure (currently under testing)
* [ ] updater option (depends on package manager)
* [ ] bonus: progress bar

####Help Docs
* [ ] help docs are "registered" with the default help program
* [ ] make wiki on github repo, add one on CC wiki?
* [ ] ~~BONUS: if a printer is detected, offer to print a manual~~
