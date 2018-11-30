local elevatorExceptions = {}

--elevatorExceptions["From SubArea"] = {
--	["To Area"] = {{X, Y--Elevator NPC}, {"Dialog Answer"}, "Dialog Question", "Dialog When Complete", false, {X, Y--Exit Link}},
--}

elevatorExceptions["Celadon Department Store Elevator"] = {
	["Celadon Department Store 2F Elevator"] = {{7, 3}, {"2F"}, "You are now on: 1F. Which floor do you want?", "", false, {8, 7}}, 
	["Celadon Department Store 3F Elevator"] = {{7, 3}, {"3F"}, "You are now on: 1F. Which floor do you want?", "", false, {8, 7}}, 
	["Celadon Department Store 4F Elevator"] = {{7, 3}, {"4F"}, "You are now on: 1F. Which floor do you want?", "", false, {8, 7}}, 
	["Celadon Department Store 5F Elevator"] = {{7, 3}, {"5F"}, "You are now on: 1F. Which floor do you want?", "", false, {8, 7}}, 
	["Celadon Department Store 6F Elevator"] = {{7, 3}, {"6F"}, "You are now on: 1F. Which floor do you want?", "", false, {8, 7}}
}
elevatorExceptions["Celadon Department Store 2F Elevator"] = {
	["Celadon Department Store Elevator"] = {{7, 44}, {"1F"}, "You are now on: 2F. Which floor do you want?", "", false, {8, 48}}, 
	["Celadon Department Store 3F Elevator"] = {{7, 44}, {"3F"}, "You are now on: 2F. Which floor do you want?", "", false, {8, 48}}, 
	["Celadon Department Store 4F Elevator"] = {{7, 44}, {"4F"}, "You are now on: 2F. Which floor do you want?", "", false, {8, 48}}, 
	["Celadon Department Store 5F Elevator"] = {{7, 44}, {"5F"}, "You are now on: 2F. Which floor do you want?", "", false, {8, 48}}, 
	["Celadon Department Store 6F Elevator"] = {{7, 44}, {"6F"}, "You are now on: 2F. Which floor do you want?", "", false, {8, 48}}
}
elevatorExceptions["Celadon Department Store 3F Elevator"] = {
	["Celadon Department Store Elevator"] = {{7, 85}, {"1F"}, "You are now on: 3F. Which floor do you want?", "", false, {8, 89}}, 
	["Celadon Department Store 2F Elevator"] = {{7, 85}, {"2F"}, "You are now on: 3F. Which floor do you want?", "", false, {8, 89}}, 
	["Celadon Department Store 4F Elevator"] = {{7, 85}, {"4F"}, "You are now on: 3F. Which floor do you want?", "", false, {8, 89}}, 
	["Celadon Department Store 5F Elevator"] = {{7, 85}, {"5F"}, "You are now on: 3F. Which floor do you want?", "", false, {8, 89}}, 
	["Celadon Department Store 6F Elevator"] = {{7, 85}, {"6F"}, "You are now on: 3F. Which floor do you want?", "", false, {8, 89}}
}
elevatorExceptions["Celadon Department Store 4F Elevator"] = {
	["Celadon Department Store Elevator"] = {{7, 126}, {"1F"}, "You are now on: 4F. Which floor do you want?", "", false, {8, 130}}, 
	["Celadon Department Store 2F Elevator"] = {{7, 126}, {"2F"}, "You are now on: 4F. Which floor do you want?", "", false, {8, 130}}, 
	["Celadon Department Store 3F Elevator"] = {{7, 126}, {"3F"}, "You are now on: 4F. Which floor do you want?", "", false, {8, 130}}, 
	["Celadon Department Store 5F Elevator"] = {{7, 126}, {"5F"}, "You are now on: 4F. Which floor do you want?", "", false, {8, 130}}, 
	["Celadon Department Store 6F Elevator"] = {{7, 126}, {"6F"}, "You are now on: 4F. Which floor do you want?", "", false, {8, 130}}
}
elevatorExceptions["Celadon Department Store 5F Elevator"] = {
	["Celadon Department Store Elevator"] = {{7, 167}, {"1F"}, "You are now on: 5F. Which floor do you want?", "", false, {8, 171}}, 
	["Celadon Department Store 2F Elevator"] = {{7, 167}, {"2F"}, "You are now on: 5F. Which floor do you want?", "", false, {8, 171}}, 
	["Celadon Department Store 3F Elevator"] = {{7, 167}, {"3F"}, "You are now on: 5F. Which floor do you want?", "", false, {8, 171}}, 
	["Celadon Department Store 4F Elevator"] = {{7, 167}, {"4F"}, "You are now on: 5F. Which floor do you want?", "", false, {8, 171}}, 
	["Celadon Department Store 6F Elevator"] = {{7, 167}, {"6F"}, "You are now on: 5F. Which floor do you want?", "", false, {8, 171}}
}
elevatorExceptions["Celadon Department Store 6F Elevator"] = {
	["Celadon Department Store Elevator"] = {{7, 208}, {"1F"}, "You are now on: 6F. Which floor do you want?", "", false, {8, 212}}, 
	["Celadon Department Store 2F Elevator"] = {{7, 208}, {"2F"}, "You are now on: 6F. Which floor do you want?", "", false, {8, 212}}, 
	["Celadon Department Store 3F Elevator"] = {{7, 208}, {"3F"}, "You are now on: 6F. Which floor do you want?", "", false, {8, 212}}, 
	["Celadon Department Store 4F Elevator"] = {{7, 208}, {"4F"}, "You are now on: 6F. Which floor do you want?", "", false, {8, 212}}, 
	["Celadon Department Store 5F Elevator"] = {{7, 208}, {"5F"}, "You are now on: 6F. Which floor do you want?", "", false, {8, 212}}
}
elevatorExceptions["Rocket Hideout B1F Elevator"] = {
	["Rocket Hideout B2F Elevator"] = {{61, 5}, {"B2F"}, "You are now on: B1F. Which floor do you want?", "", false, {62, 10}},
	["Rocket Hideout B4F Elevator"] = {{61, 5}, {"B4F"}, "You are now on: B1F. Which floor do you want?", "", false, {62, 10}}
}
elevatorExceptions["Rocket Hideout B2F Elevator"] = {
	["Rocket Hideout B1F Elevator"] = {{61, 68}, {"B1F"}, "You are now on: B2F. Which floor do you want?", "", false, {62, 73}},
	["Rocket Hideout B4F Elevator"] = {{61, 68}, {"B4F"}, "You are now on: B2F. Which floor do you want?", "", false, {62, 73}}
}
elevatorExceptions["Rocket Hideout B4F Elevator"] = {
	["Rocket Hideout B1F Elevator"] = {{61, 174}, {"B1F"}, "You are now on: B4F. Which floor do you want?", "", false, {62, 179}},
	["Rocket Hideout B2F Elevator"] = {{61, 174}, {"B2F"}, "You are now on: B4F. Which floor do you want?", "", false, {62, 179}}
}
elevatorExceptions["Silph Co. Elevator"] = {
	["Silph Co. 2F Elevator"] = {{79, 6}, {"2F"}, "You are now on: 1F. Which floor do you want?", "", false, {80, 10}}, 
	["Silph Co. 3F Elevator"] = {{79, 6}, {"3F"}, "You are now on: 1F. Which floor do you want?", "", false, {80, 10}}, 
	["Silph Co. 4F Elevator"] = {{79, 6}, {"4F"}, "You are now on: 1F. Which floor do you want?", "", false, {80, 10}}, 
	["Silph Co. 5F Elevator"] = {{79, 6}, {"5F"}, "You are now on: 1F. Which floor do you want?", "", false, {80, 10}}, 
	["Silph Co. 6F Elevator"] = {{79, 6}, {"6F"}, "You are now on: 1F. Which floor do you want?", "", false, {80, 10}}, 
	["Silph Co. 7F Elevator"] = {{79, 6}, {"7F"}, "You are now on: 1F. Which floor do you want?", "", false, {80, 10}}, 
	["Silph Co. 8F Elevator"] = {{79, 6}, {"8F"}, "You are now on: 1F. Which floor do you want?", "", false, {80, 10}}, 
	["Silph Co. 9F Elevator"] = {{79, 6}, {"9F"}, "You are now on: 1F. Which floor do you want?", "", false, {80, 10}}, 
	["Silph Co. 10F Elevator"] = {{79, 6}, {"10F"}, "You are now on: 1F. Which floor do you want?", "", false, {80, 10}}, 
	["Silph Co. 11F Elevator"] = {{79, 6}, {"11F"}, "You are now on: 1F. Which floor do you want?", "", false, {80, 10}}
}
elevatorExceptions["Silph Co. 2F Elevator"] = {
	["Silph Co. Elevator"] = {{80, 41}, {"1F"}, "You are now on: 2F. Which floor do you want?", "", false, {81, 46}}, 
	["Silph Co. 3F Elevator"] = {{80, 41}, {"3F"}, "You are now on: 2F. Which floor do you want?", "", false, {81, 46}}, 
	["Silph Co. 4F Elevator"] = {{80, 41}, {"4F"}, "You are now on: 2F. Which floor do you want?", "", false, {81, 46}}, 
	["Silph Co. 5F Elevator"] = {{80, 41}, {"5F"}, "You are now on: 2F. Which floor do you want?", "", false, {81, 46}}, 
	["Silph Co. 6F Elevator"] = {{80, 41}, {"6F"}, "You are now on: 2F. Which floor do you want?", "", false, {81, 46}}, 
	["Silph Co. 7F Elevator"] = {{80, 41}, {"7F"}, "You are now on: 2F. Which floor do you want?", "", false, {81, 46}}, 
	["Silph Co. 8F Elevator"] = {{80, 41}, {"8F"}, "You are now on: 2F. Which floor do you want?", "", false, {81, 46}}, 
	["Silph Co. 9F Elevator"] = {{80, 41}, {"9F"}, "You are now on: 2F. Which floor do you want?", "", false, {81, 46}}, 
	["Silph Co. 10F Elevator"] = {{80, 41}, {"10F"}, "You are now on: 2F. Which floor do you want?", "", false, {81, 46}}, 
	["Silph Co. 11F Elevator"] = {{80, 41}, {"11F"}, "You are now on: 2F. Which floor do you want?", "", false, {81, 46}}
}
elevatorExceptions["Silph Co. 3F Elevator"] = {
	["Silph Co. Elevator"] = {{80, 75}, {"1F"}, "You are now on: 3F. Which floor do you want?", "", false, {81, 79}}, 
	["Silph Co. 2F Elevator"] = {{80, 75}, {"2F"}, "You are now on: 3F. Which floor do you want?", "", false, {81, 79}}, 
	["Silph Co. 4F Elevator"] = {{80, 75}, {"4F"}, "You are now on: 3F. Which floor do you want?", "", false, {81, 79}}, 
	["Silph Co. 5F Elevator"] = {{80, 75}, {"5F"}, "You are now on: 3F. Which floor do you want?", "", false, {81, 79}}, 
	["Silph Co. 6F Elevator"] = {{80, 75}, {"6F"}, "You are now on: 3F. Which floor do you want?", "", false, {81, 79}}, 
	["Silph Co. 7F Elevator"] = {{80, 75}, {"7F"}, "You are now on: 3F. Which floor do you want?", "", false, {81, 79}}, 
	["Silph Co. 8F Elevator"] = {{80, 75}, {"8F"}, "You are now on: 3F. Which floor do you want?", "", false, {81, 79}}, 
	["Silph Co. 9F Elevator"] = {{80, 75}, {"9F"}, "You are now on: 3F. Which floor do you want?", "", false, {81, 79}}, 
	["Silph Co. 10F Elevator"] = {{80, 75}, {"10F"}, "You are now on: 3F. Which floor do you want?", "", false, {81, 79}}, 
	["Silph Co. 11F Elevator"] = {{80, 75}, {"11F"}, "You are now on: 3F. Which floor do you want?", "", false, {81, 79}}, 
}
elevatorExceptions["Silph Co. 4F Elevator"] = {
	["Silph Co. Elevator"] = {{79, 120}, {"1F"}, "You are now on: 4F. Which floor do you want?", "", false, {80, 124}}, 
	["Silph Co. 2F Elevator"] = {{79, 120}, {"2F"}, "You are now on: 4F. Which floor do you want?", "", false, {80, 124}}, 
	["Silph Co. 3F Elevator"] = {{79, 120}, {"3F"}, "You are now on: 4F. Which floor do you want?", "", false, {80, 124}}, 
	["Silph Co. 5F Elevator"] = {{79, 120}, {"5F"}, "You are now on: 4F. Which floor do you want?", "", false, {80, 124}}, 
	["Silph Co. 6F Elevator"] = {{79, 120}, {"6F"}, "You are now on: 4F. Which floor do you want?", "", false, {80, 124}}, 
	["Silph Co. 7F Elevator"] = {{79, 120}, {"7F"}, "You are now on: 4F. Which floor do you want?", "", false, {80, 124}}, 
	["Silph Co. 8F Elevator"] = {{79, 120}, {"8F"}, "You are now on: 4F. Which floor do you want?", "", false, {80, 124}}, 
	["Silph Co. 9F Elevator"] = {{79, 120}, {"9F"}, "You are now on: 4F. Which floor do you want?", "", false, {80, 124}}, 
	["Silph Co. 10F Elevator"] = {{79, 120}, {"10F"}, "You are now on: 4F. Which floor do you want?", "", false, {80, 124}}, 
	["Silph Co. 11F Elevator"] = {{79, 120}, {"11F"}, "You are now on: 4F. Which floor do you want?", "", false, {80, 124}}, 
}
elevatorExceptions["Silph Co. 5F Elevator"] = {
	["Silph Co. Elevator"] = {{79, 155}, {"1F"}, "You are now on: 5F. Which floor do you want?", "", false, {80, 159}}, 
	["Silph Co. 2F Elevator"] = {{79, 155}, {"2F"}, "You are now on: 5F. Which floor do you want?", "", false, {80, 159}}, 
	["Silph Co. 3F Elevator"] = {{79, 155}, {"3F"}, "You are now on: 5F. Which floor do you want?", "", false, {80, 159}}, 
	["Silph Co. 4F Elevator"] = {{79, 155}, {"4F"}, "You are now on: 5F. Which floor do you want?", "", false, {80, 159}}, 
	["Silph Co. 6F Elevator"] = {{79, 155}, {"6F"}, "You are now on: 5F. Which floor do you want?", "", false, {80, 159}}, 
	["Silph Co. 7F Elevator"] = {{79, 155}, {"7F"}, "You are now on: 5F. Which floor do you want?", "", false, {80, 159}}, 
	["Silph Co. 8F Elevator"] = {{79, 155}, {"8F"}, "You are now on: 5F. Which floor do you want?", "", false, {80, 159}}, 
	["Silph Co. 9F Elevator"] = {{79, 155}, {"9F"}, "You are now on: 5F. Which floor do you want?", "", false, {80, 159}}, 
	["Silph Co. 10F Elevator"] = {{79, 155}, {"10F"}, "You are now on: 5F. Which floor do you want?", "", false, {80, 159}}, 
	["Silph Co. 11F Elevator"] = {{79, 155}, {"11F"}, "You are now on: 5F. Which floor do you want?", "", false, {80, 159}}, 
}
elevatorExceptions["Silph Co. 6F Elevator"] = {
	["Silph Co. Elevator"] = {{79, 190}, {"1F"}, "You are now on: 6F. Which floor do you want?", "", false, {80, 194}}, 
	["Silph Co. 2F Elevator"] = {{79, 190}, {"2F"}, "You are now on: 6F. Which floor do you want?", "", false, {80, 194}}, 
	["Silph Co. 3F Elevator"] = {{79, 190}, {"3F"}, "You are now on: 6F. Which floor do you want?", "", false, {80, 194}}, 
	["Silph Co. 4F Elevator"] = {{79, 190}, {"4F"}, "You are now on: 6F. Which floor do you want?", "", false, {80, 194}}, 
	["Silph Co. 5F Elevator"] = {{79, 190}, {"5F"}, "You are now on: 6F. Which floor do you want?", "", false, {80, 194}}, 
	["Silph Co. 7F Elevator"] = {{79, 190}, {"7F"}, "You are now on: 6F. Which floor do you want?", "", false, {80, 194}}, 
	["Silph Co. 8F Elevator"] = {{79, 190}, {"8F"}, "You are now on: 6F. Which floor do you want?", "", false, {80, 194}}, 
	["Silph Co. 9F Elevator"] = {{79, 190}, {"9F"}, "You are now on: 6F. Which floor do you want?", "", false, {80, 194}}, 
	["Silph Co. 10F Elevator"] = {{79, 190}, {"10F"}, "You are now on: 6F. Which floor do you want?", "", false, {80, 194}}, 
	["Silph Co. 11F Elevator"] = {{79, 190}, {"11F"}, "You are now on: 6F. Which floor do you want?", "", false, {80, 194}}, 
}
elevatorExceptions["Silph Co. 7F Elevator"] = {
	["Silph Co. Elevator"] = {{80, 225}, {"1F"}, "You are now on: 7F. Which floor do you want?", "", false, {81, 229}}, 
	["Silph Co. 2F Elevator"] = {{80, 225}, {"2F"}, "You are now on: 7F. Which floor do you want?", "", false, {81, 229}}, 
	["Silph Co. 3F Elevator"] = {{80, 225}, {"3F"}, "You are now on: 7F. Which floor do you want?", "", false, {81, 229}}, 
	["Silph Co. 4F Elevator"] = {{80, 225}, {"4F"}, "You are now on: 7F. Which floor do you want?", "", false, {81, 229}}, 
	["Silph Co. 5F Elevator"] = {{80, 225}, {"5F"}, "You are now on: 7F. Which floor do you want?", "", false, {81, 229}}, 
	["Silph Co. 6F Elevator"] = {{80, 225}, {"6F"}, "You are now on: 7F. Which floor do you want?", "", false, {81, 229}}, 
	["Silph Co. 8F Elevator"] = {{80, 225}, {"8F"}, "You are now on: 7F. Which floor do you want?", "", false, {81, 229}}, 
	["Silph Co. 9F Elevator"] = {{80, 225}, {"9F"}, "You are now on: 7F. Which floor do you want?", "", false, {81, 229}}, 
	["Silph Co. 10F Elevator"] = {{80, 225}, {"10F"}, "You are now on: 7F. Which floor do you want?", "", false, {81, 229}}, 
	["Silph Co. 11F Elevator"] = {{80, 225}, {"11F"}, "You are now on: 7F. Which floor do you want?", "", false, {81, 229}}, 
}
elevatorExceptions["Silph Co. 8F Elevator"] = {
	["Silph Co. Elevator"] = {{80, 260}, {"1F"}, "You are now on: 8F. Which floor do you want?", "", false, {81, 264}}, 
	["Silph Co. 2F Elevator"] = {{80, 260}, {"2F"}, "You are now on: 8F. Which floor do you want?", "", false, {81, 264}}, 
	["Silph Co. 3F Elevator"] = {{80, 260}, {"3F"}, "You are now on: 8F. Which floor do you want?", "", false, {81, 264}}, 
	["Silph Co. 4F Elevator"] = {{80, 260}, {"4F"}, "You are now on: 8F. Which floor do you want?", "", false, {81, 264}}, 
	["Silph Co. 5F Elevator"] = {{80, 260}, {"5F"}, "You are now on: 8F. Which floor do you want?", "", false, {81, 264}}, 
	["Silph Co. 6F Elevator"] = {{80, 260}, {"6F"}, "You are now on: 8F. Which floor do you want?", "", false, {81, 264}}, 
	["Silph Co. 7F Elevator"] = {{80, 260}, {"7F"}, "You are now on: 8F. Which floor do you want?", "", false, {81, 264}}, 
	["Silph Co. 9F Elevator"] = {{80, 260}, {"9F"}, "You are now on: 8F. Which floor do you want?", "", false, {81, 264}}, 
	["Silph Co. 10F Elevator"] = {{80, 260}, {"10F"}, "You are now on: 8F. Which floor do you want?", "", false, {81, 264}}, 
	["Silph Co. 11F Elevator"] = {{80, 260}, {"11F"}, "You are now on: 8F. Which floor do you want?", "", false, {81, 264}}, 
}
elevatorExceptions["Silph Co. 9F Elevator"] = {
	["Silph Co. Elevator"] = {{80, 296}, {"1F"}, "You are now on: 9F. Which floor do you want?", "", false, {81, 300}}, 
	["Silph Co. 2F Elevator"] = {{80, 296}, {"2F"}, "You are now on: 9F. Which floor do you want?", "", false, {81, 300}}, 
	["Silph Co. 3F Elevator"] = {{80, 296}, {"3F"}, "You are now on: 9F. Which floor do you want?", "", false, {81, 300}}, 
	["Silph Co. 4F Elevator"] = {{80, 296}, {"4F"}, "You are now on: 9F. Which floor do you want?", "", false, {81, 300}}, 
	["Silph Co. 5F Elevator"] = {{80, 296}, {"5F"}, "You are now on: 9F. Which floor do you want?", "", false, {81, 300}}, 
	["Silph Co. 6F Elevator"] = {{80, 296}, {"6F"}, "You are now on: 9F. Which floor do you want?", "", false, {81, 300}}, 
	["Silph Co. 7F Elevator"] = {{80, 296}, {"7F"}, "You are now on: 9F. Which floor do you want?", "", false, {81, 300}}, 
	["Silph Co. 8F Elevator"] = {{80, 296}, {"8F"}, "You are now on: 9F. Which floor do you want?", "", false, {81, 300}}, 
	["Silph Co. 10F Elevator"] = {{80, 296}, {"10F"}, "You are now on: 9F. Which floor do you want?", "", false, {81, 300}}, 
	["Silph Co. 11F Elevator"] = {{80, 296}, {"11F"}, "You are now on: 9F. Which floor do you want?", "", false, {81, 300}}, 
}
elevatorExceptions["Silph Co. 10F Elevator"] = {
	["Silph Co. Elevator"] = {{80, 330}, {"1F"}, "You are now on: 10F. Which floor do you want?", "", false, {81, 334}}, 
	["Silph Co. 2F Elevator"] = {{80, 330}, {"2F"}, "You are now on: 10F. Which floor do you want?", "", false, {81, 334}}, 
	["Silph Co. 3F Elevator"] = {{80, 330}, {"3F"}, "You are now on: 10F. Which floor do you want?", "", false, {81, 334}}, 
	["Silph Co. 4F Elevator"] = {{80, 330}, {"4F"}, "You are now on: 10F. Which floor do you want?", "", false, {81, 334}}, 
	["Silph Co. 5F Elevator"] = {{80, 330}, {"5F"}, "You are now on: 10F. Which floor do you want?", "", false, {81, 334}}, 
	["Silph Co. 6F Elevator"] = {{80, 330}, {"6F"}, "You are now on: 10F. Which floor do you want?", "", false, {81, 334}}, 
	["Silph Co. 7F Elevator"] = {{80, 330}, {"7F"}, "You are now on: 10F. Which floor do you want?", "", false, {81, 334}}, 
	["Silph Co. 8F Elevator"] = {{80, 330}, {"8F"}, "You are now on: 10F. Which floor do you want?", "", false, {81, 334}}, 
	["Silph Co. 9F Elevator"] = {{80, 330}, {"9F"}, "You are now on: 10F. Which floor do you want?", "", false, {81, 334}}, 
	["Silph Co. 11F Elevator"] = {{80, 330}, {"11F"}, "You are now on: 10F. Which floor do you want?", "", false, {81, 334}}, 
}
elevatorExceptions["Silph Co. 11F Elevator"] = {
	["Silph Co. Elevator"] = {{79, 365}, {"1F"}, "You are now on: 11F. Which floor do you want?", "", false, {80, 369}}, 
	["Silph Co. 2F Elevator"] = {{79, 365}, {"2F"}, "You are now on: 11F. Which floor do you want?", "", false, {80, 369}}, 
	["Silph Co. 3F Elevator"] = {{79, 365}, {"3F"}, "You are now on: 11F. Which floor do you want?", "", false, {80, 369}}, 
	["Silph Co. 4F Elevator"] = {{79, 365}, {"4F"}, "You are now on: 11F. Which floor do you want?", "", false, {80, 369}}, 
	["Silph Co. 5F Elevator"] = {{79, 365}, {"5F"}, "You are now on: 11F. Which floor do you want?", "", false, {80, 369}}, 
	["Silph Co. 6F Elevator"] = {{79, 365}, {"6F"}, "You are now on: 11F. Which floor do you want?", "", false, {80, 369}}, 
	["Silph Co. 7F Elevator"] = {{79, 365}, {"7F"}, "You are now on: 11F. Which floor do you want?", "", false, {80, 369}}, 
	["Silph Co. 8F Elevator"] = {{79, 365}, {"8F"}, "You are now on: 11F. Which floor do you want?", "", false, {80, 369}}, 
	["Silph Co. 9F Elevator"] = {{79, 365}, {"9F"}, "You are now on: 11F. Which floor do you want?", "", false, {80, 369}}, 
	["Silph Co. 10F Elevator"] = {{79, 365}, {"10F"}, "You are now on: 11F. Which floor do you want?", "", false, {80, 369}}, 
}

--elevatorExceptions["From SubArea"] = {
--	["To Area"] = {{X, Y--Elevator NPC}, {"Dialog Answer"}, "Dialog Question", "Dialog When Complete", false, {X, Y--Exit Link}},
--}

return elevatorExceptions