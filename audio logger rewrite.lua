-- Audio Logger V1.1 BETA

local AudioLogger = Instance.new("ScreenGui")
local Main = Instance.new("Frame")
local UICorner = Instance.new("UICorner")
local SideBar = Instance.new("Frame")
local UICorner_2 = Instance.new("UICorner")
local Selector = Instance.new("Frame")
local Home = Instance.new("TextButton")
local Credits = Instance.new("TextButton")
local Logger = Instance.new("TextButton")
local Home_2 = Instance.new("Frame")
local PlayerProfile = Instance.new("Frame")
local Image = Instance.new("ImageLabel")
local UICorner_3 = Instance.new("UICorner")
local UICorner_4 = Instance.new("UICorner")
local Welcome = Instance.new("TextLabel")
local Change1 = Instance.new("TextLabel")
local ChangeLogTitle = Instance.new("TextLabel")
local Version = Instance.new("TextLabel")
local ChangeFrame = Instance.new("Frame")
local Credits_2 = Instance.new("Frame")
local List = Instance.new("ScrollingFrame")
local UIListLayout = Instance.new("UIListLayout")
local CreditsTitle = Instance.new("TextButton")
local Theo = Instance.new("TextButton")
local shadowHolder = Instance.new("Frame")
local penumbraShadow = Instance.new("ImageLabel")
local ambientShadow = Instance.new("ImageLabel")
local ambientShadow_2 = Instance.new("ImageLabel")
local TopBar = Instance.new("Frame")
local UICorner_5 = Instance.new("UICorner")
local Title = Instance.new("TextLabel")
local Logger_2 = Instance.new("Frame")
local Webhook = Instance.new("TextBox")
local UICorner_6 = Instance.new("UICorner")
local Start = Instance.new("TextButton")
local UICorner_7 = Instance.new("UICorner")
local Stats = Instance.new("TextLabel")
local LogAllAudios = Instance.new("TextButton")
local UICorner_8 = Instance.new("UICorner")
local Version_2 = Instance.new("StringValue")
local LogAll = false

