local noRecoilEnabled = false

function ToggleNoRecoil()
    noRecoilEnabled = not noRecoilEnabled
    local player = game.Players.LocalPlayer

    while noRecoilEnabled do
        local tool = player.Backpack:FindFirstChildOfClass("Tool") or player.Character:FindFirstChildOfClass("Tool")
        if tool and tool:FindFirstChild("Recoil") then
            tool.Recoil.Value = 0
        end
        wait(0.1)
    end
end