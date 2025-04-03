local crystalNames = { -- naming every crystals
    "Red Crystal",
    "Blue Crystal",
    "Purple Crystal",
    "Lightning Crystal",
    "Snow Crystal",
    "Lava Crystal",
    "Inferno Crystal",
    "Electro Legends Crystal",
    "Jungle Crystal"
}

local selectedCrystal = ""

Crystals:AddDropdown({ -- making sure we can select the proper crystal we want to open
    Name = "Dropdown",
    Default = "Pick the Crystal you wish to buy",
    Options = crystalNames,
    Callback = function(Value)
        selectedCrystal = Value
        print("Selected crystal: " .. selectedCrystal)
    end    
})
 
Crystals:AddButton({ -- manually opening 1 crystal after selecting the crystal from the dropdown
    Name = "Buy Crystal",
    Callback = function()
        if selectedCrystal == "" then
            print("No crystal selected!")
            return
        end

        local ohString1 = "openCrystal"
        local ohString2 = selectedCrystal
        
        game:GetService("ReplicatedStorage").rEvents.openCrystalRemote:InvokeServer(ohString1, ohString2)
        print("Buy Crystal button pressed for: " .. selectedCrystal)
    end    
})


Crystals:AddToggle({ -- automaticly opening crystals after selecting the crystal from the dropdown
    Name = "Mass Buy Crystal",
    Default = false,
    Callback = function(Value)
        autoBuyCrystal = Value
        if autoBuyCrystal then
            print("Mass buy enabled for: " .. selectedCrystal)
            while autoBuyCrystal do
                if selectedCrystal ~= "" then
                    local ohString1 = "openCrystal"
                    local ohString2 = selectedCrystal
                    
                    game:GetService("ReplicatedStorage").rEvents.openCrystalRemote:InvokeServer(ohString1, ohString2)
                    print("Mass buying crystal: " .. selectedCrystal)
                end
                wait(0.1)
            end
        else
            print("Mass buy disabled.")
        end
    end    
})
