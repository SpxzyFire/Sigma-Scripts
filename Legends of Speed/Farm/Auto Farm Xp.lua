local XpFarmEnabled = false
local ohString1 = "collectOrb"
local ohString2 = "Yellow Orb"
local ohString3 = "City"

Farm:AddToggle({ 
    Name = "Farm EXP", 
    Default = false,
    Callback = function(Value)
        autoSwingEnabled = Value

        if autoSwingEnabled then
            spawn(function()
                while autoSwingEnabled do
                    for i = 1, 100 do
                        game:GetService("ReplicatedStorage").rEvents.orbEvent:FireServer(ohString1, ohString2, ohString3)
                    end
                    
                    wait(0.1)
                end
            end)
        end
    end    
})
