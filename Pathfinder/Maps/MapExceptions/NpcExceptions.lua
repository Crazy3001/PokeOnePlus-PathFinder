return function()

local npcExce = {}

--npcExce["From Area"] = {
--	["To Area"] = {{X, Y}, "Answer", "NPC Dialog"}
--}

npcExce["Mt. Silver 1F_A"] = {
	["Mt. Silver 1F_B"] = {{76, 80}, "", ""}
}
npcExce["Safari Gate"] = {
	["Kanto Safari Zone"] = {{36, 15}, "Yes", "The entrance fee is 1000 for a limited time visit! Do you want to enter?"}
}
npcExce["Vermilion City"] = {
	["S.S. Anne"] = {{112, 199}, "Yes", "Ok...You want to enter the S.S. Anne?"}
}

--npcExce["From Area"] = {
--	["To Area"] = {{X, Y}, "Answer", "NPC Dialog"}
--}

return npcExce
end