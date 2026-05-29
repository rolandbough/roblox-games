--[[
  Finish line — triggers when the player reaches the end
  Place in: a Part with TouchTransmitter at the end of your obby
--]]

local FinishLine = script.Parent
local Players = game:GetService("Players")

FinishLine.Touched:Connect(function(hit)
	local character = hit.Parent
	local player = Players:GetPlayerFromCharacter(character)
	
	if player then
		-- Award points / trigger win sequence
		local leaderstats = player:FindFirstChild("leaderstats")
		if leaderstats then
			local wins = leaderstats:FindFirstChild("Wins")
			if wins then
				wins.Value += 1
			end
		end
		
		-- Announce finish
		print(player.Name .. " finished the obby!")
		
		-- Flash effect
		FinishLine.BrickColor = BrickColor.new("Bright green")
		task.wait(0.3)
		FinishLine.BrickColor = BrickColor.new("Lime green")
		task.wait(0.3)
		FinishLine.BrickColor = BrickColor.new("Bright green")
	end
end)
