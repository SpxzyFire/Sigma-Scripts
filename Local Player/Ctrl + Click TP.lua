local ControlClickTPEnabled = false

localPlayerSection:AddToggle({
    Name = "Control + Click TP",
    Default = false,
    Callback = function(Value)
        ControlClickTPEnabled = Value
        if Value then
            local Connection
            Connection = UserInputService.InputBegan:Connect(function(input, gameProcessed)
                if gameProcessed then return end
                if input.UserInputType == Enum.UserInputType.MouseButton1 and UserInputService:IsKeyDown(Enum.KeyCode.LeftControl) then
                    local Mouse = LocalPlayer:GetMouse()
                    local Target = Mouse.Hit.Position
                    LocalPlayer.Character:MoveTo(Target)
                end
            end)
            -- Disconnect when toggle is off
            if not Value then
                Connection:Disconnect()
            end
        end
    end
})
