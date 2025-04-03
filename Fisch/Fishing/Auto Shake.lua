otherSection:AddToggle({
    Name = "Auto Shake",
    Default = false,
    Callback = function(Value)
        StopCoroutine("AutoShake") -- Stop existing coroutine
        if Value then
            Coroutines.AutoShake = coroutine.create(function()
                while task.wait() and Value do
                    pcall(function()
                        local ShakeUI = LocalPlayer.PlayerGui:FindFirstChild("shakeui")
                        if ShakeUI then
                            local SafeZone = ShakeUI:FindFirstChild("safezone")
                            if SafeZone then
                                -- Find the shake button
                                local ShakeButton = SafeZone:FindFirstChildWhichIsA("ImageButton")
                                if ShakeButton then
                                    -- Simulate mouse click on the shake button
                                    local ClickPosition = ShakeButton.AbsolutePosition + ShakeButton.AbsoluteSize / 2
                                    VirtualInputManager:SendMouseButtonEvent(ClickPosition.X, ClickPosition.Y, 0, true, game, 1)
                                    task.wait(0.1)
                                    VirtualInputManager:SendMouseButtonEvent(ClickPosition.X, ClickPosition.Y, 0, false, game, 1)
                                end
                            end
                        end
                    end)
                end
            end)
            coroutine.resume(Coroutines.AutoShake)
        end
    end
})
