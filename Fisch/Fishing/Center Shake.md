# Read 
You cannot use this feature with auto shake enabled, it will break the auto shake :(
Btw what it does is that it makes every shake button smaller and placed in the middle of the screen (good if using auto clicker ig?)
```lua
otherSection:AddToggle({
    Name = "Center Shake",
    Default = false,
    Callback = function(Value)
        StopCoroutine("CenterShake") -- Stop existing coroutine
        if Value then
            Coroutines.CenterShake = coroutine.create(function()
                while task.wait() and Value do
                    pcall(function()
                        local ShakeUI = LocalPlayer.PlayerGui:FindFirstChild("shakeui")
                        if ShakeUI then
                            local SafeZone = ShakeUI:FindFirstChild("safezone")
                            if SafeZone then
                                -- Disable the script that locks the size of the SafeZone
                                local ConnectScript = SafeZone:FindFirstChild("connect")
                                if ConnectScript then
                                    ConnectScript.Enabled = false
                                end

                                -- Center the SafeZone
                                SafeZone.Size = UDim2.fromOffset(0, 0)
                                SafeZone.Position = UDim2.fromScale(0.5, 0.5)
                                SafeZone.AnchorPoint = Vector2.new(0.5, 0.5)
                            end
                        end
                    end)
                end
            end)
            coroutine.resume(Coroutines.CenterShake)
        end
    end
})
```
