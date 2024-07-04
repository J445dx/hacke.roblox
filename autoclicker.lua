local autoclickerEnabled = false

function ToggleAutoClicker()
    autoclickerEnabled = not autoclickerEnabled
    local player = game.Players.LocalPlayer
    local mouse = player:GetMouse()

    while autoclickerEnabled do
        mouse1click()
        wait(0.1)
    end
end