name = "Universal Leveler Beta - Version 0.2.3" 
author = "Crazy3001"

				--#################################################--
				-------------------CONFIGURATION-------------------
				--#################################################--

--If you have a mount equipped in game, set to true if you would like to use it. If no mount is equipped and is set to true, the bot will not move.
mount = false
				
--Case Sensitive--
--Put the name of the map you want to train at between "". (Example: location = {"Route 2"})
--You can use multiple areas and alternate between them randomly at a set time limit, specified below with minutesToMove (Example: location = {"Route 2", "Route 22", "Route 1"})
location = {"Route 1"}

-- Including quotations, put "Grass" for grass, "Water" for water, "Cave" for cave, {x1, y1, x2, y2} for rectangle
-- If you're using a rectangle, you can set more rectangles to hunt in just by adding 4 more parameters. Example: local area = {x1, y1, x2, y2, x1, y1, x2, y2}
cellType = "Grass"
		
-- If you're using multiple rectangles, this is the amount of time in minutes that we'll stay in one rectangle before moving to a different one
minutesToMove = 30

--Will catch any Pokemon that is not registered as owned in your Pokedex.
catchNotCaught = false

--the below is case-sensitive, add more moves by adding commas. example : catchThesePokemon = {"Mankey", "Pikachu", "Gastly"}--
--Even if you set all other capture variables to false, we'll still try to catch these/this pokemon--
--Leave an empty "" here if you aren't using it--
catchThesePokemon = {""}
	
--Will level your pokemon to this level then stop. Put 101 if EV Training or if you want level 100 Pokemon to fight.--
levelPokesTo = 100

--What level you want your pokemon to start fight instead of switching out.
minLevel = 5

--The percentage of your last alive usable poke's health that we'll stop fighting at and go to pokecenter--
healthToRunAt = 20 

--the below is case-sensitive, add more moves by adding commas. ex : movesNotToForget = {"Move 1", "Move 2", "Move 3"}--
--Leave an empty "" here if you aren't using it--
movesNotToForget = {"Dig", "Cut", "Surf", "Flash", "Rock Smash", "Fly", "False Swipe"}
		

				--#################################################--
				----------------END OF CONFIGURATION-----------------
				--#################################################--


				--#################################################--
				-------------------START OF SCRIPT-------------------
				--#################################################--

				
description = "Leveling pokemon to level " .. levelPokesTo .. ". Press Start"

local pf = require "Pathfinder/MoveToApp"
local Lib = require "Pathfinder/Lib/Lib"
local Game = require "Pathfinder/Lib/Game"
local Table = require "Pathfinder/Lib/Table"
local area = nil

function onStart()
    healCounter = 0
    shinyCounter = 0
    catchCounter = 0
    wildCounter = 0
	rand = 0 -- Used to represent each rectangle in area
	tmpRand = 0 -- Used to make sure rand is different every time we call math.random
	lineSwitch = false -- Used in moveToLine()
	areaTimer = os.time()
	rectTimer = os.time()
    log("Start botting.")
end

function onPause()
   log("***********************************PAUSED - SESSION STATS***********************************")
   log("Shinies Caught: " .. shinyCounter)
   log("Pokemon Caught: " .. catchCounter)
   log("Pokemons encountered: " .. wildCounter)
   log("You have visited the PokeCenter ".. healCounter .." times.")
   log("*********************************************************************************************")
end

function onResume()
   log("*********************************************************************************************")
   log("SESSION RESUMED")
   log("*********************************************************************************************")
end

function onDialogMessage(pokecenter)
    if stringContains(pokecenter, "There you go, take care of them!") then
		healCounter = healCounter + 1
		log("You have visited the PokeCenter ".. healCounter .." times.")
    end
end

