local totemLocations = {
    ["Aurora Totem"] = Vector3.new(-1811, -137, -3282),
    ["Smokescreen Totem"] = Vector3.new(2789, 140, -625),
    ["Windset Totem"] = Vector3.new(2849, 178, 2702),
    ["Tempest Totem"] = Vector3.new(35, 133, 1943),
    ["Sundial Totem"] = Vector3.new(-1148, 134, -1075),
    ["Eclipse Totem"] = Vector3.new(5968, 274, 838),
    ["Meteor Totem"] = Vector3.new(-1948, 275, 230),
    ["Bizzard Totem"] = Vector3.new(20145, 743, 5805),
    ["Avalanche Totem"] = Vector3.new(19710, 468, 6052),
    ["Zeus Storm Totem"] = Vector3.new(-4325, -628, 2686)
}

-- Add the dropdown for Totems
MiscTab:AddDropdown({
    Name = "Totem Teleport",  -- Name of the dropdown
    Default = "",  -- Default value when the GUI is opened
    Options = {
        "Aurora Totem", "Smokescreen Totem", "Windset Totem", "Tempest Totem", 
        "Sundial Totem", "Eclipse Totem", "Meteor Totem", "Bizzard Totem", 
        "Avalanche Totem", "Zeus Storm Totem"
    },  -- List of totem options
    Callback = function(Value)
        -- Get the player and their character
        local player = game.Players.LocalPlayer
        local character = player.Character or player.CharacterAdded:Wait()

        -- Check if the selected value exists in the totemLocations table
        local location = totemLocations[Value]
        
        if location then
            -- Teleport the player to the selected location
            character:SetPrimaryPartCFrame(CFrame.new(location))
            print("Teleported to " .. Value)
        else
            print("Totem location not found!")
        end
    end    
})
