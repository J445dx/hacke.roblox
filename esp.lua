local espEnabled = false

function ToggleESP()
    espEnabled = not espEnabled

    if espEnabled then
        while espEnabled do
            for _, player in pairs(game.Players:GetPlayers()) do
                if player ~= game.Players.LocalPlayer and player.Character and player.Character:FindFirstChild("HumanoidRootPart") then
                    if not player.Character:FindFirstChild("ESPBox") then
                        local espBox = Instance.new("BoxHandleAdornment")
                        espBox.Name = "ESPBox"
                        espBox.Adornee = player.Character.HumanoidRootPart
                        espBox.Size = player.Character.HumanoidRootPart.Size
                        espBox.Color3 = Color3.new(1, 0, 0)
                        espBox.Transparency = 0.5
                        espBox.ZIndex = 1
                        espBox.AlwaysOnTop = true
                        espBox.Parent = player.Character.HumanoidRootPart
                    end
                end
            end
            wait(1)
        end
    else
        for _, player in pairs(game.Players:GetPlayers()) do
            if player.Character and player.Character:FindFirstChild("ESPBox") then
                player.Character.ESPBox:Destroy()
            end
        end
    end
end