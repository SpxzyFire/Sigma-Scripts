local JumppowerApplyEnabled = false
local CurrentJumppower = 50

localPlayerSection:AddToggle({
    Name = "Apply Jumppower",
    Default = false,
    Callback = function(Value)
        JumppowerApplyEnabled = Value
        if Value then
            coroutine.resume(coroutine.create(function()
                while JumppowerApplyEnabled do
                    task.wait()
                    pcall(function()
                        LocalPlayer.Character:FindFirstChildOfClass("Humanoid").JumpPower = CurrentJumppower
                    end)
                end
            end))
        end
    end
})

localPlayerSection:AddSlider({
    Name = "Jumppower",
    Min = 50,
    Max = 200,
    Default = 50,
    Color = Color3.fromRGB(255, 255, 255),
    Increment = 1,
    ValueName = "studs",
    Callback = function(Value)
        CurrentJumppower = Value
        if JumppowerApplyEnabled then
            LocalPlayer.Character:FindFirstChildOfClass("Humanoid").JumpPower = Value
        end
    end
})
