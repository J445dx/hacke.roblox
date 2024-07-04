local wallhackEnabled = false

function ToggleWallhack()
    wallhackEnabled = not wallhackEnabled

    if wallhackEnabled then
        while wallhackEnabled do
            for _, player in pairs(game.Players:GetPlayers()) do
                if player ~= game.Players.LocalPlayer and player.Character then
                    for _, part in pairs(player.Character:GetChildren()) do
                        if part:IsA("BasePart") then
                            part.Material = Enum.Material.Neon
                            part.Color = Color3.new(1, 0, 0)
                            part.Transparency = 0.5
                        end
                    end
                end
            end
            wait(1)
        end
    else
        for _, player in pairs(game.Players:GetPlayers()) do
            if player.Character then
                for _, part in pairs(player.Character:GetChildren()) do
                    if part:IsA("BasePart") then
                        part.Material = Enum.Material.Plastic
                        part.Transparency = 0
                    end
                end
            end
        end
    end
end