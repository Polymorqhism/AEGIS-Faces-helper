-- Gui to Lua
-- Version: 3.2

-- Instances:

local ScreenGui = Instance.new("ScreenGui")
local Frame = Instance.new("Frame")
local TextBox = Instance.new("TextBox")
local TextButton = Instance.new("TextButton")
local Helper = Instance.new("TextLabel")

--Properties:

ScreenGui.Parent = game.Players.LocalPlayer:WaitForChild("PlayerGui")
ScreenGui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling

Frame.Parent = ScreenGui
Frame.BackgroundColor3 = Color3.fromRGB(57, 57, 57)
Frame.BorderColor3 = Color3.fromRGB(204, 204, 204)
Frame.BorderSizePixel = 3
Frame.Position = UDim2.new(0.209019706, 0, 0.315789491, 0)
Frame.Size = UDim2.new(0, 197, 0, 148)

TextBox.Parent = Frame
TextBox.BackgroundColor3 = Color3.fromRGB(152, 152, 152)
TextBox.BackgroundTransparency = 1.000
TextBox.BorderSizePixel = 0
TextBox.Position = UDim2.new(0, 0, 0.116666667, 0)
TextBox.Size = UDim2.new(0, 197, 0, 38)
TextBox.Font = Enum.Font.Unknown
TextBox.PlaceholderColor3 = Color3.fromRGB(178, 178, 178)
TextBox.PlaceholderText = "INSERT USER HERE"
TextBox.Text = ""
TextBox.TextColor3 = Color3.fromRGB(255, 255, 255)
TextBox.TextSize = 17.000

TextButton.Parent = Frame
TextButton.BackgroundColor3 = Color3.fromRGB(77, 77, 77)
TextButton.BorderSizePixel = 2
TextButton.Position = UDim2.new(0.101522848, 0, 0.616666675, 0)
TextButton.Size = UDim2.new(0, 157, 0, 39)
TextButton.Font = Enum.Font.Unknown
TextButton.Text = "START FACE HELPER"
TextButton.TextColor3 = Color3.fromRGB(255, 255, 255)
TextButton.TextSize = 20.000

Helper.Name = "Helper"
Helper.Parent = Frame
Helper.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
Helper.BackgroundTransparency = 1.000
Helper.Position = UDim2.new(-0.0101522841, 0, 0.367117077, 0)
Helper.Size = UDim2.new(0, 200, 0, 26)
Helper.Font = Enum.Font.Unknown
Helper.Text = "..."
Helper.TextColor3 = Color3.fromRGB(0, 255, 0)
Helper.TextSize = 20.000

-- Scripts:

local function ZJVZB_fake_script() -- TextButton.LocalScript 
	local script = Instance.new('LocalScript', TextButton)

	script.Parent.MouseButton1Up:Connect(function()
		if(script.Parent.Value.Value == false) then
			
			local player = game.Players:WaitForChild(script.Parent.Parent.TextBox.Text)
			script.Parent.Text = "STOP FACE HELPER"
			script.Parent.Value.Value = true
			
			player.Chatted:Connect(function(msg)
				if(script.Parent.Value.Value == true) then
					if msg == "Right, face." then
						script.Parent.Parent.Helper.Text = "TURN RIGHT"
					elseif msg == "Left, face." then
						script.Parent.Parent.Helper.Text = "TURN LEFT"
					elseif msg == "Center, face." then
						script.Parent.Parent.Helper.Text = "TURN CENTER"
					elseif msg == "Control, face." then
						script.Parent.Parent.Helper.Text = "TRACK HOST"
					elseif msg == "Right, incline." then
						script.Parent.Parent.Helper.Text = "INCLINE RIGHT"
					elseif msg == "Left, incline." then
						script.Parent.Parent.Helper.Text = "INCLINE LEFT"
					elseif msg == "About, face." then
						script.Parent.Parent.Helper.Text = "FACE OPPOSITE"
					end
				else
					print("NOT PLAYER")
				end
	
			end)
				
		elseif script.Parent.Value.Value == true then
			script.Parent.Parent.Helper.Text = ""
			script.Parent.Text = "START FACE HELPER"
			script.Parent.Value.Value = false
			
		end	
	end)
end
coroutine.wrap(ZJVZB_fake_script)()
