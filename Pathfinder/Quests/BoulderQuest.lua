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

	if getTeamSize() == 0 then
		pauseMessage = "Current Quest: Boulder Badge - Going to talk to Prof. Oak to choose our first Pokemon!"
		Lib.log1time(pauseMessage)
		if not pf.moveTo(area, "Oak's Lab") then
			if starter == "Random" then
				pushDialogAnswer(starters[math.random(#starters)])
				return talkToNpcOnCell(22, 103)
			else 
				pushDialogAnswer(starter)
				return talkToNpcOnCell(22, 103)
			end
		end
		
	elseif oldMan == false then
		pauseMessage = "Current Quest: Boulder Badge - Going to talk Nurse Joy at the Pokecenter as part of a quest."
		Lib.log1time("Talking to NPC: Nurse Joy")
		if not pf.moveTo(area, "Viridian Pokémon Center") then
			return talkToNpcOnCell(9, 119)
		end
	elseif carl == false then
		pauseMessage = "Current Quest: Boulder Badge - Going to talk Carl at the Pokemart as part of a quest."
		Lib.log1time("Talking to NPC: Carl")
		if not pf.moveTo(area, "Viridian Pokémon Mart") then
			return talkToNpcOnCell(10, 68)
		end
	elseif dizzy == false then
		pauseMessage = "Current Quest: Boulder Badge - Going to talk Dizzy at the Trainers School as part of a quest."
		Lib.log1time("Talking to NPC: Dizzy")
		if not pf.moveTo(area, "Trainers School") then
			return talkToNpcOnCell(14, 8)
		end
	elseif lara == false then
		pauseMessage = "Current Quest: Boulder Badge - Going to talk Lara in Viridian Forest as part of a quest."
		Lib.log1time("Talking to NPC: Lara")
		return talkToNpcOnCell(20, 52)
	end

	for npc=1, #boulderNpcList, 1 do
		if isNpcVisible(boulderNpcList[npc]) then
			if pf.mapName() == getNpcArea(map, getNpcData(boulderNpcList[npc]).x, getNpcData(boulderNpcList[npc]).y) then
				if getNpcData(boulderNpcList[npc]).isBattler and getNpcData(boulderNpcList[npc]).canBattle then
					pauseMessage = "Current Quest: Boulder Badge - Battling NPC's."
					Lib.log1time("Battling NPC: " .. boulderNpcList[npc] .. ".")
					return talkToNpc(boulderNpcList[npc])
				end
			else
				if getNpcData(boulderNpcList[npc]).isBattler and getNpcData(boulderNpcList[npc]).canBattle then
					pauseMessage = "Current Quest: Boulder Badge - Battling NPC's."
					Lib.log1time("Battling NPC: " .. boulderNpcList[npc] .. ".")
					return pf.moveTo(area, getNpcArea(map, getNpcData(boulderNpcList[npc]).x, getNpcData(boulderNpcList[npc]).y))
				end
			end
		end
	end
		
	if Game.minTeamLevel() < 8 then
		levelPokesTo = 8
		pauseMessage = "Current Quest: Boulder Badge - Training team until all pokemon are at least level 8."
		Lib.log1time(pauseMessage)
		return updateTargetArea(boulderTraining1, "Grass")
		
	elseif Game.minTeamLevel() >= 8 and Game.minTeamLevel() < 13 then
		levelPokesTo = 13
		pauseMessage = "Current Quest: Boulder Badge - Training team until all pokemon are at least level 13."
		Lib.log1time(pauseMessage)
		return updateTargetArea(boulderTraining2, "Grass")
		
	elseif Game.minTeamLevel() >= 13 then
		pauseMessage = "Current Quest: Boulder Badge - Going to Pewter Gym to battle all trainers and Brock to get the Boulder Badge."
		Lib.log1time(pauseMessage)
		if not pf.moveTo(area, "Pewter Gym") then
			talkToNpcOnCell(15,92)
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
	if stringContains(message, "Go to the Cerulean City Gym and test your abilities!") then
		Lib.log1time("Boulder Badge Obtained!")
	end
end

return BoulderQuest