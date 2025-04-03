# Directly Buying a Pet
this may sound weird, but it is exactly what it sounds like
instead of gambling/rolling for a pet, we will just directly buy it!
When executing the remote, if the selected pet wasnt bought, it's because you dont have required gems to buy it :(

# Making the Dropdown (Using Orion)
we will need to make a dropdown for us to be able to choose the pet
we will want to directly buy using gems, in this case we dont want to
instantly buy the pet we have selected, so we will be adding a button 
so the user we can buy it after we have selected the proper pet
```lua
local petNames = {
    "Red Bunny",
    "Red Kitty",
    "Green Vampy",
    "Blue Bunny",
    "Dark Golem",
    "Silver Dog",
    "Pink Butterfly",
    "Purple Pegasus",
    "Yellow Squeak",
    "Yellow Butterfly",
    "Green Golem",
    "Golden Angel",
    "Orange Pegasus",
    "Divine Pegasus",
    "Golden Phoenix",
    "Orange Falcon",
    "Green Firecaster",
    "Blue Firecaster",
    "White Phoenix",
    "Red Phoenix",
    "Golden Viking",
    "Speedy Sensei",
    "Maestro Dog",
    "Red Firecaster",
    "Flaming Hedgehog",
    "Soul Fusion Dog",
    "Hypersonic Pegasus",
    "Dark Soul Birdie",
    "Eternal Nebula Dragon",
    "Shadow Edge Kitty",
    "Ultimate Overdrive Bunny"
}

local selectedPet = ""

Pets:AddDropdown({
    Name = "Dropdown",
    Default = "Pick the pet you wish to dupe",
    Options = petNames,
    Callback = function(Value)
        selectedPet = Value
        print("Selected pet: " .. selectedPet)
    end    
})

Pets:AddButton({
    Name = "Dupe Pet",
    Callback = function()
        if selectedPet == "" then
            print("No pet selected!")
            return
        end

        local ohInstance1 = game:GetService("ReplicatedStorage").cPetShopFolder[selectedPet]
        
        if ohInstance1 then
            game:GetService("ReplicatedStorage").cPetShopRemote:InvokeServer(ohInstance1)
            print("Dupe Pet button pressed for: " .. selectedPet)
        else
            print("Pet not found in Pet Shop folder.")
        end
    end    
})
```

# Toggle
If you just want to mass dupe (using a toggle)
just add this under the first script
```
Pets:AddToggle({
    Name = "Mass Dupe",
    Default = false,
    Callback = function(Value)
        autoDupe = Value
        if autoDupe then
            print("Mass dupe enabled for: " .. selectedPet)
            while autoDupe do
                if selectedPet ~= "" then
                    local ohInstance1 = game:GetService("ReplicatedStorage").cPetShopFolder[selectedPet]
                    if ohInstance1 then
                        game:GetService("ReplicatedStorage").cPetShopRemote:InvokeServer(ohInstance1)
                        print("Mass duping pet: " .. selectedPet)
                    end
                end
                wait(0.1)
            end
        else
            print("Mass dupe disabled.")
        end
    end    
})
```
