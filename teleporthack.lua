function TeleportTo(playerName)
    local player = game.Players.LocalPlayer
    local targetPlayer = game.Players:FindFirstChild(playerName)
    
    if targetPlayer and targetPlayer.Character and targetPlayer.Character:FindFirstChild("HumanoidRootPart") then
        player.Character.HumanoidRootPart.CFrame = targetPlayer.Character.HumanoidRootPart.CFrame
    end
end