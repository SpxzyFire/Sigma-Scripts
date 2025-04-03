local Settings = {
    NoFlashbang = false,
}

Workspace.Camera.ChildAdded:Connect(function(child)
    if child.Name == "BlindEffect" and Settings.NoFlashbang then
        child.Enabled = false
    end
end)

PlayerTab:AddToggle({
    Name = "No Flashbang",
    Default = false,
    Callback = function(Value)
        Settings.NoFlashbang = Value
    end
})
