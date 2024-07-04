local healthHackEnabled = false

function ToggleHealthHack()
    healthHackEnabled = not healthHackEnabled
    local player = game.Players.LocalPlayer
    local humanoid = player.Character and player.Character:FindFirstChildOfClass("Humanoid")

    if humanoid then
        humanoid.MaxHealth = healthHackEnabled and math.huge or 100
        humanoid.Health = humanoid.MaxHealth
    end
end