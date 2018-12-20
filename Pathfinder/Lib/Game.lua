local Game = {}

function Game.getDistance(xa, ya, xb, yb)
    local xDist = xb - xa
    local yDist = yb - ya

    return math.sqrt((xDist ^ 2) + (yDist ^ 2))
end

function Game.getPokemonNumberWithMove(move, joy) -- optional parameter happiness
    joy = joy or 0
    for i = 1, getTeamSize() do
        if hasMove(i, move) and getPokemonHappiness(i) >= joy then
            return i
        end
    end
    return nil
end

function Game.hasPokemonWithMove(Move)
	local hasPokemonWithMove = {}
	hasPokemonWithMove["id"] = 0
	hasPokemonWithMove["move"] = nil
	local statusMoveList = {"glare", "stun spore", "thunder wave", "hypnosis", "lovely kiss", "sing", "sleep spore", "spore"}
	for _,Move in pairs(statusMoveList) do
		for i=1, getTeamSize(), 1 do
			if hasMove(i, Move) then
				hasPokemonWithMove["id"] = i
				hasPokemonWithMove["move"] = Move
				return hasPokemonWithMove, true
			end
		end
	end
	return false
end

function Game.hasUsablePokemonWithMove(Move)
	local hasUsablePokemonWithMove = {}
	hasUsablePokemonWithMove["id"] = 0
	hasUsablePokemonWithMove["move"] = nil
	local statusMoveList = {"glare", "stun spore", "thunder wave", "hypnosis", "lovely kiss", "sing", "sleep spore", "spore"}
	for _,Move in pairs(statusMoveList) do
		for i=1, getTeamSize(), 1 do
			if hasMove(i, Move) and getRemainingPowerPoints(i, Move) >= 1 and isPokemonUsable(i) then
				hasUsablePokemonWithMove["id"] = i
				hasUsablePokemonWithMove["move"] = Move
				return hasUsablePokemonWithMove, true
			end
		end
	end	
	return false
end

function Game.getPokemonIdWithItem(ItemName)	
	for i=1, getTeamSize(), 1 do
		if getPokemonHeldItem(i) == ItemName then
			return i
		end
	end
	return 0
end

function Game.isTeamFullyHealed()
	for pokemonId=1, getTeamSize(), 1 do
		if getPokemonHealthPercent(pokemonId) < 100
			or ( not isPokemonUsable(pokemonId) and ( getTeamSize() == 6 and getPokemonName(6) ~= "Ditto" ) or ( getTeamSize() >= 1 and hasMove(1,"Surf") and getRemainingPowerPoints(1,"Surf") <= 14 ) ) then
			return false
		end
	end
	return true
end

function Game.minTeamLevel()
	local current
	for pokemonId=1, getTeamSize(), 1 do
		local pokemonLevel = getPokemonLevel(pokemonId)
		if  current == nil or pokemonLevel < current then
			current = pokemonLevel
		end
	end
	return current
end

function Game.maxTeamLevel()
	local current
	for pokemonId=1, getTeamSize(), 1 do
		local pokemonLevel = getPokemonLevel(pokemonId)
		if  current == nil or pokemonLevel > current then
			current = pokemonLevel
		end
	end
	return current
end


function Game.isSorted(levelPokesTo)
	local pokemonsUsable = Game.getTotalPokemonToLevelCount(levelPokesTo)
	if getTeamSize() > 1 then
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
	end
	if not isTeamRangeSortedByLevelAscending(1, pokemonsUsable) then --Sort the team without not usable pokemons
		log("Sorting Pokemon - Please Wait")
		return sortTeamRangeByLevelAscending(1, pokemonsUsable)
	end
	if not isTeamRangeSortedByLevelAscending(pokemonsUsable + 1, getTeamSize()) then --Sort the team without not usable pokemons
		log("Sorting Pokemon - Please Wait")
		return sortTeamRangeByLevelAscending(pokemonsUsable + 1, getTeamSize())
	end
	return false
end

function Game.returnSorted(valueA, valueB)
	if valueA > valueB then
		return valueB, valueA
	end
	return valueA, valueB
end

function Game.hasRemainingPP(i)
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
    return false
end

function Game.getFirstUsablePokemon(minLevel)
	for i=1, getTeamSize(), 1 do
		if (isPokemonUsable(i) and Game.hasRemainingPP(i) and getPokemonStatus(i) == "None") and getPokemonLevel(i) >= minLevel then
			return i		
		end
	end
	return false
end

function Game.getTotalUsablePokemonCount(minLevel)
	local count = 0
	for i=1, getTeamSize(), 1 do
		if (isPokemonUsable(i) and Game.hasRemainingPP(i) and getPokemonStatus(i) == "None") and getPokemonLevel(i) >= minLevel then
			count = count + 1
		end
	end
	return count
end

function Game.getFirstMaxLevelPokemon()
	for i=1, getTeamSize(), 1 do
		if isPokemonUsable(i) and Game.hasRemainingPP(i) and getPokemonLevel(i) == 100 then
			return i		
		end
	end
	return 0
end

function Game.getTotalMaxLevelPokemonCount()
	local count = 0
	for i=1, getTeamSize(), 1 do
		if isPokemonUsable(i) and Game.hasRemainingPP(i) and getPokemonLevel(i) == 100 then
			count = count + 1
		end
	end
	return count
end