function onBattleMessage(wild)
    if stringContains(wild, "A Wild SHINY ") then
       shinyCounter = shinyCounter + 1
       wildCounter = wildCounter + 1
	   log("*********************************************************************************************")
       log("Info | Shineys encountered: " .. shinyCounter)
       log("Info | Pokemon caught: " .. catchCounter)
       log("Info | Pokemon encountered: " .. wildCounter)
	   log("*********************************************************************************************")
	elseif stringContains(wild, " was caught!") then
       catchCounter = catchCounter + 1
	   log("*********************************************************************************************")
       log("Info | Shineys encountered: " .. shinyCounter)
       log("Info | Pokemon caught: " .. catchCounter)
       log("Info | Pokemon encountered: " .. wildCounter)
	   log("*********************************************************************************************")
    elseif stringContains(wild, "A Wild ") then
       wildCounter = wildCounter + 1
	   log("*********************************************************************************************")
       log("Info | Shineys encountered: " .. shinyCounter)
       log("Info | Pokemon caught: " .. catchCounter)
       log("Info | Pokemon encountered: " .. wildCounter)
	   log("*********************************************************************************************")
	elseif stringContains(wild, "You failed to run away") then
		failedRun = true
	elseif stringContains(wild, "You can not switch this Pokemon") then	
		canNotSwitch = true
    end
end

function onLearningMove(moveName, pokemonIndex)
   forgetAnyMoveExcept(movesNotToForget)
end

function moveToLine(list)	
	-- Alternates between 2 positions	
	if lineSwitch then
		if getPlayerX() == list[1] and getPlayerY() == list[2] then
			lineSwitch = not lineSwitch
		else
			return moveToCell(list[1], list[2])
		end
	else
		if getPlayerX() == list[3] and getPlayerY() == list[4] then
			lineSwitch = not lineSwitch
		else
			return moveToCell(list[3], list[4])
		end
	end
end

function updateTargetRect(list)
	-- Every minutesToMove minutes, picks a random integer between 1 and #list / 4 to get a number corresponding to each rectangle in list	
	if os.difftime(os.time(), rectTimer) > minutesToMove * 60 or rand == 0 or rand > #list / 4 or rand == tmpRand then
		rectTimer = os.time()
		tmpRand = rand
		rand = math.random(#list / 4)
	end
	
	local n = (rand - 1) * 4
	
	if list[n + 1] == list[n + 3] or list[n + 2] == list[n + 4] then
		return moveToLine({list[n + 1], list[n + 2], list[n + 3], list[n + 4]})
	else
		return moveToRectangle(list[n + 1], list[n + 2], list[n + 3], list[n + 4])
	end
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
	else
		if #cellType > 4 then
			if not pf.moveTo(area, areaList[rand]) then
				return updateTargetRect(cellType)
			end
		elseif cellType[1] == cellType[3] or cellType[2] == cellType[4] then
			if not pf.moveTo(area, areaList[rand]) then
				return moveToLine(cellType)
			end
		else
			if not pf.moveTo(area, areaList[rand]) then
				return moveToRectangle(cellType[1], cellType[2], cellType[3], cellType[4])
			end
		end
	end

	if cellType == "GRASS" then
		if not pf.moveTo(area, areaList[rand]) then
			return moveToGrass()
		end
	elseif cellType == "WATER" then
		if not pf.moveTo(area, areaList[rand]) then
			return moveToWater()
		end
	elseif cellType == "CAVE" then
		if not pf.moveTo(area, areaList[rand]) then
			return moveToEncounterWild()
		end
	end
end

function onPathAction()
local area = getAreaName()

	if Game.isSorted(levelPokesTo) then 
		return true
	end
	
	if Game.needPokecenter() then
		return pf.useNearestPokecenter(area)
	end
	
	if not Game.allPokemonReachedTargetLevel(levelPokesTo) then
		return updateTargetArea(location, cellType)
	else
		logout()
	end
end

function onBattleAction()

	if minLevel == nil or levelPokesTo == nil then
		return run() or attack() or useAnyMove() or sendAnyPokemon()
	end

	if isWildBattle() and (isOpponentShiny() or Table.isInTable(catchThesePokemon) or (catchNotCaught and not isAlreadyCaught())) then

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
