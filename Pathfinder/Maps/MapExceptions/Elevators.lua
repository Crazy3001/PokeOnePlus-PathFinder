local elevatorExceptions = {}

elevatorExceptions["Rocket Hideout B1F Elevator"] = {
	["Rocket Hideout B2F Elevator"] = {{61, 5}, {"B2F"}, "You are now on: B1F. Which floor do you want?", "", false, {62, 10}},
	["Rocket Hideout B4F Elevator"] = {{61, 5}, {"B4F"}, "You are now on: B1F. Which floor do you want?", "", false, {62, 10}}
}
elevatorExceptions["Rocket Hideout B2F Elevator"] = {
	["Rocket Hideout B1F Elevator"] = {{61, 68}, {"B1F"}, "You are now on: B2F. Which floor do you want?", "", false, {62, 73}},
	["Rocket Hideout B4F Elevator"] = {{61, 68}, {"B4F"}, "You are now on: B2F. Which floor do you want?", "", false, {62, 73}},
}
elevatorExceptions["Rocket Hideout B4F Elevator"] = {
	["Rocket Hideout B1F Elevator"] = {{61, 174}, {"B1F"}, "You are now on: B4F. Which floor do you want?", "", false, {62, 179}},
	["Rocket Hideout B2F Elevator"] = {{61, 174}, {"B2F"}, "You are now on: B4F. Which floor do you want?", "", false, {62, 179}},
}

--elevatorExceptions["From SubArea"] = {
--	["To SubArea"] = {{X, Y--Elevator NPC}, {"Dialog Answer"}, "Dialog Question", "Dialog When Complete", false, {X, Y--Exit Link}},
--}

return elevatorExceptions