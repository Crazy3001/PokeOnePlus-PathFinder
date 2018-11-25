local cpath = select(1, ...) or "" -- callee path
local function nTimes(n, f, x) for i = 0, n - 1 do x = f(x) end return x end -- calls n times f(x)
local function rmlast(str) return str:sub(1, -2):match(".+[%./]") or "" end -- removes last dir / file from the callee path
local cpppdpath = nTimes(4, rmlast, cpath) -- callee parent parent of parent dir path

--Missing Maps: 
--Mt. Moon Rock Climb
--Cerulean Cave
--Power Plant
--House of Memories/Pokemon Tower 7f - Pokemon Tower Shaft
--Celadon City Inside
--Fuchsia City Inside
--Safari Zone
--Saffron City Inside

return function()

local KantoMap = {}

KantoMap["April And May's House"] = {["Cerulean City"] = {1}}
KantoMap["Babsis House"] = {["Pewter City"] = {1}}
KantoMap["Celadon City"] = {["Celadon Gym"] = {1}, ["Route 7"] = {1}, ["Route 16_A"] = {1}, ["Celadon Pokémon Center"] = {1}, ["Celadon Game Corner"] = {1}}
KantoMap["Celadon Game Corner - Prize Room"] = {["Celadon Game Corner"] = {1}}
KantoMap["Celadon Game Corner"] = {["Celadon City"] = {1}, ["Celadon Game Corner - Prize Room"] = {1}, ["Rocket Hideout B1F_A"] = {1}}
KantoMap["Celadon Gym"] = {["Celadon City"] = {1}}
KantoMap["Celadon Pokémon Center"] = {["Celadon City"] = {1}}
KantoMap["Cerulean Bike Shop"] = {["Cerulean City"] = {1}}
KantoMap["Cerulean City"] = {["Route 4_B"] = {1}, ["Tamara's House"] = {1}, ["April And May's House"] = {1}, ["Lola's House"] = {1}, ["Granny And Freddy's House"] = {1}, ["Cerulean Pokémon Center"] = {1}, ["Cerulean Pokémon Mart"] = {1}, ["Cerulean Gym"] = {1}, ["Martha And Martin's House"] = {1}, ["Josh's House"] = {1}, ["Cerulean Bike Shop"] = {1}, ["Route 5"] = {1}, ["Route 24"] = {1}, ["Route 9_A"] = {1}}
KantoMap["Cerulean Gym"] = {["Cerulean City"] = {1}}
KantoMap["Cerulean Jail Cells B1F"] = {["Cerulean Jail Cells"] = {1}}
KantoMap["Cerulean Jail Cells"] = {["Cerulean Jail"] = {1}, ["Cerulean Jail Cells B1F"] = {1}}
KantoMap["Cerulean Jail Storage Room"] = {["Cerulean Jail"] = {1}}
KantoMap["Cerulean Jail"] = {["Route 5"] = {1}, ["Cerulean Jail Cells"] = {1}, ["Cerulean Jail Storage Room"] = {1}}
KantoMap["Cerulean Pokémon Center"] = {["Cerulean City"] = {1}}
KantoMap["Cerulean Pokémon Mart"] = {["Cerulean City"] = {1}}
KantoMap["Daves House"] = {["Pewter City"] = {1}}
KantoMap["Diglett's Cave_A"] = {["Vermilion City"] = {1}, ["Diglett's Cave_B"] = {1}}
KantoMap["Diglett's Cave_B"] = {["Diglett's Cave_A"] = {1}, ["Diglett's Cave_C"] = {1}}
KantoMap["Diglett's Cave_C"] = {["Route 2_North East"] = {1}, ["Diglett's Cave_B"] = {1}}
KantoMap["Emmy's House"] = {["Viridian City"] = {1}}
KantoMap["Fisherman's House"] = {["Vermilion City"] = {1}}
KantoMap["Fuchsia City Gate East 2F"] = {["Fuchsia City Gate East"] = {1}}
KantoMap["Fuchsia City Gate East"] = {["Route 15"] = {1}, ["Fuchsia City Gate East 2F"] = {1}, ["Fuchsia City"] = {1}}
KantoMap["Fuchsia City Gate South"] = {["Fuchsia City"] = {1}}
KantoMap["Fuchsia City Gate West"] = {["Route 18_A"] = {1}, ["Route 18_B"] = {1}}
KantoMap["Fuchsia City"] = {["Safari Gate"] = {1}, ["Route 18_A"] = {1}, ["Fuchsia Gym"] = {1}, ["Fuchsia City Gate East"] = {1}, ["Fuchsia City Gate South"] = {1}, ["Fuchsia Pokémon Center"] = {1}}
KantoMap["Fuchsia Gym"] = {["Fuchsia City"] = {1}}
KantoMap["Fuchsia Pokémon Center"] = {["Fuchsia City"] = {1}}
KantoMap["Granny And Freddy's House"] = {["Cerulean City"] = {1}}
KantoMap["Grannys House"] = {["Route 2_North East"] = {1}}
KantoMap["House of Memories"] = {["Lavender Town"] = {1}}
KantoMap["Josh's House"] = {["Cerulean City"] = {1}}
KantoMap["Kanto Safari Zone - East"] = {["Kanto Safari Zone"] = {1}, ["Kanto Safari Zone - North"] = {1}}
KantoMap["Kanto Safari Zone - North"] = {["Kanto Safari Zone - East"] = {1}, ["Kanto Safari Zone - West"] = {1}}
KantoMap["Kanto Safari Zone - West"] = {["Kanto Safari Zone - North"] = {1}, ["Secret House"] = {1}}
KantoMap["Kanto Safari Zone"] = {["Kanto Safari Zone - East"] = {1}}
KantoMap["Lars House"] = {["Vermilion City"] = {1}}
KantoMap["Lavender Item Buyer"] = {["Lavender Town"] = {1}}
KantoMap["Lavender Pokémon Center"] = {["Lavender Town"] = {1}, ["Tourney Stadium"] = {1}}
KantoMap["Lavender Pokémon Mart"] = {["Lavender Town"] = {1}}
KantoMap["Lavender Town Gate"] = {["Lavender Town"] = {1}, ["Route 12"] = {1}}
KantoMap["Lavender Town"] = {["Route 10_C"] = {1}, ["Route 8_A"] = {1}, ["Lavender Pokémon Center"] = {1}, ["Lavender Pokémon Mart"] = {1}, ["Lavender Item Buyer"] = {1}, ["Uncle Joe's House"] = {1}, ["Mr. Fuji's House"] = {1}, ["House of Memories"] = {1}, ["Pokémon Tower"] = {1}, ["Lavender Town Gate"] = {1}}
KantoMap["Lola's House"] = {["Cerulean City"] = {1}}
KantoMap["Mac's House"] = {["Vermilion City"] = {1}}
KantoMap["Martha And Martin's House"] = {["Cerulean City"] = {1}}
KantoMap["Mary And Jane's House"] = {["Vermilion City"] = {1}}
KantoMap["Mona's House"] = {["Vermilion City"] = {1}}
KantoMap["Mr. Fuji's House"] = {["Lavender Town"] = {1}}
KantoMap["Mt. Moon B1F_A"] = {["Mt. Moon"] = {1}, ["Mt. Moon B2F_A"] = {1}}
KantoMap["Mt. Moon B1F_B"] = {["Mt. Moon"] = {1}, ["Mt. Moon B2F_B"] = {1}}
KantoMap["Mt. Moon B1F_C"] = {["Mt. Moon"] = {1}, ["Mt. Moon B2F_C"] = {1}}
KantoMap["Mt. Moon B1F_D"] = {["Mt. Moon B2F_C"] = {1}, ["Route 4_A"] = {1}}
KantoMap["Mt. Moon B2F_A"] = {["Mt. Moon B1F_A"] = {1}}
KantoMap["Mt. Moon B2F_B"] = {["Mt. Moon B1F_B"] = {1}}
KantoMap["Mt. Moon B2F_C"] = {["Mt. Moon B1F_C"] = {1}, ["Mt. Moon B1F_D"] = {1}}
KantoMap["Mt. Moon Pokémon Center"] = {["Route 3"] = {1}}
KantoMap["Mt. Moon"] = {["Route 3"] = {1}, ["Mt. Moon B1F_A"] = {1}, ["Mt. Moon B1F_B"] = {1}, ["Mt. Moon B1F_C"] = {1}}
KantoMap["Oak's House 2F"] = {["Oak's House"] = {1}}
KantoMap["Oak's House"] = {["Pallet Town"] = {1}, ["Oak's House 2F"] = {1}}
KantoMap["Oak's Lab"] = {["Pallet Town"] = {1}}
KantoMap["Pallet Town"] = {["Player House"] = {1}, ["Oak's House"] = {1}, ["Oak's Lab"] = {1}, ["Route 1"] = {1}}
KantoMap["Pewter City Museum"] = {["Pewter City"] = {1}}
KantoMap["Pewter City"] = {["Route 2_North West"] = {1}, ["Daves House"] = {1}, ["Pewter Pokémon Center"] = {1}, ["Pewter Pokémon Mart"] = {1}, ["Babsis House"] = {1}, ["Pewter Gym"] = {1}, ["Pewter City Museum"] = {1}, ["Route 3"] = {1}}
KantoMap["Pewter Gym"] = {["Pewter City"] = {1}}
KantoMap["Pewter Pokémon Center"] = {["Pewter City"] = {1}}
KantoMap["Pewter Pokémon Mart"] = {["Pewter City"] = {1}}
KantoMap["Player House 2F"] = {["Player House"] = {1}}
KantoMap["Player House"] = {["Pallet Town"] = {1}, ["Player House 2F"] = {1}}
KantoMap["Pokémon Fan Club"] = {["Vermilion City"] = {1}}
KantoMap["Pokémon League Reception"] = {["Route 22"] = {1}}
KantoMap["Pokémon Tower 2F"] = {["Pokémon Tower"] = {1}, ["Pokémon Tower 3F"] = {1}}
KantoMap["Pokémon Tower 3F"] = {["Pokémon Tower 2F"] = {1}, ["Pokémon Tower 4F"] = {1}}
KantoMap["Pokémon Tower 4F"] = {["Pokémon Tower 3F"] = {1}, ["Pokémon Tower 5F"] = {1}}
KantoMap["Pokémon Tower 5F"] = {["Pokémon Tower 4F"] = {1}, ["Pokémon Tower 6F"] = {1}}
KantoMap["Pokémon Tower 6F"] = {["Pokémon Tower 5F"] = {1}, ["Pokémon Tower 7F"] = {1}}
KantoMap["Pokémon Tower 7F"] = {["Pokémon Tower 6F"] = {1}}
KantoMap["Pokémon Tower"] = {["Lavender Town"] = {1}, ["Pokémon Tower 2F"] = {1}}
KantoMap["Power Plant"] = {["Route 10 B"] = {1}}
KantoMap["Rock Tunnel Pokémon Center"] = {["Route 10_A"] = {1}}
KantoMap["Rock Tunnel_A"] = {["Rock Tunnel_B"] = {1}, ["Route 10_A"] = {1}}
KantoMap["Rock Tunnel_B"] = {["Rock Tunnel_A"] = {1}, ["Rock Tunnel_C"] = {1}}
KantoMap["Rock Tunnel_C"] = {["Rock Tunnel_B"] = {1}, ["Rock Tunnel_D"] = {1}}
KantoMap["Rock Tunnel_D"] = {["Rock Tunnel_C"] = {1}, ["Rock Tunnel_E"] = {1}}
KantoMap["Rock Tunnel_E"] = {["Rock Tunnel_D"] = {1}, ["Route 10_C"] = {1}}
KantoMap["Rocket Hideout B1F Elevator"] = {["Rocket Hideout B1F_A"] = {1}, ["Rocket Hideout B2F Elevator"] = {1, {["items"] = {"Lift Key"}}}, ["Rocket Hideout B4F Elevator"] = {1, {["items"] = {"Lift Key"}}}}
KantoMap["Rocket Hideout B1F_A"] = {["Celadon Game Corner"] = {1}, ["Rocket Hideout B2F"] = {1}, ["Rocket Hideout B1F Elevator"] = {1}}
KantoMap["Rocket Hideout B1F_B"] = {["Rocket Hideout B2F"] = {1}}
KantoMap["Rocket Hideout B2F Elevator"] = {["Rocket Hideout B2F"] = {1}, ["Rocket Hideout B1F Elevator"] = {1, {["items"] = {"Lift Key"}}}, ["Rocket Hideout B4F Elevator"] = {1, {["items"] = {"Lift Key"}}}}
KantoMap["Rocket Hideout B2F"] = {["Rocket Hideout B1F_A"] = {1}, ["Rocket Hideout B2F Elevator"] = {1}, ["Rocket Hideout B3F"] = {1}, ["Rocket Hideout B1F_B"] = {1}}
KantoMap["Rocket Hideout B3F"] = {["Rocket Hideout B2F"] = {1}, ["Rocket Hideout B4F_A"] = {1}}
KantoMap["Rocket Hideout B4F Elevator"] = {["Rocket Hideout B4F_B"] = {1}, ["Rocket Hideout B1F Elevator"] = {1, {["items"] = {"Lift Key"}}}, ["Rocket Hideout B2F Elevator"] = {1, {["items"] = {"Lift Key"}}}}
KantoMap["Rocket Hideout B4F_A"] = {["Rocket Hideout B3F"] = {1}}
KantoMap["Rocket Hideout B4F_B"] = {["Rocket Hideout B4F Elevator"] = {1}}
KantoMap["Route 1"] = {["Pallet Town"] = {1}, ["Viridian City"] = {1}}
KantoMap["Route 10_A"] = {["Route 9_B"] = {1}, ["Rock Tunnel Pokémon Center"] = {1}, ["Rock Tunnel_A"] = {1}}
KantoMap["Route 10_B"] = {["Route 9_B"] = {1, {["abilities"] = {"surf"}}}}
KantoMap["Route 10_C"] = {["Rock Tunnel_E"] = {1}, ["Lavender Town"] = {1}}
KantoMap["Route 11"] = {["Route 12 Gate"] = {1}, ["Vermilion City"] = {1}}
KantoMap["Route 12 Gate 2F"] = {["Route 12 Gate"] = {1}}
KantoMap["Route 12 Gate"] = {["Route 12"] = {1}, ["Route 12 Gate 2F"] = {1}, ["Route 11"] = {1}}
KantoMap["Route 12 House"] = {["Route 12"] = {1}}
KantoMap["Route 12"] = {["Lavender Town Gate"] = {1}, ["Route 12 Gate"] = {1}, ["Route 12 House"] = {1}, ["Route 13"] = {1}}
KantoMap["Route 13"] = {["Route 12"] = {1}, ["Route 14"] = {1}}
KantoMap["Route 14"] = {["Route 13"] = {1}, ["Route 15"] = {1}}
KantoMap["Route 15"] = {["Route 14"] = {1}, ["Fuchsia City Gate East"] = {1}}
KantoMap["Route 16 Gate 2F"] = {["Route 16 Gate"] = {1}}
KantoMap["Route 16 Gate"] = {["Route 16_A"] = {1}, ["Route 16 Gate 2F"] = {1}, ["Route 16_C"] = {1}}
KantoMap["Route 16 House"] = {["Route 16_B"] = {1}}
KantoMap["Route 16_A"] = {["Celadon City"] = {1}, ["Route 16 Gate"] = {1}, ["Route 16_B"] = {1, {["abilities"] = {"cut"}}}}
KantoMap["Route 16_B"] = {["Route 16_A"] = {1}, ["Route 16 House"] = {1}}
KantoMap["Route 16_C"] = {["Route 16 Gate"] = {1}, ["Route 17"] = {1}}
KantoMap["Route 17"] = {["Route 16_C"] = {1}, ["Route 18_B"] = {1}}
KantoMap["Route 18_A"] = {["Fuchsia City Gate West"] = {1}, ["Fuchsia City"] = {1}}
KantoMap["Route 18_B"] = {["Route 17"] = {1}, ["Fuchsia City Gate West"] = {1}}
KantoMap["Route 2 East House"] = {["Route 2 East"] = {1}}
KantoMap["Route 2 East"] = {["Route 2_North East"] = {1}, ["Route 2 East House"] = {1}}
KantoMap["Route 22"] = {["Viridian City"] = {1}, ["Pokémon League Reception"] = {1}}
KantoMap["Route 24"] = {["Cerulean City"] = {1}, ["Route 25"] = {1}}
KantoMap["Route 25"] = {["Route 24"] = {1}, ["Sea Cottage"] = {1}}
KantoMap["Route 2_North East"] = {["Viridian Forest Gate_East"] = {.5}, ["Route 2 East"] = {1}, ["Diglett's Cave_C"] = {1}, ["Grannys House"] = {1}, ["Route 2_North West"] = {1, {["abilities"] = {"cut"}}}}
KantoMap["Route 2_North West"] = {["Viridian Forest Gate_North"] = {1}, ["Pewter City"] = {1}, ["Route 2_North East"] = {.5, {["abilities"] = {"cut"}}}}
KantoMap["Route 2_South East"] = {["Viridian Forest Gate_East"] = {.5}, ["Route 2_South West"] = {1, {["abilities"] = {"cut"}}}}
KantoMap["Route 2_South West"] = {["Viridian City"] = {1}, ["Viridian Forest Gate_South"] = {1}, ["Route 2_South East"] = {.5, {["abilities"] = {"cut"}}}}
KantoMap["Route 3"] = {["Pewter City"] = {1}, ["Mt. Moon Pokémon Center"] = {1}, ["Mt. Moon"] = {1}}
KantoMap["Route 4_A"] = {["Mt. Moon B1F_D"] = {1}, ["Route 4_B"] = {1}}
KantoMap["Route 4_B"] = {["Cerulean City"] = {1}}
KantoMap["Route 5"] = {["Cerulean City"] = {1}, ["Underground Path_A"] = {1}, ["Saffron City Gate North"] = {1}, ["Cerulean Jail"] = {1}}
KantoMap["Route 6"] = {["Vermilion City"] = {1}, ["Underground Path_C"] = {1}, ["Saffron City Gate South"] = {1}}
KantoMap["Route 7"] = {["Underground Path_F"] = {1}, ["Celadon City"] = {1}, ["Saffron City Gate West"] = {1}}
KantoMap["Route 8_A"] = {["Saffron City Gate East"] = {1}, ["Lavender Town"] = {1}, ["Underground Path_D"] = {1}, ["Route 8_B"] = {1, {["abilities"] = {"cut"}}}}
KantoMap["Route 8_B"] = {["Route 8_A"] = {1}}
KantoMap["Route 9_A"] = {["Cerulean City"] = {1}, ["Route 9_B"] = {1, {["abilities"] = {"cut"}}}}
KantoMap["Route 9_B"] = {["Route 9_A"] = {1}, ["Route 10_A"] = {1}, ["Route 10_B"] = {1, {["abilities"] = {"surf"}}}}
KantoMap["S.S. Anne 2F Room 1"] = {["S.S. Anne 2F"] = {1}}
KantoMap["S.S. Anne 2F Room 2"] = {["S.S. Anne 2F"] = {1}}
KantoMap["S.S. Anne 2F Room 3"] = {["S.S. Anne 2F"] = {1}}
KantoMap["S.S. Anne 2F Room 4"] = {["S.S. Anne 2F"] = {1}}
KantoMap["S.S. Anne 2F Room 5"] = {["S.S. Anne 2F"] = {1}}
KantoMap["S.S. Anne 2F Room 6"] = {["S.S. Anne 2F"] = {1}}
KantoMap["S.S. Anne 2F"] = {["S.S. Anne"] = {1}, ["S.S. Anne 3F"] = {1}, ["S.S. Anne Captains Room"] = {1}, ["S.S. Anne 2F Room 1"] = {1}, ["S.S. Anne 2F Room 2"] = {1}, ["S.S. Anne 2F Room 3"] = {1}, ["S.S. Anne 2F Room 4"] = {1}, ["S.S. Anne 2F Room 5"] = {1}, ["S.S. Anne 2F Room 6"] = {1}}
KantoMap["S.S. Anne 3F"] = {["S.S. Anne 2F"] = {1}}
KantoMap["S.S. Anne B1F Room 1"] = {["S.S. Anne B1F"] = {1}}
KantoMap["S.S. Anne B1F Room 2"] = {["S.S. Anne B1F"] = {1}}
KantoMap["S.S. Anne B1F Room 3"] = {["S.S. Anne B1F"] = {1}}
KantoMap["S.S. Anne B1F Room 4"] = {["S.S. Anne B1F"] = {1}}
KantoMap["S.S. Anne B1F Room 5"] = {["S.S. Anne B1F"] = {1}}
KantoMap["S.S. Anne B1F"] = {["S.S. Anne"] = {1}, ["S.S. Anne B1F Room 1"] = {1}, ["S.S. Anne B1F Room 2"] = {1}, ["S.S. Anne B1F Room 3"] = {1}, ["S.S. Anne B1F Room 4"] = {1}, ["S.S. Anne B1F Room 5"] = {1}}
KantoMap["S.S. Anne Captains Room"] = {["S.S. Anne 2F"] = {1}}
KantoMap["S.S. Anne Kitchen"] = {["S.S. Anne"] = {1}}
KantoMap["S.S. Anne Room 1"] = {["S.S. Anne"] = {1}}
KantoMap["S.S. Anne Room 2"] = {["S.S. Anne"] = {1}}
KantoMap["S.S. Anne Room 3"] = {["S.S. Anne"] = {1}}
KantoMap["S.S. Anne Room 4"] = {["S.S. Anne"] = {1}}
KantoMap["S.S. Anne Room 5"] = {["S.S. Anne"] = {1}}
KantoMap["S.S. Anne Room 6"] = {["S.S. Anne"] = {1}}
KantoMap["S.S. Anne Room 7"] = {["S.S. Anne"] = {1}}
KantoMap["S.S. Anne"] = {["Vermilion City"] = {1}, ["S.S. Anne 2F"] = {1}, ["S.S. Anne Kitchen"] = {1} ,["S.S. Anne B1F"] = {1}, ["S.S. Anne Room 1"] = {1}, ["S.S. Anne Room 2"] = {1}, ["S.S. Anne Room 3"] = {1}, ["S.S. Anne Room 4"] = {1}, ["S.S. Anne Room 5"] = {1}, ["S.S. Anne Room 6"] = {1}, ["S.S. Anne Room 7"] = {1}}
KantoMap["Safari Gate"] = {["Fuchsia City"] = {1}, ["Kanto Safari Zone"] = {1}}
KantoMap["Saffron City Gate East"] = {["Route 8_A"] = {1}, ["Saffron City"] = {1}}
KantoMap["Saffron City Gate North"] = {["Route 5"] = {1}, ["Saffron City"] = {1}}
KantoMap["Saffron City Gate South"] = {["Route 6"] = {1}, ["Saffron City"] = {1}}
KantoMap["Saffron City Gate West"] = {["Route 7"] = {1}, ["Saffron City"] = {1}}
KantoMap["Saffron City"] = {["Saffron Pokémon Center"] = {1}, ["Saffron Fighting Dojo"] = {1}, ["Saffron Gym_H"] = {1}, ["Saffron City Gate North"] = {1}, ["Saffron City Gate East"] = {1}, ["Saffron City Gate South"] = {1}, ["Saffron City Gate West"] = {1}}
KantoMap["Saffron Fighting Dojo"] = {["Saffron City"] = {1}}
KantoMap["Saffron Gym 2F"] = {["Saffron Gym_E"] = {1}, ["Saffron Gym_H"] = {1}}
KantoMap["Saffron Gym_A"] = {["Saffron Gym_B"] = {1}, ["Saffron Gym_C"] = {1}, ["Saffron Gym_D"] = {1}, ["Saffron Gym_E"] = {1}}
KantoMap["Saffron Gym_B"] = {["Saffron Gym_A"] = {1}, ["Saffron Gym_D"] = {1}, ["Saffron Gym_F"] = {1}, ["Saffron Gym_G"] = {1}}
KantoMap["Saffron Gym_C"] = {["Saffron Gym_A"] = {1}, ["Saffron Gym_F"] = {1}, ["Saffron Gym_G"] = {1}, ["Saffron Gym_I"] = {1}}
KantoMap["Saffron Gym_D"] = {["Saffron Gym_A"] = {1}, ["Saffron Gym_B"] = {1}, ["Saffron Gym_F"] = {1}, ["Saffron Gym_G"] = {1}}
KantoMap["Saffron Gym_E"] = {["Saffron Gym_A"] = {1}, ["Saffron Gym 2F"] = {1}}
KantoMap["Saffron Gym_F"] = {["Saffron Gym_B"] = {1}, ["Saffron Gym_C"] = {1}, ["Saffron Gym_D"] = {1}, ["Saffron Gym_I"] = {1}}
KantoMap["Saffron Gym_G"] = {["Saffron Gym_B"] = {1}, ["Saffron Gym_C"] = {1}, ["Saffron Gym_D"] = {1}, ["Saffron Gym_I"] = {1}}
KantoMap["Saffron Gym_H"] = {["Saffron Gym_I"] = {1}, ["Saffron City"] = {1}}
KantoMap["Saffron Gym_I"] = {["Saffron Gym_C"] = {1}, ["Saffron Gym_F"] = {1}, ["Saffron Gym_G"] = {1}, ["Saffron Gym_H"] = {1}}
KantoMap["Saffron Pokémon Center"] = {["Saffron City"] = {1}}
KantoMap["Sea Cottage"] = {["Route 25"] = {1}}
KantoMap["Secret House"] = {["Kanto Safari Zone - West"] = {1}}
KantoMap["Tamara's House"] = {["Cerulean City"] = {1}}
KantoMap["Tourney Stadium"] = {["Lavender Pokémon Center"] = {1}}
KantoMap["Trainers School B1F"] = {["Trainers School"] = {1}}
KantoMap["Trainers School"] = {["Viridian City"] = {1}, ["Trainers School B1F"] = {1}}
KantoMap["Uncle Joe's House"] = {["Lavender Town"] = {1}}
KantoMap["Underground Path_A"] = {["Underground Path_B"] = {1}, ["Route 5"] = {1}}
KantoMap["Underground Path_B"] = {["Underground Path_A"] = {1}, ["Underground Path_C"] = {1}}
KantoMap["Underground Path_C"] = {["Underground Path_B"] = {1}, ["Route 6"] = {1}}
KantoMap["Underground Path_D"] = {["Underground Path_E"] = {1}, ["Route 8_A"] = {1}}
KantoMap["Underground Path_E"] = {["Underground Path_D"] = {1}, ["Underground Path_F"] = {1}, ["Underground Path_G"] = {1}}
KantoMap["Underground Path_F"] = {["Underground Path_E"] = {1}, ["Route 7"] = {1}}
KantoMap["Underground Path_G"] = {["Underground Path_E"] = {1}}
KantoMap["Vacant House 2"] = {["Vermilion City"] = {1}}
KantoMap["Vacant House 2F"] = {["Vacant House"] = {1}}
KantoMap["Vacant House"] = {["Vacant House 2F"] = {1}, ["Vermilion City"] = {1}}
KantoMap["Vermilion City"] = {["S.S. Anne"] = {1}, ["Vermilion City_B"] = {1, {["abilities"] = {"cut"}}}, ["Mary And Jane's House"] = {1}, ["Mona's House"] = {1}, ["Vacant House"] = {1}, ["Vacant House 2"] = {1}, ["Pokémon Fan Club"] = {1}, ["Mac's House"] = {1}, ["Lars House"] = {1}, ["Fisherman's House"] = {1}, ["Route 6"] = {1}, ["Route 11"] = {1}, ["Diglett's Cave_A"] = {1}, ["Vermilion Pokémon Center"] = {1}, ["Vermilion Pokémon Mart"] = {1}}
KantoMap["Vermilion City_B"] = {["Vermilion Gym"] = {1}, ["Vermilion City"] = {1, {["abilities"] = {"cut"}}}}
KantoMap["Vermilion Gym"] = {["Vermilion City_B"] = {1}}
KantoMap["Vermilion Pokémon Center"] = {["Vermilion City"] = {1}}
KantoMap["Vermilion Pokémon Mart"] = {["Vermilion City"] = {1}}
KantoMap["Viridian City"] = {["Route 2_South West"] = {1}, ["Route 1"] = {1}, ["Route 22"] = {1}, ["Viridian Pokémon Center"] = {1}, ["Viridian Pokémon Mart"] = {1}, ["Emmy's House"] = {1}, ["Trainers School"] = {1}, ["Viridian Gym"] = {1}}
KantoMap["Viridian Forest Gate_East"] = {["Route 2_South East"] = {1}, ["Route 2_North East"] = {1}}
KantoMap["Viridian Forest Gate_North"] = {["Route 2_North West"] = {1}, ["Viridian Forest"] = {1}}
KantoMap["Viridian Forest Gate_South"] = {["Route 2_South West"] = {1}, ["Viridian Forest"] = {1}}
KantoMap["Viridian Forest"] = {["Viridian Forest Gate_South"] = {1}, ["Viridian Forest Gate_North"] = {1}}
KantoMap["Viridian Gym 2F"] = {["Viridian Gym"] = {1} }
KantoMap["Viridian Gym"] = {["Viridian City"] = {1}, ["Viridian Gym 2F"] = {1}}
KantoMap["Viridian Pokémon Center"] = {["Viridian City"] = {1}}
KantoMap["Viridian Pokémon Mart"] = {["Viridian City"] = {1}}

-- KantoMap["node"] = {["link"] = {distance, {["restrictionType"] = {"restriction"}}}}

return KantoMap
end
