local noclipEnabled = false

function ToggleNoclip()
    noclipEnabled = not noclipEnabled
    local player = game.Players.LocalPlayer

    game:GetService("RunService").Stepped:Connect(function()
        if noclipEnabled then
            for _, part in pairs(player.Character:GetDescendants()) do
                if part:IsA("BasePart") then
                    part.CanCollide = false
                end
            end
        end
    end)
end