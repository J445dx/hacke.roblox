local godModeEnabled = false

function ToggleGodMode()
    godModeEnabled = not godModeEnabled
    local player = game.Players.LocalPlayer
    local humanoid = player.Character and player.Character:FindFirstChildOfClass("Humanoid")
    
    if humanoid then
        humanoid.MaxHealth = godModeEnabled and math.huge or 100
        humanoid.Health = humanoid.MaxHealth
    end
end