local AutoCookie = false

Farm:AddToggle({ 
    Name = "Auto Cookie", 
    Default = false,
    Callback = function(Value)
        AutoCookie = Value

        if AutoCookie then
            spawn(function()
                while AutoCookie do
                    wait(0)
                    local args = {
                        [1] = "Cookie"
                    }
                    
                    game:GetService("ReplicatedStorage"):WaitForChild("RemoteEvents"):WaitForChild("GiveTool"):FireServer(unpack(args))
                    
                end
            end)
        end
    end    
})

