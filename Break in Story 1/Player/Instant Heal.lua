local GodMode = false

Farm:AddToggle({ 
    Name = "God Mode", 
    Default = false,
    Callback = function(Value)
        GodMode = Value  -- Update the toggle state

        -- Start or stop the loop based on toggle state
        if GodMode then
            spawn(function()
                while GodMode do
                    wait(0)  -- Add a short delay to prevent the loop from running too fast
                    local args = {
                        [1] = 15,
                        [2] = "Cookie"
                    }
                    
                    game:GetService("ReplicatedStorage"):WaitForChild("RemoteEvents"):WaitForChild("Energy"):FireServer(unpack(args))                    
                end
            end)
        end
    end    
})
