local Settings = {
    AutoMode = false
}

GunModsTab:AddToggle({
    Name = "Auto Mode",
    Default = false,
    Flag = "AutoMode",
    Callback = function(Value)
        Settings.AutoMode = Value
        local success, err = pcall(function()
            for _, v in pairs(getgc(true)) do
                if type(v) == "table" and rawget(v, "FireModeSettings") then
                    v.FireModeSettings = Value and { FireMode = "Auto", BurstAmount = 6, BurstRate = 25, CanSwitch = true, SwitchTo = "Auto" } or v.FireModeSettings
                end
            end
        end)
        if not success then warn("Error in Auto Mode: " .. err) end
    end
})
