local Settings = {
    InstantEquip = false
}

GunModsTab:AddToggle({
    Name = "Instant Equip",
    Default = false,
    Flag = "InstantEquip",
    Callback = function(Value)
        Settings.InstantEquip = Value
        local success, err = pcall(function()
            for _, v in pairs(getgc(true)) do
                if type(v) == "table" and rawget(v, "EquipTime") then
                    v.EquipTime = Value and 0 or v.EquipTime
                end
            end
        end)
        if not success then warn("Error in Instant Equip: " .. err) end
    end
})
