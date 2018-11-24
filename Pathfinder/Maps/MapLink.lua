local mapLink = {}

--PALLET/VIRIDIAN/1/2/21/22
mapLink["Pallet Town"] = {["Route 1"] = {{151, 172, 153, 172}}, ["Player House"] = {{145, 184}}, ["Oak's House"] = {{157, 183}}, ["Oak's Lab"] = {{158, 192}}}
mapLink["Player House"] = {["Pallet Town"] = {{12, 13, 13, 13}}, ["Player House 2F"] = {{19, 6, 19, 7}}}
mapLink["Player House 2F"] = {["Player House"] = {{73, 7, 73, 7}}}
mapLink["Oak's House"] = {["Pallet Town"] = {{12, 60}}, ["Oak's House 2F"] = {{7, 52, 7, 53}}}
mapLink["Oak's House 2F"] = {["Oak's House"] = {{65, 52, 65, 53}}}
mapLink["Oak's Lab"] = {["Pallet Town"] = {{22, 108}}}
mapLink["Route 1"] = {["Pallet Town"] = {{151, 173, 153, 173}}, ["Viridian City"] = {{148, 103, 150, 103}}}
mapLink["Viridian City"] = {
	["Route 1"] = {{148, 104, 150, 104}},
	["Viridian Pokémon Center"] = {{146, 91}},
	["Emmy's House"] = {{148, 81}},
	["Viridian Pokémon Mart"] = {{156, 81}},
	["Trainers School"] = {{148, 72}},
	["Viridian Gym"] = {{159, 68}},
	["Route 22"] = {{104, 87, 104, 89}},
	["Route 2_South West"] = {{138, 50, 141, 50}}
}
mapLink["Viridian Pokémon Center"] = {
	["Viridian City"] = {{9, 129}}
}
mapLink["Viridian Pokémon Mart"] = {
	["Viridian City"] = {{13, 78}}
}
mapLink["Emmy's House"] = {
	["Viridian City"] = {{117, 79}}
}
mapLink["Trainers School B1F"] = {
	["Trainers School"] = {{65, 8, 65, 9}}
}
mapLink["Trainers School"] = {
	["Viridian City"] = {{14, 21}},
	["Trainers School B1F"] = {{18, 8, 18, 9}}
}
mapLink["Viridian Gym"] = {
	["Viridian City"] = {{144, 24}},
	["Viridian Gym 2F"] = {{129, 2}},
}
mapLink["Viridian Gym 2F"] = {
	["Viridian Gym"] = {{171, 99}},
}
mapLink["Route 22"] = {
	["Viridian City"] = {{105, 87, 105, 89}},
	["Pokémon League Reception"] = {{39, 87, 39, 89}}
}
mapLink["Pokémon League Reception"] = {
	["Route 22"] = {{43, 22}},
}
mapLink["Route 2_South West"] = {
	["Viridian City"] = {{138, 51, 141, 51}},
	["Viridian Forest Gate_South"] = {{146, 19, 148, 19}},
	["Route 2_South East"] = {{153, 30, 153, 30}, {153, 41, 153, 41}}
}
mapLink["Route 2_South East"] = {
	["Route 2_South West"] = {{152, 30, 152, 30}, {152, 41, 152, 41}},
	["Viridian Forest Gate_East"] = {{162, 16, 163, 16}}
}
--VIRIDIAN GATES
mapLink["Viridian Forest Gate_South"] = {
	["Route 2_South West"] = {{8, 49}},
	["Viridian Forest"] = {{8, 36}}
}
mapLink["Viridian Forest Gate_East"] = {
	["Route 2_South East"] = {{51, 49}},
	["Route 2_North East"] = {{51, 36}},
}
mapLink["Viridian Forest Gate_North"] = {
	["Route 2_North West"] = {{8, 3}},
	["Viridian Forest"] = {{8, 16}}
}
--VIRIDIAN FOREST
mapLink["Viridian Forest"] = {
	["Viridian Forest Gate_South"] = {{38, 86, 40, 86}},
	["Viridian Forest Gate_North"] = {{11, 16, 12, 16}},
}
--PEWTER/2/3
mapLink["Route 2_North East"] = {
	["Viridian Forest Gate_East"] = {{31, 143, 32, 143}},
	["Diglett's Cave_C"] = {{34, 92}},
	["Grannys House"] = {{29, 113}},
	["Route 2 East"] = {{46, 100, 46, 101}},
	["Route 2_North West"] = {{20, 86, 21, 86}}
}
mapLink["Route 2_North West"] = {
	["Viridian Forest Gate_North"] = {{7, 91, 9, 91}},
	["Route 2_North East"] = {{20, 87, 21, 87}},
	["Pewter City"] = {{20, 61, 21, 61}}
}
mapLink["Grannys House"] = {
	["Route 2_North East"] = {{85, 66}},
}
mapLink["Route 2 East"] = {
	["Route 2_North East"] = {{45, 100, 45, 101}, {46, 131, 46, 131}},
	["Route 2 East House"] = {{73, 83}}
}
mapLink["Route 2 East House"] = {
	["Route 2 East"] = {{131, 72}}
}
mapLink["Pewter City"] = {
	["Pewter Pokémon Center"] = {{35, 48}},
	["Pewter Pokémon Mart"] = {{52, 39}},
	["Babsis House"] = {{54, 25}},
	["Pewter Gym"] = {{30, 26}},
	["Pewter City Museum"] = {{30, 11}},
	["Daves House"] = {{21, 54}},
	["Route 2_North West"] = {{20, 62, 21, 62}},
	["Route 3"] = {{86, 45, 86, 49}}
}
mapLink["Daves House"] = {
	["Pewter City"] = {{72, 17}}
}
mapLink["Pewter Pokémon Center"] = {
	["Pewter City"] = {{68, 117, 69, 117}}
}
mapLink["Pewter Pokémon Mart"] = {
	["Pewter City"] = {{14, 22, 15, 22}}
}
mapLink["Babsis House"] = {
	["Pewter City"] = {{119, 23, 120, 23}}
}
mapLink["Pewter City Museum"] = {
	["Pewter City"] = {{12, 60}}
}
mapLink["Pewter Gym"] = {
	["Pewter City"] = {{15, 116}}
}
mapLink["Route 3"] = {
	["Pewter City"] = {{85, 45, 85, 49}},
	["Mt. Moon Pokémon Center"] = {{178, 48}},
	["Mt. Moon"] = {{188, 47}}
}
mapLink["Mt. Moon Pokémon Center"] = {
	["Route 3"] = {{9, 25, 10, 25}}
}
--MT MOON
mapLink["Mt. Moon"] = {
	["Route 3"] = {{105, 49}},
	["Mt. Moon B1F_A"] = {{118, 27}},
	["Mt. Moon B1F_B"] = {{107, 25}},
	["Mt. Moon B1F_C"] = {{95, 16}}
}
mapLink["Mt. Moon B1F_A"] = {
	["Mt. Moon"] = {{90, 169}},
	["Mt. Moon B2F_A"] = {{73, 184}}
}
mapLink["Mt. Moon B2F_A"] = {
	["Mt. Moon B1F_A"] = {{27, 97}}
}
mapLink["Mt. Moon B1F_B"] = {
	["Mt. Moon"] = {{61, 132}},
	["Mt. Moon B2F_B"] = {{51, 136}}
}
mapLink["Mt. Moon B2F_B"] = {
	["Mt. Moon B1F_B"] = {{39, 74}}
}
mapLink["Mt. Moon B1F_C"] = {
	["Mt. Moon"] = {{6, 130}},
	["Mt. Moon B2F_C"] = {{21, 145}}
}
mapLink["Mt. Moon B2F_C"] = {
	["Mt. Moon B1F_C"] = {{35, 86}},
	["Mt. Moon B1F_D"] = {{11, 75}}
}
mapLink["Mt. Moon B1F_D"] = {
	["Mt. Moon B2F_C"] = {{26, 213}},
	["Route 4_A"] = {{36, 219}}
}
--CERULEAN/4/5/9/10/24/25
mapLink["Route 4_A"] = {
	["Mt. Moon B1F_D"] = {{27, 83}},
	["Route 4_B"] = {{101, 100, 105, 100}, {108, 104, 109, 104}, {112, 100, 114, 100}}
}
mapLink["Route 4_B"] = {
	["Cerulean City"] = {{123, 99, 123, 101}}
}
mapLink["Cerulean City"] = {
	["Route 4_B"] = {{122, 99, 122, 101}},
	["Route 24"] = {{181, 73, 184, 73}},
	["Tamara's House"] = {{150, 95}},
	["April And May's House"] = {{158, 95}},
	["Josh's House"] = {{174, 103}},
	["Lola's House"] = {{190, 97}},
	["Granny And Freddy's House"] = {{153, 112}},
	["Cerulean Pokémon Center"] = {{162, 114}},
	["Cerulean Pokémon Mart"] = {{166, 133}},
	["Cerulean Gym"] = {{177, 114}},
	["Martha And Martin's House"] = {{170, 127}},
	["Cerulean Bike Shop"] = {{148, 121}},
	["Route 5"] = {{138, 139, 158, 139}, {186, 139, 189, 139}},
	["Route 9_A"] = {{205, 105, 205, 108}}
}
mapLink["Tamara's House"] = {
	["Cerulean City"] = {{21, 48, 22, 48}}
}
mapLink["April And May's House"] = {
	["Cerulean City"] = {{57, 54}}
}
mapLink["Josh's House"] = {
	["Cerulean City"] = {{96, 51, 97, 51}}
}
mapLink["Granny And Freddy's House"] = {
	["Cerulean City"] = {{20, 78}}
}
mapLink["Cerulean Pokémon Center"] = {
	["Cerulean City"] = {{60, 26, 61, 26}}
}
mapLink["Cerulean Pokémon Mart"] = {
	["Cerulean City"] = {{20, 17, 21, 17}}
}
mapLink["Cerulean Gym"] = {
	["Cerulean City"] = {{50, 136, 52, 136}}
}
mapLink["Lola's House"] = {
	["Cerulean City"] = {{95, 12}}
}
mapLink["Martha And Martin's House"] = {
	["Cerulean City"] = {{57, 81}}
}
mapLink["Cerulean Bike Shop"] = {
	["Cerulean City"] = {{97, 81}}
}
mapLink["Route 5"] = {
	["Cerulean City"] = {{138, 138, 157, 138}, {186, 138, 189, 138}},
	["Cerulean Jail"] = {{147, 161}},
	["Underground Path_A"] = {{157, 189}},
	["Saffron City Gate North"] = {{148, 196, 149, 196}}
}
mapLink["Cerulean Jail"] = {
	["Route 5"] = {{95, 118}},
	["Cerulean Jail Cells"] = {{102, 106, 102, 107}},
	["Cerulean Jail Storage Room"] = {{95, 105}}
}
mapLink["Cerulean Jail Cells"] = {
	["Cerulean Jail"] = {{3, 118, 3, 119}},
	["Cerulean Jail Cells B1F"] = {{19, 118, 19, 119}}
}
mapLink["Cerulean Jail Cells B1F"] = {
	["Cerulean Jail Cells"] = {{4, 171, 4, 172}}
}
mapLink["Cerulean Jail Storage Room"] = {
	["Cerulean Jail"] = {{56, 168}},
}
mapLink["Route 24"] = {
	["Cerulean City"] = {{181, 74, 184, 74}, {191, 74, 192, 74}},
	["Route 25"] = {{198, 22, 198, 26}, {198, 29, 198, 29}}
}
mapLink["Route 25"] = {
	["Route 24"] = {{197, 22, 197, 26}, {197, 29, 197, 33}},
	["Sea Cottage"] = {{284, 15}},
}
mapLink["Sea Cottage"] = {
	["Route 25"] = {{11, 14}}
}
mapLink["Underground Path_A"] = {
	["Route 5"] = {{8, 9}},
	["Underground Path_B"] = {{11, 5}}
}
mapLink["Underground Path_B"] = {
	["Underground Path_A"] = {{7, 27, 7, 28}},
	["Underground Path_C"] = {{7, 67, 7, 68}}
}
mapLink["Underground Path_C"] = {
	["Underground Path_B"] = {{11, 83}},
	["Route 6"] = {{8, 87}}
}
mapLink["Route 9_A"] = {
	["Cerulean City"] = {{204, 105, 204, 108}},
	["Route 9_B"] = {{211, 109, 212, 109}}
}
mapLink["Route 9_B"] = {
	["Route 9_A"] = {{211, 108, 212, 108}},
	["Route 10_A"] = {{315, 152, 319, 152}},
	["Route 10_B"] = {{325, 152, 329, 152}}
}
mapLink["Route 10_A"] = {
	["Route 9_B"] = {{315, 151, 319, 151}},
	["Rock Tunnel Pokémon Center"] = {{308, 161}},
	["Rock Tunnel_A"] = {{301, 157}}
}
mapLink["Route 10_B"] = {
	["Route 9_B"] = {{325, 151, 329, 151}}
}
mapLink["Rock Tunnel Pokémon Center"] = {
	["Route 10_A"] = {{17, 33, 18, 33}}
}
--VERMILION/6/11
mapLink["Route 6"] = {
	["Underground Path_C"] = {{127, 27}},
	["Vermilion City"] = {{120, 85, 123, 85}},
	["Saffron City Gate South"] = {{117, 12, 119, 12}}
}
mapLink["Vermilion City"] = {
	["Vermilion City_B"] = {{115, 140}},
	["Route 6"] = {{120, 84, 123, 84}},
	["Route 11"] = {{175, 135, 175, 138}},
	["Vermilion Pokémon Center"] = {{107, 105}},
	["Vermilion Pokémon Mart"] = {{135, 126}},
	["Fisherman's House"] = {{99, 103}},
	["Lars House"] = {{114, 103}},
	["Mac's House"] = {{110, 126}},
	["Pokémon Fan Club"] = {{96, 129}},
	["Vacant House"] = {{130, 110}},
	["Mona's House"] = {{135, 107}},
	["Mary And Jane's House"] = {{145, 86}},
	["Vacant House 2"] = {{155, 86}},	
	["Diglett's Cave_A"] = {{167, 132}}
}
mapLink["Vermilion Gym"] = {
	["Vermilion City_B"] = {{87, 90}}
}
mapLink["Vermilion Pokémon Center"] = {
	["Vermilion City"] = {{140, 98, 141, 98}}
}
mapLink["Vermilion Pokémon Mart"] = {
	["Vermilion City"] = {{9, 17, 10, 17}}
}
mapLink["Fisherman's House"] = {
	["Vermilion City"] = {{9, 45}}
}
mapLink["Lars House"] = {
	["Vermilion City"] = {{46, 51}}
}
mapLink["Mac's House"] = {
	["Vermilion City"] = {{46, 76}}
}
mapLink["Pokémon Fan Club"] = {
	["Vermilion City"] = {{11, 70}}
}
mapLink["Mona's House"] = {
	["Vermilion City"] = {{118, 44}}
}
mapLink["Mary And Jane's House"] = {
	["Vermilion City"] = {{85, 12}}
}
mapLink["Vacant House 2"] = {
	["Vermilion City"] = {{119, 11}}
}
mapLink["Vermilion City_B"] = {
	["Vermilion Gym"] = {{107, 142}},
	["Vermilion City"] = {{115, 139}}
}
mapLink["Vacant House"] = {
	["Vermilion City"] = {{84, 47}},
	["Vacant House 2F"] = {{83, 39}}
}
mapLink["Vacant House 2F"] = {
	["Vacant House"] = {{148, 45}}
}
mapLink["Diglett's Cave_A"] = {
	["Vermilion City"] = {{41, 95}},
	["Diglett's Cave_B"] = {{48, 91}}
}
mapLink["Diglett's Cave_B"] = {
	["Diglett's Cave_A"] = {{42, 58}},
	["Diglett's Cave_C"] = {{15, 9}}
}
mapLink["Diglett's Cave_C"] = {
	["Route 2_North East"] = {{8, 94}},
	["Diglett's Cave_B"] = {{13, 88}}
}
mapLink["Route 11"] = {
	["Vermilion City"] = {{174, 135, 174, 137}}
}
mapLink["S.S. Anne"] = {
	["Vermilion City"] = {{110, 370}},
	["S.S. Anne B1F"] = {{129, 396, 129, 397}},
	["S.S. Anne Room 1"] = {{124, 387, 126, 387}},--far right room
	["S.S. Anne Room 2"] = {{119, 387, 121, 387}},
	["S.S. Anne Room 3"] = {{114, 387, 116, 387}},
	["S.S. Anne Room 4"] = {{109, 387, 111, 387}},--middle room
	["S.S. Anne Room 5"] = {{104, 387, 106, 387}},
	["S.S. Anne Room 6"] = {{99, 387, 101, 387}},
	["S.S. Anne Room 7"] = {{94, 387, 96, 387}},--far left room
	["S.S. Anne Kitchen"] = {{88, 399, 90, 399}},
	["S.S. Anne 2F"] = {{88, 382, 88, 384}}
}
mapLink["S.S. Anne Room 1"] = {
	["S.S. Anne"] = {{104, 173}}
}
mapLink["S.S. Anne Room 2"] = {
	["S.S. Anne"] = {{61, 175}}
}
mapLink["S.S. Anne Room 3"] = {
	["S.S. Anne"] = {{17, 174}}
}
mapLink["S.S. Anne Room 4"] = {
	["S.S. Anne"] = {{104, 128}}
}
mapLink["S.S. Anne Room 5"] = {
	["S.S. Anne"] = {{62, 129}}
}
mapLink["S.S. Anne Room 6"] = {
	["S.S. Anne"] = {{16, 124}}
}
mapLink["S.S. Anne Room 7"] = {
	["S.S. Anne"] = {{104, 82}}
}
mapLink["S.S. Anne Kitchen"] = {
	["S.S. Anne"] = {{83, 214}}
}
mapLink["S.S. Anne 2F"] = {
	["S.S. Anne"] = {{15, 335, 15, 336}},
	["S.S. Anne 2F Room 1"] = {{19, 344}},
	["S.S. Anne 2F Room 2"] = {{23, 344}},
	["S.S. Anne 2F Room 3"] = {{27, 344}},
	["S.S. Anne 2F Room 4"] = {{31, 344}},
	["S.S. Anne 2F Room 5"] = {{35, 344}},
	["S.S. Anne 2F Room 6"] = {{39, 344}},
	["S.S. Anne 3F"] = {{13, 345, 13, 347}},
	["S.S. Anne Captains Room"] = {{47, 333, 47, 335}}
}
mapLink["S.S. Anne 2F Room 1"] = {
	["S.S. Anne 2F"] = {{19, 272, 21, 272}}
}
mapLink["S.S. Anne 2F Room 2"] = {
	["S.S. Anne 2F"] = {{63, 273, 65, 273}}
}
mapLink["S.S. Anne 2F Room 3"] = {
	["S.S. Anne 2F"] = {{104, 273, 106, 273}}
}
mapLink["S.S. Anne 2F Room 4"] = {
	["S.S. Anne 2F"] = {{21, 311, 23, 311}}
}
mapLink["S.S. Anne 2F Room 5"] = {
	["S.S. Anne 2F"] = {{87, 308, 89, 308}}
}
mapLink["S.S. Anne 2F Room 6"] = {
	["S.S. Anne 2F"] = {{130, 312, 132, 312}}
}
mapLink["S.S. Anne 3F"] = {
	["S.S. Anne 2F"] = {{132, 339, 132, 343}}
}
mapLink["S.S. Anne Captains Room"] = {
	["S.S. Anne 2F"] = {{13, 385, 13, 387}}
}
mapLink["S.S. Anne B1F"] = {
	["S.S. Anne"] = {{35, 4, 35, 5}},
	["S.S. Anne B1F Room 1"] = {{31, 2}},
	["S.S. Anne B1F Room 2"] = {{27, 2}},
	["S.S. Anne B1F Room 3"] = {{23, 2}},
	["S.S. Anne B1F Room 4"] = {{19, 2}},
	["S.S. Anne B1F Room 5"] = {{15, 2}}
}
mapLink["S.S. Anne B1F Room 1"] = {
	["S.S. Anne B1F"] = {{65, 97, 67, 97}}
}
mapLink["S.S. Anne B1F Room 2"] = {
	["S.S. Anne B1F"] = {{19, 98, 21, 98}}
}
mapLink["S.S. Anne B1F Room 3"] = {
	["S.S. Anne B1F"] = {{105, 46, 107, 46}}
}
mapLink["S.S. Anne B1F Room 4"] = {
	["S.S. Anne B1F"] = {{63, 47, 66, 47}}
}
mapLink["S.S. Anne B1F Room 5"] = {
	["S.S. Anne B1F"] = {{16, 47, 18, 47}}
}
mapLink["Route 9 A"] = {
	["Route 9 B"] = {{211, 109, 212, 109}}
}
mapLink["Rock Tunnel_A"] = {
	["Rock Tunnel_B"] = {{47, 25}},
	["Route 10_A"] = {{56, 19}}
}
mapLink["Rock Tunnel_B"] = {
	["Rock Tunnel_A"] = {{48, 74}}, 
	["Rock Tunnel_C"] = {{17, 62}}
}
mapLink["Rock Tunnel_C"] = {
	["Rock Tunnel_B"] = {{18, 17}},
	["Rock Tunnel_D"] = {{20, 26}}
}
mapLink["Rock Tunnel_D"] = {
	["Rock Tunnel_C"] = {{19, 76}},
	["Rock Tunnel_E"] = {{17, 91}}
}
mapLink["Rock Tunnel_E"] = {
	["Rock Tunnel_D"] = {{18, 43}},
	["Route 10_C"] = {{33, 46}}
}
mapLink["Route 10_C"] = {
	["Rock Tunnel_E"] = {{102, 70}},
	["Lavender Town"] = {{120, 108, 121, 108}}
}
mapLink["Lavender Town"] = {
	["Route 10_C"] = {{120, 107, 121, 107}},
	["Route 8_A"] = {{102, 122, 102, 123}},
	["Lavender Pokémon Center"] = {{115, 116}},
	["Lavender Pokémon Mart"] = {{107, 115}},
	["Lavender Item Buyer"] = {{127, 129}},
	["Uncle Joe's House"] = {{107, 137}},
	["Mr. Fuji's House"] = {{114, 137}},
	["House of Memories"] = {{127, 138}},
	["Pokémon Tower"] = {{126, 117}}
}
mapLink["Lavender Pokémon Center"] = {
	["Lavender Town"] = {{52, 25, 53, 25}},
	["Tourney Stadium"] = {{55, 3, 57, 3}}
}
mapLink["Tourney Stadium"] = {
	["Lavender Pokémon Center"] = {{153, 99, 155, 99}}
}
mapLink["Lavender Pokémon Mart"] = {
	["Lavender Town"] = {{11, 17, 12, 17}}
}
mapLink["Lavender Item Buyer"] = {
	["Lavender Town"] = {{23, 135}}
}
mapLink["Uncle Joe's House"] = {
	["Lavender Town"] = {{9, 47}}
}
mapLink["Mr. Fuji's House"] = {
	["Lavender Town"] = {{45, 58}}
}
mapLink["House of Memories"] = {
	["Lavender Town"] = {{85, 66, 86, 66}}
}
mapLink["Pokémon Tower"] = {
	["Lavender Town"] = {{14, 25, 15, 25}},
	["Pokémon Tower 2F"] = {{23, 14, 23, 16}}
}
mapLink["Pokémon Tower 2F"] = {
	["Tower 1F"] = {{58, 16, 58, 17}},
	["Pokémon Tower 3F"] = {{74, 15, 74, 17}}
}
mapLink["Pokémon Tower 3F"] = {
	["Pokémon Tower 2F"] = {{119, 16, 119, 17}},
	["Pokémon Tower 4F"] = {{135, 15, 135, 17}}
}
mapLink["Pokémon Tower 4F"] = {
	["Pokémon Tower 3F"] = {{175, 18, 175, 19}},
	["Pokémon Tower 5F"] = {{191, 17, 191, 19}}
}
mapLink["Pokémon Tower 5F"] = {
	["Pokémon Tower 4F"] = {{9, 69, 9, 70}},
	["Pokémon Tower 6F"] = {{25, 68, 25, 70}}
}
mapLink["Pokémon Tower 6F"] = {
	["Pokémon Tower 5F"] = {{60, 69, 60, 70}},
	["Pokémon Tower 7F"] = {{75, 68, 75, 70}}
}
mapLink["Pokémon Tower 7F"] = {
	["Pokémon Tower 6F"] = {{120, 70, 120, 71}}
}

