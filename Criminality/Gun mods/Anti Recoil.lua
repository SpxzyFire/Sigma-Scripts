local Settings = {
    NoRecoil = false
}

GunModsTab:AddToggle({
    Name = "No Recoil",
    Default = false,
    Flag = "NoRecoil",
    Callback = function(Value)
        Settings.NoRecoil = Value
        local success, err = pcall(function()
            for _, v in pairs(getgc(true)) do
                if type(v) == "table" and rawget(v, "Recoil") then
                    v.Recoil = Value and 0 or v.Recoil
                end
            end
        end)
        if not success then
            warn("Error in No Recoil: " .. err)
        end
    end
})
