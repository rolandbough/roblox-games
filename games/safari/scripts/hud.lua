--[[
  HUD / Progress UI — shows how many animals found
  Place this in StarterGui as a LocalScript + ScreenGui
  
  Updates in real-time when animals are discovered
--]]

local Players = game:GetService("Players")
local player = Players.LocalPlayer
local replicatedStorage = game:GetService("ReplicatedStorage")

local screenGui = Instance.new("ScreenGui")
screenGui.Name = "SafariHUD"
screenGui.Parent = player:WaitForChild("PlayerGui")

-- Main frame
local frame = Instance.new("Frame")
frame.Size = UDim2.new(0, 220, 0, 120)
frame.Position = UDim2.new(0, 16, 0, 16)
frame.BackgroundColor3 = Color3.fromRGB(20, 20, 30)
frame.BackgroundTransparency = 0.3
frame.BorderSizePixel = 0
frame.Parent = screenGui

-- Title
local title = Instance.new("TextLabel")
title.Text = "🌍 Biome Safari"
title.Size = UDim2.new(1, 0, 0, 28)
title.BackgroundTransparency = 1
title.TextColor3 = Color3.fromRGB(255, 200, 80)
title.Font = Enum.Font.GothamBold
title.TextSize = 16
title.Parent = frame

-- Progress bar background
local progressBg = Instance.new("Frame")
progressBg.Size = UDim2.new(0.9, 0, 0, 12)
progressBg.Position = UDim2.new(0.05, 0, 0, 32)
progressBg.BackgroundColor3 = Color3.fromRGB(40, 40, 50)
progressBg.BorderSizePixel = 0
progressBg.Parent = frame

-- Progress bar fill
local progressFill = Instance.new("Frame")
progressFill.Size = UDim2.new(0, 0, 1, 0)
progressFill.BackgroundColor3 = Color3.fromRGB(80, 220, 100)
progressFill.BorderSizePixel = 0
progressFill.Parent = progressBg

-- Counter text
local counter = Instance.new("TextLabel")
counter.Text = "0 / 50 animals found"
counter.Size = UDim2.new(1, 0, 0, 24)
counter.Position = UDim2.new(0, 0, 0, 48)
counter.BackgroundTransparency = 1
counter.TextColor3 = Color3.fromRGB(200, 200, 200)
counter.Font = Enum.Font.Gotham
counter.TextSize = 14
counter.Parent = frame

-- Listen for animal discoveries
local remote = replicatedStorage:FindFirstChild("AnimalFound")
if remote then
	remote.OnClientEvent:Connect(function(biome, animalName)
		-- Flash effect
		progressFill.BackgroundColor3 = Color3.fromRGB(255, 220, 80)
		task.wait(0.2)
		progressFill.BackgroundColor3 = Color3.fromRGB(80, 220, 100)
		
		-- Update text (player.leaderstats.AnimalsFound would be better)
	end)
end

-- Update loop
while task.wait(0.5) do
	local leaderstats = player:FindFirstChild("leaderstats")
	if leaderstats then
		local found = leaderstats:FindFirstChild("AnimalsFound")
		if found then
			local total = 50
			counter.Text = found.Value .. " / " .. total .. " animals found"
			progressFill.Size = UDim2.new(found.Value / total, 0, 1, 0)
		end
	end
end
