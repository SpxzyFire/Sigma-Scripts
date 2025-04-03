local Settings = {
Viewmodel = {
    Enabled = true,
    ArmsColor = Color3.fromRGB(255, 255, 255),
    ArmsMaterial = "ForceField",
    ToolColor = Color3.fromRGB(255, 255, 255),
    ToolMaterial = "Plastic"
}}

local Players = game:GetService("Players")
local Workspace = game:GetService("Workspace")
local RunService = game:GetService("RunService")
local LocalPlayer = Players.LocalPlayer

local function UpdateViewmodel()
    if Workspace.Camera:FindFirstChild("ViewModel") then
        local vm = Workspace.Camera.ViewModel
        if Settings.Viewmodel.Enabled then
            for _, arm in pairs({"Left Arm", "Right Arm"}) do
                if vm[arm] then
                    vm[arm].Color = Settings.Viewmodel.ArmsColor
                    vm[arm].Material = Enum.Material[Settings.Viewmodel.ArmsMaterial]
                end
            end
            
            local vmTool = vm:FindFirstChildWhichIsA("Tool")
            if vmTool then
                for _, part in pairs(vmTool:GetDescendants()) do
                    if part:IsA("BasePart") or part:IsA("MeshPart") then
                        part.Color = Settings.Viewmodel.ToolColor
                        part.Material = Enum.Material[Settings.Viewmodel.ToolMaterial]
                    end
                end
            end
        end
    end

    if LocalPlayer.Character and Settings.Viewmodel.Enabled then
        local tool = LocalPlayer.Character:FindFirstChildWhichIsA("Tool")
        if tool then
            for _, part in pairs(tool:GetDescendants()) do
                if part:IsA("BasePart") or part:IsA("MeshPart") then
                    part.Color = Settings.Viewmodel.ToolColor
                    part.Material = Enum.Material[Settings.Viewmodel.ToolMaterial]
                end
            end
        end
    end
end

local VisualTab = Window:MakeTab({
    Name = "Visual",
    Icon = "rbxassetid://4483345998",
    PremiumOnly = false
})

local ViewModelSection = VisualTab:AddSection({
	Name = "View Model Section"
})

VisualTab:AddToggle({
    Name = "Enable Viewmodel Changer",
    Default = false,
    Callback = function(Value)
        Settings.Viewmodel.Enabled = Value
    end
})

VisualTab:AddColorpicker({
    Name = "Arms Color",
    Default = Color3.fromRGB(255, 255, 255),
    Callback = function(Value)
        Settings.Viewmodel.ArmsColor = Value
    end
})

VisualTab:AddDropdown({
    Name = "Arms Material",
    Default = "ForceField",
    Options = {"ForceField", "Plastic", "Wood", "Slate", "Concrete"},
    Callback = function(Value)
        Settings.Viewmodel.ArmsMaterial = Value
    end
})

VisualTab:AddColorpicker({
    Name = "Tool Color",
    Default = Color3.fromRGB(255, 255, 255),
    Callback = function(Value)
        Settings.Viewmodel.ToolColor = Value
    end
})

VisualTab:AddDropdown({
    Name = "Tool Material",
    Default = "ForceField",
    Options = {"ForceField", "Plastic", "Wood", "Slate", "Concrete"},
    Callback = function(Value)
        Settings.Viewmodel.ToolMaterial = Value
    end
})

-- Main loop
RunService.Heartbeat:Connect(UpdateViewmodel)
