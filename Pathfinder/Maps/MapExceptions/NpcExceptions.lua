return function()

local npcExce = {}

npcExce["Vermilion City"] = {
	["S.S. Anne"] = {{112, 199}, "Yes", "Ok...You want to enter the S.S. Anne?"}
}
npcExce["Safari Gate"] = {
	["Kanto Safari Zone"] = {{36, 15}, "Yes", "The entrance fee is 1000 for a limited time visit! Do you want to enter?"}
}
-- npcExce["From SubArea"] = {
--     ["To SubArea"] = {{X, Y}, "Answer", "NPC Dialog"}
-- }

return npcExce
end