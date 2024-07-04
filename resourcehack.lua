function IncreaseResource(resourceName, amount)
    local player = game.Players.LocalPlayer
    if player:FindFirstChild("leaderstats") then
        local resource = player.leaderstats:FindFirstChild(resourceName)
        if resource then
            resource.Value = resource.Value + amount
        end
    end
end