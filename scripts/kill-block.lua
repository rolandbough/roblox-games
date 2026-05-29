-- Kill block / lava / pit script
-- Place inside a Part that should destroy the player on touch

local KillBlock = script.Parent
local Players = game:GetService("Players")
local Debris = game:GetService("Debris")

-- Load the player's last checkpoint
local function respawnPlayer(player)
	local char = player.Character
	if char then
		local hrp = char:FindFirstChild("HumanoidRootPart")
		local leaderstats = player:FindFirstChild("leaderstats")
		
		if leaderstats and hrp then
			local checkpointVal = leaderstats:FindFirstChild("CurrentCheckpoint")
			if checkpointVal and checkpointVal.Value ~= "" then
				-- Find checkpoint and teleport
				local checkpoint = workspace:FindFirstChild(checkpointVal.Value)
				if checkpoint then
					hrp.CFrame = checkpoint.CFrame + Vector3.new(0, 3, 0)
					return
				end
			end
		end
		
		-- Fallback: respawn at spawn
		local spawn = workspace:FindFirstChild("SpawnLocation")
		if spawn then
			hrp.CFrame = spawn.CFrame + Vector3.new(0, 3, 0)
		end
	end
end

KillBlock.Touched:Connect(function(hit)
	local character = hit.Parent
	local player = Players:GetPlayerFromCharacter(character)
	
	if player then
		respawnPlayer(player)
	end
end)
