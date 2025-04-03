local codes = {
    "speedchampion000",
    "racer300",
    "SPRINT250",
    "hyper250",
    "legends500",
    "sparkles300",
    "Launch200",
    "jungleracer5000",
    "junglesecrets7500",
    "speedchampion0"
}

for _, code in ipairs(codes) do
    game:GetService("ReplicatedStorage").rEvents.codeRemote:InvokeServer(code)
end  
