local cdpath = ""
local cpath = select(1, ...) -- callee path
if cpath ~= nil then
	cdpath = cpath:match(".+[/%.]") or cdpath -- callee dir path
end

local pf            = require (cdpath .. "Lib/MoveTo/MoveTo")
local DialogSolver  = require (cdpath .. "Lib/MoveTo/DialogSolver")
local moveToMapCell = require (cdpath .. "Lib/MoveTo/MoveToMapCell")
local Pokecenter    = require (cdpath .. "Lib/MoveTo/Pokecenter")
local Pokemart      = require (cdpath .. "Lib/MoveTo/Pokemart")
local MapPath       = require (cdpath .. "Lib/MoveTo/MapPath")

return {
	getPath = pf.getPath,
	moveTo = pf.moveTo,
	moveToMapCell = moveToMapCell.moveToMapCell,
	moveToPC = Pokecenter.moveToPC,
	useNearestPokecenter = Pokecenter.useNearestPokecenter,
	useNearestPokemart = Pokemart.useNearestPokemart,
	mapName = pf.mapName,
	getPathInMap = MapPath.getPath,
}
