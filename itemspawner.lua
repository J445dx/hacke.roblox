function SpawnItem(itemName)
    local player = game.Players.LocalPlayer
    local backpack = player.Backpack
    local tool = Instance.new("Tool")
    tool.Name = itemName
    tool.Parent = backpack
end