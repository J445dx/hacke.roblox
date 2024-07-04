local radarEnabled = false

function ToggleRadarHack()
    radarEnabled = not radarEnabled

    while radarEnabled do
        for _, player in pairs(game.Players:GetPlayers()) do
            if player ~= game.Players.LocalPlayer and player.Character and player.Character:FindFirstChild("HumanoidRootPart") then
                local beacon = player.Character:FindFirstChild("Beacon")
                if not beacon then
                    beacon = Instance.new("Part")
                    beacon.Name = "Beacon"
                    beacon.Anchored = true
                    beacon.CanCollide = false
                    beacon.Size = Vector3.new(0.5, 20, 0.5)
                    beacon.Color = Color3.new(1, 0, 0)
                    beacon.Parent = player.Character
                end
                beacon.CFrame = CFrame.new(player.Character.HumanoidRootPart.Position + Vector3.new(0, 10, 0))
            end
        end
        wait(1)
    end
end