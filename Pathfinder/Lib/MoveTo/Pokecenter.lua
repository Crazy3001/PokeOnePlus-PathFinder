local cpath = select(1, ...) or "" -- callee path
local function nTimes(n, f, x) for i = 0, n - 1 do x = f(x) end return x end -- calls n times f(x)
local function rmlast(str) return str:sub(1, -2):match(".+[%./]") or "" end -- removes last dir / file from the callee path
local cppdpath = nTimes(3, rmlast, cpath) -- callee parent of parent dir path


local pf             = require (cppdpath .. "Lib/MoveTo/MoveTo")
local Lib            = require (cppdpath .. "Lib/Lib")
local PokecenterList = require (cppdpath .. "Maps/Pokecenters/Pokecenters")

-- move to closest PC
local function moveToPC(map)
    return pf.moveTo(map or getAreaName(), PokecenterList)
end

-- move to closest PC and use the nurse
local function useNearestPokecenter(map)
    map = map or getAreaName()
    if pf.moveTo(map, PokecenterList) then
        return true
    end
    return assert(usePokecenter(), "usePokecenter() failed")
end

return {
    moveToPC = moveToPC,
    useNearestPokecenter = useNearestPokecenter
}
