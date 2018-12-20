name = "Questing PF"
author = "Crazy3001"


				--#################################################--
				-------------------CONFIGURATION-------------------
				--#################################################--
				
				
mount = true -- If you have a mount equipped and wish to use it set true.  If you don't have a mount, the bot will not move.
discover = true

starter = "Random" -- "Bulbasaur", "Charmander", "Squirtle" or "Random"
fossil = "Random" -- "Dome", "Helix" or "Random"
dojo = "Random" -- "Hitmonlee", "Hitmonchan" or "Random"

movesNotToForget = {"Dig", "Cut", "Surf", "Flash", "Rock Smash", "Fly", "False Swipe"} -- Will not forget these moves when learning new ones.

local blacklist = {	-- Pokemon you DON'T want in your team.  If your team size is less than 6, the bot will not attempt to catch these Pokemon.
	 "Ariados", 
	 "Caterpie",     
	 "Metapod",      
	 "Butterfree",   
	 "Weedle",       
	 "Kakuna",       
	 "Beedrill",
	 "Pidgeotto",
	 "Pidgey",
	 "Zubat",
	 "Hoothoot",
	 "Ekans",     
	 "Arbok",
	 "Nidoran F",
	 "Nidorina",
	 "Nidoran M",
	 "Nidorino",
	 "Clefable",
	 "Jigglypuff",
	 "Onix",
	 "Abra",
	 "Spinarak",
	 "Dodrio",
	 "Zigzagoon",
	 "Diglett",
	 "Magnemite",
	 "Clefairy",
	 "Hypno",
	 "Spearow",
	 "Drowzee",
	 "Ledyba",
	 "Ledian",
}


				--#################################################--
				----------------END OF CONFIGURATION-----------------
				--#################################################--

				
				
				--#################################################--
				-------------------START OF SCRIPT-------------------
				--#################################################--


description = "Configuration is in Questing.lua. Press Start."
				
local pf = require "Pathfinder/MoveToApp"
local Lib = require "Pathfinder/Lib/Lib"
local Game = require "Pathfinder/Lib/Game"
local Table = require "Pathfinder/Lib/Table"
local mapAreas = require "Pathfinder/Maps/MapArea"
local BoulderQuest = require "Pathfinder/Quests/BoulderQuest"
local CascadeQuest = require "Pathfinder/Quests/CascadeQuest"

minutesToMove = math.random(10, 30)
local area = nil

function onStart()

	Lib.log1time("Questing PF Started.")

	if not hasBadge("Boulder Badge") then
		minLevel = 4
		levelPokesTo = 15
		Lib.log1time("Current Quest: Boulder Badge")
	elseif not hasBadge("Cascade Badge") then
		minLevel = 8
		levelPokesTo = 23
		Lib.log1time("Current Quest: Cascade Badge")
	elseif not hasBadge("Thunder Badge") then
		minLevel = 12
		levelPokesTo = 30
		Lib.log1time("Current Quest: Thunder Badge")
	elseif not hasBadge("Rainbow Badge") then
		minLevel = 16
		levelPokesTo = 40
		Lib.log1time("Current Quest: Rainbow Badge")
	elseif not hasBadge("Soul Badge") then
		minLevel = 20
		levelPokesTo = 50
		Lib.log1time("Current Quest: Soul Badge")
	elseif not hasBadge("Marsh Badge") then
		minLevel = 24
		levelPokesTo = 60
		Lib.log1time("Current Quest: Marsh Badge")
	elseif not hasBadge("Volcano Badge") then
		minLevel = 28
		levelPokesTo = 70
		Lib.log1time("Current Quest: Volcano Badge")
	elseif not hasBadge("Earth Badge") then
		minLevel = 32
		levelPokesTo = 80
		Lib.log1time("Current Quest: Earth Badge")
	end
	
	rand = 0 -- Used to represent each rectangle in area
	tmpRand = 0 -- Used to make sure rand is different every time we call math.random
	areaTimer = os.time()
	
end

function onPause()

	Lib.log1time("***********************************QUESTING PF PAUSED***********************************")
	Lib.log1time(pauseMessage)
	Lib.log1time("****************************************************************************************")

end

function onResume()

	Lib.log1time("***********************************QUESTING PF RESUMED***********************************")

end

function onStop()

end

