local cpath = select(1, ...) or "" -- callee path
local function nTimes(n, f, x) for i = 0, n - 1 do x = f(x) end return x end -- calls n times f(x)
local function rmlast(str) return str:sub(1, -2):match(".+[%./]") or "" end -- removes last dir / file from the callee path
local cppdpath = nTimes(3, rmlast, cpath) -- callee parent of parent dir path

local Lib = require(cppdpath .. "Lib/Lib")
local Game = require(cppdpath .. "Lib/Game")
local aStar = require(cppdpath .. "Lib/lua-astar/AStar")

local mapCells = {}
local shorelineCells = {}
local nodeEquality = {__eq = function(left, right) return left.x == right.x and left.y == right.y end}
local walkableTypes = {["Normal Ground"] = true, Grass = true, Link = true, Ice = true, Tree = true, Rock = true}

-- cellCosts[from][to] = cost
-- 'from' cells of type Link/Ice/Tree/Rock are considered to be Normal Ground
-- 'to' cells of type Link/Ice are considered to be Normal Ground
local cellCosts = {}
cellCosts["Normal Ground"] = {}
cellCosts["Normal Ground"]["Normal Ground"] = 1
cellCosts["Normal Ground"]["Grass"] = 2
cellCosts["Normal Ground"]["Water"] = 3
cellCosts["Normal Ground"]["Tree"] = 1 -- Cut tree
cellCosts["Normal Ground"]["Rock"] = 2 -- Rock Smash rock

cellCosts["Grass"] = {}
cellCosts["Grass"]["Normal Ground"] = 1
cellCosts["Grass"]["Grass"] = 2
cellCosts["Grass"]["Water"] = 3
cellCosts["Grass"]["Tree"] = 1
cellCosts["Grass"]["Rock"] = 2

cellCosts["Water"] = {}
cellCosts["Water"]["Normal Ground"] = 1
cellCosts["Water"]["Grass"] = 2
cellCosts["Water"]["Water"] = 2
cellCosts["Water"]["Tree"] = 2
cellCosts["Water"]["Rock"] = 3

-- aStar functions

local function expand(node)
	return mapCells[getMapName()][node].neighbors
end

local function cost(from, to)
	local map = getMapName()
	from = mapCells[map][from].type
	to = mapCells[map][to].type
	if from == "Link" or from == "Ice" or from == "Tree" or from == "Rock" then from = "Normal Ground" end
	if to == "Link" or to == "Ice" then to = "Normal Ground" end
	return cellCosts[from][to]
end

-- return estimated cost of goal, 0 is dijkstra
local function heuristic(n)
    return 0
end

local function goal(target)
	return function(node)
		return node == target
	end
end

local simpleAStar = aStar(expand)(cost)(heuristic)

--------------------------------------------------

local function newNode(x, y)
	return setmetatable({x = x, y = y}, nodeEquality)
end

local function coordinatesToNode(x, y)
	return x .. " " .. y
end

local function nodeToCoordinates(node)
	local coords = Lib.splitstring(node, " ")
	return tonumber(coords[1]), tonumber(coords[2])
end

local function cellIsWalkableOrWater(x, y)
	local cell = getCellType(x, y)
	return (not isNpcOnCell(x, y) or Game.getNpcOnCell(x, y).name:lower() == "tilescript") and (walkableTypes[cell] or cell == "Water")
end

local function cellIsWalkable(x, y)
	local cell = getCellType(x, y)
	return (not isNpcOnCell(x, y) or Game.getNpcOnCell(x, y).name:lower() == "tilescript") and walkableTypes[cell]
end

