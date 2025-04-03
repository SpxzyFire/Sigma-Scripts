local teleportLocations = {
    ["Mirror Area"] = Vector3.new(-1628, -207, -2788),
    ["Inn Keeper"] = Vector3.new(-1652, -214, -2833),
    ["Mel Merchant"] = Vector3.new(-1658, -213, -2819),
    ["Clarence"] = Vector3.new(-1625, -231, -2904),
    ["Sleeper"] = Vector3.new(-1498, -235, -2852),
    ["Desolate Skin"] = Vector3.new(-1573, -289, -2966),
    ["Daisy"] = Vector3.new(582, 165, 216),
    ["Mods Lantern"] = Vector3.new(-39, -247, 196),
    ["Quiet Symph"] = Vector3.new(566, 152, 354),
    ["Lantern Keeper"] = Vector3.new(658, 164, 260),
    ["Paul"] = Vector3.new(382, 137, 347),
    ["Inn Keeper 2"] = Vector3.new(487, 151, 231),
    ["Moosewood Angler"] = Vector3.new(480, 151, 302),
    ["Marc Merchant"] = Vector3.new(466, 151, 224),
    ["Phineas"] = Vector3.new(470, 151, 278),
    ["Moosewood Skin"] = Vector3.new(416, 135, 189),
    ["Lucas"] = Vector3.new(449, 182, 181),
    ["Appraiser"] = Vector3.new(453, 151, 207),
    ["Marchent"] = Vector3.new(466, 151, 224),
    ["Henry"] = Vector3.new(484, 152, 236),
    ["Arnold"] = Vector3.new(320, 134, 264),
    ["Moosewood Shipwright"] = Vector3.new(358, 134, 258),
    ["Captain Ahab"] = Vector3.new(364, 133, 295),
    ["Quiet Synph"] = Vector3.new(566, 152, 354),
    ["Mushgrove Skin"] = Vector3.new(2643, 130, -709),
    ["Mushgrove Guard"] = Vector3.new(2521, 161, -891),
    ["Agaric"] = Vector3.new(2601, 132, -729),
    ["Jack Marrow"] = Vector3.new(-2830, 215, 1517),
    ["Forsaken Skin"] = Vector3.new(-2564, 149, 1645),
    ["Mila Merchant"] = Vector3.new(-2509, 136, 1583),
    ["Spirit of Zeus"] = Vector3.new(-4296, -673, 2354),
    ["Spirit of Hades"] = Vector3.new(-4414, -996, 2048),
    ["Myron Merchant"] = Vector3.new(-4458, -606, 1880),
    ["Spirit of Cronus"] = Vector3.new(-4184, -887, 1828),
    ["Spirit of Athena"] = Vector3.new(-4588, -597, 1846),
    ["Spirit of Ares"] = Vector3.new(-4586, -597, 1839),
    ["Spirit of Nyx"] = Vector3.new(-4449, -594, 1804),
    ["Spirit of Apollo"] = Vector3.new(-4290, -595, 1795),
    ["Inn Keeper Atlantis"] = Vector3.new(-4275, -603, 1818),
    ["Perditus"] = Vector3.new(770, -729, 1385),
    ["Milo Merchant"] = Vector3.new(957, -712, 1263),
    ["The Depths Angler"] = Vector3.new(982, -703, 1232),
    ["Occultus"] = Vector3.new(1023, -703, 1564),
    ["Tenebris"] = Vector3.new(1061, -629, 1310),
    ["The Depths Skin"] = Vector3.new(1037, -806, 1444),
    ["Submersus"] = Vector3.new(1211, -1011, 1316),
    ["Aspicientis"] = Vector3.new(1215, -707, 1321),
    ["Abyssus"] = Vector3.new(1397, -1013, 965),
    ["???"] = Vector3.new(-86, -515, 1136),
    ["Custos"] = Vector3.new(22, -706, 1253),
    ["Leeris"] = Vector3.new(-142, -548, 1426),
    ["Synph"] = Vector3.new(-138, -512, 1132),
    ["Mike Merchant"] = Vector3.new(2718, 157, 2374),
    ["Wilson"] = Vector3.new(2941, 281, 2570),
    ["Snowcap Shipwright"] = Vector3.new(2623, 136, 2401),
    ["Snowcap Skin"] = Vector3.new(2652, 138, 2538),
    ["Mann Merchant"] = Vector3.new(6081, 195, 309),
    ["Chiseler"] = Vector3.new(6087, 195, 295),
    ["Meteoriticist"] = Vector3.new(5922, 262, 596)
}

local dropdownOptions = {}
for name, _ in pairs(teleportLocations) do
    table.insert(dropdownOptions, name)
end

MiscTab:AddDropdown({
    Name = "NPC Tp", 
    Default = "",
    Options = dropdownOptions,
    Callback = function(Value)
        local location = teleportLocations[Value]
        if location then
            game.Players.LocalPlayer.Character:SetPrimaryPartCFrame(CFrame.new(location))
        end
    end    
})
