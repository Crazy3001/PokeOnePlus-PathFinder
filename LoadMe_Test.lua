name = "Simple Example"
author = "Crazy3001"

description = [[Simple application of the PathFinder, this script moves to a destination from anywhere.]]

-- First you need to get the module loaded in your script :
local pf = require "Pathfinder/MoveToApp"  -- loading the module MoveToApp and getting the functions it sends back in a table: pf.
-- Now to use PathFinder functions you can write pf.functionName().
-- You can require MoveToApp from anywhere above in the hierarchie.
local map = nil -- we want to only call getMapName() on time per onPathAction() so we use this variable

--[[

-- Most useful calls :
moveTo(map, dest) --> Main function for moving to dest. return false when done. true if destination is not reached. Need to be called multiple times. dest can be a string or a list of string. map is the current player map
moveToPC(map)   --> Move to nearest Pokecenter.
useNearestPokecenter(map) --> Go heal your team to the nearest Pokecenter.
moveToMapCell() --> 

if you need more details see HOWTO and README
------------------]]

function onPathAction()
    map = getAreaName() -- get the map name
		--log(getMapName())
		pf.moveTo(map, "Saffron City")
		--pf.useNearestPokecenter(map)
		--moveToArea("Player House 2F")
		--moveToCell(23, 16)
end

function onBattleAction()
    return run() or attack() or sendAnyPokemon() -- we use this to not get stuck in battle.
end

