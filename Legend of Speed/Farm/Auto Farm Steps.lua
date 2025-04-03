local StepFarmEnabled = false
local ohString1 = "collectOrb"
local ohString2 = "Ethereal Orb"
local ohString3 = "City"

Farm:AddToggle({ 
    Name = "Farm Steps", 
    Default = false,
    Callback = function(Value)
        StepFarmEnabled = Value

        if StepFarmEnabled then
            spawn(function()
                while StepFarmEnabled do
                    for i = 1, 100 do
                        game:GetService("ReplicatedStorage").rEvents.orbEvent:FireServer(ohString1, ohString2, ohString3)
                    end
                    
                    wait(0.1)
                end
            end)
        end
    end    
})
