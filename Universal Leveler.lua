name = "Universal Leveler - Version 1.0"
author = "Crazy3001"

				--#################################################--
				-------------------CONFIGURATION-------------------
				--#################################################--
--Favorites:
--Seafoam B4F (56,14,61,14)
--Dragons Den
--Victory Road Kanto 3F


--Case Sensitive--
--Put the name of the map you want to train at between "". {Example: location = "Route 121"}
local location = "Route 15"		

-- Put "Grass" for grass, "Water" for water, {x, y} for fishing cell, {x1, y1, x2, y2} for rectangle
-- If you're using a rectangle, you can set more rectangles to hunt in just by adding 4 more parameters. Example: local area = {x1, y1, x2, y2, x1, y1, x2, y2}
local area = "Grass"
		
-- If you're using multiple rectangles, this is the amount of time in minutes that we'll stay in one rectangle before moving to a different one
local minutesToMove = 30

--Will catch any Pokemon that is not registered as owned in your Pokedex.
local catchNotCaught = false

--the below is case-sensitive, add more moves by adding commas. example : catchThesePokemon = {"Pokemon 1", "Pokemon 2", "Pokemon 3"}--
--Even if you set all other capture variables to false, we'll still try to catch these/this pokemon--
--Leave an empty "" here if you aren't using it--
local catchThesePokemon = {""}

--When leveling, if there are any Pokemon you do not want to fight, put them in here. Example : evadeThesePokemon = {"Pokemon 1", "Pokemon 2", "Pokemon 3"}--
--Leave an empty "" here if you aren't using it--
local evadeThesePokemon = {""}
	
--Will level your pokemon to this level then stop. Put 101 if EV Training or if you want level 100 Pokemon to fight.--
local levelPokesTo = 60

--What level you want your pokemon to start fight instead of switching out.
local minLevel = 25

--The percentage of your last alive usable poke's health that we'll stop fighting at and go to pokecenter--
local healthToRunAt = 30 

--Type of rod you want to use when fishing
local typeRod = "Super Rod"

--the below is case-sensitive, add more moves by adding commas. ex : movesNotToForget = {"Move 1", "Move 2", "Move 3"}--
--Leave an empty "" here if you aren't using it--
local movesNotToForget = {"Dig", "Cut", "Surf", "Flash", "Rock Smash", "Fly"}
		

				--#################################################--
				----------------END OF CONFIGURATION-----------------
				--#################################################--


				--#################################################--
				-------------------START OF SCRIPT-------------------
				--#################################################--

				
description = "Training at " .. location .. "." .. " Leveling pokemon to level " .. levelPokesTo .. ". Press Start"

local pf = require "Pathfinder/MoveToApp"
local Lib = require "Pathfinder/Lib/lib"
local map = nil

function onStart()
    healCounter = 0
    shinyCounter = 0
    catchCounter = 0
    wildCounter = 0
	rand = 0 -- Used to represent each rectangle in area
	tmpRand = 0 -- Used to make sure rand is different every time we call math.random
	lineSwitch = false -- Used in moveToLine()
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
    elseif stringContains(wild, "Success! You caught ") then
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

function TableLength(T)
 local count = 0
 for _ in pairs(T) do count = count + 1 end
 return count
end

function isOnList(List)
	result = false
    if List[1] ~= "" then
	    for i=1, TableLength(List), 1 do
		    if getOpponentName() == List[i] then
			    result = true
		    end
	    end
    end
    return result
end

function isOnCell(X, Y)
	if getPlayerX() == X and getPlayerY() == Y then
		return true
	end
	return false
end

function getPokemonIdWithItem(ItemName)	
	for i=1, getTeamSize(), 1 do
		if getPokemonHeldItem(i) == ItemName then
			return i
		end
	end
	return 0
end

