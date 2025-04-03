local ohString1 = "claimGift

for ohNumber2 = 1, 7 do 
  --[[ instead of manually entering 1, 2 ... to 7
  we are just telling roblox to do 1 to 7 in this line
  ]]--
  
    game:GetService("ReplicatedStorage").rEvents.freeGiftClaimRemote:InvokeServer(ohString1, ohNumber2)
end   
