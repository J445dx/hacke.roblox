local speed = 16

function ToggleSpeedhack()
    speed = speed == 16 and 100 or 16
    local player = game.Players.LocalPlayer
    local humanoid = player.Character and player.Character:FindFirstChildOfClass("Humanoid")
    if humanoid then
        humanoid.WalkSpeed = speed
    end
end