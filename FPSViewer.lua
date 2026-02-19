-- FPS Display LocalScript
-- Place this inside StarterPlayerScripts or StarterGui

local Players = game:GetService("Players")
local RunService = game:GetService("RunService")
local UserInputService = game:GetService("UserInputService")

local player = Players.LocalPlayer
local playerGui = player:WaitForChild("PlayerGui")

-- ─── Create ScreenGui ────────────────────────────────────────────────────────

local screenGui = Instance.new("ScreenGui")
screenGui.Name = "FPSDisplay"
screenGui.ResetOnSpawn = false
screenGui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
screenGui.DisplayOrder = 999
screenGui.Parent = playerGui

-- ─── Main Frame ──────────────────────────────────────────────────────────────
setfpscap(99999)
local mainFrame = Instance.new("Frame")
mainFrame.Name = "MainFrame"
mainFrame.Size = UDim2.new(0, 200, 0, 130)
mainFrame.Position = UDim2.new(1, -214, 0, 46)
mainFrame.BackgroundColor3 = Color3.fromRGB(15, 15, 15)
mainFrame.BackgroundTransparency = 0.25
mainFrame.BorderSizePixel = 0
mainFrame.Active = true
mainFrame.Draggable = true
mainFrame.Parent = screenGui

local mainCorner = Instance.new("UICorner")
mainCorner.CornerRadius = UDim.new(0, 6)
mainCorner.Parent = mainFrame

local mainStroke = Instance.new("UIStroke")
mainStroke.Color = Color3.fromRGB(255, 255, 255)
mainStroke.Transparency = 0.88
mainStroke.Thickness = 1
mainStroke.Parent = mainFrame

-- ─── Header Bar ──────────────────────────────────────────────────────────────

local header = Instance.new("Frame")
header.Name = "Header"
header.Size = UDim2.new(1, 0, 0, 28)
header.Position = UDim2.new(0, 0, 0, 0)
header.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
header.BackgroundTransparency = 0.93
header.BorderSizePixel = 0
header.Parent = mainFrame

local headerCorner = Instance.new("UICorner")
headerCorner.CornerRadius = UDim.new(0, 6)
headerCorner.Parent = header

-- Red accent square
local accentDot = Instance.new("Frame")
accentDot.Size = UDim2.new(0, 7, 0, 7)
accentDot.Position = UDim2.new(0, 10, 0.5, -3)
accentDot.BackgroundColor3 = Color3.fromRGB(226, 35, 26)
accentDot.BorderSizePixel = 0
accentDot.Parent = header

local accentCorner = Instance.new("UICorner")
accentCorner.CornerRadius = UDim.new(0, 2)
accentCorner.Parent = accentDot

-- "PERFORMANCE" label
local headerLabel = Instance.new("TextLabel")
headerLabel.Size = UDim2.new(1, -60, 1, 0)
headerLabel.Position = UDim2.new(0, 24, 0, 0)
headerLabel.BackgroundTransparency = 1
headerLabel.Text = "PERFORMANCE"
headerLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
headerLabel.TextTransparency = 0.3
headerLabel.TextSize = 10
headerLabel.Font = Enum.Font.GothamBold
headerLabel.TextXAlignment = Enum.TextXAlignment.Left
headerLabel.Parent = header

-- LIVE badge
local liveBadge = Instance.new("TextLabel")
liveBadge.Size = UDim2.new(0, 36, 0, 16)
liveBadge.Position = UDim2.new(1, -44, 0.5, -8)
liveBadge.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
liveBadge.BackgroundTransparency = 0.9
liveBadge.Text = "LIVE"
liveBadge.TextColor3 = Color3.fromRGB(255, 255, 255)
liveBadge.TextTransparency = 0.55
liveBadge.TextSize = 8
liveBadge.Font = Enum.Font.GothamBold
liveBadge.BorderSizePixel = 0
liveBadge.Parent = header

local liveCorner = Instance.new("UICorner")
liveCorner.CornerRadius = UDim.new(0, 3)
liveCorner.Parent = liveBadge

-- ─── Big FPS Number ───────────────────────────────────────────────────────────

local fpsLabel = Instance.new("TextLabel")
fpsLabel.Name = "FPSLabel"
fpsLabel.Size = UDim2.new(1, -60, 0, 54)
fpsLabel.Position = UDim2.new(0, 12, 0, 28)
fpsLabel.BackgroundTransparency = 1
fpsLabel.Text = "--"
fpsLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
fpsLabel.TextSize = 48
fpsLabel.Font = Enum.Font.GothamBold
fpsLabel.TextXAlignment = Enum.TextXAlignment.Left
fpsLabel.Parent = mainFrame

-- "FPS" unit label
local fpsUnit = Instance.new("TextLabel")
fpsUnit.Size = UDim2.new(0, 40, 0, 20)
fpsUnit.Position = UDim2.new(0, 12, 0, 70)
fpsUnit.BackgroundTransparency = 1
fpsUnit.Text = "FPS"
fpsUnit.TextColor3 = Color3.fromRGB(255, 255, 255)
fpsUnit.TextTransparency = 0.6
fpsUnit.TextSize = 11
fpsUnit.Font = Enum.Font.GothamBold
fpsUnit.TextXAlignment = Enum.TextXAlignment.Left
fpsUnit.Parent = mainFrame

-- ─── Status Row ──────────────────────────────────────────────────────────────

local statusDot = Instance.new("Frame")
statusDot.Name = "StatusDot"
statusDot.Size = UDim2.new(0, 6, 0, 6)
statusDot.Position = UDim2.new(0, 12, 0, 96)
statusDot.BackgroundColor3 = Color3.fromRGB(74, 222, 128)
statusDot.BorderSizePixel = 0
statusDot.Parent = mainFrame

