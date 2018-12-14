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
npcList = {"Gary", "Youngster Joey", "Jr. Trainer Sherman", "Lass Nancy", "Old Man San Tsu", "Bugcatcher Yolo", "Bugcatcher Riley", "Bugcatcher Ricky", "Bugcatcher Charles", "Youngster John", "Dave", "Zackery", "Jr. Trainer Steve", "Jr. Trainer Rocky", "Hiker Edwin"}

function BoulderQuest.path()
local area = getAreaName()
local map = getMapName()

	if getTeamSize() == 0 then
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
		if not pf.moveTo(area, "Viridian Pokémon Center") then
			talkToNpcOnCell(9, 119)
		end
	elseif carl == false then
		if not pf.moveTo(area, "Viridian Pokémon Mart") then
			talkToNpcOnCell(10, 68)
		end
	elseif dizzy == false then
		if not pf.moveTo(area, "Trainers School") then
			talkToNpcOnCell(14, 8)
		end
	elseif lara == false then
		talkToNpcOnCell(20, 52)
		
	elseif Game.minTeamLevel() < 10 then
		levelPokesTo = 10
		
		for npc=1, #npcList, 1 do
			if isNpcVisible(npcList[npc]) then
				if (pf.mapName() == Game.getNpcArea(map, getNpcData(npcList[npc]).x, getNpcData(npcList[npc]).y)) then
					if getNpcData(npcList[npc]).isBattler and getNpcData(npcList[npc]).canBattle then
						Lib.log1time("Battling NPC: " .. npcList[npc] .. ".")
						return talkToNpc(npcList[npc])
					end
				else
					if getNpcData(npcList[npc]).isBattler and getNpcData(npcList[npc]).canBattle then
						Lib.log1time("Battling NPC: " .. npcList[npc] .. ".")
						return pf.moveTo(area, Game.getNpcArea(map, npcX, npcY))
					end
				end
			end
		end	
		
		return updateTargetArea(boulderTraining1, "Grass")
		
	elseif Game.minTeamLevel() >= 10 and Game.minTeamLevel() < 15 then
		levelPokesTo = 15
		
		for npc=1, #npcList, 1 do
			if isNpcVisible(npcList[npc]) then
				if (pf.mapName() == Game.getNpcArea(map, getNpcData(npcList[npc]).x, getNpcData(npcList[npc]).y)) then
					if getNpcData(npcList[npc]).isBattler and getNpcData(npcList[npc]).canBattle then
						Lib.log1time("Battling NPC: " .. npcList[npc] .. ".")
						return talkToNpc(npcList[npc])
					end
				else
					if getNpcData(npcList[npc]).isBattler and getNpcData(npcList[npc]).canBattle then
						Lib.log1time("Battling NPC: " .. npcList[npc] .. ".")
						return pf.moveTo(area, Game.getNpcArea(map, npcX, npcY))
					end
				end
			end
		end
		
		return updateTargetArea(boulderTraining2, "Grass")
		
	elseif Game.minTeamLevel() >= 15 then
	
		for npc=1, #npcList, 1 do
			if isNpcVisible(npcList[npc]) then
				if (pf.mapName() == Game.getNpcArea(map, getNpcData(npcList[npc]).x, getNpcData(npcList[npc]).y)) then
					if getNpcData(npcList[npc]).isBattler and getNpcData(npcList[npc]).canBattle then
						Lib.log1time("Battling NPC: " .. npcList[npc] .. ".")
						return talkToNpc(npcList[npc])
					end
				else
					if getNpcData(npcList[npc]).isBattler and getNpcData(npcList[npc]).canBattle then
						Lib.log1time("Battling NPC: " .. npcList[npc] .. ".")
						return pf.moveTo(area, Game.getNpcArea(map, npcX, npcY))
					end
				end
			end
		end	

		if not pf.moveTo(area, "Pewter Gym") then
			return talkToNpcOnCell(15,92)
		end
		
    end
	
end

function onDialogMessage(message)
	if stringContains(message, "You should visit the Poké Center and Poké Mart! Both are useful places for aspiring trainers such as yourself.") then
		oldMan = false
	end
	if (stringContains(message, "The Poké Mart, where you can buy items, is not far away. Go take a look!") or stringContains(message, "There you go, take care of them!")) and oldMan == false then
		oldMan = true
		carl = false
	end
	if (stringContains(message, "She can teach you something about Pokémon!") or stringContains(message, "How may I help you?")) and carl == false then
		carl = true
		dizzy = false
	end
	if stringContains(message, "If not, feel free to use the computers!") then
		dizzy = true
	end
	if stringContains(message, "Have you already found Lara? Please, look for her!") then
		lara = false
	end
	if stringContains(message, "Some Pokémon only appear rarely...") or stringContains(message, "Feel free to explore the rest of the forest as you like!") then
		lara = true
	end
end

return BoulderQuest