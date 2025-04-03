local Settings = {
  NoFallDamage = false
}

local oldNamecall
oldNamecall = hookmetamethod(game, "__namecall", function(self, ...)
    local method = getnamecallmethod()
    
    if not checkcaller() and method == "FireServer" then
        if Settings.NoFallDamage and tostring(self) == "__DFfDD" then
            return
        end
    end
    
    return oldNamecall(self, ...)
end)

PlayerTab:AddToggle({
    Name = "Anti Fall Damage",
    Default = false,
    Callback = function(Value)
        Settings.NoFallDamage = Value
    end
})

