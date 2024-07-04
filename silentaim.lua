local silentAimEnabled = false

function ToggleSilentAim()
    silentAimEnabled = not silentAimEnabled
    local player = game.Players.LocalPlayer
    local mouse = player:GetMouse()

    mouse.Button1Down:Connect(function()
        if silentAimEnabled then
            local closestPlayer = GetClosestPlayer()
            if closestPlayer and closestPlayer.Character and closestPlayer.Character:FindFirstChild("HumanoidRootPart") then
                mouse.TargetFilter = closestPlayer.Character
                local aimAt = closestPlayer.Character.HumanoidRootPart
                mouse.Hit = CFrame.new(aimAt.Position)
            end
        end
    end)
end