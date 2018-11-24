local cpath = select(1, ...) or "" -- callee path
local function nTimes(n, f, x) for i = 0, n - 1 do x = f(x) end return x end -- calls n times f(x)
local function rmlast(str) return str:sub(1, -2):match(".+[%./]") or "" end -- removes last dir / file from the callee path
local cppdpath = nTimes(3, rmlast, cpath) -- callee parent of parent dir path

local Maybe                 = require (cppdpath .. "Lib/Maybe")
local Lib                   = require (cppdpath .. "Lib/Lib")
local _npcExceptions        = require (cppdpath .. "Maps/MapExceptions/NpcExceptions")
local elevators             = require (cppdpath .. "Maps/MapExceptions/Elevators")


local function solveNpc(message, n1, n2)
    local npcExce = npcExceptions[n1][n2]
    assert(npcExce[2] and npcExce[3], "PathFinder --> npc dialog exception is missing some data. " .. n1 .. " -> " .. n2)
    if string.upper(message) == string.upper(npcExce[3]) then
        pushDialogAnswer(npcExce[2])
        log("Pathfinder: Pushing dialog: " .. npcExce[2])
    end
end

local function solveElevator(message, n1, n2)
    local exce = elevators[n1][n2]
    local pushLog = "Pathfinder: Pushing dialog:"
    assert(exce[2] and exce[3] and exce[4] and Maybe.isJust(exce[5] and exce[6]), "PathFinder --> elevator dialog exception is missing some data. " .. n1 .. " -> " .. n2)
    if message == exce[3] then
        for _, push in pairs(exce[2]) do
            pushDialogAnswer(push)
            pushLog = pushLog .. " " .. push
        end
        log(pushLog)
    elseif message == exce[4] then
        exce[5] = true
    end
end

local function solveDialog(message, pf)
    local n1 = pf.from
    local n2 = pf.toMap
    if pf.exceptionExist(npcExceptions, n1, n2) then
        return solveNpc(message, n1, n2)
    elseif pf.exceptionExist(elevators, n1, n2) then
        return solveElevator(message, n1, n2)
    end
end

local function onDialogSolverStart()
    npcExceptions = _npcExceptions()
end

registerHook("onStart", onDialogSolverStart)

return { solveDialog = solveDialog }
