local triggerbotEnabled = false

function ToggleTriggerbot()
    triggerbotEnabled = not triggerbotEnabled
    local player = game.Players.LocalPlayer
    local mouse = player:GetMouse()

    while triggerbotEnabled do
        if mouse.Target and mouse.Target.Parent and mouse.Target.Parent:FindFirstChild("Humanoid") then
            mouse1click()
        end
        wait(0.1)
    end
end