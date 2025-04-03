local Settings = {
NoFailLockpick = false
}

LocalPlayer.PlayerGui.ChildAdded:Connect(function(child)
    if child.Name == "LockpickGUI" and Settings.NoFailLockpick then
        for _, bar in pairs(child.MF["LP_Frame"].Frames:GetChildren()) do
            if bar:FindFirstChild("Bar") then
                bar.Bar.UIScale.Scale = 10
            end
        end
    end
end)

PlayerTab:AddToggle({
    Name = "No Fail Lockpick",
    Default = false,
    Callback = function(Value)
        Settings.NoFailLockpick = Value
    end
})
