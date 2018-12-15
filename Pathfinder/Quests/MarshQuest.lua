local cpath = select(1, ...) or "" -- callee path
local function rmlast(str) return str:sub(1, -2):match(".+[%./]") or "" end -- removes last dir / file from the callee path
local cdpath = rmlast(cpath) -- callee dir path
local cpdpath = rmlast(cdpath) -- callee parent dir path

local pf = require (cpdpath .. "MoveToApp")
local Lib = require (cpdpath .. "Lib/Lib")
local Game = require (cpdpath .. "Lib/Game")
local Table = require (cpdpath .. "Lib/Table")

local MarshQuest = {}

local area = nil

marshTraining1 = {}
marshNpcList = {}

function Quest.path()
local area = getAreaName()
local map = getMapName()

	for npc=1, #marshNpcList, 1 do
		if isNpcVisible(marshNpcList[npc]) then
			if pf.mapName() == getNpcArea(map, getNpcData(marshNpcList[npc]).x, getNpcData(marshNpcList[npc]).y) then
				if getNpcData(marshNpcList[npc]).isBattler and getNpcData(marshNpcList[npc]).canBattle then
					Lib.log1time("Battling NPC: " .. marshNpcList[npc] .. ".")
					return talkToNpc(marshNpcList[npc])
				end
			else
				if getNpcData(marshNpcList[npc]).isBattler and getNpcData(marshNpcList[npc]).canBattle then
					Lib.log1time("Battling NPC: " .. marshNpcList[npc] .. ".")
					return pf.moveTo(area, Game.getNpcArea(map, npcX, npcY))
				end
			end
		end
	end
	
end

return MarshQuest