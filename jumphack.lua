local jumpPower = 50

function IncreaseJumpPower()
    jumpPower = jumpPower + 10
    local player = game.Players.LocalPlayer
    local humanoid = player.Character and player.Character:FindFirstChildOfClass("Humanoid")
    if humanoid then
        humanoid.JumpPower = jumpPower
    end
end