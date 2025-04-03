reelingSection:AddToggle({
    Name = "Auto-Reel (Legit)",
    Default = false,
    Callback = function(Value)
        StopCoroutine("AutoReel") -- Stop existing coroutine
        if Value then
            Coroutines.AutoReel = coroutine.create(function()
                while task.wait() and Value do
                    pcall(function()
                        local ReelUI = LocalPlayer.PlayerGui:FindFirstChild("reel")
                        if ReelUI then
                            local Bar = ReelUI:FindFirstChild("bar")
                            if Bar then
                                local PlayerBar = Bar:FindFirstChild("playerbar")
                                local TargetBar = Bar:FindFirstChild("fish")
                                if PlayerBar and TargetBar then
                                    local UnfilteredTargetPosition = PlayerBar.Position:Lerp(TargetBar.Position, 0.7)
                                    local TargetPosition = UDim2.fromScale(math.clamp(UnfilteredTargetPosition.X.Scale, 0.15, 0.85), UnfilteredTargetPosition.Y.Scale)
                                    PlayerBar.Position = TargetPosition
                                end
                            end
                        end
                    end)
                end
            end)
            coroutine.resume(Coroutines.AutoReel)
        end
    end
})
