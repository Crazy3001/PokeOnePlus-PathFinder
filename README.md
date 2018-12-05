## Pathfinder for PokeOne+ v1.0.2
This script provides a module to move from a map A to a map B using the shortest path.  
The Objective of this project is to provide a tool to simplify scripting in PokeOne+. So you don't have to use an elseif per map you're crossing.  
It also provides advanced functionality, settings, and more...  

[For explanation on how to use the API read HOWTO](https://github.com/Crazy3001/PokeOnePlus-PathFinder/blob/master/Documentation/HOWTO.md).  
[If you want to know how the map system works or how to add maps](https://github.com/Crazy3001/PokeOnePlus-PathFinder/blob/master/Documentation/ADDINGMAPS.md).  
[If you want to see a list of map names](https://github.com/Crazy3001/PokeOnePlus-PathFinder/blob/master/Documentation/KANTOMAPLIST.md).  
Use `LoadMe_Test.lua` to test the module, I recommand you [read](https://github.com/Crazy3001/PokeOnePlus-PathFinder/blob/master/LoadMe_Test.lua) it as well. 

#####Features

* Move to the requested map or go to the closest in a list of Map given.
* move to a specific cell on a map.
* checking for possible paths.
* Move to the closest Pokecenter.
* Use the closest Pokecenter.
* Provides Examples such as a script to level anywhere.

#####Know issues :

* X map does not work! Not everything is currently implemented, I welcome help if you want to implement maps, make pull request on github.
* Planning on discover and headbutt scripts. ( all you have to do is tell it where to go.)

## Contributors:

### Most of this work is credited to:
- Rympex
- MeltWS
- Zonz

### lua-astar
*https://github.com/Shakadak/lua-astar*
A simple implementation of the A* pathfinding algorithm
The `aStar` function expect a few more arguments than most other implementations available anywhere.
I therefore invite you to read `example.lua`

### Original Projects
- https://github.com/Rympex/Pathfinding-Dijkstra
- https://github.com/MeltWS/ProShinePathfinder
- https://github.com/Zonz/ProShinePathfinder
