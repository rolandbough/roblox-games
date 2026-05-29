--[[
  Hub Teleport System
  Place these scripts inside each biome portal part
  
  Each portal needs:
  - A Part named "Portal" with TouchTransmitter
  - A StringValue "BiomeName" inside it (e.g. "Winter")
--]]

local Players = game:GetService("Players")

script.Parent.Touched:Connect(function(hit)
	local character = hit.Parent
	local player = Players:GetPlayerFromCharacter(character)
	if not player then return end
	
	local biomeName = script.Parent:FindFirstChild("BiomeName")
	if not biomeName then return end
	
	local biome = workspace:FindFirstChild(biomeName.Value)
	if not biome then return end
	
	local spawnLocation = biome:FindFirstChild("SpawnLocation")
	local cframe = spawnLocation and spawnLocation.CFrame or biome:GetPivot()
	
	local hrp = character:FindFirstChild("HumanoidRootPart")
	if hrp then
		hrp.CFrame = cframe + Vector3.new(0, 3, 0)
	end
end)
