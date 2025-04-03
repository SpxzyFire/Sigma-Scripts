local PepperSpray = {
    InfiniteSpray = false
}

game:GetService("RunService").RenderStepped:Connect(function()
    wait(1)
    if PepperSpray.InfiniteSpray and game.Players.LocalPlayer.Character:FindFirstChild("Pepper-spray") then
        game.Players.LocalPlayer.Character["Pepper-spray"].Ammo.Value = 99
        game.Players.LocalPlayer.Character["Pepper-spray"].RemoteEvent:FireServer("Update", 99)
    end
end)

GunModsTab:AddToggle({
	Name = "Infinite Pepper Spray",
	Default = false,
	Callback = function(Value)
        PepperSpray.InfiniteSpray = Value
	end    
})
