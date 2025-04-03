local Settings = {
NoSmoke = false
}

Workspace.Debris.ChildAdded:Connect(function(child)
    if child.Name == "SmokeExplosion" and Settings.NoSmoke then
        task.wait(0.1)
        child:Destroy()
    end
end)

PlayerTab:AddToggle({
    Name = "No Smoke Grenades",
    Default = false,
    Callback = function(Value)
        Settings.NoSmoke = Value
    end
})
