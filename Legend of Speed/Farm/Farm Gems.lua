local GemFarmEnabled = false
local ohString1 = "collectOrb"
local ohString2 = "Infernal Gem"
local ohString3 = "City"

Farm:AddToggle({ 
    Name = "Farm Gems", 
    Default = false,
    Callback = function(Value)
        GemFarmEnabled = Value

        if GemFarmEnabled then
            spawn(function()
                while GemFarmEnabled do
                    for i = 1, 100 do
                        game:GetService("ReplicatedStorage").rEvents.orbEvent:FireServer(ohString1, ohString2, ohString3)
                    end
                    
                    wait(0.1)
                end
            end)
        end
    end    
})
