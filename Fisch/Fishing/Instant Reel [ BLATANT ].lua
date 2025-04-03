reelingSection:AddToggle({
    Name = "Instant Reel (Blatant)",
    Default = false,
    Callback = function(Value)
        StopCoroutine("InstantReel") -- Stop existing coroutine
        if Value then
            Coroutines.InstantReel = coroutine.create(function()
                while task.wait() and Value do
                    pcall(function()
                        local ReelUI = LocalPlayer.PlayerGui:FindFirstChild("reel")
                        if ReelUI then
                            local Bar = ReelUI:FindFirstChild("bar")
                            if Bar then
                                local ReelScript = Bar:FindFirstChild("reel")
                                if ReelScript and ReelScript.Enabled == true then
                                    Remotes.ReelFinished:FireServer(100, true)
                                end
                            end
                        end
                    end)
                end
            end)
            coroutine.resume(Coroutines.InstantReel)
        end
    end
})
