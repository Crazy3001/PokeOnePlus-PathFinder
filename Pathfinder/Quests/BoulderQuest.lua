local cpath = select(1, ...) or "" -- callee path
local function rmlast(str) return str:sub(1, -2):match(".+[%./]") or "" end -- removes last dir / file from the callee path
local cdpath = rmlast(cpath) -- callee dir path
local cpdpath = rmlast(cdpath) -- callee parent dir path

local pf = require (cpdpath .. "MoveToApp")
local Lib = require (cpdpath .. "Lib/Lib")
local Game = require (cpdpath .. "Lib/Game")
local Table = require (cpdpath .. "Lib/Table")

local BoulderQuest = {}

local area = nil

starters = {"Bulbasaur", "Charmander", "Squirtle"}
boulderTraining1 = {"Route 1", "Route 22", "Route 2"}
boulderTraining2 = {"Route 2_C", "Viridian Forest"}
boulderNpcList = {"Gary", "Youngster Joey", "Jr. Trainer Sherman", "Lass Nancy", "Old Man San Tsu", "Bugcatcher Yolo", "Bugcatcher Riley", "Bugcatcher Charles", "Youngster John", "Dave", "Zackery", "Jr. Trainer Steve", "Jr. Trainer Rocky", "Hiker Edwin"}

function BoulderQuest.path()
local area = getAreaName()
local map = getMapName()

	for npc=1, #boulderNpcList, 1 do
		if isNpcVisible(boulderNpcList[npc]) then
			if pf.mapName() == getNpcArea(map, getNpcData(boulderNpcList[npc]).x, getNpcData(boulderNpcList[npc]).y) then
				if getNpcData(boulderNpcList[npc]).isBattler and getNpcData(boulderNpcList[npc]).canBattle then
					Lib.log1time("Battling NPC: " .. boulderNpcList[npc] .. ".")
					return talkToNpc(boulderNpcList[npc])
				end
			else
				if getNpcData(boulderNpcList[npc]).isBattler and getNpcData(boulderNpcList[npc]).canBattle then
					Lib.log1time("Battling NPC: " .. boulderNpcList[npc] .. ".")
					return pf.moveTo(area, getNpcArea(map, getNpcData(boulderNpcList[npc]).x, getNpcData(boulderNpcList[npc]).y))
				end
			end
		end
	end

	if getTeamSize() == 0 then
		Lib.log1time("Talking to NPC: Prof. Oak")
		if not pf.moveTo(area, "Oak's Lab") then
			if starter == "Random" then
				pushDialogAnswer(starters[math.random(#starters)])
				talkToNpcOnCell(22, 103)
			else 
				pushDialogAnswer(starter)
				talkToNpcOnCell(22, 103)
			end
		end
		
	elseif oldMan == false then
		Lib.log1time("Talking to NPC: Nurse Joy")
		if not pf.moveTo(area, "Viridian Pokémon Center") then
			talkToNpcOnCell(9, 119)
		end
	elseif carl == false then
		Lib.log1time("Talking to NPC: Carl")
		if not pf.moveTo(area, "Viridian Pokémon Mart") then
			talkToNpcOnCell(10, 68)
		end
	elseif dizzy == false then
		Lib.log1time("Talking to NPC: Dizzy")
		if not pf.moveTo(area, "Trainers School") then
			talkToNpcOnCell(14, 8)
		end
	elseif lara == false then
		Lib.log1time("Talking to NPC: Lara")
		talkToNpcOnCell(20, 52)
		
	elseif Game.minTeamLevel() < 8 then
		levelPokesTo = 8
		Lib.log1time("Training Until All Pokemon Are Level " .. levelPokesTo .. ".")
		return updateTargetArea(boulderTraining1, "Grass")
		
	elseif Game.minTeamLevel() >= 8 and Game.minTeamLevel() < 13 then
		levelPokesTo = 13
		Lib.log1time("Training Until All Pokemon Are Level " .. levelPokesTo .. ".")
		return updateTargetArea(boulderTraining2, "Grass")
		
	elseif Game.minTeamLevel() >= 13 then
		Lib.log1time("Going To First Gym!")
		if not pf.moveTo(area, "Pewter Gym") then
			return talkToNpcOnCell(15,92)
		end
		
    end
	
end

return BoulderQuest