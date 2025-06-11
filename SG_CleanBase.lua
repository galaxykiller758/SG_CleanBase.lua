--// Star Glitcher Base Remastered + Patched by ReapsReality (Xeno-Ready)

-- Notification system with fallback
local notifLibrary = nil
local success, result = pcall(function()
    notifLibrary = loadstring(game:HttpGet("https://raw.githubusercontent.com/IceMinisterq/Notification-Library/main/Library.lua"))()
end)
if not success then
    notifLibrary = {
        SendNotification = function(title, text, duration)
            warn("[Notification] " .. title .. ": " .. text)
        end
    }
end

-- Notify script loaded and patch credit
notifLibrary:SendNotification("Star Glitcher Patched", "Fixed version by ReapsReality", 4)

-- GUI Cleanup
if game.CoreGui:FindFirstChild("StarGlitcherUI") then
    game.CoreGui.StarGlitcherUI:Destroy()
end

-- GUI Setup
local sgGui = Instance.new("ScreenGui", game.CoreGui)
sgGui.Name = "StarGlitcherUI"

local mainFrame = Instance.new("Frame", sgGui)
mainFrame.Size = UDim2.new(0, 300, 0, 150)
mainFrame.Position = UDim2.new(0.5, -150, 0.5, -75)
mainFrame.BackgroundColor3 = Color3.fromRGB(35,35,35)
mainFrame.BorderSizePixel = 0

local title = Instance.new("TextLabel", mainFrame)
title.Size = UDim2.new(1, 0, 0, 30)
title.Text = "Star Glitcher Patched by ReapsReality"
title.TextColor3 = Color3.new(1, 1, 1)
title.BackgroundTransparency = 1
title.Font = Enum.Font.GothamBold
title.TextScaled = true

-- Sound Cleanup
for _, s in ipairs(game.CoreGui:GetDescendants()) do
    if s:IsA("Sound") then
        s:Destroy()
    end
end

-- Move System Example
local sound = Instance.new("Sound", game.CoreGui)
sound.SoundId = "rbxassetid://9118828566"
sound.Volume = 4

local moveButton = Instance.new("TextButton", mainFrame)
moveButton.Size = UDim2.new(0.9, 0, 0, 30)
moveButton.Position = UDim2.new(0.05, 0, 0, 50)
moveButton.Text = "Play Move Sound"
moveButton.Font = Enum.Font.Gotham
moveButton.TextColor3 = Color3.new(1, 1, 1)
moveButton.BackgroundColor3 = Color3.fromRGB(55,55,55)
moveButton.BorderSizePixel = 0

moveButton.MouseButton1Click:Connect(function()
    if sound.IsLoaded then
        sound:Play()
        notifLibrary:SendNotification("Move Used", "Sound move triggered!", 2)
    else
        notifLibrary:SendNotification("Error", "Sound not loaded.", 2)
    end
end)

-- Idle Animation Example
local anim = Instance.new("Animation")
anim.AnimationId = "rbxassetid://507766666"

local char = game.Players.LocalPlayer.Character
if char and char:FindFirstChild("Humanoid") then
    local track = char.Humanoid:LoadAnimation(anim)
    track:Play()
end

-- Final Notification
notifLibrary:SendNotification("Setup Complete", "All systems initialized.", 3)
