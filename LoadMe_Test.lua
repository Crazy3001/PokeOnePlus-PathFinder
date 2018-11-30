name = "Simple Example"
author = "Crazy3001"

description = [[Simple application of the PathFinder, this script moves to a destination from anywhere.]]

-- First you need to get the module loaded in your script :
local pf = require "Pathfinder/MoveToApp"  -- loading the module MoveToApp and getting the functions it sends back in a table: pf.
-- Now to use PathFinder functions you can write pf.functionName().
-- You can require MoveToApp from anywhere above in the hierarchie.
local area = nil -- we want to only call getAreaName() one time per onPathAction() so we use this variable

--[[

-- Most useful calls :
moveTo(area, dest) --> Main function for moving to dest. return false when done. true if destination is not reached. Need to be called multiple times. dest can be a string or a list of string. map is the current player area
moveToPC(area)   --> Move to nearest Pokecenter.
useNearestPokecenter(area) --> Go heal your team to the nearest Pokecenter.
moveToMapCell() --> Move to a certain cell in a subarea

if you need more details see HOWTO and README
------------------]]

function onPathAction()
    area = getAreaName() -- get the area name
	pf.moveTo(area, "Pokémon League Reception")
	-- the line above will move the bot to the map "Pokémon League Reception"
end

function onBattleAction()
    return run() or attack() or sendAnyPokemon() -- we use this to not get stuck in battle.
end