local dotCorner = Instance.new("UICorner")
dotCorner.CornerRadius = UDim.new(1, 0)
dotCorner.Parent = statusDot

local statusLabel = Instance.new("TextLabel")
statusLabel.Name = "StatusLabel"
statusLabel.Size = UDim2.new(0, 80, 0, 16)
statusLabel.Position = UDim2.new(0, 24, 0, 89)
statusLabel.BackgroundTransparency = 1
statusLabel.Text = "Excellent"
statusLabel.TextColor3 = Color3.fromRGB(74, 222, 128)
statusLabel.TextSize = 10
statusLabel.Font = Enum.Font.GothamBold
statusLabel.TextXAlignment = Enum.TextXAlignment.Left
statusLabel.Parent = mainFrame

local avgLabel = Instance.new("TextLabel")
avgLabel.Name = "AvgLabel"
avgLabel.Size = UDim2.new(0, 80, 0, 16)
avgLabel.Position = UDim2.new(1, -90, 0, 89)
avgLabel.BackgroundTransparency = 1
avgLabel.Text = "avg: --"
avgLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
avgLabel.TextTransparency = 0.65
avgLabel.TextSize = 9
avgLabel.Font = Enum.Font.Gotham
avgLabel.TextXAlignment = Enum.TextXAlignment.Right
avgLabel.Parent = mainFrame

-- ─── Divider ─────────────────────────────────────────────────────────────────

local divider = Instance.new("Frame")
divider.Size = UDim2.new(1, -24, 0, 1)
divider.Position = UDim2.new(0, 12, 0, 110)
divider.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
divider.BackgroundTransparency = 0.92
divider.BorderSizePixel = 0
divider.Parent = mainFrame

-- ─── Min / Avg / Max Stats Row ───────────────────────────────────────────────

local statsFrame = Instance.new("Frame")
statsFrame.Size = UDim2.new(1, 0, 0, 36)
statsFrame.Position = UDim2.new(0, 0, 0, 112)
statsFrame.BackgroundTransparency = 1
statsFrame.BorderSizePixel = 0
statsFrame.Parent = mainFrame

-- Resize main frame to fit stats
mainFrame.Size = UDim2.new(0, 200, 0, 148)

local function makeStatBlock(labelText, xPos)
	local block = Instance.new("Frame")
	block.Size = UDim2.new(0, 60, 1, 0)
	block.Position = UDim2.new(0, xPos, 0, 0)
	block.BackgroundTransparency = 1
	block.BorderSizePixel = 0
	block.Parent = statsFrame

	local val = Instance.new("TextLabel")
	val.Size = UDim2.new(1, 0, 0, 20)
	val.Position = UDim2.new(0, 0, 0, 4)
	val.BackgroundTransparency = 1
	val.Text = "--"
	val.TextColor3 = Color3.fromRGB(255, 255, 255)
	val.TextSize = 14
	val.Font = Enum.Font.GothamBold
	val.TextXAlignment = Enum.TextXAlignment.Center
	val.Parent = block

	local lbl = Instance.new("TextLabel")
	lbl.Size = UDim2.new(1, 0, 0, 12)
	lbl.Position = UDim2.new(0, 0, 0, 22)
	lbl.BackgroundTransparency = 1
	lbl.Text = labelText
	lbl.TextColor3 = Color3.fromRGB(255, 255, 255)
	lbl.TextTransparency = 0.7
	lbl.TextSize = 8
	lbl.Font = Enum.Font.GothamBold
	lbl.TextXAlignment = Enum.TextXAlignment.Center
	lbl.Parent = block

	return val
end

local statMin = makeStatBlock("MIN", 10)
local statAvg = makeStatBlock("AVG", 72)
local statMax = makeStatBlock("MAX", 134)

-- ─── FPS Logic ───────────────────────────────────────────────────────────────

local frameCount = 0
local elapsed = 0
local currentFPS = 0

local fpsHistory = {}
local fpsMin = math.huge
local fpsMax = 0
local fpsSum = 0
local fpsSamples = 0

local function getColor(fps)
	if fps >= 55 then
		return Color3.fromRGB(74, 222, 128), "Excellent"
	elseif fps >= 40 then
		return Color3.fromRGB(163, 230, 53), "Good"
	elseif fps >= 30 then
		return Color3.fromRGB(250, 204, 21), "Okay"
	elseif fps >= 20 then
		return Color3.fromRGB(251, 146, 60), "Low"
	else
		return Color3.fromRGB(248, 113, 113), "Critical"
	end
end

RunService.RenderStepped:Connect(function(dt)
	frameCount += 1
	elapsed += dt

	if elapsed >= 0.25 then
		currentFPS = math.round(frameCount / elapsed)
		frameCount = 0
		elapsed = 0

		-- Update history
		table.insert(fpsHistory, currentFPS)
		if #fpsHistory > 60 then
			table.remove(fpsHistory, 1)
		end

		-- Stats
		if currentFPS < fpsMin then fpsMin = currentFPS end
		if currentFPS > fpsMax then fpsMax = currentFPS end
		fpsSum += currentFPS
		fpsSamples += 1
		local avg = math.round(fpsSum / fpsSamples)

		-- Color + status
		local color, status = getColor(currentFPS)

		-- Update UI
		fpsLabel.Text = tostring(currentFPS)
		fpsLabel.TextColor3 = color

		statusDot.BackgroundColor3 = color
		statusLabel.Text = status
		statusLabel.TextColor3 = color

		avgLabel.Text = "avg: " .. avg

		statMin.Text = fpsMin == math.huge and "--" or tostring(fpsMin)
		statAvg.Text = tostring(avg)
		statMax.Text = tostring(fpsMax)
	end
end)
