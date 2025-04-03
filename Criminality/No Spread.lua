local Settings = {
    Spread = false
}

GunModsTab:AddToggle({
    Name = "No Spread",
    Default = false,
    Flag = "Spread",
    Callback = function(Value)
        Settings.Spread = Value
        local success, err = pcall(function()
            if not isfunction(getgc) then
                warn("getgc is not available.")
                return
            end

            for _, v in pairs(getgc(true)) do
                if type(v) == "table" and rawget(v, "Spread") then
                    v.Spread = Value and Settings.SpreadAmount or v.Spread
                end
            end
        end)
        if not success then
            warn("Error in Custom Spread: " .. err)
        end
    end
})
