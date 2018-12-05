local cpath = select(1, ...) or "" -- callee path
local function nTimes(n, f, x) for i = 0, n - 1 do x = f(x) end return x end -- calls n times f(x)
local function rmlast(str) return str:sub(1, -2):match(".+[%./]") or "" end -- removes last dir / file from the callee path
local cppdpath = nTimes(3, rmlast, cpath) -- callee parent of parent dir path
local cpppdpath = rmlast(cppdpath) -- callee parent parent of parent dir path

local version = "1.0.2"

local aStar               = require (cppdpath .. "Lib/lua-astar/AStar")
local Lib                 = require (cppdpath .. "Lib/Lib")
local Game                = require (cppdpath .. "Lib/Game")
local Table               = require (cppdpath .. "Lib/Table")
local _globalMap          = require (cppdpath .. "Maps/GlobalMap")
local mapAreas            = require (cppdpath .. "Maps/MapArea")
local mapLinks            = require (cppdpath .. "Maps/MapLink")
local subMaps             = require (cppdpath .. "Maps/MapExceptions/SubstituteMaps")
local _npcExceptions      = require (cppdpath .. "Maps/MapExceptions/NpcExceptions")
local dialogSolver        = require (cppdpath .. "Lib/MoveTo/DialogSolver")
local mapPath             = require (cppdpath .. "Lib/MoveTo/MapPath")
local elevatorExceptions  = require (cppdpath .. "Maps/MapExceptions/Elevators")
local moveAbilities       = {["cut"] = 0, ["surf"] = 0, ["rock smash"] = 0}
local moveItems           = {"Lift Key", "Silph Scope", "Bicycle"}
local globalMap           = {}
local pathSolution        = {}
local settings            = {}
local destStore           = ""
local npcExceptions       = nil
local playerNode          = nil
local from                = nil
local toMap               = nil
local subArea             = nil

-----------------------------------
----- A* NECESSARY  FUNCTIONS -----
-----------------------------------

-- checks if the link restrictions are matched depending on your team / items.
local function isLinkRestrictionMatched(data)
    if data.items then
        for _, item in ipairs(data.items) do
            if not settings.accountItems[item] then
                return false
            end
        end
    elseif data.abilities then
        for _, ability in ipairs(data.abilities) do
            if not settings.abilitiesIndex[ability] then
                return false
            end
        end
    else error("Pathfinder --> Unknown link restriction.")
    end
    return true
end


