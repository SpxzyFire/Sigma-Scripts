PlayerTab:AddButton({
    Name = "Delete All Doors",
    Callback = function()
        for _, door in pairs(Workspace.Map.Doors:GetChildren()) do
            door:Destroy()
        end
    end
})
