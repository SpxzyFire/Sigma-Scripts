local InfiniteJumpEnabled = false

localPlayerSection:AddToggle({
    Name = "Infinite Jump",
    Default = false,
    Callback = function(Value)
        InfiniteJumpEnabled = Value
        if Value then
            UserInputService.JumpRequest:Connect(function()
                if InfiniteJumpEnabled then
                    LocalPlayer.Character:FindFirstChildOfClass("Humanoid"):ChangeState("Jumping")
                end
            end)
        end
    end
})
