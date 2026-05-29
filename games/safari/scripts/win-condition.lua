--[[
  Win Condition — checks if a player has found all 50 animals
  Place in ServerScriptService
  
  Triggers celebration when the 50th animal is found
--]]

local CollectionLog = require(script.Parent.CollectionLog)
local Players = game:GetService("Players")

local TOTAL_ANIMALS = 50

-- Listen for leaderstats changes
local function onLeaderstatsUpdate(player, stat)
	if stat.Name == "AnimalsFound" and stat.Value >= TOTAL_ANIMALS then
		-- WIN!
		local remote = game:GetService("ReplicatedStorage"):FindFirstChild("GameWon")
		if remote then
			remote:FireAllClients(player.Name .. " found all 50 animals!")
		end
		
		print(player.Name .. " completed the Biome Safari!")
		
		-- Could add: fireworks, leaderboard points, badge
	end
end

Players.PlayerAdded:Connect(function(player)
	local leaderstats = Instance.new("Folder")
	leaderstats.Name = "leaderstats"
	leaderstats.Parent = player
	
	local found = Instance.new("IntValue")
	found.Name = "AnimalsFound"
	found.Value = 0
	found.Parent = leaderstats
	
	found:GetPropertyChangedSignal("Value"):Connect(function()
		onLeaderstatsUpdate(player, found)
	end)
end)
