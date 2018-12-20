local cpath = select(1, ...) or "" -- callee path
local function rmlast(str) return str:sub(1, -2):match(".+[%./]") or "" end -- removes last dir / file from the callee path
local cdpath = rmlast(cpath) -- callee dir path
local cpdpath = rmlast(cdpath) -- callee parent dir path

local pf = require (cpdpath .. "MoveToApp")
local Lib = require (cpdpath .. "Lib/Lib")
local Game = require (cpdpath .. "Lib/Game")
local Table = require (cpdpath .. "Lib/Table")

local CascadeQuest = {}

local area = nil

fossils = {"Dome", "Helix"}
cascadeTraining1 = {"Route 3", "Mt. Moon", "Mt. Moon B1F", "Mt. Moon B2F"}
cascadeTraining2 = {"Route 4_B", "Route 24", "Route 25", "Route 5"}
cascadeNpcList = {"Youngster Josh", "Lass Janice", "Bugcatcher Kent", "Lass Iris", "Youngster Ben", "Nerd Jason", "Youngster Yuri", "Bugcatcher Harry", "Scientist Adam", "Scientist Octavio", "Gentleman Garelt", "Lass Dazey", "Team Rocket Ruyi", 
				  "Team Rocket Viola", "Team Rocket Grim", "Team Rocket Bledge", "Lass Valerie", "Gary", "Bugcatcher Cale", "Lass Ali", "Youngster Timmy", "Lass Reli", "Jr. Trainer Evan", "Corben", "Camper Colin", "Hiker Franklin", "Youngster Joey", 
				  "Hiker Wayne", "Youngster Dan", "Picnicker Kelsey", "Hiker Nob", "Youngster Chad", "Camper Flint", "Lass Haley"}

function CascadeQuest.path()
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

	if moonstone == false then
		if isNpcVisible(".moonstone") then
			pauseMessage = "Current Quest: Cascade Badge - Going to get the Moonstone as part of a quest."
			Lib.log1time("Getting Item: Moonstone")
			return talkToNpc(".moonstone")
		end
	elseif kent == false then
		pauseMessage = "Current Quest: Cascade Badge - Going to talk Robby as part of a quest."
		Lib.log1time("Talking to NPC: Robby")
		return talkToNpcOnCell(125, 81)		
	elseif robby == false then
		pauseMessage = "Current Quest: Cascade Badge - Going to talk Charles as part of a quest."
		Lib.log1time("Talking to NPC: Charles")
		return talkToNpcOnCell(142, 60)
	elseif charles == false then
		pauseMessage = "Current Quest: Cascade Badge - Going to talk Kent as part of a quest."
		Lib.log1time("Talking to NPC: Kent")
		return talkToNpcOnCell(131, 54)
	end

	for npc=1, #cascadeNpcList, 1 do
		if isNpcVisible(cascadeNpcList[npc]) then
			if pf.mapName() == getNpcArea(map, getNpcData(cascadeNpcList[npc]).x, getNpcData(cascadeNpcList[npc]).y) then
				if getNpcData(cascadeNpcList[npc]).isBattler and getNpcData(cascadeNpcList[npc]).canBattle then
					pauseMessage = "Current Quest: Cascade Badge - Battling NPC's."
					Lib.log1time("Battling NPC: " .. cascadeNpcList[npc] .. ".")
					return talkToNpc(cascadeNpcList[npc])
				end
			else
				if getNpcData(cascadeNpcList[npc]).isBattler and getNpcData(cascadeNpcList[npc]).canBattle then
					pauseMessage = "Current Quest: Cascade Badge - Battling NPC's."
					Lib.log1time("Battling NPC: " .. cascadeNpcList[npc] .. ".")
					return pf.moveTo(area, getNpcArea(map, getNpcData(cascadeNpcList[npc]).x, getNpcData(cascadeNpcList[npc]).y))
				end
			end
		end
	end

	if Game.minTeamLevel() < 18 then
		levelPokesTo = 18
		pauseMessage = "Current Quest: Cascade Badge - Training team until all pokemon are at least level 18."
		Lib.log1time(pauseMessage)
		return updateTargetArea(cascadeTraining1, "Wild")
	
	elseif Game.minTeamLevel() >= 18 and not hasItem("S.S. Ticket") then
		if not pf.moveTo(area, "Sea Cottage") then
			if isNpcOnCell(14,10) then
				pauseMessage = "Current Quest: Cascade Badge - Going to talk to Bill and get the S.S. Ticket."
				Lib.log1time("Talking to NPC: Bill")
				return talkToNpcOnCell(14, 10)
			else
				pauseMessage = "Current Quest: Cascade Badge - Going to talk to Bill and get the S.S. Ticket."
				Lib.log1time("Talking to NPC: Bill")
				pushDialogAnswer("press blue button")
				return talkToNpcOnCell(9, 10)
			end				
		end
		
	elseif Game.minTeamLevel() >= 18 and Game.minTeamLevel < 23 then
		levelPokesTo = 23
		pauseMessage = "Current Quest: Cascade Badge - Training team until all pokemon are at least level 23."
		Lib.log1time(pauseMessage)
		return updateTargetArea(cascadeTraining1, "Grass")
		
	elseif Game.minTeamLevel >= 23 then
		pauseMessage = "Current Quest: Boulder Badge - Going to Pewter Gym to battle all trainers and Brock to get the Boulder Badge."
		Lib.log1time(pauseMessage)
		if not pf.moveTo(area, "Cerulean Gym") then
			return talkToNpcOnCell(51, 109)
		end
		
    end
	
end

function onDialogMessage(message)
	if stringContains(message, "You find them in craters, like the ones just down there. Go, take a look, I'm sure you will find one there!") or stringContains(message, "Take a closer look at the meteorite crater nearby.") then
		moonstone = false
	end
	if stringContains(message, "Obtained Moon Stone x1") then
		moonstone = true
	end
	if stringContains(message, "Robby and Charles! Try to find and beat them!") then
		kent = false
	end
	if stringContains(message, "Please tell me you also defeated Kent...") then
		kent = true
		robby = false
	end
	if stringContains(message, "And I've lost again...") then
		robby = true
		charles = false
	end
	if stringContains(message, "You won against my friends? Great, thanks a lot!") then
		charles = true
	end
	if stringContains(message, "So, I suggest we share! Please choose one of them!") then
		if fossil == "Random" then
			return pushDialogAnswer(fossils[math.random(#fossils)])
		else 
			return pushDialogAnswer(fossil)
		end
	end
end

return CascadeQuest