local autoSwingEnabled = false

Farm:AddToggle({ 
    Name = "Auto Swing", 
    Default = false,
    Callback = function(Value)
        autoSwingEnabled = Value

        if autoSwingEnabled then
            spawn(function()
                while autoSwingEnabled do
                    wait(0) 
                    local args = {
                        [1] = "swingKatana"
                    }

                    game:GetService("Players").LocalPlayer:WaitForChild("ninjaEvent"):FireServer(unpack(args))
                end
            end)
        end
    end    

})
