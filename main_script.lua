-- Carregar funções extras
local function loadScript(name)
    loadstring(game:HttpGet("https://raw.githubusercontent.com/J445dx/Roblox.lua/main/" .. name .. ".lua"))()
end

local scripts = {
    "esp", "aimbot", "wallhack", "speedhack", "noclip", "godmode", "flyhack",
    "autoclicker", "triggerbot", "radarhack", "teleporthack", "itemspawner",
    "resourcehack", "infiniteammo", "healthhack", "jumphack", "silentaim",
    "norecoil", "antikick", "antiban"
}

for _, script in ipairs(scripts) do
    loadScript(script)
end

-- Criar ScreenGui
local screenGui = Instance.new("ScreenGui")
screenGui.Name = "MenuGui"
screenGui.Parent = game.CoreGui

-- Criar Frame do Menu
local menuFrame = Instance.new("Frame")
menuFrame.Size = UDim2.new(0, 400, 0, 700)
menuFrame.Position = UDim2.new(0.5, -200, 0.5, -350)
menuFrame.BackgroundColor3 = Color3.new(0.1, 0.1, 0.1)
menuFrame.Parent = screenGui

-- Título do Menu
local titleLabel = Instance.new("TextLabel")
titleLabel.Size = UDim2.new(1, 0, 0, 50)
titleLabel.Position = UDim2.new(0, 0, 0, 0)
titleLabel.BackgroundColor3 = Color3.new(1, 0, 0)
titleLabel.TextColor3 = Color3.new(1, 1, 1)
titleLabel.Text = "MODDED BY J445dx"
titleLabel.TextSize = 24
titleLabel.Parent = menuFrame

-- Função para criar um botão no menu
function createButton(text, position, callback)
    local button = Instance.new("TextButton")
    button.Size = UDim2.new(1, -20, 0, 40)
    button.Position = UDim2.new(0, 10, 0, position)
    button.BackgroundColor3 = Color3.new(0.4, 0.4, 0.4)
    button.TextColor3 = Color3.new(1, 1, 1)
    button.Text = text
    button.Parent = menuFrame
    button.MouseButton1Click:Connect(callback)
end

-- Invisibilidade
local invisible = false
function toggleInvisibility()
    invisible = not invisible
    local player = game.Players.LocalPlayer
    local character = player.Character or player.CharacterAdded:Wait()
    for _, part in pairs(character:GetDescendants()) do
        if part:IsA("BasePart") or part:IsA("Decal") or part:IsA("ParticleEmitter") then
            part.Transparency = invisible and 1 or 0
        elseif part:IsA("Humanoid") then
            part.HealthDisplayDistance = invisible and 0 or 100
            part.NameDisplayDistance = invisible and 0 or 100
        end
    end
end

-- Aumentar Tamanho
function increaseSize()
    local player = game.Players.LocalPlayer
    local character = player.Character or player.CharacterAdded:Wait()
    for _, part in pairs(character:GetChildren()) do
        if part:IsA("BasePart") then
            part.Size = part.Size * 1.1
        end
    end
end

-- Reduzir Tamanho
function decreaseSize()
    local player = game.Players.LocalPlayer
    local character = player.Character or player.CharacterAdded:Wait()
    for _, part in pairs(character:GetChildren()) do
        if part:IsA("BasePart") then
            part.Size = part.Size * 0.9
        end
    end
end

-- Aimbot
local aimbotEnabled = false
function toggleAimbot()
    aimbotEnabled = not aimbotEnabled
    local player = game.Players.LocalPlayer
    local mouse = player:GetMouse()

    mouse.Button1Down:Connect(function()
        if aimbotEnabled then
            local closestPlayer = GetClosestPlayer()
            if closestPlayer and closestPlayer.Character and closestPlayer.Character:FindFirstChild("HumanoidRootPart") then
                mouse.TargetFilter = closestPlayer.Character
                local aimAt = closestPlayer.Character.HumanoidRootPart
                mouse.Hit = CFrame.new(aimAt.Position)
            end
        end
    end)
end

function GetClosestPlayer()
    local closestPlayer = nil
    local shortestDistance = math.huge
    local localPlayer = game.Players.LocalPlayer
    local localCharacter = localPlayer.Character or localPlayer.CharacterAdded:Wait()
    local localRoot = localCharacter:WaitForChild("HumanoidRootPart")

    for _, player in pairs(game.Players:GetPlayers()) do
        if player ~= localPlayer and player.Team ~= localPlayer.Team and player.Character and player.Character:FindFirstChild("HumanoidRootPart") then
            local distance = (localRoot.Position - player.Character.HumanoidRootPart.Position).Magnitude
            if distance < shortestDistance then
                closestPlayer = player
                shortestDistance = distance
            end
        end
    end

    return closestPlayer
end

-- Aumentar Velocidade
local speed = 16
function increaseSpeed()
    speed = speed + 5
    local player = game.Players.LocalPlayer
    local character = player.Character or player.CharacterAdded:Wait()
    local humanoid = character:FindFirstChildOfClass("Humanoid")
    if humanoid then
        humanoid.WalkSpeed = speed
    end
end

-- Adicionar botões ao menu
createButton("Toggle Invisibility", 60, toggleInvisibility)
createButton("Increase Size", 110, increaseSize)
createButton("Decrease Size", 160, decreaseSize)
createButton("Toggle Aimbot", 210, toggleAimbot)
createButton("Increase Speed", 260, increaseSpeed)

-- Mostrar ou esconder o menu ao clicar no botão flutuante
local floatButton = Instance.new("TextButton")
floatButton.Size = UDim2.new(0, 100, 0, 50)
floatButton.Position = UDim2.new(0, 10, 0, 10)
floatButton.BackgroundColor3 = Color3.new(1, 0, 0)
floatButton.TextColor3 = Color3.new(1, 1, 1)
floatButton.Text = "Toggle Menu"
floatButton.Parent = screenGui
floatButton.MouseButton1Click:Connect(function()
    menuFrame.Visible = not menuFrame.Visible
end)