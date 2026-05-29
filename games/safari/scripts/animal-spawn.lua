--[[
  Animal Spawn System
  Place this in ServerScriptService
  
  Each animal is a model with:
  - A ClickDetector (player clicks to "find" it)
  - A BillboardGui showing the animal name (hidden until nearby)
  - An Attachment with a sound (optional animal call)
--]]

local Animals = game:GetService("ServerStorage"):WaitForChild("Animals")
local CollectionLog = require(script.CollectionLog)

-- All animal data
local ANIMAL_DATA = {
	Winter = {"Penguin", "PolarBear", "ArcticFox", "Seal", "SnowOwl", 
	          "Walrus", "Reindeer", "SnowHare", "Wolf", "Ermine"},
	Forest = {"Deer", "Fox", "Bear", "Rabbit", "Owl",
	          "Squirrel", "Wolf", "Hedgehog", "Badger", "Woodpecker"},
	Savanna = {"Lion", "Giraffe", "Zebra", "Elephant", "Cheetah",
	           "Rhino", "Hippo", "Ostrich", "Gazelle", "Meerkat"},
	Ocean = {"Dolphin", "Whale", "Shark", "SeaTurtle", "Octopus",
	         "Clownfish", "MantaRay", "Jellyfish", "Seahorse", "Crab"},
	Desert = {"Camel", "Scorpion", "FennecFox", "Rattlesnake", "Tortoise"},
	Jungle = {"Toucan", "Jaguar", "Sloth", "Monkey", "TreeFrog"}
}

local AnimalSpawn = {}

function AnimalSpawn.spawnAll()
	for biome, animals in pairs(ANIMAL_DATA) do
		local biomeFolder = Animals:FindFirstChild(biome)
		if not biomeFolder then continue end
		
		for _, animalName in ipairs(animals) do
			local animalModel = biomeFolder:FindFirstChild(animalName)
			if animalModel then
				local clone = animalModel:Clone()
				clone.Parent = workspace:FindFirstChild(biome)
				
				-- Add ClickDetector for finding
				local detector = Instance.new("ClickDetector")
				detector.Parent = clone
				
				detector.MouseClick:Connect(function(player)
					if CollectionLog:isFound(player, biome, animalName) then
						return -- already found
					end
					
					CollectionLog:markFound(player, biome, animalName)
					
					-- Visual feedback
					clone:FindFirstChild("Highlight") and clone.Highlight:Destroy()
					
					-- Reward / ping
					local leaderstats = player:FindFirstChild("leaderstats")
					if leaderstats then
						local found = leaderstats:FindFirstChild("AnimalsFound")
						if found then
							found.Value += 1
						end
					end
				end)
			end
		end
	end
end

function AnimalSpawn.getTotalCount()
	local count = 0
	for _, animals in pairs(ANIMAL_DATA) do
		count = count + #animals
	end
	return count
end

return AnimalSpawn
