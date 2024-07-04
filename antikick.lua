function ToggleAntiKick()
    local mt = getrawmetatable(game)
    local oldNamecall = mt.__namecall

    setreadonly(mt, false)

    mt.__namecall = newcclosure(function(self, ...)
        if getnamecallmethod() == "Kick" then
            return
        end
        return oldNamecall(self, ...)
    end)
end