-- return a new table containing only valid links
local function getUsableLinks(links)
    local usableLinks = {}
    for link, data in pairs(links) do
        assert(type(data) == "table", "Pathfinder --> Link " .. link .. " data is not a table")
        local isLinkValid = #data == 1
        for i = 2, #data do
            if isLinkRestrictionMatched(data[i]) then
                isLinkValid = true
                break;
            end
        end
        if isLinkValid then
            usableLinks[#usableLinks + 1] = link
        end
    end
    return usableLinks
end

-- return a table of node, linked to the node n
local function expand(n)
    assert(type(globalMap[n]) == "table", "Pathfinder --> Received node \"" .. n .. "\" doesn't exist in the map.")
    return getUsableLinks(globalMap[n])
end

-- Take 2 nodes return dist
local function cost(from, to)
    if type(globalMap[from][to]) == "table" then
        return globalMap[from][to][1]
    end
    return globalMap[from][to]
end

-- return estimated cost of goal, 0 is dijkstra
local function heuristic(n)
    return 0
end

-- return true if destination is reached
local function goal(targets)
    return function(current)
        return Lib.inTable(targets, current)
    end
end

-- call simplification
local simpleAStar = aStar(expand)(cost)(heuristic)

---------------------------
--- EXCEPTION  HANDLING ---
---------------------------

-- check for exceptions in table
local function exceptionExist(t, n1, n2)
    return t[n1] and t[n1][n2]
end

local function solveElevatorExce(n1, n2)
    local exce = elevatorExceptions[n1][n2]
    if exce[5] then
        exce[5] = false
        return assert(moveToCell(table.unpack(exce[6])), "Pathfinder --> Error: Elevator exception failed on moving to map for: " .. n1 .. " -> " .. n2)
    else return assert(talkToNpcOnCell(table.unpack(exce[1])), "Pathfinder --> Error: Elevator exception invalid for talking to npc on map: " .. n1 .. " -> " .. n2)
    end
end

-- check if the nodes are the same map
local function isSameMap(n1, n2)
    --return n1:gsub("_%u$", "") == n2:gsub("_%u$", "")
	return n1 == n2
end

-- skip nodes in the path if they are the same map and no exception exist between them
-- return the next destination node and her predecessor for exception handling.
local function getNextNodes()
    local from = playerNode
    while pathSolution[1] and isSameMap(playerNode, pathSolution[1]) do
        local toMap = pathSolution[1]
        if exceptionExist(npcExceptions, from, toMap) then
            return from, toMap
        end
        from = pathSolution[1]
        table.remove(pathSolution, 1)
    end
    return from, pathSolution[1]
end

-- check for exceptions from n1 to n2, and solve it
local function handleException(n1, n2)
    if exceptionExist(npcExceptions, n1, n2) then
        return assert(talkToNpcOnCell(table.unpack(npcExceptions[n1][n2][1])), "Pathfinder --> Error: Exception invalid for: " .. n1 .. " -> " .. n2)
    elseif exceptionExist(elevatorExceptions, n1, n2) then
        return solveElevatorExce(n1, n2)
    end
end

-- return the node coresponding to the current player pos. Also used to return the current map, with mapArea tag if applicable
local function getPlayerNode(map)
	local map = getMapName()
	local playerInRectangle = Lib.inRectangle(getPlayerX(), getPlayerY())
	if mapAreas[map] then
		for mapArea, locs in pairs(mapAreas[map]) do
			for _, rect in ipairs(locs) do
				if playerInRectangle(table.unpack(rect)) then
					return mapArea
				end
			end
		end
		error("Pathfinder --> sub map could not be defined, map: " .. map .. "  x: " .. getPlayerX() .. "  y: " .. getPlayerY())
	end
	assert(globalMap[map], "Pathfinder -> Location does not exist in the map: " .. tostring(map))
	return map
end

-- create a new list replacing maps by all nodes corresponding to them
local function mapsToNodes(mapList)
    local nodeList = {}
    if type(mapList) == "string" then
        mapList = {mapList}
    end
    for _, map in pairs(mapList) do
        if mapAreas[map] then
            for mapArea, _ in pairs(mapAreas[map]) do
                table.insert(nodeList, mapArea)
            end
		elseif subMaps[map] then -- if the map has sub maps
			for submap, _ in pairs(subMaps[map]) do
				table.insert(nodeList, submap)
			end
        elseif globalMap[map] then
            table.insert(nodeList, map)
        else error("Pathfinder -> Requested dest does not exist in the map : " .. map)
        end
    end
    return nodeList
end

---------------------------
--- FUNCTION FOR MOVETO ---
---------------------------

-- reset path
local function resetPath()
    destStore = ""
end

local function errorInPath(from, toMap)
	resetPath()
	Lib.log1time("Pathfinder --> Error in Path: from " .. from .. " to " .. toMap .. " -- Reset and Recalc")
	swapPokemon(getTeamSize(), getTeamSize() - 1)
end

-- try to move with exception, and with the map name if no exception are found.
local function movingApply(from, toMap)
local mapLink = mapLinks[from][toMap]
	Lib.log1time("Path: Maps Remains: " .. #pathSolution .. "  Moving To: --> " .. toMap)
	if handleException(from, toMap) then
		return true	
	elseif mapLink then
		if #mapLink == 1 then
			if #mapLink[1] == 2 then
				moveToCell(mapLink[1][1], mapLink[1][2])
			else
				moveToCell(getNearestMovableCell(mapLink[1])[1], getNearestMovableCell(mapLink[1])[2])
			end
		else 
			if #mapLink > 1 then
				if Game.getDistance(getPlayerX(), getPlayerY(), getNearestMovableCell(mapLink[1])[1], getNearestMovableCell(mapLink[1])[2]) > Game.getDistance(getPlayerX(), getPlayerY(), getNearestMovableCell(mapLink[2])[1], getNearestMovableCell(mapLink[2])[2]) then
					table.remove(mapLink, 1)
				else
					table.remove(mapLink, 2)
				end
			end
		end
	end
	return true
end

-- remove already crossed nodes then try to move
local function moveWithCalcPath()
    if #pathSolution > 0 then
        if pathSolution[1] == playerNode then
            table.remove(pathSolution, 1)
            from, toMap = getNextNodes()
            if #pathSolution > 0 then
                return movingApply(from, toMap)
            end
            log("Pathfinder: Destination Reached.")
            return false
        else
            return movingApply(from, toMap)
        end
    end
    return false
end

---------------------------
-------- SETTINGS ---------
---------------------------

-- check if the player can use TM / HM moves.
local function validateAbilitiesIndex(dirtyList, abilityList)
    local pokeIndexTable = {}
    local teamSize = getTeamSize()
    for ability, happinessReq in pairs(abilityList) do
        local pokeIndex = dirtyList[ability]
        if not pokeIndex or teamSize < pokeIndex or not hasMove(pokeIndex, ability) or not (getPokemonHappiness(pokeIndex) > happinessReq) then
            pokeIndexTable[ability] = Game.getPokemonNumberWithMove(ability, happinessReq)
        else pokeIndexTable[ability] = pokeIndex
        end
    end
    return pokeIndexTable
end

-- check if the account has items. We assume items previously validated are always true, to limit API calls.
local function validateItems(currentItems, items)
    local accountItems = {}
    currentItems = currentItems or {}
    for _, item in ipairs(items) do
        if not currentItems[item] then
            accountItems[item] = hasItem(item)
        end
    end
    return accountItems
end

-- init setting on start, uses preset and bot team / items
local function initSettings(ss)
    settings.abilitiesIndex = validateAbilitiesIndex({}, moveAbilities)
end

-- try to find a path changing settings
local function findSettings(dest)
    local message = "Pathfinder --> Path Not Found ERROR. From " .. playerNode .. " to " .. destStore .. "."

    for ability, _ in pairs(moveAbilities) do
        if not settings.abilitiesIndex[ability] then
            settings.abilitiesIndex[ability] = 1
            if simpleAStar(goal(dest))(playerNode) then
                error(message .. " A Pokemon with the move " .. ability .. " would open a path.")
            end
        end
    end
    for _, item in ipairs(moveItems) do
        if not settings.accountItems[item] then
            settings.accountItems[item] = 1
            if simpleAStar(goal(dest))(playerNode) then
                error(message .. " Item: " .. item .. " would open a path.")
            end
        end
    end
    error(message)
end

-- main function called by users
local function moveTo(map, dest)
	if not dest then
		dest = map
		map = getMapName()
	end
	playerNode = getPlayerNode(map)
	dest = mapsToNodes(dest)
	if not isMounted() and not isSurfing() and isOutside() then
		assert(useEquippedMount(), "Error using Mount.")
		return true
	elseif checkNpcWith("Emma's Pokéball") then
		return talkNpcWith("Emma's Pokéball")
	elseif checkNpcWith("LostPokeball") then
		return talkNpcWith("LostPokeball")
	--elseif checkNpcWith("item") then
	--	return talkNpcWith("item")
	elseif destStore == table.concat(dest, " | ") then
		return moveWithCalcPath()
	else
		settings.abilitiesIndex = validateAbilitiesIndex(settings.abilitiesIndex, moveAbilities)
		settings.accountItems = validateItems(settings.accountItems, moveItems)
		pathSolution = simpleAStar(goal(dest))(playerNode)
		destStore = table.concat(dest, " | ")
		if not pathSolution then return findSettings(dest) end
		log("Path: " .. table.concat(pathSolution,"->"))
		return moveWithCalcPath()
	end
	return false
end

local function getPath(start, dest)
	settings.abilitiesIndex = validateAbilitiesIndex(settings.abilitiesIndex, moveAbilities)
    settings.accountItems = validateItems(settings.accountItems, moveItems)
    return simpleAStar(goal(mapsToNodes(dest)))(start)
end

local pfData     = {
resetPath        = resetPath,
exceptionExist   = exceptionExist,
}

------------------------
-------- HOOKS ---------
------------------------

-- we handle dialogs in DialogSolver
local function onPathfinderDialogMessage(message)
    if stringContains(message, "Your safari time is over.") then 
		if not moveTo(map, "Fuchsia City") then
			resetPath()
		end
	end
    --[[if stringContains(message, "Hey, you want to leave the Safari Zone?") then 
		if stringContains(toMap, "Safari") then 
			pushDialogAnswer(1)
		else
			pushDialogAnswer(2)
			if not moveTo(map, "Fuchsia City") then
				resetPath() 
			end
		end
	end]]
    pfData.from = from
    pfData.toMap = toMap
    pfData.abilitiesIndex = settings.abilitiesIndex
    dialogSolver.solveDialog(message, pfData)
end

local function onPathfinderSystemMessage(message)
    --if stringContains(message, "Your safari time is over.") then 
	--	resetPath() 
	--end
end

-- load map and settings
local function onPathfinderStart()
    globalMap = assert(_globalMap(), "Pathfinder --> Error : failed to load map")
	Lib.log1time("Pathfinder v(" .. version .. ") :")
    npcExceptions = _npcExceptions()
    initSettings(ss)
end

-- reset path on stop
local function onPathfinderStop()
    resetPath()
end

registerHook("onStart", onPathfinderStart)
registerHook("onDialogMessage", onPathfinderDialogMessage)
registerHook("onSystemMessage", onPathfinderSystemMessage)
registerHook("onStop", onPathfinderStop)

-- return table for users
return {
	moveTo = moveTo,
	getPath = getPath,
	mapName = getPlayerNode,
}
