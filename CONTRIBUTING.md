## Etiquette Regarding Communication
When requesting support, try to remember that we are all volunteers that have lives outside of this project and none of us are paid to ensure things work for you, so please be considerate of others' time when you are asking for things. Many of us have families/friends/work/university that also need time as well and only have so much time to give on a daily basis. We will do what we can to provide support when folks are running into issues, but you may have to wait, so a little consideration and patience will be welcome. After all, you are using a pretty good tool without cost. It may not be perfect (yet), and we know that.

Adapted from [choclatey](https://github.com/chocolatey/choco#etiquette-regarding-communication)

## Defining a contribution
You are a contributor if you...
* have made at least one pull request which has been accepted
* are/were a [member](https://github.com/orgs/CC-Hive/people) of the github organization
* have made changes to the wiki which haven't been reverted

## How to use github
Lupus590 made a [tutorial on the forums](http://www.computercraft.info/forums2/index.php?/topic/26002-)

## Prefered format for marking things to do in code/designs
`TODO: <short description of thing to do` This can be followed by a few more details, it may be helpful if your editor highlights the `TODO:` tag

## Prefered format for git commit messages
```
Capitalized, short (50 chars or less) summary

More detailed explanatory text, if necessary.

Write your commit message in the imperative: "Fix bug" and not "Fixed bug"
or "Fixes bug."  This convention matches up with commit messages generated
by commands like git merge and git revert.

- Bullet points are okay, you can use a hyphen or asterisk, but it must be followed by a
  single space, with blank lines in between

- Here is a second bullet point to demostate
```
adapted from [this blog](http://tbaggery.com/2008/04/19/a-note-about-git-commit-messages.html)

# General
* The master branch should always build (even if it does nothing), if you are making a new feature then make it in a new branch. See the [GitHub Flow](https://guides.github.com/introduction/flow/) for more information.
* Follow styling sheet (provisional below)
* Too many comments are better than too few, if a comment is exstanious then I ( @Lupus590 ) will remove it. I can't add comments for you though.
* This is open source software. Consider the people who will read your code, and make it look nice for them. It's sort of like driving a car: Perhaps you love doing donuts when you're alone, but with passengers the goal is to make the ride as smooth as possible. (Stolen from [here](https://github.com/opengovernment/opengovernment/blob/master/CONTRIBUTING.md))
* If your contibution is in the [todo list](https://github.com/CC-Hive/Main/blob/master/TODO.md) then please put a `x` in the box in TODO.md
* Try to keep commits descriptive (I will admit that I don't always do this)
* Do lots of small commits over one big one, it's easier for others to contribute with you and easier to revert parts
* Pull requests: if it's all related then it can all go together, just make sure it's not all one big commit (see above) I can revert parts I don't like later. As to deciding what's related, use your best judgment.
* This project is under the [MIT License](https://github.com/CC-Hive/Main/blob/master/LICENSE.txt). Any code contributions you make must be made under a compatible license.
* Contributers should document and publish their work in a way that allows another contributor to pick up on it if the original contributer stops working on the project due to any reason.

### Documentation Generation

#### Start here for basic syntax
 * [LDoc, a Lua Documentation Tool](http://stevedonovan.github.io/ldoc/manual/doc.md.html)

#### Additional syntax examples
 * http://stevedonovan.github.io/ldoc/examples/three.lua.html
 * http://stevedonovan.github.io/ldoc/examples/four.lua.html
 * http://stevedonovan.github.io/ldoc/examples/colon.lua.html
 * http://stevedonovan.github.io/ldoc/examples/multiple.lua.html
 * http://www.computercraft.info/forums2/index.php?/topic/21254-howl-lua-build-system/page__view__findpost__p__244826

### Some notes:
 * [Hive - a turtle control system (ComputerCraft Forums)](http://www.computercraft.info/forums2/index.php?/topic/22421-wip-mit-hive-a-turtle-control-system)
 * [Howl - Lua build system (ComputerCraft Forums)](http://www.computercraft.info/forums2/index.php?/topic/21254-howl-lua-build-system/)
 * [Howl - multiple files vs single combined file distribution](http://www.computercraft.info/forums2/index.php?/topic/24639-howl-multiple-files-vs-single-combined-file-distribution/)
