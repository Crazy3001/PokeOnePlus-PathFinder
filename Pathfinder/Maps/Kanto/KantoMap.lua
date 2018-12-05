local cpath = select(1, ...) or "" -- callee path
local function nTimes(n, f, x) for i = 0, n - 1 do x = f(x) end return x end -- calls n times f(x)
local function rmlast(str) return str:sub(1, -2):match(".+[%./]") or "" end -- removes last dir / file from the callee path
local cpppdpath = nTimes(4, rmlast, cpath) -- callee parent parent of parent dir path

--KantoMap["node"] = {["link"] = {distance, {["restrictionType"] = {"restriction"}}}}

--Missing Maps: 
--Mt. Moon Rock Climb
--Cerulean Cave
--Magnet Train
--Safari Zone needs refined
--Seafoam needs refined
--Mt Silver Waterfall

return function()

local KantoMap = {}

KantoMap["April And May's House"] = {["Cerulean City"] = {1}}
KantoMap["Babsis House"] = {["Pewter City"] = {1}}
KantoMap["Celadon City Inn"] = {["Celadon City"] = {1}}
KantoMap["Celadon City"] = {["Celadon Department Store"] = {1}, ["Surface House"] = {1}, ["Celadon Restaurant"] = {1}, ["Team Rocket House"] = {1}, ["Celadon Condominiums_A"] = {1}, ["Celadon Condominiums_B"] = {1}, ["Celadon City Inn"] = {1}, ["Celadon Gym"] = {1}, ["Route 7"] = {1}, ["Route 16_A"] = {1}, ["Celadon Pokémon Center"] = {1}, ["Celadon Game Corner"] = {1}}
KantoMap["Celadon Condominiums 2F_A"] = {["Celadon Condominiums_A"] = {1}, ["Celadon Condominiums 3F_A"] = {1}}
KantoMap["Celadon Condominiums 2F_B"] = {["Celadon Condominiums_B"] = {1}, ["Celadon Condominiums 3F_B"] = {1}}
KantoMap["Celadon Condominiums 3F_A"] = {["Celadon Condominiums 2F_A"] = {1}, ["Celadon Condominiums 4F_A"] = {1}}
KantoMap["Celadon Condominiums 3F_B"] = {["Celadon Condominiums 2F_B"] = {1}, ["Celadon Condominiums 4F_B"] = {1}}
KantoMap["Celadon Condominiums 4F_A"] = {["Celadon Condominiums 3F_A"] = {1}}
KantoMap["Celadon Condominiums 4F_B"] = {["Celadon Condominiums 3F_B"] = {1}, ["Celadon Condominiums 4F_C"] = {1}}
KantoMap["Celadon Condominiums 4F_C"] = {["Celadon Condominiums 4F_B"] = {1}}
KantoMap["Celadon Condominiums_A"] = {["Celadon City"] = {1}, ["Celadon Condominiums 2F_A"] = {1}}
KantoMap["Celadon Condominiums_B"] = {["Celadon City"] = {1}, ["Celadon Condominiums 2F_B"] = {1}}
KantoMap["Celadon Department Store 2F Elevator"] = {["Celadon Department Store 2F"] = {1}, ["Celadon Department Store Elevator"] = {1}, ["Celadon Department Store 3F Elevator"] = {1}, ["Celadon Department Store 4F Elevator"] = {1}, ["Celadon Department Store 5F Elevator"] = {1}, ["Celadon Department Store 6F Elevator"] = {1}} 
KantoMap["Celadon Department Store 2F"] = {["Celadon Department Store 2F Elevator"] = {1}, ["Celadon Department Store"] = {1}, ["Celadon Department Store 3F"] = {1}} 
KantoMap["Celadon Department Store 3F Elevator"] = {["Celadon Department Store 3F"] = {1}, ["Celadon Department Store Elevator"] = {1}, ["Celadon Department Store 2F Elevator"] = {1}, ["Celadon Department Store 4F Elevator"] = {1}, ["Celadon Department Store 5F Elevator"] = {1}, ["Celadon Department Store 6F Elevator"] = {1}} 
KantoMap["Celadon Department Store 3F"] = {["Celadon Department Store 3F Elevator"] = {1}, ["Celadon Department Store 2F"] = {1}, ["Celadon Department Store 4F"] = {1}} 
KantoMap["Celadon Department Store 4F Elevator"] = {["Celadon Department Store 4F"] = {1}, ["Celadon Department Store Elevator"] = {1}, ["Celadon Department Store 2F Elevator"] = {1}, ["Celadon Department Store 3F Elevator"] = {1}, ["Celadon Department Store 5F Elevator"] = {1}, ["Celadon Department Store 6F Elevator"] = {1}} 
KantoMap["Celadon Department Store 4F"] = {["Celadon Department Store 4F Elevator"] = {1}, ["Celadon Department Store 3F"] = {1}, ["Celadon Department Store 5F"] = {1}} 
KantoMap["Celadon Department Store 5F Elevator"] = {["Celadon Department Store 5F"] = {1}, ["Celadon Department Store Elevator"] = {1}, ["Celadon Department Store 2F Elevator"] = {1}, ["Celadon Department Store 3F Elevator"] = {1}, ["Celadon Department Store 4F Elevator"] = {1}, ["Celadon Department Store 6F Elevator"] = {1}} 
KantoMap["Celadon Department Store 5F"] = {["Celadon Department Store 5F Elevator"] = {1}, ["Celadon Department Store 4F"] = {1}, ["Celadon Department Store 6F"] = {1}} 
KantoMap["Celadon Department Store 6F Elevator"] = {["Celadon Department Store 6F"] = {1}, ["Celadon Department Store Elevator"] = {1}, ["Celadon Department Store 2F Elevator"] = {1}, ["Celadon Department Store 3F Elevator"] = {1}, ["Celadon Department Store 4F Elevator"] = {1}, ["Celadon Department Store 5F Elevator"] = {1}}
KantoMap["Celadon Department Store 6F"] = {["Celadon Department Store 6F Elevator"] = {1}, ["Celadon Department Store 5F"] = {1}} 
KantoMap["Celadon Department Store Elevator"] = {["Celadon Department Store"] = {1}, ["Celadon Department Store 2F Elevator"] = {1}, ["Celadon Department Store 3F Elevator"] = {1}, ["Celadon Department Store 4F Elevator"] = {1}, ["Celadon Department Store 5F Elevator"] = {1}, ["Celadon Department Store 6F Elevator"] = {1}} 
KantoMap["Celadon Department Store"] = {["Celadon City"] = {1}, ["Celadon Department Store Elevator"] = {1}, ["Celadon Department Store 2F"] = {1}} 
KantoMap["Celadon Game Corner - Prize Room"] = {["Celadon Game Corner"] = {1}}
KantoMap["Celadon Game Corner"] = {["Celadon City"] = {1}, ["Celadon Game Corner - Prize Room"] = {1}, ["Rocket Hideout B1F_A"] = {1}}
KantoMap["Celadon Gym"] = {["Celadon City"] = {1}}
KantoMap["Celadon Pokémon Center"] = {["Celadon City"] = {1}}
KantoMap["Celadon Restaurant"] = {["Celadon City"] = {1}}
KantoMap["Cerulean Bike Shop"] = {["Cerulean City"] = {1}}
KantoMap["Cerulean Cave_A"] = {["Cerulean City"] = {1}}
KantoMap["Cerulean City"] = {["Cerulean Cave_A"] = {1}, ["Route 4_B"] = {1}, ["Tamara's House"] = {1}, ["April And May's House"] = {1}, ["Lola's House"] = {1}, ["Granny And Freddy's House"] = {1}, ["Cerulean Pokémon Center"] = {1}, ["Cerulean Pokémon Mart"] = {1}, ["Cerulean Gym"] = {1}, ["Martha And Martin's House"] = {1}, ["Josh's House"] = {1}, ["Cerulean Bike Shop"] = {1}, ["Route 5"] = {1}, ["Route 24"] = {1}, ["Route 9_A"] = {1}}
KantoMap["Cerulean Gym"] = {["Cerulean City"] = {1}}
KantoMap["Cerulean Jail Cells B1F"] = {["Cerulean Jail Cells"] = {1}}
KantoMap["Cerulean Jail Cells"] = {["Cerulean Jail"] = {1}, ["Cerulean Jail Cells B1F"] = {1}}
KantoMap["Cerulean Jail Storage Room"] = {["Cerulean Jail"] = {1}}
KantoMap["Cerulean Jail"] = {["Route 5"] = {1}, ["Cerulean Jail Cells"] = {1}, ["Cerulean Jail Storage Room"] = {1}}
KantoMap["Cerulean Pokémon Center"] = {["Cerulean City"] = {1}}
KantoMap["Cerulean Pokémon Mart"] = {["Cerulean City"] = {1}}
KantoMap["Cinnabar Gym"] = {["Cinnabar Island"] = {1}}
KantoMap["Cinnabar Island"] = {["Walter's House"] = {1}, ["Pokémon Lab"] = {1}, ["Cinnabar Pokémon Mart"] = {1}, ["Cinnabar Gym"] = {1}, ["Pokémon Mansion"] = {1}, ["Cinnabar Pokémon Center"] = {1}, ["Route 21_B"] = {1, {["abilities"] = {"surf"}}}, ["Route 20_B"] = {1, {["abilities"] = {"surf"}}}}
KantoMap["Cinnabar Pokémon Center"] = {["Cinnabar Island"] = {1}}
KantoMap["Cinnabar Pokémon Mart"] = {["Cinnabar Island"] = {1}}
KantoMap["Clara's House"] = {["Saffron City"] = {1}}
KantoMap["Copycat's House 2F"] = {["Copycat's House"] = {1}}
KantoMap["Copycat's House"] = {["Copycat's House 2F"] = {1}, ["Saffron City"] = {1}}
KantoMap["Daves House"] = {["Pewter City"] = {1}}
KantoMap["Diglett's Cave_A"] = {["Vermilion City"] = {1}, ["Diglett's Cave_B"] = {1}}
KantoMap["Diglett's Cave_B"] = {["Diglett's Cave_A"] = {1}, ["Diglett's Cave_C"] = {1}}
KantoMap["Diglett's Cave_C"] = {["Route 2_D"] = {1}, ["Diglett's Cave_B"] = {1}}
KantoMap["Emmy's House"] = {["Viridian City"] = {1}}
KantoMap["Fisherman's House"] = {["Vermilion City"] = {1}}
KantoMap["Fuchsia City Gate East 2F"] = {["Fuchsia City Gate East"] = {1}}
KantoMap["Fuchsia City Gate East"] = {["Route 15"] = {1}, ["Fuchsia City Gate East 2F"] = {1}, ["Fuchsia City"] = {1}}
KantoMap["Fuchsia City Gate South"] = {["Fuchsia City"] = {1}, ["Route 19"] = {1}}
KantoMap["Fuchsia City Gate West"] = {["Route 18_A"] = {1}, ["Route 18_B"] = {1}}
KantoMap["Fuchsia City House"] = {["Fuchsia City"] = {1}}
KantoMap["Fuchsia City Library"] = {["Fuchsia City"] = {1}}
KantoMap["Fuchsia City"] = {["Fuchsia City House"] = {1}, ["Move Deleter"] = {1}, ["Good Rod House"] = {1}, ["Fuchsia City Library"] = {1}, ["Fuchsia Pokémon Mart"] = {1}, ["Warden's House"] = {1}, ["Safari Gate"] = {1}, ["Route 18_A"] = {1}, ["Fuchsia Gym"] = {1}, ["Fuchsia City Gate East"] = {1}, ["Fuchsia City Gate South"] = {1}, ["Fuchsia Pokémon Center"] = {1}}
KantoMap["Fuchsia Gym"] = {["Fuchsia City"] = {1}}
KantoMap["Fuchsia Pokémon Center"] = {["Fuchsia City"] = {1}}
KantoMap["Fuchsia Pokémon Mart"] = {["Fuchsia City"] = {1}}
KantoMap["Good Rod House"] = {["Fuchsia City"] = {1}}
KantoMap["Granny And Freddy's House"] = {["Cerulean City"] = {1}}
KantoMap["Grannys House"] = {["Route 2_D"] = {1}}
KantoMap["House of Memories"] = {["Lavender Town"] = {1}, ["Pokémon Tower Shaft_I"] = {1}}
KantoMap["Josh's House"] = {["Cerulean City"] = {1}}
KantoMap["Kanto Safari Zone - East"] = {["Kanto Safari Zone"] = {1}, ["Kanto Safari Zone - North"] = {1}}
KantoMap["Kanto Safari Zone - North"] = {["Kanto Safari Zone - East"] = {1}, ["Kanto Safari Zone - West"] = {1}}
KantoMap["Kanto Safari Zone - West"] = {["Kanto Safari Zone - North"] = {1}, ["Secret House"] = {1}}
KantoMap["Kanto Safari Zone"] = {["Kanto Safari Zone - East"] = {1}, ["Safari Gate"] = {1}, ["Safari Zone - Center"] = {1}}
KantoMap["Lady Incognitia's House"] = {["Route 28_B"] = {1}}
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
KantoMap["Move Deleter"] = {["Fuchsia City"] = {1}}
KantoMap["Mr. Fuji's House"] = {["Lavender Town"] = {1}}
KantoMap["Mr. Mind's House 2F"] = {["Mr. Mind's House"] = {1}}
KantoMap["Mr. Mind's House"] = {["Mr. Mind's House 2F"] = {1}, ["Saffron City"] = {1}}
KantoMap["Mr. Psychic's House"] = {["Saffron City"] = {1}}
KantoMap["Mt. Moon B1F_A"] = {["Mt. Moon"] = {1}, ["Mt. Moon B2F_A"] = {1}}
KantoMap["Mt. Moon B1F_B"] = {["Mt. Moon"] = {1}, ["Mt. Moon B2F_B"] = {1}}
KantoMap["Mt. Moon B1F_C"] = {["Mt. Moon"] = {1}, ["Mt. Moon B2F_C"] = {1}}
KantoMap["Mt. Moon B1F_D"] = {["Mt. Moon B2F_C"] = {1}, ["Route 4_A"] = {1}}
KantoMap["Mt. Moon B2F_A"] = {["Mt. Moon B1F_A"] = {1}}
KantoMap["Mt. Moon B2F_B"] = {["Mt. Moon B1F_B"] = {1}}
KantoMap["Mt. Moon B2F_C"] = {["Mt. Moon B1F_C"] = {1}, ["Mt. Moon B1F_D"] = {1}}
KantoMap["Mt. Moon Pokémon Center"] = {["Route 3"] = {1}}
KantoMap["Mt. Moon"] = {["Route 3"] = {1}, ["Mt. Moon B1F_A"] = {1}, ["Mt. Moon B1F_B"] = {1}, ["Mt. Moon B1F_C"] = {1}}
KantoMap["Mt. Silver 1F_A"] = {["Mt. Silver"] = {1}, ["Mt. Silver Lower Mountainside"] = {1}}
KantoMap["Mt. Silver 1F_B"] = {}
KantoMap["Mt. Silver 1F_C"] = {}
KantoMap["Mt. Silver 1F_D"] = {["Mt. Silver Lower Mountainside"] = {1}, ["Mt. Silver 2F_A"] = {1}}
KantoMap["Mt. Silver 1F_E"] = {["Mt. Silver Lower Mountainside"] = {1}}
KantoMap["Mt. Silver 2F_A"] = {["Mt. Silver 1F_D"] = {1}, ["Mt. Silver Upper Mountainside_A"] = {1}}
KantoMap["Mt. Silver 2F_B"] = {["Mt. Silver Upper Mountainside_A"] = {1}}
KantoMap["Mt. Silver 2F_C"] = {["Mt. Silver Upper Mountainside_A"] = {1}, ["Mt. Silver Upper Mountainside_C"] = {1}}
KantoMap["Mt. Silver 2F_D"] = {["Mt. Silver Upper Mountainside_C"] = {1}, ["Mt. Silver Upper Mountainside_B"] = {1}}
KantoMap["Mt. Silver 3F"] = {["Mt. Silver Upper Mountainside_B"] = {1}, ["Mt. Silver Upper Mountainside_D"] = {1}}
KantoMap["Mt. Silver Lower Mountainside"] = {["Mt. Silver 1F_A"] = {1}, ["Mt. Silver 1F_E"] = {1}, ["Mt. Silver 1F_D"] = {1}}
KantoMap["Mt. Silver Pokémon Center"] = {["Mt. Silver"] = {1}}
KantoMap["Mt. Silver Upper Mountainside_A"] = {["Mt. Silver 2F_A"] = {1}, ["Mt. Silver 2F_B"] = {1}, ["Mt. Silver 2F_C"] = {1}}
KantoMap["Mt. Silver Upper Mountainside_B"] = {["Mt. Silver 2F_D"] = {1}, ["Mt. Silver 3F"] = {1}}
KantoMap["Mt. Silver Upper Mountainside_C"] = {["Mt. Silver 2F_C"] = {1}, ["Mt. Silver 2F_D"] = {1}}
KantoMap["Mt. Silver Upper Mountainside_D"] = {["Mt. Silver 3F"] = {1}}
KantoMap["Mt. Silver"] = {["Mt. Silver Pokémon Center"] = {1}, ["Route 28_A"] = {1}}
KantoMap["Oak's House 2F"] = {["Oak's House"] = {1}}
KantoMap["Oak's House"] = {["Pallet Town"] = {1}, ["Oak's House 2F"] = {1}}
KantoMap["Oak's Lab"] = {["Pallet Town"] = {1}}
KantoMap["Pallet Town"] = {["Route 21_A"] = {1, {["abilities"] = {"surf"}}}, ["Player House"] = {1}, ["Oak's House"] = {1}, ["Oak's Lab"] = {1}, ["Route 1"] = {1}}
KantoMap["Pewter City Museum"] = {["Pewter City"] = {1}}
KantoMap["Pewter City"] = {["Route 2_C"] = {1}, ["Daves House"] = {1}, ["Pewter Pokémon Center"] = {1}, ["Pewter Pokémon Mart"] = {1}, ["Babsis House"] = {1}, ["Pewter Gym"] = {1}, ["Pewter City Museum"] = {1}, ["Route 3"] = {1}}
KantoMap["Pewter Gym"] = {["Pewter City"] = {1}}
KantoMap["Pewter Pokémon Center"] = {["Pewter City"] = {1}}
KantoMap["Pewter Pokémon Mart"] = {["Pewter City"] = {1}}
KantoMap["Player House 2F"] = {["Player House"] = {1}}
KantoMap["Player House"] = {["Pallet Town"] = {1}, ["Player House 2F"] = {1}}
KantoMap["Pokémon Fan Club"] = {["Vermilion City"] = {1}}
KantoMap["Pokémon Lab Room 1"] = {["Pokémon Lab"] = {1}}
KantoMap["Pokémon Lab Room 2"] = {["Pokémon Lab"] = {1}}
KantoMap["Pokémon Lab Room 3"] = {["Pokémon Lab"] = {1}}
KantoMap["Pokémon Lab"] = {["Pokémon Lab Room 1"] = {1}, ["Pokémon Lab Room 2"] = {1}, ["Pokémon Lab Room 3"] = {1}, ["Cinnabar Island"] = {1}}
KantoMap["Pokémon League Bathroom"] = {["Pokémon League"] = {1}}
KantoMap["Pokémon League Reception"] = {["Route 22"] = {1}, ["Route 23_A"] = {1}, ["Route 28_A"] = {1}}
KantoMap["Pokémon League"] = {["Pokémon League Bathroom"] = {1}, ["Route 23_B"] = {1}}
KantoMap["Pokémon Mansion 2F_A"] = {["Pokémon Mansion"] = {1}, ["Pokémon Mansion 3F_A"] = {1}, ["Pokémon Mansion 3F_B"] = {1}}
KantoMap["Pokémon Mansion 2F_B"] = {["Pokémon Mansion 3F_A"] = {1}}
KantoMap["Pokémon Mansion 3F_A"] = {["Pokémon Mansion 2F_A"] = {1}, ["Pokémon Mansion 2F_B"] = {1}, ["Pokémon Mansion"] = {1}}
KantoMap["Pokémon Mansion 3F_B"] = {["Pokémon Mansion 2F_A"] = {1}}
KantoMap["Pokémon Mansion B1F"] = {["Pokémon Mansion"] = {1}}
KantoMap["Pokémon Mansion"] = {["Cinnabar Island"] = {1}, ["Pokémon Mansion 2F_A"] = {1}, ["Pokémon Mansion B1F"] = {1}}
KantoMap["Pokémon Tower 2F"] = {["Pokémon Tower"] = {1}, ["Pokémon Tower 3F"] = {1}}
KantoMap["Pokémon Tower 3F"] = {["Pokémon Tower 2F"] = {1}, ["Pokémon Tower 4F"] = {1}}
KantoMap["Pokémon Tower 4F"] = {["Pokémon Tower 3F"] = {1}, ["Pokémon Tower 5F"] = {1}}
KantoMap["Pokémon Tower 5F"] = {["Pokémon Tower 4F"] = {1}, ["Pokémon Tower 6F"] = {1}}
KantoMap["Pokémon Tower 6F"] = {["Pokémon Tower 5F"] = {1}, ["Pokémon Tower 7F"] = {1}}
KantoMap["Pokémon Tower 7F"] = {["Pokémon Tower 6F"] = {1}, ["Pokémon Tower Shaft_A"] = {1}}
KantoMap["Pokémon Tower Shaft_A"] = {["Pokémon Tower 7F"] = {1}, ["Pokémon Tower Shaft_B"] = {1}}
KantoMap["Pokémon Tower Shaft_B"] = {["Pokémon Tower Shaft_A"] = {1}, ["Pokémon Tower Shaft_C"] = {1}}
KantoMap["Pokémon Tower Shaft_C"] = {["Pokémon Tower Shaft_B"] = {1}, ["Pokémon Tower Shaft_D"] = {1}}
KantoMap["Pokémon Tower Shaft_D"] = {["Pokémon Tower Shaft_C"] = {1}, ["Pokémon Tower Shaft_E"] = {1}}
KantoMap["Pokémon Tower Shaft_E"] = {["Pokémon Tower Shaft_D"] = {1}, ["Pokémon Tower Shaft_F"] = {1}}
KantoMap["Pokémon Tower Shaft_F"] = {["Pokémon Tower Shaft_E"] = {1}, ["Pokémon Tower Shaft_G"] = {1}}
KantoMap["Pokémon Tower Shaft_G"] = {["Pokémon Tower Shaft_F"] = {1}, ["Pokémon Tower Shaft_H"] = {1}}
KantoMap["Pokémon Tower Shaft_H"] = {["Pokémon Tower Shaft_I"] = {1}}
KantoMap["Pokémon Tower Shaft_I"] = {["Pokémon Tower Shaft_H"] = {1}, ["House of Memories"] = {1}}
KantoMap["Pokémon Tower"] = {["Lavender Town"] = {1}, ["Pokémon Tower 2F"] = {1}}
KantoMap["Pokémon Trainer Fan Club"] = {["Saffron City"] = {1}}
KantoMap["Power Plant"] = {["Route 10_B"] = {1}}
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
KantoMap["Route 2 East House"] = {["Route 2 East"] = {1}}
KantoMap["Route 2 East"] = {["Route 2_D"] = {1}, ["Route 2 East House"] = {1}}
KantoMap["Route 2_A"] = {["Viridian City"] = {1}, ["Viridian Forest Gate South"] = {1}, ["Route 2_B"] = {.5, {["abilities"] = {"cut"}}}}
KantoMap["Route 2_B"] = {["Viridian Forest Gate East"] = {.5}, ["Route 2_A"] = {1, {["abilities"] = {"cut"}}}}
KantoMap["Route 2_C"] = {["Viridian Forest Gate North"] = {1}, ["Pewter City"] = {1}, ["Route 2_D"] = {.5, {["abilities"] = {"cut"}}}}
KantoMap["Route 2_D"] = {["Viridian Forest Gate East"] = {.5}, ["Route 2 East"] = {1}, ["Diglett's Cave_C"] = {1}, ["Grannys House"] = {1}, ["Route 2_C"] = {1, {["abilities"] = {"cut"}}}}
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
KantoMap["Route 10_A"] = {["Route 9_B"] = {1}, ["Rock Tunnel Pokémon Center"] = {1}, ["Rock Tunnel_A"] = {1}}
KantoMap["Route 10_B"] = {["Route 9_B"] = {1, {["abilities"] = {"surf"}}}, ["Power Plant"] = {1}}
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
KantoMap["Route 19"] = {["Fuchsia City Gate South"] = {1}, ["Route 20_A"] = {1, {["abilities"] = {"surf"}}}}
KantoMap["Route 20_A"] = {["Route 19"] = {1}, ["Seafoam Islands_A"] = {1}}
KantoMap["Route 20_B"] = {["Seafoam Islands_B"] = {1}, ["Cinnabar Island"] = {1}}
KantoMap["Route 21 Gate"] = {["Route 21_A"] = {1}, ["Route 21_B"] = {1}}
KantoMap["Route 21_A"] = {["Route 21 Gate"] = {1}, ["Pallet Town"] = {1}}
KantoMap["Route 21_B"] = {["Cinnabar Island"] = {1}, ["Route 21 Gate"] = {1}}
KantoMap["Route 22"] = {["Viridian City"] = {1}, ["Pokémon League Reception"] = {1}}
KantoMap["Route 23_A"] = {["Pokémon League Reception"] = {1}, ["Victory Road 1F"] = {1, {["abilities"] = {"rock smash"}}}}
KantoMap["Route 23_B"] = {["Victory Road"] = {1}, ["Pokémon League"] = {1}}
KantoMap["Route 24"] = {["Cerulean City"] = {1}, ["Route 25"] = {1}}
KantoMap["Route 25"] = {["Route 24"] = {1}, ["Sea Cottage"] = {1}}
KantoMap["Route 28_A"] = {["Mt. Silver"] = {1}, ["Route 28_B"] = {1, {["abilities"] = {"cut"}}}, ["Pokémon League Reception"] = {1}}
KantoMap["Route 28_B"] = {["Lady Incognitia's House"] = {1}, ["Route 28_A"] = {1}}
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
KantoMap["Safari Zone - Center"] = {["Kanto Safari Zone"] = {1}}
KantoMap["Saffron City Gate East"] = {["Route 8_A"] = {1}, ["Saffron City"] = {1}}
KantoMap["Saffron City Gate North"] = {["Route 5"] = {1}, ["Saffron City"] = {1}}
KantoMap["Saffron City Gate South"] = {["Route 6"] = {1}, ["Saffron City"] = {1}}
KantoMap["Saffron City Gate West"] = {["Route 7"] = {1}, ["Saffron City"] = {1}}
KantoMap["Saffron City"] = {["Silph Co."] = {1}, ["Saffron Pokémon Mart"] = {1}, ["Mr. Mind's House"] = {1}, ["Mr. Psychic's House"] = {1}, ["Pokémon Trainer Fan Club"] = {1}, ["Copycat's House"] = {1}, ["Clara's House"] = {1}, ["Saffron Railway Station"] = {1}, ["Saffron Pokémon Center"] = {1}, ["Saffron Fighting Dojo"] = {1}, ["Saffron Gym_H"] = {1}, ["Saffron City Gate North"] = {1}, ["Saffron City Gate East"] = {1}, ["Saffron City Gate South"] = {1}, ["Saffron City Gate West"] = {1}}
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
KantoMap["Saffron Pokémon Mart"] = {["Saffron City"] = {1}}
KantoMap["Saffron Railway Station"] = {["Saffron City"] = {1}}
KantoMap["Sea Cottage"] = {["Route 25"] = {1}}
KantoMap["Seafoam Gym"] = {["Seafoam Islands_B"] = {1}}
KantoMap["Seafoam Islands B1F"] = {["Seafoam Islands_A"] = {1}, ["Seafoam Islands B2F_B"] = {1}, ["Seafoam Islands B2F_C"] = {1}, ["Seafoam Islands B2F_D"] = {1}, ["Seafoam Islands B2F_A"] = {1}}
KantoMap["Seafoam Islands B2F_A"] = {["Seafoam Islands B1F"] = {1}, ["Seafoam Islands B3F_B"] = {1}, ["Seafoam Islands B3F_C"] = {1}, ["Seafoam Islands B3F_D"] = {1}}
KantoMap["Seafoam Islands B2F_B"] = {["Seafoam Islands B1F"] = {1}, ["Seafoam Islands B3F_A"] = {1}}
KantoMap["Seafoam Islands B2F_C"] = {["Seafoam Islands B1F"] = {1}, ["Seafoam Islands B2F_D"] = {1}}
KantoMap["Seafoam Islands B2F_D"] = {["Seafoam Islands B1F"] = {1}}
KantoMap["Seafoam Islands B3F_A"] = {["Seafoam Islands B4F_A"] = {1}, ["Seafoam Islands B2F_B"] = {1}}
KantoMap["Seafoam Islands B3F_B"] = {["Seafoam Islands B4F_C"] = {1}, ["Seafoam Islands B4F_D"] = {1}, ["Seafoam Islands B2F_A"] = {1}, ["Seafoam Islands B4F_B"] = {1}}
KantoMap["Seafoam Islands B3F_C"] = {["Seafoam Islands B2F_A"] = {1}, ["Seafoam Islands B4F_C"] = {1}}
KantoMap["Seafoam Islands B3F_D"] = {["Seafoam Islands B4F_A"] = {1}, ["Seafoam Islands B2F_A"] = {1}}
KantoMap["Seafoam Islands B4F_A"] = {["Seafoam Islands B3F_A"] = {1}, ["Seafoam Islands B3F_D"] = {1}}
KantoMap["Seafoam Islands B4F_B"] = {["Seafoam Islands B3F_B"] = {1}}
KantoMap["Seafoam Islands B4F_C"] = {["Seafoam Islands B3F_B"] = {1}, ["Seafoam Islands B3F_C"] = {1}}
KantoMap["Seafoam Islands B4F_D"] = {["Seafoam Islands B3F_B"] = {1}}
KantoMap["Seafoam Islands_A"] = {["Route 20_A"] = {1}, ["Seafoam Islands B1F"] = {1, {["abilities"] = {"rock smash"}}}}
KantoMap["Seafoam Islands_B"] = {["Seafoam Gym"] = {1}, ["Seafoam Islands B1F"] = {1}, ["Route 20_B"] = {1}}
KantoMap["Secret House"] = {["Kanto Safari Zone - West"] = {1}}
KantoMap["Silph Co. 2F Elevator"] = {["Silph Co. 2F"] = {1}, ["Silph Co. Elevator"] = {1}, ["Silph Co. 3F Elevator"] = {1}, ["Silph Co. 4F Elevator"] = {1}, ["Silph Co. 5F Elevator"] = {1}, ["Silph Co. 6F Elevator"] = {1}, ["Silph Co. 7F Elevator"] = {1}, ["Silph Co. 8F Elevator"] = {1}, ["Silph Co. 9F Elevator"] = {1}, ["Silph Co. 10F Elevator"] = {1}, ["Silph Co. 11F Elevator"] = {1}}
KantoMap["Silph Co. 2F"] = {["Silph Co."] = {1}, ["Silph Co. 3F"] = {1}, ["Silph Co. 2F Elevator"] = {1}}
KantoMap["Silph Co. 3F Elevator"] = {["Silph Co. 3F"] = {1}, ["Silph Co. Elevator"] = {1}, ["Silph Co. 2F Elevator"] = {1}, ["Silph Co. 4F Elevator"] = {1}, ["Silph Co. 5F Elevator"] = {1}, ["Silph Co. 6F Elevator"] = {1}, ["Silph Co. 7F Elevator"] = {1}, ["Silph Co. 8F Elevator"] = {1}, ["Silph Co. 9F Elevator"] = {1}, ["Silph Co. 10F Elevator"] = {1}, ["Silph Co. 11F Elevator"] = {1}}
KantoMap["Silph Co. 3F"] = {["Silph Co. 7F_B"] = {1}, ["Silph Co. 2F"] = {1}, ["Silph Co. 4F"] = {1}, ["Silph Co. 3F Elevator"] = {1}}
KantoMap["Silph Co. 4F Elevator"] = {["Silph Co. 4F"] = {1}, ["Silph Co. Elevator"] = {1}, ["Silph Co. 2F Elevator"] = {1}, ["Silph Co. 3F Elevator"] = {1}, ["Silph Co. 5F Elevator"] = {1}, ["Silph Co. 6F Elevator"] = {1}, ["Silph Co. 7F Elevator"] = {1}, ["Silph Co. 8F Elevator"] = {1}, ["Silph Co. 9F Elevator"] = {1}, ["Silph Co. 10F Elevator"] = {1}, ["Silph Co. 11F Elevator"] = {1}}
KantoMap["Silph Co. 4F"] = {["Silph Co. 3F"] = {1}, ["Silph Co. 5F"] = {1}, ["Silph Co. 4F Elevator"] = {1}}
KantoMap["Silph Co. 5F Elevator"] = {["Silph Co. 5F"] = {1}, ["Silph Co. Elevator"] = {1}, ["Silph Co. 2F Elevator"] = {1}, ["Silph Co. 3F Elevator"] = {1}, ["Silph Co. 4F Elevator"] = {1}, ["Silph Co. 6F Elevator"] = {1}, ["Silph Co. 7F Elevator"] = {1}, ["Silph Co. 8F Elevator"] = {1}, ["Silph Co. 9F Elevator"] = {1}, ["Silph Co. 10F Elevator"] = {1}, ["Silph Co. 11F Elevator"] = {1}}
KantoMap["Silph Co. 5F"] = {["Silph Co. 4F"] = {1}, ["Silph Co. 6F"] = {1}, ["Silph Co. 5F Elevator"] = {1}}
KantoMap["Silph Co. 6F Elevator"] = {["Silph Co. 6F"] = {1}, ["Silph Co. Elevator"] = {1}, ["Silph Co. 2F Elevator"] = {1}, ["Silph Co. 3F Elevator"] = {1}, ["Silph Co. 4F Elevator"] = {1}, ["Silph Co. 5F Elevator"] = {1}, ["Silph Co. 7F Elevator"] = {1}, ["Silph Co. 8F Elevator"] = {1}, ["Silph Co. 9F Elevator"] = {1}, ["Silph Co. 10F Elevator"] = {1}, ["Silph Co. 11F Elevator"] = {1}}
KantoMap["Silph Co. 6F"] = {["Silph Co. 5F"] = {1}, ["Silph Co. 7F_A"] = {1}, ["Silph Co. 6F Elevator"] = {1}}
KantoMap["Silph Co. 7F Elevator"] = {["Silph Co. 7F_A"] = {1}, ["Silph Co. Elevator"] = {1}, ["Silph Co. 2F Elevator"] = {1}, ["Silph Co. 3F Elevator"] = {1}, ["Silph Co. 4F Elevator"] = {1}, ["Silph Co. 5F Elevator"] = {1}, ["Silph Co. 6F Elevator"] = {1}, ["Silph Co. 8F Elevator"] = {1}, ["Silph Co. 9F Elevator"] = {1}, ["Silph Co. 10F Elevator"] = {1}, ["Silph Co. 11F Elevator"] = {1}}
KantoMap["Silph Co. 7F_A"] = {["Silph Co. 6F"] = {1}, ["Silph Co. 8F"] = {1}, ["Silph Co. 7F Elevator"] = {1}}
KantoMap["Silph Co. 7F_B"] = {["Silph Co. 3F"] = {1}, ["Silph Co. 11F_B"] = {1}}
KantoMap["Silph Co. 8F Elevator"] = {["Silph Co. 8F"] = {1}, ["Silph Co. Elevator"] = {1}, ["Silph Co. 2F Elevator"] = {1}, ["Silph Co. 3F Elevator"] = {1}, ["Silph Co. 4F Elevator"] = {1}, ["Silph Co. 5F Elevator"] = {1}, ["Silph Co. 6F Elevator"] = {1}, ["Silph Co. 7F Elevator"] = {1}, ["Silph Co. 9F Elevator"] = {1}, ["Silph Co. 10F Elevator"] = {1}, ["Silph Co. 11F Elevator"] = {1}}
KantoMap["Silph Co. 8F"] = {["Silph Co. 7F_A"] = {1}, ["Silph Co. 9F"] = {1}, ["Silph Co. 8F Elevator"] = {1}}
KantoMap["Silph Co. 9F Elevator"] = {["Silph Co. 9F"] = {1}, ["Silph Co. Elevator"] = {1}, ["Silph Co. 2F Elevator"] = {1}, ["Silph Co. 3F Elevator"] = {1}, ["Silph Co. 4F Elevator"] = {1}, ["Silph Co. 5F Elevator"] = {1}, ["Silph Co. 6F Elevator"] = {1}, ["Silph Co. 7F Elevator"] = {1}, ["Silph Co. 8F Elevator"] = {1}, ["Silph Co. 10F Elevator"] = {1}, ["Silph Co. 11F Elevator"] = {1}}
KantoMap["Silph Co. 9F"] = {["Silph Co. 8F"] = {1}, ["Silph Co. 10F"] = {1}, ["Silph Co. 9F Elevator"] = {1}}
KantoMap["Silph Co. 10F Elevator"] = {["Silph Co. 10F"] = {1}, ["Silph Co. Elevator"] = {1}, ["Silph Co. 2F Elevator"] = {1}, ["Silph Co. 3F Elevator"] = {1}, ["Silph Co. 4F Elevator"] = {1}, ["Silph Co. 5F Elevator"] = {1}, ["Silph Co. 6F Elevator"] = {1}, ["Silph Co. 7F Elevator"] = {1}, ["Silph Co. 8F Elevator"] = {1}, ["Silph Co. 9F Elevator"] = {1}, ["Silph Co. 11F Elevator"] = {1}}
KantoMap["Silph Co. 10F"] = {["Silph Co. 9F"] = {1}, ["Silph Co. 11F_A"] = {1}, ["Silph Co. 10F Elevator"] = {1}}
KantoMap["Silph Co. 11F Elevator"] = {["Silph Co. 11F_A"] = {1}, ["Silph Co. Elevator"] = {1}, ["Silph Co. 2F Elevator"] = {1}, ["Silph Co. 3F Elevator"] = {1}, ["Silph Co. 4F Elevator"] = {1}, ["Silph Co. 5F Elevator"] = {1}, ["Silph Co. 6F Elevator"] = {1}, ["Silph Co. 7F Elevator"] = {1}, ["Silph Co. 8F Elevator"] = {1}, ["Silph Co. 9F Elevator"] = {1}, ["Silph Co. 10F Elevator"] = {1}}
KantoMap["Silph Co. 11F_A"] = {["Silph Co. 10F"] = {1}, ["Silph Co. 11F Elevator"] = {1}}
KantoMap["Silph Co. 11F_B"] = {["Silph Co. 7F_B"] = {1}}
KantoMap["Silph Co. Elevator"] = {["Silph Co."] = {1}, ["Silph Co. 2F Elevator"] = {1}, ["Silph Co. 3F Elevator"] = {1}, ["Silph Co. 4F Elevator"] = {1}, ["Silph Co. 5F Elevator"] = {1}, ["Silph Co. 6F Elevator"] = {1}, ["Silph Co. 7F Elevator"] = {1}, ["Silph Co. 8F Elevator"] = {1}, ["Silph Co. 9F Elevator"] = {1}, ["Silph Co. 10F Elevator"] = {1}, ["Silph Co. 11F Elevator"] = {1}}
KantoMap["Silph Co."] = {["Saffron City"] = {1}, ["Silph Co. 2F"] = {1}, ["Silph Co. Elevator"] = {1}}
KantoMap["Surface House 2F"] = {["Surface House"] = {1}}
KantoMap["Surface House"] = {["Celadon City"] = {1}, ["Surface House 2F"] = {1}}
KantoMap["Tamara's House"] = {["Cerulean City"] = {1}}
KantoMap["Team Rocket House 2F"] = {["Team Rocket House"] = {1}}
KantoMap["Team Rocket House"] = {["Celadon City"] = {1}, ["Team Rocket House 2F"] = {1}}
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
KantoMap["Victory Road 1F"] = {["Victory Road 2F_A"] = {1}, ["Route 23_A"] = {1}}
KantoMap["Victory Road 2F_A"] = {["Victory Road 1F"] = {1}, ["Victory Road 3F_A"] = {1}, ["Victory Road 3F_D"] = {1}, ["Victory Road 2F_B"] = {1}}
KantoMap["Victory Road 2F_B"] = {["Victory Road 3F_C"] = {1}}
KantoMap["Victory Road 2F_C"] = {["Victory Road 2F_D"] = {1}}
KantoMap["Victory Road 2F_D"] = {["Victory Road 3F_B"] = {1}}
KantoMap["Victory Road 3F_A"] = {["Victory Road 2F_A"] = {1}, ["Victory Road 3F_B"] = {1}}
KantoMap["Victory Road 3F_B"] = {["Victory Road"] = {1}, ["Victory Road 2F_D"] = {1}, ["Victory Road 2F_A"] = {1}}
KantoMap["Victory Road 3F_C"] = {["Victory Road 2F_B"] = {1}, ["Victory Road 2F_B"] = {1}, ["Victory Road 2F_D"] = {1}, ["Victory Road 2F_C"] = {1}}
KantoMap["Victory Road 3F_D"] = {["Victory Road 2F_A"] = {1}, ["Victory Road 2F_B"] = {1}}
KantoMap["Victory Road"] = {["Victory Road 3F_B"] = {1}, ["Route 23_B"] = {1, {["abilities"] = {"rock smash"}}}}
KantoMap["Viridian City"] = {["Route 2_A"] = {1}, ["Route 1"] = {1}, ["Route 22"] = {1}, ["Viridian Pokémon Center"] = {1}, ["Viridian Pokémon Mart"] = {1}, ["Emmy's House"] = {1}, ["Trainers School"] = {1}, ["Viridian Gym"] = {1}}
KantoMap["Viridian Forest Gate East"] = {["Route 2_B"] = {1}, ["Route 2_D"] = {1}}
KantoMap["Viridian Forest Gate North"] = {["Route 2_C"] = {1}, ["Viridian Forest"] = {1}}
KantoMap["Viridian Forest Gate South"] = {["Route 2_A"] = {1}, ["Viridian Forest"] = {1}}
KantoMap["Viridian Forest"] = {["Viridian Forest Gate South"] = {1}, ["Viridian Forest Gate North"] = {1}}
KantoMap["Viridian Gym 2F"] = {["Viridian Gym"] = {1} }
KantoMap["Viridian Gym"] = {["Viridian City"] = {1}, ["Viridian Gym 2F"] = {1}}
KantoMap["Viridian Pokémon Center"] = {["Viridian City"] = {1}}
KantoMap["Viridian Pokémon Mart"] = {["Viridian City"] = {1}}
KantoMap["Walter's House"] = {["Cinnabar Island"] = {1}}
KantoMap["Warden's House"] = {["Fuchsia City"] = {1}}

--KantoMap["node"] = {["link"] = {distance, {["restrictionType"] = {"restriction"}}}}

return KantoMap
end