local function getNeighbors(x, y)
	local neighbors = {}
	if x < getMapWidth() then
		if cellIsWalkableOrWater(x + 1, y) then
			table.insert(neighbors, coordinatesToNode(x + 1, y))
		elseif getCellType(x + 1, y) == "Ledge East" and cellIsWalkable(x + 2, y) then
			table.insert(neighbors, coordinatesToNode(x + 2, y))
		end
	end
	if x > 0 then
		if cellIsWalkableOrWater(x - 1, y) then
			table.insert(neighbors, coordinatesToNode(x - 1, y))
		elseif getCellType(x - 1, y) == "Ledge West" and cellIsWalkable(x - 2, y) then
			table.insert(neighbors, coordinatesToNode(x - 2, y))
		end
	end
	if y < getMapHeight() then
		if cellIsWalkableOrWater(x, y + 1) then
			table.insert(neighbors, coordinatesToNode(x, y + 1))
		elseif getCellType(x, y + 1) == "Ledge South" and cellIsWalkable(x, y + 2) then
			table.insert(neighbors, coordinatesToNode(x, y + 2))
		end
	end
	if y > 0 and cellIsWalkableOrWater(x, y - 1) then
		table.insert(neighbors, coordinatesToNode(x, y - 1))
	end
	return neighbors
end

local function buildMap()
	local cells = {}
	local map = getMapName()
	shorelineCells[map] = {}
	for x = 0, getMapWidth() do
		for y = 0, getMapHeight() do
			if cellIsWalkableOrWater(x, y) then
				local cell = coordinatesToNode(x, y)
				cells[cell] = {}
				cells[cell].node = newNode(x, y)
				cells[cell].neighbors = getNeighbors(x, y)
				cells[cell].type = getCellType(x, y)
				if cellIsWalkable(x, y) then
					for _, node in ipairs(cells[cell].neighbors) do
						local edgeX, edgeY = nodeToCoordinates(node)
						if getCellType(edgeX, edgeY) == "Water" then
							table.insert(shorelineCells[map], newNode(x, y))
							break
						end
					end
				end
			end
		end
	end
	return cells
end

local function pathToCoordinates(stringArray)
	local path = {}
	for _, node in ipairs(stringArray) do
		local x, y = nodeToCoordinates(node)
		table.insert(path, newNode(x, y))
	end
	return path
end

local function getPath(x, y)
	assert((type(x) == "number" or tonumber(x))
	   and (type(y) == "number" or tonumber(y)),
	   "Pathfinder --> Error : getPath expects an (x, y) coordinate.")
	x = tonumber(x)
	y = tonumber(y)
	local map = getMapName()
	mapCells[map] = mapCells[map] or buildMap()
	local startNode = coordinatesToNode(getPlayerX(), getPlayerY())
	local endNode = coordinatesToNode(x, y)
	if not mapCells[map][endNode] then
		return nil -- Target cell is a collider
	end
	local path = simpleAStar(goal(endNode))(startNode)
	if not path then
		return nil -- Target cell is inaccessible
	end
	table.remove(path, 1) -- remove player node
	return pathToCoordinates(path)
end

local function cellIsAccessible(x, y)
	assert((type(x) == "number" or tonumber(x))
	   and (type(y) == "number" or tonumber(y)),
	   "Pathfinder --> Error : cellIsAccessible expects an (x, y) coordinate.")
	return getPath(x, y) ~= nil
end

local function cellIsShoreline(x, y)
	assert((type(x) == "number" or tonumber(x))
	   and (type(y) == "number" or tonumber(y)),
	   "Pathfinder --> Error : cellIsShoreline expects an (x, y) coordinate.")
	x = tonumber(x)
	y = tonumber(y)
	local map = getMapName()
	mapCells[map] = mapCells[map] or buildMap()
	return Lib.inTable(shorelineCells[map], newNode(x, y))
end

local function moveToShoreline()
	local map = getMapName()
	mapCells[map] = mapCells[map] or buildMap()
	if #shorelineCells[map] == 0 or cellIsShoreline(getPlayerX(), getPlayerY()) then
		return false -- No shorelines are on the current map or we're already on a shoreline
	end
	local closestNode = nil
	local shortestPath = 9999
	for _, node in ipairs(shorelineCells[map]) do
		local path = getPath(node.x, node.y)		
		if path ~= nil and #path < shortestPath then
			shortestPath = #path
			closestNode = node
		end
	end
	if closestNode == nil then
		return false -- No shoreline is accessible from the current location
	end
	return moveToCell(closestNode.x, closestNode.y)
end

return
{
	getPath = getPath,
	cellIsAccessible = cellIsAccessible,
	cellIsShoreline = cellIsShoreline,
	moveToShoreline = moveToShoreline,
}