mapLink["Route 8_A"] = {
	["Route 8_B"] = {{70, 121, 70, 122}, {52, 126, 52, 127}},
	["Lavender Town"] = {{103, 122, 103, 123}},
	["Underground Path_D"] = {{26, 119}}
}
mapLink["Route 8_B"] = {
	["Route 8_A"] = {{71, 121, 71, 122}, {51, 126, 51, 127}},
}
mapLink["Underground Path_D"] = {
	["Route 8_A"] = {{111, 13}},
	["Underground Path_E"] = {{108, 10}}
}
mapLink["Underground Path_E"] = {
	["Underground Path_D"] = {{87, 8, 87, 9}},
	["Underground Path_F"] = {{33, 8, 33, 9}},
	["Underground Path_G"] = {{75, 5}},
}
mapLink["Underground Path_F"] = {
	["Route 7"] = {{8, 11}},
	["Underground Path_E"] = {{11, 7}}
}
mapLink["Underground Path_G"] = {
	["Underground Path_E"] = {{108, 46}}
}
mapLink["Route 7"] = {
	["Celadon City"] = {{177, 85, 177, 89}},
	["Underground Path_F"] = {{191, 106}}
}
mapLink["Celadon City"] = {
	["Route 7"] = {{178, 85, 178, 89}},
	["Route 16_A"] = {{100, 103, 100, 105}},
	["Celadon Pokémon Center"] = {{165, 82}},
	["Celadon Game Corner"] = {{147, 95}}
}
mapLink["Celadon Game Corner"] = {
	["Celadon City"] = {{128, 78}},
	["Celadon Game Corner - Prize Room"] = {{130, 65}},
	["Rocket Hideout B1F_A"] = {{135, 66, 135, 67}}
}
mapLink["Rocket Hideout B1F_A"] = {
	["Celadon Game Corner"] = {{12, 6, 12, 7}},
	["Rocket Hideout B2F"] = {{20, 6, 20, 7}},
	["Rocket Hideout B1F Elevator"] = {{27, 30}}
}
mapLink["Rocket Hideout B1F_B"] = {
	["Rocket Hideout B2F"] = {{18, 35, 18, 36}}
}
mapLink["Rocket Hideout B1F Elevator"] = {
	["Rocket Hideout B1F_A"] = {{62, 10, 63, 10}}
}
mapLink["Rocket Hideout B2F"] = {
	["Rocket Hideout B1F_A"] = {{38, 66, 38, 67}},
	["Rocket Hideout B2F Elevator"] = {{32, 83}},
	["Rocket Hideout B3F"] = {{27, 66, 27, 67}},
	["Rocket Hideout B1F_B"] = {{28, 78, 28, 80}},
}
mapLink["Rocket Hideout B3F"] = {
	["Rocket Hideout B2F"] = {{21, 112, 21, 113}},
	["Rocket Hideout B4F_A"] = {{20, 134, 20, 135}}
}
mapLink["Rocket Hideout B4F_A"] = {
	["Rocket Hideout B3F"] = {{18, 186, 18, 187}}
}
mapLink["Rocket Hideout B4F_B"] = {
	["Rocket Hideout B4F Elevator"] = {{27, 196}}
}
mapLink["Rocket Hideout B2F Elevator"] = {
	["Rocket Hideout B2F"] = {{62, 73, 63, 73}}
}
mapLink["Rocket Hideout B4F Elevator"] = {
	["Rocket Hideout B4F_B"] = {{62, 179, 63, 179}}
}
mapLink["Celadon Game Corner - Prize Room"] = {
	["Celadon Game Corner"] = {{88, 77}}
}
mapLink["Celadon Pokémon Center"] = {
	["Celadon City"] = {{11, 84, 12, 84}}
}
mapLink["Route 16_A"] = {
	["Celadon City"] = {{101, 103, 101, 105}},
	["Route 16_B"] = {{85, 105}}
}
mapLink["Route 16_B"] = {
	["Route 16_A"] = {{86, 105}},
	["Route 16 House"] = {{51, 88}}
}
mapLink["Route 16 House"] = {
	["Route 16_B"] = {{35, 32}}
}
return mapLink