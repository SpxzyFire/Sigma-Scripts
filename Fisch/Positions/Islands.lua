local locations = {
    ["atlantis"] = Vector3.new(-4265, -603, 1831),
    ["vertigo"] = Vector3.new(-112, -515, 1040),
    ["poseidon puzzle"] = Vector3.new(-3695, -547, 1014),
    ["moosewood"] = Vector3.new(382, 135, 244),
    ["ancientarchives"] = Vector3.new(-3155, -755, 2193),
    ["etherealpuzzle"] = Vector3.new(-4122, -602, 1821),
    ["keepers"] = Vector3.new(1296, -805, -299),
    ["archive"] = Vector3.new(1296, -805, -299),
    ["ancient"] = Vector3.new(-3158, -755, 2214),
    ["northglider"] = Vector3.new(20241, 757, 5756),
    ["arch"] = Vector3.new(999, 131, -1237),
    ["trident"] = Vector3.new(-1479, -226, -2391),
    ["peak"] = Vector3.new(19998, 1136, 5520),
    ["crafting"] = Vector3.new(-3160, -746, 1684),
    ["oilrig"] = Vector3.new(-1901, 225, -486),
    ["sunstone"] = Vector3.new(-933, 132, -1119),
    ["roslitsubmarine"] = Vector3.new(-1332, 133, 313),
    ["bosspool"] = Vector3.new(-2373, -11186, 7123),
    ["deepshop"] = Vector3.new(-979, -245, -2700),
    ["northern"] = Vector3.new(19527, 133, 5293),
    ["podium1"] = Vector3.new(-3464, -2258, 3833),
    ["snow"] = Vector3.new(2649, 142, 2521),
    ["zeuspuzzle"] = Vector3.new(-4296, -670, 2354),
    ["enchantaltar"] = Vector3.new(1311, -805, -103),
    ["podium2"] = Vector3.new(-826, -3274, -710),
    ["anglerminigame"] = Vector3.new(-10085, -9645, 275),
    ["statue"] = Vector3.new(73, 142, -1028),
    ["bunker1"] = Vector3.new(1738, 143, -2435),
    ["mushgrove"] = Vector3.new(2501, 131, -721),
    ["camp2"] = Vector3.new(19757, 415, 5407),
    ["spike"] = Vector3.new(-1255, 138, 1554),
    ["swamp"] = Vector3.new(2501, 131, -721),
    ["camp1"] = Vector3.new(20208, 208, 5279),
    ["thedepthsobby"] = Vector3.new(67, -705, 1231),
    ["anglerbaby"] = Vector3.new(-13527, -11050, 120),
    ["thedepths"] = Vector3.new(568, -704, 1231),
    ["executive"] = Vector3.new(-30, -251, 199),
    ["volcano"] = Vector3.new(-1889, 168, 329),
    ["gamma"] = Vector3.new(2233, -804, 1021),
    ["forsaken"] = Vector3.new(-2498, 137, 1625),
    ["sukenpanel"] = Vector3.new(-4615, -597, 1843),
    ["finalpuzzle"] = Vector3.new(19964, 1138, 5402)
}

-- Add the dropdown
MiscTab:AddDropdown({
    Name = "Place Teleport",  -- Name of the dropdown
    Default = "Choose your Location",  -- Default value when the GUI is opened
    Options = {
        "atlantis", "vertigo", "poseidon puzzle", "moosewood", "ancientarchives",
        "etherealpuzzle", "keepers", "archive", "ancient", "northglider", "arch",
        "trident", "peak", "crafting", "oilrig", "sunstone", "roslitsubmarine", 
        "bosspool", "deepshop", "northern", "podium1", "snow", "zeuspuzzle",
        "enchantaltar", "podium2", "anglerminigame", "statue", "bunker1", 
        "mushgrove", "camp2", "spike", "swamp", "camp1", "thedepthsobby", 
        "anglerbaby", "thedepths", "executive", "volcano", "gamma", "forsaken", 
        "sukenpanel", "finalpuzzle"
    },
    Callback = function(Value)
        -- Get the player and their character
        local player = game.Players.LocalPlayer
        local character = player.Character or player.CharacterAdded:Wait()

        -- Check if the selected value exists in the locations table
        local location = locations[Value]
        
        if location then
            -- Teleport the player to the selected location
            character:SetPrimaryPartCFrame(CFrame.new(location))
            print("Teleported to " .. Value)
        else
            print("Location not found!")
        end
    end    
})
