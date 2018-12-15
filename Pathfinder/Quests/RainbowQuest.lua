local cpath = select(1, ...) or "" -- callee path
local function rmlast(str) return str:sub(1, -2):match(".+[%./]") or "" end -- removes last dir / file from the callee path
local cdpath = rmlast(cpath) -- callee dir path
local cpdpath = rmlast(cdpath) -- callee parent dir path

local pf = require (cpdpath .. "MoveToApp")
local Lib = require (cpdpath .. "Lib/Lib")
local Game = require (cpdpath .. "Lib/Game")
local Table = require (cpdpath .. "Lib/Table")

local RainbowQuest = {}

local area = nil

rainbowTraining1 = {}
rainbowNpcList = {}

function Quest.path()
local area = getAreaName()
local map = getMapName()

	for npc=1, #rainbowNpcList, 1 do
		if isNpcVisible(rainbowNpcList[npc]) then
			if pf.mapName() == getNpcArea(map, getNpcData(rainbowNpcList[npc]).x, getNpcData(rainbowNpcList[npc]).y) then
				if getNpcData(rainbowNpcList[npc]).isBattler and getNpcData(rainbowNpcList[npc]).canBattle then
					Lib.log1time("Battling NPC: " .. rainbowNpcList[npc] .. ".")
					return talkToNpc(rainbowNpcList[npc])
				end
			else
				if getNpcData(rainbowNpcList[npc]).isBattler and getNpcData(rainbowNpcList[npc]).canBattle then
					Lib.log1time("Battling NPC: " .. rainbowNpcList[npc] .. ".")
					return pf.moveTo(area, getNpcArea(map, getNpcData(boulderNpcList[npc]).x, getNpcData(boulderNpcList[npc]).y))
				end
			end
		end
	end
	
end

return RainbowQuest