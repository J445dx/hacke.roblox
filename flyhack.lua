local flyEnabled = false

function ToggleFlyHack()
    flyEnabled = not flyEnabled
    local player = game.Players.LocalPlayer
    local humanoidRootPart = player.Character and player.Character:FindFirstChild("HumanoidRootPart")

    while flyEnabled do
        humanoidRootPart.Velocity = Vector3.new(0, 50, 0)
        wait(0.1)
    end
end