function Game.getFirstPokemonToLevel(levelPokesTo)
	for i=1, getTeamSize(), 1 do
		if isPokemonUsable(i) and getPokemonLevel(i) < levelPokesTo then
			return i		
		end
	end
	return 0
end

function Game.getTotalPokemonToLevelCount(levelPokesTo)
	local count = 0
	for i=1, getTeamSize(), 1 do
		if isPokemonUsable(i) and getPokemonLevel(i) < levelPokesTo then
			count = count + 1
		end
	end
	if count == 0 then
	end
	return count
end

function Game.getTotalUsablePokemonToLevelCount(levelPokesTo)
	local count = 0
	for i=1, getTeamSize(), 1 do
		if isPokemonUsable(i) and Game.hasRemainingPP(i) and getPokemonLevel(i) < levelPokesTo then
			count = count + 1
		end
	end
	if count == 0 then
	end
	return count
end

function Game.allPokemonReachedTargetLevel(levelPokesTo)
	local count = 0
	for i=1, getTeamSize(), 1 do
		if getPokemonLevel(i) >= levelPokesTo then
			count = count + 1
		end
	end
	if count == getTeamSize() then
		return true
	end
	return false
end

function Game.tryTeachMove(movename, ItemName)
local pokemonIdTeach = 1

	if not Game.hasPokemonWithMove(movename) then
		if pokemonIdTeach > getTeamSize() then
			return fatal("No pokemon in this Team can learn: ".. ItemName)
		else
			log("Pokemon: " .. getPokemonName(pokemonIdTeach) .. " Try Learning: " .. ItemName)
			useItemOnPokemon(ItemName, pokemonIdTeach)
			pokemonIdTeach = pokemonIdTeach + 1
			return
		end
	end
	pokemonIdTeach = 1
	return true
end

function Game.getPokemonTotalEfforValues(index)
	totalEvs = getPokemonEffortValue(index, "Atk") + getPokemonEffortValue(index, "Def") + getPokemonEffortValue(index, "SpAtk") 
		+ getPokemonEffortValue(index, "SpDef") + getPokemonEffortValue(index, "Speed") + getPokemonEffortValue(index, "Hp")
	return totalEvs
end

function Game.canSetEffortValues(index, statType)
	totalEvs = getPokemonEffortValue(index, "Atk") + getPokemonEffortValue(index, "Def") + getPokemonEffortValue(index, "SpAtk") 
		+ getPokemonEffortValue(index, "SpDef") + getPokemonEffortValue(index, "Speed") + getPokemonEffortValue(index, "Hp")

	if getPokemonCollectedEffortValue(index, statType) == getPokemonEffortValue(index, statType) then
		return false
	end

	if totalEvs >= 510 then
		return false
	elseif totalEvs + getPokemonCollectedEffortValue(index, statType) <= 510 then
		return true
	end

	return false;
end

function Game.getSetableEffortValue(index, statType)
	local setAbleEvs = -1
	totalEvs = getPokemonEffortValue(index, "Atk") + getPokemonEffortValue(index, "Def") + getPokemonEffortValue(index, "SpAtk") 
		+ getPokemonEffortValue(index, "SpDef") + getPokemonEffortValue(index, "Speed") + getPokemonEffortValue(index, "Hp")
	if getPokemonCollectedEffortValue(index, statType) == getPokemonEffortValue(index, statType) then
		setAbleEvs = -1
	end

	if totalEvs >= 510 then
		setAbleEvs = -1
	elseif totalEvs + getPokemonCollectedEffortValue(index, statType) <= 510 then
		setAbleEvs = getPokemonCollectedEffortValue(index, statType)
	elseif totalEvs + getPokemonCollectedEfsfortValue(index, statType) > 510 and totalEvs < 510 then
		setAbleEvs = 510 - totalEvs		
	end

	if setAbleEvs == getPokemonEffortValue(index, statType) or setAbleEvs > getPokemonCollectedEffortValue(index, statType) then
		setAbleEvs = -1
	end

	return setAbleEvs
end

function Game.needPokecenter()
	if getTeamSize() <= 1 then
		return false
	elseif Game.getTotalUsablePokemonCount(minLevel) > 1 and Game.getTotalUsablePokemonToLevelCount(levelPokesTo) > 1 then
		return false
	elseif Game.getTotalUsablePokemonCount(minLevel) >= 1 and Game.getTotalUsablePokemonToLevelCount(levelPokesTo) == 1 and getPokemonHealthPercent(Game.getFirstPokemonToLevel(levelPokesTo)) >= 20 then
		return false
	end
	return true
end

function updateTargetRect(list)
	-- Every minutesToMove minutes, picks a random integer between 1 and #list / 4 to get a number corresponding to each rectangle in list	
	if os.difftime(os.time(), areaTimer) > minutesToMove * 60 or rand == 0 or rand > #list / 4 or rand == tmpRand then
		areaTimer = os.time()
		tmpRand = rand
		rand = math.random(#list / 4)
	end
	
	local n = (rand - 1) * 4
	
	if list[n + 1] == list[n + 3] or list[n + 2] == list[n + 4] then
		return Game.moveToLine({list[n + 1], list[n + 2], list[n + 3], list[n + 4]})
	else
		return moveToRectangle(list[n + 1], list[n + 2], list[n + 3], list[n + 4])
	end
end

function Game.moveToLine(list)	
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

return Game