function isSorted()
	local pokemonsUsable = getTotalPokemonToLevelCount()
	for pokemonId=1, pokemonsUsable, 1 do
		if not isPokemonUsable(pokemonId) or getPokemonLevel(pokemonId) >= levelPokesTo then --Move it at bottom of the Team
			for pokemonId_ = pokemonsUsable + 1, getTeamSize(), 1 do
				if isPokemonUsable(pokemonId_) and getPokemonLevel(pokemonId_) < levelPokesTo then
					swapPokemon(pokemonId, pokemonId_)
					return true
				end
			end
			
		end
	end
	if not isTeamRangeSortedByLevelAscending(1, pokemonsUsable) then --Sort the team without not usable pokemons
		return sortTeamRangeByLevelAscending(1, pokemonsUsable)
	end
	if not isTeamRangeSortedByLevelAscending(pokemonsUsable + 1, getTeamSize()) then --Sort the team without not usable pokemons
		return sortTeamRangeByLevelAscending(pokemonsUsable + 1, getTeamSize())
	end
	return false
end

function updateFishing(list)
	-- Moves to a position and uses rod	
	if getPlayerX() == list[1] and getPlayerY() == list[2] then
		return useItem(rod)
	else
		return moveToCell(list[1], list[2])
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

function hasRemainingPP(i)
    for m=1, 4, 1 do
        if getPokemonMoveName(i, m) then
            if getPokemonMovePower(i,m) >= 1 then
                p = getPokemonMoveName(i,m)
                if getRemainingPowerPoints(i,p) >= 1 then
                    return true
                end
            end
        end
    end
    Lib.log1time("######No More PP, Using Pokecenter######")
    return false
end

function getFirstUsablePokemon()
	for i=1, getTeamSize(), 1 do
		if (isPokemonUsable(i) and hasRemainingPP(i)) and (getPokemonLevel(i) == 100 or (getPokemonLevel(i) >= minLevel and getPokemonLevel(i) < levelPokesTo)) then
			return i		
		end
	end
	Lib.log1time("E01 | ######No More Usable Pokemon, Using Pokecenter######")
	return 0
end

function getTotalUsablePokemonCount()
	local count = 0
	for i=1, getTeamSize(), 1 do
		if (isPokemonUsable(i) and hasRemainingPP(i)) and (getPokemonLevel(i) == 100 or (getPokemonLevel(i) >= minLevel and getPokemonLevel(i) < levelPokesTo)) then
			count = count + 1
		end
	end
	if count == 0 then
		Lib.log1time("E02 | ######No More Usable Pokemon, Using Pokecenter######")
	end
	return count
end

function getFirstMaxLevelPokemon()
	for i=1, getTeamSize(), 1 do
		if isPokemonUsable(i) and hasRemainingPP(i) and getPokemonLevel(i) == 100 then
			return i		
		end
	end
	return 0
end

function getTotalMaxLevelPokemonCount()
	local count = 0
	for i=1, getTeamSize(), 1 do
		if isPokemonUsable(i) and hasRemainingPP(i) and getPokemonLevel(i) >= 100 then
			count = count + 1
		end
	end
	return count
end

function getFirstPokemonToLevel()
	for i=1, getTeamSize(), 1 do
		if isPokemonUsable(i) and getPokemonLevel(i) < levelPokesTo then
			return i		
		end
	end
	Lib.log1time("E03 | ######No More Pokemon To Level Alive, Using Pokecenter######")
	return 0
end

function getTotalPokemonToLevelCount()
	local count = 0
	for i=1, getTeamSize(), 1 do
		if isPokemonUsable(i) and getPokemonLevel(i) < levelPokesTo then
			count = count + 1
		end
	end
	if count == 0 then
		Lib.log1time("E04 | ######No More Pokemon To Level Alive, Using Pokecenter######")
	end
	return count
end

function allPokemonReachedTargetLevel()
	local count = 0
	for i=1, getTeamSize(), 1 do
		if getPokemonLevel(i) >= levelPokesTo then
			count = count + 1
		end
	end
	if count == getTeamSize() then
		Lib.log1time("######All Pokemon Reached Target Level, Logging Out######")
		return true
	end
	return false
