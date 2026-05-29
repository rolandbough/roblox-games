--[[
  Collection Log — tracks which animals each player has found
  Uses a ModuleScript pattern for clean access
--]]

local CollectionLog = {}
local Players = game:GetService("Players")

-- Store: { [userId] = { [biome] = { [animalName] = true } } }
local playerData = {}

function CollectionLog:init(player)
	local userId = player.UserId
	if not playerData[userId] then
		playerData[userId] = {}
	end
end

function CollectionLog:markFound(player, biome, animalName)
	local userId = player.UserId
	self:init(player)
	
	if not playerData[userId][biome] then
		playerData[userId][biome] = {}
	end
	
	playerData[userId][biome][animalName] = true
	
	-- Fire a remote event for the GUI
	local remote = game:GetService("ReplicatedStorage"):FindFirstChild("AnimalFound")
	if remote then
		remote:FireClient(player, biome, animalName)
	end
end

function CollectionLog:isFound(player, biome, animalName)
	local userId = player.UserId
	local data = playerData[userId]
	if not data then return false end
	
	local biomeData = data[biome]
	if not biomeData then return false end
	
	return biomeData[animalName] == true
end

function CollectionLog:getFoundCount(player)
	local userId = player.UserId
	local data = playerData[userId]
	if not data then return 0 end
	
	local count = 0
	for _, animals in pairs(data) do
		for _ in pairs(animals) do
			count = count + 1
		end
	end
	return count
end

function CollectionLog:getBiomeCounts(player)
	local userId = player.UserId
	local data = playerData[userId]
	if not data then return {} end
	
	local counts = {}
	for biome, animals in pairs(data) do
		local count = 0
		for _ in pairs(animals) do
			count = count + 1
		end
		counts[biome] = count
	end
	return counts
end

-- Save/Load could be added later with DataStore

return CollectionLog