local function log(webhook, logall)
	game.StarterGui:SetCore("SendNotification", {
		Title = "Logging...",
		Text = "Please wait, this may take a while",
	})

	print("[*] Logging audios...")

	local audios = ""
	local sounds_found = 0

	if logall == true then
		for _,v in pairs(game:GetDescendants()) do
			if v:IsA("Sound") then
				if v.SoundId:match("%d+") then
					local songAudioId = v.SoundId:match("%d+")
					if songAudioId == "" or songAudioId == "3"  then
						warn("[-] Audio id returned nothing, ignoring...")
					else
						sounds_found = sounds_found + 1
						Stats.Text = "Logged: " .. tostring(sounds_found)
						audios = audios .. songAudioId .. ":" .. v.Name .. "\n"
					end
				end
			end
		end
	else
		for _,v in pairs(game:GetDescendants()) do
			if v:IsA("Sound") and v.Playing == true then
				if v.SoundId:match("%d+") then
					local songAudioId = v.SoundId:match("%d+")
					if songAudioId == "" or songAudioId == "3" then
						warn("[-] Audio id returned nothing, ignoring...")
					else
						sounds_found = sounds_found + 1
						Stats.Text = "Logged: " .. tostring(sounds_found)
						audios = audios .. songAudioId .. ":" .. v.Name .. "\n"
					end
				end
			end
		end
	end
	wait(1)
	if audios:len() >= 4096 then 
		writefile("LoggedAudios_"..game.PlaceId..".txt", "The total characters was over 4096, so we had to save it here, total audios found: " .. tostring(sounds_found) .. "\n" .. audios)
		game.StarterGui:SetCore("SendNotification", {
			Title = "Oh No",
			Text = "We could not send the message because it was too long, but we have saved it to your Workspace folder instead"
		})
	elseif audios == "" then
		game.StarterGui:SetCore("SendNotification", {
			Title = "Oh No",
			Text = "We didnt find any audios"
		})  
	else
		msg = {
			["embeds"] = {
				{
					["title"] = "Audios Logged",
					["color"] = 5832569,
					["description"] = "*Found ".. tostring(sounds_found) .." audio(s):*\n" .. audios,
					["footer"] = {
						["text"] = "enjoy these fucking audios lmao"
					}
				}
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
		game.StarterGui:SetCore("SendNotification", {
			Title = "Success",
			Text = "Logged to webhook"
		})
	end
	print("[+] Logged ".. tostring(sounds_found) .." audio(s)")
end

AudioLogger.Name = "AudioLogger"
AudioLogger.Parent = game.CoreGui
AudioLogger.ResetOnSpawn = false

Version_2.Name = "Version"
Version_2.Parent = AudioLogger
Version_2.Value = "V1.1 BETA"

Main.Name = "Main"
Main.Parent = AudioLogger
Main.AnchorPoint = Vector2.new(0.5, 0.5)
Main.BackgroundColor3 = Color3.fromRGB(29, 29, 29)
Main.BorderColor3 = Color3.fromRGB(0, 0, 0)
Main.Position = UDim2.new(0.499127448, 0, 0.499993384, 0)
Main.Size = UDim2.new(0, 525, 0, 329)
Main.ZIndex = 2

UICorner.CornerRadius = UDim.new(0, 4)
UICorner.Parent = Main

SideBar.Name = "SideBar"
SideBar.Parent = Main
SideBar.BackgroundColor3 = Color3.fromRGB(34, 34, 34)
SideBar.Size = UDim2.new(0, 105, 0, 329)
SideBar.ZIndex = 2

UICorner_2.CornerRadius = UDim.new(0, 4)
UICorner_2.Parent = SideBar

Selector.Name = "Selector"
Selector.Parent = SideBar
Selector.BackgroundColor3 = Color3.fromRGB(30, 68, 112)
Selector.BorderSizePixel = 0
Selector.Position = UDim2.new(0.958676577, 0, 0.0898419917, 0)
Selector.Size = UDim2.new(0, 3, 0, 29)
Selector.ZIndex = 3

Home.Name = "Home"
Home.Parent = SideBar
Home.BackgroundColor3 = Color3.fromRGB(29, 29, 29)
Home.BackgroundTransparency = 1.000
Home.BorderSizePixel = 0
Home.Position = UDim2.new(0.105097599, 0, 0.0804777294, 0)
Home.Size = UDim2.new(0, 88, 0, 29)
Home.ZIndex = 2
Home.AutoButtonColor = false
Home.Font = Enum.Font.GothamSemibold
Home.Text = "Home"
Home.TextColor3 = Color3.fromRGB(61, 133, 222)
Home.TextSize = 15.000
Home.TextXAlignment = Enum.TextXAlignment.Left

Credits.Name = "Credits"
Credits.Parent = SideBar
Credits.BackgroundColor3 = Color3.fromRGB(29, 29, 29)
Credits.BackgroundTransparency = 1.000
Credits.BorderSizePixel = 0
Credits.Position = UDim2.new(0.114621401, 0, 0.284125179, 0)
Credits.Size = UDim2.new(0, 88, 0, 29)
Credits.ZIndex = 2
Credits.AutoButtonColor = false
Credits.Font = Enum.Font.GothamSemibold
Credits.Text = "Credits"
Credits.TextColor3 = Color3.fromRGB(191, 191, 191)
Credits.TextSize = 15.000
Credits.TextXAlignment = Enum.TextXAlignment.Left

Logger.Name = "Logger"
Logger.Parent = SideBar
Logger.BackgroundColor3 = Color3.fromRGB(29, 29, 29)
Logger.BackgroundTransparency = 1.000
Logger.BorderSizePixel = 0
Logger.Position = UDim2.new(0.114621408, 0, 0.177742213, 0)
Logger.Size = UDim2.new(0, 88, 0, 29)
Logger.ZIndex = 2
Logger.AutoButtonColor = false
Logger.Font = Enum.Font.GothamSemibold
Logger.Text = "Logger"
Logger.TextColor3 = Color3.fromRGB(191, 191, 191)
Logger.TextSize = 15.000
Logger.TextXAlignment = Enum.TextXAlignment.Left

Home_2.Name = "Home"
Home_2.Parent = Main
Home_2.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
Home_2.BackgroundTransparency = 1.000
Home_2.ClipsDescendants = true
Home_2.Position = UDim2.new(0.19961977, 0, 0.0881458968, 0)
Home_2.Size = UDim2.new(0, 421, 0, 300)
Home_2.Visible = false
Home_2.ZIndex = 2

PlayerProfile.Name = "PlayerProfile"
PlayerProfile.Parent = Home_2
PlayerProfile.BackgroundColor3 = Color3.fromRGB(34, 34, 34)
PlayerProfile.Position = UDim2.new(0.035629455, 0, 0.043333333, 0)
PlayerProfile.Size = UDim2.new(0, 90, 0, 90)
PlayerProfile.ZIndex = 2

Image.Name = "Image"
Image.Parent = PlayerProfile
Image.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
Image.BackgroundTransparency = 1.000
Image.Position = UDim2.new(0.0444444455, 0, 0.0444444455, 0)
Image.Size = UDim2.new(0.899999976, 0, 0.899999976, 0)
Image.ZIndex = 3

UICorner_3.CornerRadius = UDim.new(0, 100)
UICorner_3.Parent = Image

UICorner_4.CornerRadius = UDim.new(0, 100)
UICorner_4.Parent = PlayerProfile

Welcome.Name = "Welcome"
Welcome.Parent = Home_2
Welcome.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
Welcome.BackgroundTransparency = 1.000
Welcome.Position = UDim2.new(0.249406174, 0, 0.0882572457, 0)
Welcome.Size = UDim2.new(0, 285, 0, 67)
Welcome.ZIndex = 2
Welcome.Font = Enum.Font.GothamSemibold
Welcome.Text = "Welcome,"
Welcome.TextColor3 = Color3.fromRGB(227, 227, 227)
Welcome.TextSize = 18.000
Welcome.TextYAlignment = Enum.TextYAlignment.Top

Change1.Name = "Change1"
Change1.Parent = Home_2
Change1.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
Change1.BackgroundTransparency = 1.000
Change1.BorderSizePixel = 0
Change1.Position = UDim2.new(0.0507047027, 0, 0.525876641, 0)
Change1.Size = UDim2.new(0, 272, 0, 30)
Change1.ZIndex = 3
Change1.Font = Enum.Font.SourceSans
Change1.Text = "[-] Better UI"
Change1.TextColor3 = Color3.fromRGB(255, 255, 255)
Change1.TextSize = 22.000
Change1.TextWrapped = true
Change1.TextXAlignment = Enum.TextXAlignment.Left

ChangeLogTitle.Name = "ChangeLogTitle"
ChangeLogTitle.Parent = Home_2
ChangeLogTitle.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
ChangeLogTitle.BackgroundTransparency = 1.000
ChangeLogTitle.BorderSizePixel = 0
ChangeLogTitle.Position = UDim2.new(0.035629455, 0, 0.401003718, 0)
ChangeLogTitle.Size = UDim2.new(0, 136, 0, 30)
ChangeLogTitle.ZIndex = 2
ChangeLogTitle.Font = Enum.Font.SourceSans
ChangeLogTitle.Text = "Change log:"
ChangeLogTitle.TextColor3 = Color3.fromRGB(255, 255, 255)
ChangeLogTitle.TextScaled = true
ChangeLogTitle.TextSize = 25.000
ChangeLogTitle.TextWrapped = true
ChangeLogTitle.TextXAlignment = Enum.TextXAlignment.Left

Version.Name = "Version"
Version.Parent = Home_2
Version.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
Version.BackgroundTransparency = 1.000
Version.BorderSizePixel = 0
Version.Position = UDim2.new(0.000154690046, 0, 0.917557657, 0)
Version.Size = UDim2.new(0, 420, 0, 24)
Version.ZIndex = 2
Version.Font = Enum.Font.SourceSans
Version.Text = "Loading version..."
Version.TextColor3 = Color3.fromRGB(255, 255, 255)
Version.TextSize = 19.000

ChangeFrame.Name = "ChangeFrame"
ChangeFrame.Parent = Home_2
ChangeFrame.BackgroundColor3 = Color3.fromRGB(29, 29, 29)
ChangeFrame.BorderColor3 = Color3.fromRGB(25, 23, 23)
ChangeFrame.BorderSizePixel = 3
ChangeFrame.Position = UDim2.new(0.035629455, 0, 0.523333311, 0)
ChangeFrame.Size = UDim2.new(0, 392, 0, 118)
ChangeFrame.ZIndex = 2

Credits_2.Name = "Credits"
Credits_2.Parent = Main
Credits_2.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
Credits_2.BackgroundTransparency = 1.000
Credits_2.ClipsDescendants = true
Credits_2.Position = UDim2.new(0.19961977, 0, 0.0881458968, 0)
Credits_2.Size = UDim2.new(0, 421, 0, 300)
Credits_2.Visible = false
Credits_2.ZIndex = 2

List.Name = "List"
List.Parent = Credits_2
List.Active = true
List.BackgroundColor3 = Color3.fromRGB(40, 40, 40)
List.BackgroundTransparency = 1.000
List.BorderSizePixel = 0
List.Position = UDim2.new(0.0207546353, 0, 0.00186004641, 0)
List.Size = UDim2.new(0, 412, 0, 299)
List.ZIndex = 1002
List.BottomImage = ""
List.CanvasSize = UDim2.new(0, 0, 20, 0)
List.MidImage = ""
List.ScrollBarThickness = 7
List.TopImage = ""

UIListLayout.Parent = List
UIListLayout.SortOrder = Enum.SortOrder.LayoutOrder

CreditsTitle.Name = "CreditsTitle"
CreditsTitle.Parent = List
CreditsTitle.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
CreditsTitle.BackgroundTransparency = 1.000
CreditsTitle.BorderColor3 = Color3.fromRGB(35, 35, 35)
CreditsTitle.BorderSizePixel = 0
CreditsTitle.Position = UDim2.new(0, 0, 0.501672328, 0)
CreditsTitle.Size = UDim2.new(0, 411, 0, 25)
CreditsTitle.ZIndex = 1003
CreditsTitle.AutoButtonColor = false
CreditsTitle.Font = Enum.Font.Gotham
CreditsTitle.Text = "-- Credits --"
CreditsTitle.TextColor3 = Color3.fromRGB(255, 255, 255)
CreditsTitle.TextSize = 12.000
CreditsTitle.TextStrokeColor3 = Color3.fromRGB(255, 255, 255)

Theo.Name = "Theo"
Theo.Parent = List
Theo.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
Theo.BackgroundTransparency = 1.000
Theo.BorderColor3 = Color3.fromRGB(35, 35, 35)
Theo.BorderSizePixel = 0
Theo.Position = UDim2.new(0, 0, 0.501672328, 0)
Theo.Size = UDim2.new(0, 411, 0, 25)
Theo.ZIndex = 1003
Theo.AutoButtonColor = false
Theo.Font = Enum.Font.Gotham
Theo.Text = "Theo - UI and scripting"
Theo.TextColor3 = Color3.fromRGB(255, 255, 255)
Theo.TextSize = 12.000
Theo.TextStrokeColor3 = Color3.fromRGB(255, 255, 255)

shadowHolder.Name = "shadowHolder"
shadowHolder.Parent = Main
shadowHolder.BackgroundTransparency = 1.000
shadowHolder.Position = UDim2.new(-0.0153820813, 0, -0.0210526306, 0)
shadowHolder.Size = UDim2.new(1.03161383, 0, 1.03801608, 0)
shadowHolder.ZIndex = 0

penumbraShadow.Name = "penumbraShadow"
penumbraShadow.Parent = shadowHolder
penumbraShadow.AnchorPoint = Vector2.new(0.5, 0.5)
penumbraShadow.BackgroundTransparency = 1.000
penumbraShadow.Position = UDim2.new(0.498979509, 0, 0.494149804, 2)
penumbraShadow.Size = UDim2.new(1.00222731, 4, 1.00725126, 4)
penumbraShadow.ZIndex = 0
penumbraShadow.Image = "rbxassetid://1316045217"
penumbraShadow.ImageColor3 = Color3.fromRGB(0, 0, 0)
penumbraShadow.ImageTransparency = 0.880
penumbraShadow.ScaleType = Enum.ScaleType.Slice
penumbraShadow.SliceCenter = Rect.new(10, 10, 118, 118)

ambientShadow.Name = "ambientShadow"
ambientShadow.Parent = shadowHolder
ambientShadow.AnchorPoint = Vector2.new(0.5, 0.5)
ambientShadow.BackgroundTransparency = 1.000
ambientShadow.Position = UDim2.new(0.498979509, 0, 0.494149804, 2)
ambientShadow.Size = UDim2.new(1.00222731, 4, 1.00725126, 4)
ambientShadow.ZIndex = 0
ambientShadow.Image = "rbxassetid://1316045217"
ambientShadow.ImageColor3 = Color3.fromRGB(0, 0, 0)
ambientShadow.ImageTransparency = 0.880
ambientShadow.ScaleType = Enum.ScaleType.Slice
ambientShadow.SliceCenter = Rect.new(10, 10, 118, 118)

ambientShadow_2.Name = "ambientShadow"
ambientShadow_2.Parent = shadowHolder
ambientShadow_2.AnchorPoint = Vector2.new(0.5, 0.5)
ambientShadow_2.BackgroundTransparency = 1.000
ambientShadow_2.Position = UDim2.new(0.498979509, 0, 0.494149804, 2)
ambientShadow_2.Size = UDim2.new(1.00222731, 4, 1.00725126, 4)
ambientShadow_2.ZIndex = 0
ambientShadow_2.Image = "rbxassetid://1316045217"
ambientShadow_2.ImageColor3 = Color3.fromRGB(0, 0, 0)
ambientShadow_2.ImageTransparency = 0.880
ambientShadow_2.ScaleType = Enum.ScaleType.Slice
ambientShadow_2.SliceCenter = Rect.new(10, 10, 118, 118)

TopBar.Name = "TopBar"
TopBar.Parent = Main
TopBar.BackgroundColor3 = Color3.fromRGB(34, 34, 34)
TopBar.Position = UDim2.new(0.187566668, 0, 0, 0)
TopBar.Size = UDim2.new(0, 427, 0, 27)
TopBar.ZIndex = 2

UICorner_5.CornerRadius = UDim.new(0, 4)
UICorner_5.Parent = TopBar

Title.Name = "Title"
Title.Parent = TopBar
Title.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
Title.BackgroundTransparency = 1.000
Title.Position = UDim2.new(-0.206088915, 0, 0.234976307, 0)
Title.Size = UDim2.new(0, 178, 0, 17)
Title.ZIndex = 2
Title.Font = Enum.Font.GothamSemibold
Title.Text = "Audio Logger"
Title.TextColor3 = Color3.fromRGB(190, 190, 190)
Title.TextSize = 14.000
Title.TextXAlignment = Enum.TextXAlignment.Left

Logger_2.Name = "Logger"
Logger_2.Parent = Main
Logger_2.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
Logger_2.BackgroundTransparency = 1.000
Logger_2.ClipsDescendants = true
Logger_2.Position = UDim2.new(0.19961977, 0, 0.0881458968, 0)
Logger_2.Size = UDim2.new(0, 421, 0, 300)
Logger_2.ZIndex = 2

Webhook.Name = "Webhook"
Webhook.Parent = Logger_2
Webhook.BackgroundColor3 = Color3.fromRGB(34, 34, 34)
Webhook.BorderSizePixel = 0
Webhook.Position = UDim2.new(0.0507047027, 0, 0.0417273976, 0)
Webhook.Size = UDim2.new(0, 385, 0, 37)
Webhook.ZIndex = 2
Webhook.Font = Enum.Font.Gotham
Webhook.PlaceholderText = "Webhook"
Webhook.Text = ""
Webhook.TextColor3 = Color3.fromRGB(255, 255, 255)
Webhook.TextScaled = true
Webhook.TextSize = 11.000
Webhook.TextWrapped = true

UICorner_6.CornerRadius = UDim.new(0, 3)
UICorner_6.Parent = Webhook

Start.Name = "Start"
Start.Parent = Logger_2
Start.BackgroundColor3 = Color3.fromRGB(34, 34, 34)
Start.BorderSizePixel = 0
Start.Position = UDim2.new(0.294821709, 0, 0.395595402, 0)
Start.Size = UDim2.new(0, 165, 0, 33)
Start.ZIndex = 2
Start.AutoButtonColor = false
Start.Font = Enum.Font.GothamBold
Start.Text = "Start Logging"
Start.TextColor3 = Color3.fromRGB(255, 255, 255)
Start.TextSize = 17.000
Start.TextWrapped = true
Start.MouseButton1Down:Connect(function()
	if Webhook.Text == "" then
		game.StarterGui:SetCore("SendNotification", {
			Title = "Missing arguments",
			Text = "Please enter a webhook URL",
		})
	else
		if LogAllAudios.Text == "Log all audios: False" then
			log(Webhook.Text, false)
		else
			log(Webhook.Text, true)
		end
	end
end)

UICorner_7.CornerRadius = UDim.new(0, 3)
UICorner_7.Parent = Start

Stats.Name = "Stats"
Stats.Parent = Logger_2
Stats.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
Stats.BackgroundTransparency = 1.000
Stats.Position = UDim2.new(0.278471649, 0, 0.574976325, 0)
Stats.Size = UDim2.new(0, 178, 0, 17)
Stats.ZIndex = 2
Stats.Font = Enum.Font.GothamSemibold
Stats.Text = "Logged: Not ran yet"
Stats.TextColor3 = Color3.fromRGB(190, 190, 190)
Stats.TextSize = 14.000

LogAllAudios.Name = "LogAllAudios"
LogAllAudios.Parent = Logger_2
LogAllAudios.BackgroundColor3 = Color3.fromRGB(34, 34, 34)
LogAllAudios.BorderSizePixel = 0
LogAllAudios.Position = UDim2.new(0.0507047027, 0, 0.212262064, 0)
LogAllAudios.Size = UDim2.new(0, 384, 0, 33)
LogAllAudios.ZIndex = 2
LogAllAudios.AutoButtonColor = false
LogAllAudios.Font = Enum.Font.GothamBold
LogAllAudios.Text = "Log all audios: False"
LogAllAudios.TextColor3 = Color3.fromRGB(255, 255, 255)
LogAllAudios.TextSize = 17.000
LogAllAudios.TextWrapped = true
LogAllAudios.MouseButton1Down:Connect(function()
	if LogAll == false then
		LogAll = true
		LogAllAudios.Text = "Log all audios: True"
	else
		LogAll = false
		LogAllAudios.Text = "Log all audios: False"
	end
end)

UICorner_8.CornerRadius = UDim.new(0, 3)
UICorner_8.Parent = LogAllAudios

-- Scripts:

local function AZLAZPQ_fake_script() -- SideBar.LocalScript 
	local script = Instance.new('LocalScript', SideBar)

	local tweenservice = game:GetService("TweenService")
	local info = TweenInfo.new(.8, Enum.EasingStyle.Sine, Enum.EasingDirection.Out, 0, false, 0)
	local tab = "Home"
	local unselected = {
		TextColor3 = Color3.fromRGB(190, 190, 190)
	}
	local selected = {
		TextColor3 = Color3.fromRGB(61, 133, 222)
	}
	local hover = {
		TextColor3 = Color3.fromRGB(235, 235, 235)
	}
	local deb = false
	for i,v in pairs(script.Parent:GetChildren())do
		if v:IsA("TextButton")then
			v.MouseEnter:Connect(function()
				if tab ~= v.Name then
					tweenservice:Create(v, info, hover):Play()
				end
			end)
			v.MouseLeave:Connect(function()
				if tab ~= v.Name then
					tweenservice:Create(v, info, unselected):Play()
				end
			end)
			if v.Name ~= "RE" and v.Name ~= "R6"then
				v.MouseButton1Down:Connect(function()
					if not deb then
						deb = true
						if tab ~= nil then
							script.Parent.Parent[tab]:TweenSize(UDim2.new(0, 0, 0, 300), "Out", "Quint", .4, false)
							tweenservice:Create(script.Parent[tab], info, unselected):Play()
							wait(.4)
							script.Parent.Parent[tab].Visible = false
						end
						tab = v.Name
						script.Parent.Parent[tab].Visible = true
						tweenservice:Create(script.Parent[tab], info, selected):Play()
						script.Parent.Parent[tab]:TweenSize(UDim2.new(0, 421,0, 300), "Out", "Quint", .4, false)
						script.Parent.Selector:TweenPosition(UDim2.new(.959, 0, script.Parent[tab].Position.Y.Scale, 0), "Out", "Quint", .4, false)
						wait(.3)
						deb = false
					end
				end)
			else
				v.MouseButton1Down:Connect(function()
					tweenservice:Create(v, info, selected):Play()
					wait(.5)
					tweenservice:Create(v, info, unselected):Play()
				end)
			end
		end
	end
end
coroutine.wrap(AZLAZPQ_fake_script)()
local function QJWCUBK_fake_script() -- Main.Drag 
	local script = Instance.new('LocalScript', Main)

	local uis = game:GetService('UserInputService')
	local frame = script.Parent
	local toggle
	local speed = 0.15
	local drag
	local pos
	frame.InputBegan:Connect(function(input)
		if (input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch) then 
			toggle = true
			drag = input.Position
			pos = frame.Position
			input.Changed:Connect(function()
				if input.UserInputState == Enum.UserInputState.End then
					toggle = false
				end
			end)
		end
	end)
	uis.InputChanged:Connect(function(input)
		if input.UserInputType == Enum.UserInputType.MouseMovement or input.UserInputType == Enum.UserInputType.Touch then
			if toggle then
				local delta = input.Position - drag
				local position = UDim2.new(pos.X.Scale, pos.X.Offset + delta.X,
					pos.Y.Scale, pos.Y.Offset + delta.Y)
				game:GetService('TweenService'):Create(frame, TweenInfo.new(speed), {Position = position}):Play()
			end
		end
	end)
	local toScale = {"Credits", "Logger"}
	script.Parent.Home.Visible = true
	for i,v in pairs(toScale)do
		script.Parent[v].Size = UDim2.new(0, 0, 0, 300)
		if v.Name == "Home" then
			script.Parent[v].Visible = true
		else
			script.Parent[v].Visible = false
		end
	end
end
coroutine.wrap(QJWCUBK_fake_script)()
local function HKMTUC_fake_script() -- PlayerProfile.LocalScript 
	local script = Instance.new('LocalScript', PlayerProfile)

	local Players = game:GetService("Players")
	
	local player = Players.LocalPlayer
	
	local userId = player.UserId
	local thumbType = Enum.ThumbnailType.HeadShot
	local thumbSize = Enum.ThumbnailSize.Size420x420
	local content, isReady = Players:GetUserThumbnailAsync(userId, thumbType, thumbSize)
	
	local imageLabel = script.Parent.Image
	imageLabel.Image = content
	
	if player.DisplayName == player.Name then
		script.Parent.Parent.Welcome.Text = "Welcome,\n\n" .. player.Name
	else
		script.Parent.Parent.Welcome.Text = "Welcome,\n\n" .. player.DisplayName .. " (" .. player.Name .. ")"
	end
end
coroutine.wrap(HKMTUC_fake_script)()
local function XZHLSPT_fake_script() -- Version.Update 
	local script = Instance.new('LocalScript', Version)

	local v = script.Parent.Parent.Parent.Parent.Version.Value
	
	script.Parent.Text = "You are running version: " .. v
end
coroutine.wrap(XZHLSPT_fake_script)()
local function JIRT_fake_script() -- List.SmoothScroll 
	local script = Instance.new('LocalScript', List)

	local content = script.Parent
	content.ScrollingEnabled = not script.SmoothingEnabled.Value 
	
	local input = content:Clone()
	input:ClearAllChildren()
	input.BackgroundTransparency = 1
	input.ScrollBarImageTransparency = 1
	input.ZIndex = content.ZIndex + 1
	input.Name = "_smoothinputframe"
	input.ScrollingEnabled = script.SmoothingEnabled.Value 
	input.Parent = content.Parent
	
	script.SmoothingEnabled:GetPropertyChangedSignal("Value"):Connect(function()
		if script.SmoothingEnabled.Value then
			input.CanvasPosition = content.CanvasPosition
		end
		content.ScrollingEnabled = not script.SmoothingEnabled.Value 
		input.ScrollingEnabled = script.SmoothingEnabled.Value 
	end)
	
	input:GetPropertyChangedSignal("CanvasPosition"):Connect(function()
		if not script.SmoothingEnabled.Value then
			content.CanvasPosition = input.CanvasPosition
		end
	end)
	script.InputFrame.Value = input
	local function syncProperty(prop)
		content:GetPropertyChangedSignal(prop):Connect(function()
			if prop == "ZIndex" then
				input[prop] = content[prop] + 1
			else
				input[prop] = content[prop]
			end
		end)
	end
	
	syncProperty "CanvasSize"
	syncProperty "Position"
	syncProperty "Rotation"
	syncProperty "ScrollingDirection"
	syncProperty "ScrollBarThickness"
	syncProperty "BorderSizePixel"
	syncProperty "ElasticBehavior"
	syncProperty "SizeConstraint"
	syncProperty "ZIndex"
	syncProperty "BorderColor3"
	syncProperty "Size"
	syncProperty "AnchorPoint"
	syncProperty "Visible"
	
	local smoothConnection = game:GetService("RunService").RenderStepped:Connect(function()
		if script.SmoothingEnabled.Value then
			local a = content.CanvasPosition
			local b = input.CanvasPosition
			local c = script.SmoothingFactor.Value
			local d = (b - a) * c + a
			content.CanvasPosition = d
		end
	end)
	
	content.AncestryChanged:Connect(function()
		if content.Parent == nil then
			input:Destroy()
			smoothConnection:Disconnect()
		end
	end)
end
coroutine.wrap(JIRT_fake_script)()
