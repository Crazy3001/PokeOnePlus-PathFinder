## - The map system
The map system is located in `Pathfinder/Maps`, there are two big sections, as well as the maps for pokecenters and items used by API calls like moveToPC():
- The maps for the algorithm, such as the Regions maps. They represent Nodes and Links, a node is a Map and links are the possible Maps accessible from it.
- The Exceptions maps, inside `MapExceptions`.

`GlobalMap` is used to link the main regions maps together.

### - Understanding the need for exceptions:

Sometimes, you can only access a part of a map because of your team, items or simply because the map is divided by a cave, or another zone  
For example: `Route 10` is divided in multiple parts due to water, and `Rock Tunnel`.  
Another example would be `Route 2`: there are parts before and after the forest, some part you can only access with `cut`.  
In these cases the maps need to be subdivided for the algorithm to make no mistakes.  
Example: If we are on the top side of `route 2` then the closest Pokecenter would be in `Pewter City`, if we are on the bottom side then it is in `Viridian City`.  
If there is something that could prevent you from traversing a link from the current map, you should make exceptions.  
There are exceptions aswell if moving to a link require talking to a NPC.

### - Adding map without exceptions:

Take a look at the region maps from [Kanto](https://github.com/Crazy3001/PokeOnePlus-PathFinder/blob/master/Pathfinder/Maps/Kanto/KantoMap.lua) as an example:
```lua
KantoMap["node"] = {["link1"] = {distance1}, ["link2"] = {distance2}}
```
The node is the name of the Map  
We can have as many links as we need, they MUST be names of other nodes in the map, they MUST have a number distance.  
Example :
```lua
KantoMap["Player Bedroom Pallet"] = {["Player House Pallet"] = {1}}
```
  
Sometimes you can have restrictions on a link, for example if you need surf.  
`-- KantoMap["node"] = {["link"] = {distance, {["restrictionType"] = {"restriction"}}}}`  
The `restrictionType`s must either be `abilities` or `items`, there can be multiple restrictions. The account must fulfill every `restriction` paired to `restrictionType` in order to make the link traversable  
Example:
```lua
KantoMap["Pallet Town"] = {["Player House Pallet"] = {1}, ["Route 21"] = {1, {["abilities"] = {"surf"}}}, ["Route 1"] = {1}}
```
Here the link will only be usable if the player has `surf`

### - Exceptions handling:

#### Substitutes Areas

If the area must be subdivided, we need to know which part is which, so we define substitute area with rectangles. See the file `MapExceptions/SubstituteMaps`.  
```lua
    ["Area Name"] = {
        ["SubArea_X] = {{x1, y1, x2, y2}, {x1, y1, x2, y2}} -- location of the subarea
        ["SubArea_Y] = {{x1, y1, x2, y2}} -- location of the subarea
    },
    ["Route 2"] = {
        ["Route 2_A"] = {{138, 19, 152, 50}}, -- bottom / viridian side
        ["Route 2_B"] = {{153, 16, 166, 48}}, -- down right / bottom of stop house 3
        ["Route 2_C"] = {{5, 62, 44, 86}, {6, 87, 9, 91}}, -- top / pewter side
        ["Route 2_D"] = {{17, 87, 45, 153}} -- top right / digletts side
        },
```
There can be as many rectangles as you need to, the rectangles MUST cover the whole subarea area.  
Adding all subarea rectangles MUST cover the whole map Area.  
`Route 2` is subdivided in four submaps.  
  
We also need to define links, as for any other areas:  
```lua
KantoMap["Route 2_A"] = {["Viridian City"] = {1}, ["Viridian Forest Gate South"] = {1}, ["Route 2_B"] = {0, {["abilities"] = {"cut"}}}}
KantoMap["Route 2_B"] = {["Viridian Forest Gate East"] = {1}, ["Route 2_A"] = {0, {["abilities"] = {"cut"}}}}
KantoMap["Route 2_C"] = {["Viridian Forest Gate North"] = {1}, ["Pewter City"] = {1}, ["Route 2_D"] = {0, {["abilities"] = {"cut"}}}}
KantoMap["Route 2_D"] = {["Viridian Forest Gate East"] = {1}, ["Route 2 East"] = {1}, ["Diglett's Cave_C"] = {1}, ["Grannys House"] = {1}, ["Route 2_C"] = {0, {["abilities"] = {"cut"}}}}
```
Here we have distances of 0 because we do not want the algorithm to weight the path between subarea, it could have been 0.2 or something else as well.  
Note that each subarea have it's own links and restrictions.  
  
All links must also be defined. Not just the normal map links, but also linking Areas and sub areas.
located in `MapLink`
If the link is just 1 cell, you can use just the X, Y coordinate of that cell:
```lua
mapLink["node"] = {
    ["destNode"] = {x, y} -- the cell which teleports to destNode from node.
}
mapLink["Oak's Lab"] = {
	["Pallet Town"] = {{22, 108}}
}
```
If the link is multiple cells, you have to use a rectangle and it will find the nearest cell in that rectangle:
```lua
mapLink["Route 2_A"] = {
	["Viridian City"] = {{138, 51, 141, 51}}, -- nearest row of moveable cells linking the areas
	["Viridian Forest Gate South"] = {{146, 19, 148, 19}}, -- more than 1 cell linking the maps
	["Route 2_B"] = {{153, 30, 153, 30}, {153, 41, 153, 41}} -- multiple single cells linking areas must be wrote as rectangles
}
```
The pathfinder will know which cell to go to access the maps from `Route 2_A`.

#### Npc Exceptions
If moving from a map A to a map B requires talking to a NPC you must fill the data inside `NpcExceptions`  
```lua
npcExce["node"] = {
    ["destNode"] = {{npcX, npcY}, dialogAnswer, "dialogCheck"}
}
npcExce["Vermilion City"] = {
	["S.S. Anne"] = {{112, 199}, "Yes", "Ok...You want to enter the S.S. Anne?"}
}
```
The dialogs must be the full sentences.
