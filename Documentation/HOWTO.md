## Read first
Last updated for v1.0.3
This is a guide on possibilities provided by the PathFinder module, and how to use them.

I strongly advice you [read](https://github.com/Crazy3001/PokeOnePlus-PathFinder/blob/master/LoadMe_Test.lua) the `LoadMe_Test.lua.` As it is the simplest application of the module you can make.  

The only module you need to require is `moveToApp`. The module return a table of functions.  
How to load the module: `Pathfinder = require "Pathfinder/MoveToApp"`

The following assumes you understand the lua module system and understand how to use functions from a module.

## Module functions list :
```lua
-- legend : return type function(params)
bool moveTo(currentArea, dest)
bool moveToMapCell(currentArea, dest, x, y) -- use this for subareas
bool moveToPC(currentArea)
bool useNearestPokecenter(currentArea) -- always true
maybeList getPath(start, dest) -- checking for possible paths
```

## Detailed informations :
### - Moving to a map
```lua
moveTo(currentArea, dest)
```
The function expects two parameters:  
`currentArea` contains the area the player is in, you can get it with `getAreaName()`.  
`dest` contains a string or list of string. All strings must be the names of a known area ( case sensitive ).  
You can see the list of maps supported inside the `Maps` folder. [Kanto](https://github.com/Crazy3001/PokeOnePlus-PathFinder/blob/master/Pathfinder/Maps/Kanto/KantoMap.lua), [Johto](https://github.com/Crazy3001/PokeOnePlus-PathFinder/blob/master/Pathfinder/Maps/Johto/JohtoMap.lua)  
If it receive a list of maps it will go to the closest one.  
Return `true` if moving and `false` when destination is reached.  
Examples use of moveTo(currentArea, dest) :
```lua
local currentArea = getAreaName() -- we get the name of the area the player is in.

moveTo(currentArea, "Viridian City") --> will move to Viridian City.
moveTo(currentArea, {"Viridian City", "Ecruteak City"}) --> will move to the closest area found.
```  
### - Moving to a specific cell on an area
```lua
moveToMapCell(currentArea, dest, x, y)
```
The function expects four parameters:  
`currentArea` contains the area the player is in, you can get it with `getAreaName()`  
`dest` contains a string that is the name of a known area ( case sensitive ).  
`x` and `y` coordinates on the area.  
This function is mainly usefull if you are trying to move in a area that exist in different place in the game. Simply use coordinates and the Pathfinder will find the correct subarea.  
```lua
-- we assume currentArea contains the name of the area the player is in.
moveToMapCell(currentArea, "Route 2", 28, 35) --> will move to 28, 35 in Route 2.
```  
### - Moving to a Pokecenter
```lua
moveToPC(currentArea)
```
The function expects a parameter `currentArea` containing the name of the area the player is in.  
This function request `moveTo()` with a list of Pokecenter, resulting in moving to the closest Pokecenter.  
return `true` when moving, `false` when in a Pokecenter.  
Example use of moveToPC() :
```lua
if accessBox then -- if we need to access a Pokecenter in our script
  if not moveToPC(currentArea) then -- move to the closest Pokecenter
    log("Pokecenter reached") -- if moveToPC(currentArea) returns false we're in a Pokecenter
  end
end
```
### - Using the closest Pokecenter
```lua
useNearestPokecenter(currentArea)
```
The function expects a parameter `currentArea` containing the name of the area the player is in.  
The function request `moveTo()` with a list of Pokecenter, resulting in moving to the closest Pokecenter.  
When in a Pokecenter the function will talk to the nurse and heal your team.  
return `true` when moving, `false` when in a Pokecenter.  
This function moves to the closest Pokecenter and use it.  
Return value will always be `true`. you should be using your own verification to know when to use it.  
Example use of useNearestPokecenter() :
```lua
if needHeal then -- if we need to heal in our script
  useNearestPokecenter(currentArea)
end
```
### - Checking paths
```lua
maybeList getPath(start, dest)
```
This function attempt to find a path from `start` to `dest` and returns it.  
The function expects `start` to be a string and `dest` to be a string or a list of strings.  
The return will either be a list with nodes: `{"n1", "n2", ...}` which represent the path. Or `nil` if no path could be found.  
It could be used to check if an account can pathfind to a destination with the current team / items it has. Or other creative purposes.  
Example use of getPath(start, dest) :
```lua
local path = getPath("Pallet Town", "Cinnabar Island") -- will return true if we can move from Pallet Town to Cinnabar Island
assert(path, "Path was not found.") -- if the Path is nil we stop.
fatal("The path found is: " .. table.concat(path, ", ")) -- we log the path found and terminate.
```
## Notes
The `Pathfinder` will verify your team abilities to move such as `cut`, `surf` etc everytime you ask for a new destination.  
