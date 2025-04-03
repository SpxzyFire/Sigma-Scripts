local Settings = {
    NoBarbwire = false
}

local oldNamecall
oldNamecall = hookmetamethod(game, "__namecall", function(self, ...)
    local method = getnamecallmethod()
    
    if not checkcaller() and method == "FireServer" then
        if Settings.NoBarbwire and tostring(self) == "BHHh" then
            return
        end
    end
    
    return oldNamecall(self, ...)
end)

PlayerTab:AddToggle({
    Name = "Anti Barbwire",
    Default = false,
    Callback = function(Value)
        Settings.NoBarbwire = Value
    end
})
