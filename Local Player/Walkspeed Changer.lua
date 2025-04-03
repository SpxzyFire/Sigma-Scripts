local CurrentWalkspeed = 16
local WalkspeedApplyEnabled = false

localPlayerSection:AddToggle({
    Name = "Apply Walkspeed",
    Default = false,
    Callback = function(Value)
        WalkspeedApplyEnabled = Value
        if Value then
            coroutine.resume(coroutine.create(function()
                while WalkspeedApplyEnabled do
                    task.wait()
                    pcall(function()
                        LocalPlayer.Character:FindFirstChildOfClass("Humanoid").WalkSpeed = CurrentWalkspeed
                    end)
                end
            end))
        end
    end
})

localPlayerSection:AddSlider({
    Name = "Walkspeed",
    Min = 16,
    Max = 100,
    Default = 16,
    Color = Color3.fromRGB(255, 255, 255),
    Increment = 1,
    ValueName = "studs",
    Callback = function(Value)
        CurrentWalkspeed = Value
        if WalkspeedApplyEnabled then
            LocalPlayer.Character:FindFirstChildOfClass("Humanoid").WalkSpeed = Value
        end
    end
})
