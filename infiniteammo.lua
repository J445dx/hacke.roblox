local infiniteAmmoEnabled = false

function ToggleInfiniteAmmo()
    infiniteAmmoEnabled = not infiniteAmmoEnabled
    local player = game.Players.LocalPlayer

    while infiniteAmmoEnabled do
        local tool = player.Backpack:FindFirstChildOfClass("Tool") or player.Character:FindFirstChildOfClass("Tool")
        if tool and tool:FindFirstChild("Ammo") then
            tool.Ammo.Value = math.huge
        end
        wait(0.1)
    end
end