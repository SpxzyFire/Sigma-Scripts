local Settings = {
    NoRagdoll = false,
}

local oldNamecall
oldNamecall = hookmetamethod(game, "__namecall", function(self, ...)
    local method = getnamecallmethod()
    
        if Settings.NoRagdoll and tostring(self) == "__--r" then
            return
        end
  end
    
    return oldNamecall(self, ...)
end)

PlayerTab:AddToggle({
    Name = "Anti Break Limbs",
    Default = false,
    Callback = function(Value)
        Settings.NoRagdoll = Value
    end
})

