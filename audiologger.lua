local webhook = "webhook here lmao" -- put your webhook (discord) here

-- vvv dont mess with any of this unless you know what you're doing vvv --
game.StarterGui:SetCore("SendNotification", {
Title = "LOGGING IN PROGRESS",
Text = "logging audios, be patient",
Button1 = "ok"
})
local audios = ""
for _,v in pairs(workspace:GetDescendants()) do
   if v:IsA("Sound") and v.Playing == true then
       if not v.SoundId:match("rbxasset://") then
           local songAudioId = v.SoundId
           local songName = ""
           songAudioId = string.gsub(v.SoundId, "rbxassetid://", "")
           songAudioId = string.gsub(songAudioId, "http://www.roblox.com/asset/?id=", "")
           songName = game:GetService("MarketplaceService"):GetProductInfo(tonumber(songAudioId)).Name
           audios = audios .. v.SoundId:gsub("rbxassetid://", "") .. " : " .. v.Name .. " : " .. tostring(v:GetFullName()) .. " : " .. songName .. "\n\n"
       end
   end
end
wait(1)
audios = string.gsub(audios, "http://www.roblox.com/asset/?id=", "")
if audios == "" then else
msg = {
       ["embeds"] = {{
           ["color"] = 13708129,
           ["description"] = audios,
           ["author"] = {
           ["name"] = "NEW IDS " .. tostring(game.PlaceId)
       }}
   }
}
local response = request({
   Url = webhook,
   Method = "POST",
   Headers = {
       ["Content-Type"] = "application/json"
   },
   Body = game:GetService("HttpService"):JSONEncode(msg)
   })
end
game.StarterGui:SetCore("SendNotification", {
Title = "LOGGED",
Text = "audio logs sent to webhook",
Button1 = "ok"
})