end

function onPathAction()
local map = getMapName()
local location = location
canNotSwitch = false
failedRun = false

	if isSorted() then 
		return true
	end
	
	if not allPokemonReachedTargetLevel() then
		if getTotalUsablePokemonCount() >= 1 and (getTotalPokemonToLevelCount() > 1 or (getTotalPokemonToLevelCount() == 1 and getPokemonHealthPercent(getFirstPokemonToLevel()) >= healthToRunAt)) then
			if not pf.moveTo(map, location) then
				if type(area) == "string" then
					location = area:upper()
				else
					if #area == 2 then
						return updateFishing(area)
					elseif #area > 4 then
						return updateTargetRect(area)
					elseif area[1] == area[3] or area[2] == area[4] then
						return moveToLine(area)
					else
						return moveToRectangle(area[1], area[2], area[3], area[4])
					end
				end
				
				if location == "GRASS" then
					return moveToGrass()
				elseif location == "WATER" then
					return moveToWater()
				end
			end
		else
			pf.useNearestPokecenter(map)
		end
	else
		logout()
	end
end

function onBattleAction()
	if isWildBattle() and isOpponentShiny() or isOnList(catchThesePokemon) or (catchNotCaught and not isAlreadyCaught()) then
		if isPokemonUsable(getActivePokemonNumber()) then
			if useItem("Ultra Ball") or useItem("Great Ball") or useItem("Poké Ball") then
				return
			end
		else
			return sendUsablePokemon() or sendAnyPokemon()
		end
	end
	if isWildBattle() and not isOnList(evadeThesePokemon) then
		if getTotalUsablePokemonCount() < 1 or (getTotalPokemonToLevelCount() < 1 or (getTotalPokemonToLevelCount() == 1 and getPokemonHealthPercent(getFirstPokemonToLevel()) < healthToRunAt)) then
			if isPokemonUsable(getActivePokemonNumber()) then
				return run()
			else
				if getTotalUsablePokemonCount() >= 1 then
					return sendPokemon(getFirstUsablePokemon()) 
				else 
					return sendAnyPokemon()
				end
			end
		elseif getPokemonLevel(getActivePokemonNumber()) < minLevel then
			if getTotalUsablePokemonCount() >= 1 then
				return sendPokemon(getFirstUsablePokemon()) 
			else 
				return run() or sendAnyPokemon()
			end
		elseif failedRun then
			Lib.log1time("###Failed Run###")
			failedRun = false
			if getTotalUsablePokemonCount() >= 1 then
				return sendPokemon(getFirstUsablePokemon()) or attack()
			else
				return sendAnyPokemon() or attack()
			end
		elseif canNotSwitch then
			Lib.log1time("###Can Not Switch###")
			canNotSwitch = false
			return run() or attack()
		else
			if isPokemonUsable(getActivePokemonNumber()) and hasRemainingPP(getActivePokemonNumber()) then
				return attack() or sendPokemon(getFirstUsablePokemon()) or run()
			else
				if getTotalUsablePokemonCount() >= 1 then
					return sendPokemon(getFirstUsablePokemon())
				else
					return run() or sendAnyPokemon()
				end
			end
		end		
	else
		if isPokemonUsable(getActivePokemonNumber()) and hasRemainingPP(getActivePokemonNumber()) then
			if failedRun then
				Lib.log1time("###Failed Run###")
				failedRun = false
				if getTotalUsablePokemonCount() >= 1 then
					return sendPokemon(getFirstUsablePokemon()) or attack()
				else
					return sendAnyPokemon() or attack()
				end
			elseif canNotSwitch then
				Lib.log1time("###Can Not Switch###")
				canNotSwitch = false
				return run() or attack()
			else
				return run() or sendAnyPokemon()
			end
		else
			return run() or sendAnyPokemon()
		end
	end
end
