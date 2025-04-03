reelingSection:AddToggle({
    Name = "Always Perfect",
    Default = false,
    Callback = function(Value)
        if Value then
            hookfunction(Remotes.ReelFinished.FireServer, function(self, percentage, isPerfect)
                return Remotes.ReelFinished.FireServer(self, 100, true)
            end)
        else
            -- Restore original function if needed
        end
    end
})
