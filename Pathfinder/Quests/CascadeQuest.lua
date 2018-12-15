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
cascadeTraining1 = {"Mt. Moon", "Mt. Moon B1F", "Mt. Moon B2F"}
cascadeNpcList = {"Hiker Willy", "Youngster Josh", "Lass Janice", "Bugcatcher Kent", "Lass Iris", "Youngster Ben", "Nerd Jason", "Youngster Yuri", "Bugcatcher Harry", "Scientist Adam", "Scientist Octavio", "Gentleman Garelt", "Lass Dazey", "Team Rocket Ruyi", "Team Rocket Viola", "Team Rocket Grim"}

function CascadeQuest.path()
local area = getAreaName()
local map = getMapName()

	for npc=1, #cascadeNpcList, 1 do
		if isNpcVisible(cascadeNpcList[npc]) then
			if pf.mapName() == getNpcArea(map, getNpcData(cascadeNpcList[npc]).x, getNpcData(cascadeNpcList[npc]).y) then
				if getNpcData(cascadeNpcList[npc]).isBattler and getNpcData(cascadeNpcList[npc]).canBattle then
					Lib.log1time("Battling NPC: " .. cascadeNpcList[npc] .. ".")
					return talkToNpc(cascadeNpcList[npc])
				end
			else
				if getNpcData(cascadeNpcList[npc]).isBattler and getNpcData(cascadeNpcList[npc]).canBattle then
					Lib.log1time("Battling NPC: " .. cascadeNpcList[npc] .. ".")
					return pf.moveTo(area, Game.getNpcArea(map, npcX, npcY))
				end
			end
		end
	end

	if moonStone == false then
		talkToNpcOnCell(105, 69)		
	elseif kent == false then
		talkToNpcOnCell(125, 81)		
	elseif robby == false then
		talkToNpcOnCell(142, 60)
	elseif charles == false then
		talkToNpcOnCell(131, 54)

	elseif Game.minTeamLevel() < 20 then
		levelPokesTo = 20
		return updateTargetArea(cascadeTraining1, "Encounter")
	
	--[[else
		if Game.minTeamLevel() >= 18 and not hasItem("Dome Fossil") and not hasItem("Helix Fossil") then
			if not pf.moveTo(area, "Mt. Moon B2F_C") then
				if fossil == "Random" then
					pushDialogAnswer(fossils[math.random(#fossils)])
					talkToNpcOnCell()
				else 
					pushDialogAnswer(fossil)
					talkToNpcOnCell()
				end
			end
		end]]
    end
	
end

return CascadeQuest