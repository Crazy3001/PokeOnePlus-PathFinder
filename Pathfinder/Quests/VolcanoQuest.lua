local cpath = select(1, ...) or "" -- callee path
local function rmlast(str) return str:sub(1, -2):match(".+[%./]") or "" end -- removes last dir / file from the callee path
local cdpath = rmlast(cpath) -- callee dir path
local cpdpath = rmlast(cdpath) -- callee parent dir path

local pf = require (cpdpath .. "MoveToApp")
local Lib = require (cpdpath .. "Lib/Lib")
local Game = require (cpdpath .. "Lib/Game")
local Table = require (cpdpath .. "Lib/Table")

local VolcanoQuest = {}

local area = nil

volcanoTraining1 = {}
volcanoNpcList = {}

function Quest.path()
local area = getAreaName()
local map = getMapName()

	if Game.isSorted(levelPokesTo) then
		Lib.log1time("Sorting Finished")
		return true
	end
	
	if Game.needPokecenter() then
		Lib.log1time("Using Pokecenter")
		return pf.useNearestPokecenter(area)
	end
	
	if getMoney() > 10000 and getItemQuantity("Poké Ball") < 10 then
		Lib.log1time("Buying 50 Poké Balls")
		return pf.useNearestPokemart(area, "Poké Ball", 50)
	elseif getMoney() > 4000 and getItemQuantity("Poké Ball") < 10 then
		Lib.log1time("Buying 20 Poké Balls")
		return pf.useNearestPokemart(area, "Poké Ball", 20)
	elseif getMoney() > 2000 and getItemQuantity("Poké Ball") < 10 then
		Lib.log1time("Buying 10 Poké Balls")
		return pf.useNearestPokemart(area, "Poké Ball", 10)
	elseif isShopOpen() then 
	    return closeShop()
	end

	for npc=1, #volcanoNpcList, 1 do
		if isNpcVisible(volcanoNpcList[npc]) then
			if pf.mapName() == getNpcArea(map, getNpcData(volcanoNpcList[npc]).x, getNpcData(volcanoNpcList[npc]).y) then
				if getNpcData(volcanoNpcList[npc]).isBattler and getNpcData(volcanoNpcList[npc]).canBattle then
					Lib.log1time("Battling NPC: " .. volcanoNpcList[npc] .. ".")
					return talkToNpc(volcanoNpcList[npc])
				end
			else
				if getNpcData(volcanoNpcList[npc]).isBattler and getNpcData(volcanoNpcList[npc]).canBattle then
					Lib.log1time("Battling NPC: " .. volcanoNpcList[npc] .. ".")
					return pf.moveTo(area, getNpcArea(map, getNpcData(volcanoNpcList[npc]).x, getNpcData(volcanoNpcList[npc]).y))
				end
			end
		end
	end
	
end

return VolcanoQuest