function getNpcArea(map, npcX, npcY)
local map = getMapName()
local npcInRectangle = Lib.inRectangle(npcX, npcY)

	if mapAreas[map] then
		for mapArea, locs in pairs(mapAreas[map]) do
			for _, rect in ipairs(locs) do
				if npcInRectangle(table.unpack(rect)) then
					return mapArea
				end
			end
		end
		error("Pathfinder --> sub map could not be defined, map: " .. map .. "  x: " .. x .. "  y: " .. y)
	end
	
end

function updateTargetArea(areaList, cellType)
local area = getAreaName()

	if os.difftime(os.time(), areaTimer) > minutesToMove * 60 or rand == 0 or rand > #areaList or rand == tmpRand then
		areaTimer = os.time()
		tmpRand = rand
		rand = math.random(#areaList)
	end
	
	if type(cellType) == "string" then
		cellType = cellType:upper()
	end
	
	if cellType == "GRASS" then
		if not pf.moveTo(area, areaList[rand]) then
			return moveToGrass()
		end
	elseif cellType == "WATER" then
		if not pf.moveTo(area, areaList[rand]) then
			return moveToWater()
		end
	elseif cellType == "WILD" then
		if not pf.moveTo(area, areaList[rand]) then
			return moveToEncounterWild()
		end
	end
	
end

function onPathAction()
local area = getAreaName()
	
	if not hasBadge("Boulder Badge") then
		return BoulderQuest.path()
	elseif not hasBadge("Cascade Badge") then
		return CascadeQuest.path()
	elseif not hasBadge("Thunder Badge") then
		return ThunderQuest.path()
	elseif not hasBadge("Rainbow Badge") then
		return RainbowQuest.path()
	elseif not hasBadge("Soul Badge") then
		return SoulQuest.path()
	elseif not hasBadge("Marsh Badge") then
		return MarshQuest.path()
	elseif not hasBadge("Volcano Badge") then
		return VolcanoQuest.path()
	elseif not hasBadge("Earth Badge") then
		return EarthQuest.path()
	end

end

function onBattleAction()

	if isWildBattle() and (isOpponentShiny() or ((getTeamSize() < 6 and not Table.isInTable(blacklist)) and not isAlreadyCaught() and getOpponentLevel() >= 4 and getOpponentHealthPercent() <= 50)) then
		if isPokemonUsable(getActivePokemonNumber()) then
			if useItem("Ultra Ball") or useItem("Great Ball") or useItem("Poké Ball") or useItem("Luxury Ball") then
				return
			else
				return weakAttack() or attack() or run() or useAnyMove()
			end
		else
			return sendUsablePokemon() or sendAnyPokemon() or run() or attack() or useAnyMove()
		end
	end

	if isWildBattle() then
		if Game.getTotalUsablePokemonCount(minLevel) < 1 or (Game.getTotalPokemonToLevelCount(levelPokesTo) < 1 or (Game.getTotalPokemonToLevelCount(levelPokesTo) == 1 and getPokemonHealthPercent(Game.getFirstPokemonToLevel(levelPokesTo)) < 20)) then
			return run() or attack() or sendAnyPokemon() or useAnyMove()
		elseif getPokemonLevel(getActivePokemonNumber()) < minLevel then
			if Game.getTotalUsablePokemonCount(minLevel) >= 1 then
				return sendPokemon(Game.getFirstUsablePokemon(minLevel)) 
			else 
				return run() or sendAnyPokemon() or attack() or useAnyMove()
			end
		else
			if isPokemonUsable(getActivePokemonNumber()) and Game.hasRemainingPP(getActivePokemonNumber()) then
				return attack() or sendPokemon(Game.getFirstUsablePokemon(minLevel)) or run() or useAnyMove()
			else
				if Game.getTotalUsablePokemonCount(minLevel) >= 1 then
					return sendPokemon(Game.getFirstUsablePokemon(minLevel))
				else
					return run() or sendAnyPokemon() or attack() or useAnyMove()
				end
			end
		end
	end
		
	return attack() or sendPokemon(Game.getFirstUsablePokemon(minLevel)) or sendAnyPokemon() or useAnyMove()
	
end

function onBattleMessage(message)

	if stringContains(message, "A Wild ") then
		Lib.log1time("Opponents Level: " .. getOpponentLevel() .. "")
	end

end


function onSystemMessage(message)

end

function onLearningMove(moveName, pokemonIndex)

   forgetAnyMoveExcept(movesNotToForget)
   
end