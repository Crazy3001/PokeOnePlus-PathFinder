--Where would you like to start your journey?
local pf = require "Pathfinder/MoveToApp"
local Lib = require "Pathfinder/Lib/Lib"
local Game = require "Pathfinder/Lib/Game"
local Table = require "Pathfinder/Lib/Table"
local mapAreas = require "Pathfinder/Maps/MapArea"
local BoulderQuest = require "Pathfinder/Quests/BoulderQuest"
local CascadeQuest = require "Pathfinder/Quests/CascadeQuest"

local area = nil
local mount = false
local discover = true
minutesToMove = 10
local movesNotToForget = {"Dig", "Cut", "Surf", "Flash", "Rock Smash", "Fly", "False Swipe"}

starter = "Random" --"Bulbasaur","Charmander","Squirtle" or "Random"
fossil = "Random" 
--dojo = "Random"

local blacklist = {	
	 "Ariados", 
	 "Caterpie",     
	 "Metapod",      
	 "Butterfree",   
	 "Weedle",       
	 "Kakuna",       
	 "Beedrill",            
	 "Pidgeotto",    
	 "Pidgeot",
	 "Pidgey",
	 "Zubat",
	 "Hoothoot",
	 "Ekans",     
	 "Arbok",            
	 "Raichu",         
	 "Nidoran F",    
	 "Nidorina",     
	 "Nidoqueen",    
	 "Nidoran M",    
	 "Nidorino",     
	 "Nidoking",          
	 "Clefable",       
	 "Ninetales",    
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
}


function onStart()

	if not hasBadge("Boulder Badge") then
		Lib.log1time("Current Quest: Boulder Badge")
	elseif not hasBadge("Cascade Badge") then
		Lib.log1time("Current Quest: Cascade Badge")
	end
	rand = 0 -- Used to represent each rectangle in area
	tmpRand = 0 -- Used to make sure rand is different every time we call math.random
	areaTimer = os.time()
	
end

function onPause()

end

function onResume()

end

function onStop()

end

function updateTargetArea(areaList, cellType)
local area = getAreaName()
	-- Every minutesToMove minutes, picks a random integer between 1 and #list / 4 to get a number corresponding to each rectangle in list	
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
	elseif cellType == "ENCOUNTER" then
		if not pf.moveTo(area, areaList[rand]) then
			return moveToEncounterWild()
		end
	end
end

function onPathAction()
local area = getAreaName()
log(minLevel)
log(levelPokesTo)

	if Game.minTeamLevel() < 10 then
		minLevel = 5
		levelPokesTo = 10
	elseif Game.minTeamLevel() >= 10 and Game.minTeamLevel() < 15 then
		minLevel = 5
		levelPokesTo = 15
	elseif Game.minTeamLevel() >= 15 and Game.minTeamLevel() < 20 then
		minLevel = 10
		levelPokesTo = 20
	end
		
	if Game.isSorted(levelPokesTo) then 
		return true
	end
	
	if Game.needPokecenter() then
		Lib.log1time("Using Pokecenter")
		return pf.useNearestPokecenter(area)
	end
	
	if getMoney() > 4000 and getItemQuantity("Poké Ball") < 10 then
		return pf.useNearestPokemart(area, "Poké Ball", 20)
	elseif getMoney() > 2000 and getItemQuantity("Poké Ball") < 10 then
		return pf.useNearestPokemart(area, "Poké Ball", 10)
	elseif isShopOpen() then 
	    return closeShop()
	end
	
	if not hasBadge("Boulder Badge") then
		return BoulderQuest.path()
	elseif not hasBadge("Cascade Badge") then
		return CascadeQuest.path()
	end

end

function onBattleAction()

	if minLevel == nil or levelPokesTo == nil then
		if not hasBadge("Boulder Badge") then
			minLevel = 5
			levelPokesTo = 15
		end
	end

	if isWildBattle() and (isOpponentShiny() or (not Table.isInTable(blacklist) and not isAlreadyCaught() and getOpponentLevel() >= 5 and getOpponentHealthPercent() <= 50)) then

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

		if Game.getTotalUsablePokemonCount(minLevel) < 1 or (Game.getTotalPokemonToLevelCount(levelPokesTo) < 1 or (Game.getTotalPokemonToLevelCount(levelPokesTo) == 1 and getPokemonHealthPercent(Game.getFirstPokemonToLevel(levelPokesTo)) < 30)) then
			--[[if isPokemonUsable(getActivePokemonNumber()) then]]
			return run() or attack() or sendAnyPokemon() or useAnyMove()
			--[[else
				if Game.getTotalUsablePokemonCount(minLevel) >= 1 then
					return sendPokemon(Game.getFirstUsablePokemon(minLevel)) 
				else 
					return sendAnyPokemon() or run() or attack()
				end
			end]]
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
	else

		return attack() or sendPokemon(Game.getFirstUsablePokemon(minLevel)) or sendAnyPokemon() or useAnyMove()
	end
	
end

function onBattleMessage(message)
	if stringContains(message, "Go to the Cerulean City Gym and test your abilities!") then
		Lib.log1time("Boulder Badge Obtained!")
	end
end

function onSystemMessage(message)

end

function onLearningMove(moveName, pokemonIndex)
   forgetAnyMoveExcept(movesNotToForget)
end