-- Checkpoint script for obstacle courses
-- Place this in a Part / TouchTransmitter inside each checkpoint

local Checkpoint = script.Parent
local Players = game:GetService("Players")

Checkpoint.Touched:Connect(function(hit)
	local character = hit.Parent
	local player = Players:GetPlayerFromCharacter(character)
	
	if player then
		-- Save this checkpoint as the player's respawn point
		local leaderstats = player:FindFirstChild("leaderstats")
		if leaderstats then
			local checkpointVal = leaderstats:FindFirstChild("CurrentCheckpoint")
			if checkpointVal then
				checkpointVal.Value = Checkpoint.Name
			end
		end
		
		-- Visual feedback
		Checkpoint.BrickColor = BrickColor.new("Bright green")
		task.wait(0.5)
		Checkpoint.BrickColor = BrickColor.new("Bright yellow")
	end
end)
