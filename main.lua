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


TextButton.TextColor3 = Color3.fromRGB(85, 255, 0)


TextButton.TextSize = 20.000



Helper.Name = "Helper"


Helper.Parent = Frame


Helper.BackgroundColor3 = Color3.fromRGB(255, 255, 255)


Helper.BackgroundTransparency = 1.000


Helper.Position = UDim2.new(-0.0101522841, 0, 0.367117077, 0)


Helper.Size = UDim2.new(0, 200, 0, 26)


Helper.Font = Enum.Font.Unknown


Helper.Text = ""


Helper.TextColor3 = Color3.fromRGB(0, 255, 0)


Helper.TextSize = 20.000



-- Scripts:



local function OWFHJI_fake_script() -- Frame.LocalScript 


	local script = Instance.new('LocalScript', Frame)



	local UserInputService = game:GetService("UserInputService")


	local runService = (game:GetService("RunService"));


	


	local gui = script.Parent


	


	local dragging


	local dragInput


	local dragStart


	local startPos


	


	function Lerp(a, b, m)


		return a + (b - a) * m


	end;


	


	local lastMousePos


	local lastGoalPos


	local DRAG_SPEED = (8); -- // The speed of the UI darg.


	function Update(dt)


		if not (startPos) then return end;


		if not (dragging) and (lastGoalPos) then


			gui.Position = UDim2.new(startPos.X.Scale, Lerp(gui.Position.X.Offset, lastGoalPos.X.Offset, dt * DRAG_SPEED), startPos.Y.Scale, Lerp(gui.Position.Y.Offset, lastGoalPos.Y.Offset, dt * DRAG_SPEED))


			return 


		end;


	


		local delta = (lastMousePos - UserInputService:GetMouseLocation())


		local xGoal = (startPos.X.Offset - delta.X);


		local yGoal = (startPos.Y.Offset - delta.Y);


		lastGoalPos = UDim2.new(startPos.X.Scale, xGoal, startPos.Y.Scale, yGoal)


		gui.Position = UDim2.new(startPos.X.Scale, Lerp(gui.Position.X.Offset, xGoal, dt * DRAG_SPEED), startPos.Y.Scale, Lerp(gui.Position.Y.Offset, yGoal, dt * DRAG_SPEED))


	end;


	


	gui.InputBegan:Connect(function(input)


		if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then


			dragging = true


			dragStart = input.Position


			startPos = gui.Position


			lastMousePos = UserInputService:GetMouseLocation()


	


			input.Changed:Connect(function()


				if input.UserInputState == Enum.UserInputState.End then


					dragging = false


				end


			end)


		end


	end)


	


	gui.InputChanged:Connect(function(input)


		if input.UserInputType == Enum.UserInputType.MouseMovement or input.UserInputType == Enum.UserInputType.Touch then


			dragInput = input


		end


	end)


	


	runService.Heartbeat:Connect(Update)


end


coroutine.wrap(OWFHJI_fake_script)()


local function OUAMTAD_fake_script() -- TextButton.LocalScript 


	local script = Instance.new('LocalScript', TextButton)



	script.Parent.MouseButton1Up:Connect(function()


		


		if(script.Parent.Value.Value == false) then


	


			local player = game.Players:WaitForChild(script.Parent.Parent.TextBox.Text)


			script.Parent.Text = "STOP FACE HELPER"


			script.Parent.TextColor3 = Color3.new(0.666667, 0, 0)


			script.Parent.Parent.Helper.Text = "Waiting for face..."


			script.Parent.Parent.Helper.TextColor3 = Color3.new(1, 0.333333, 0)


			script.Parent.Parent.TextBox.TextEditable = false


			script.Parent.Parent.TextBox.ClearTextOnFocus = false


			script.Parent.Value.Value = true


	


			player.Chatted:Connect(function(msg)


				if(script.Parent.Value.Value == true) then


					


					if msg == "Right, face." then


						script.Parent.Parent.Helper.Text = "TURN RIGHT"


						script.Parent.Parent.Helper.TextColor3 = Color3.new(0, 1, 0)


						


					elseif msg == "Left, face." then


						script.Parent.Parent.Helper.Text = "TURN LEFT"


						script.Parent.Parent.Helper.TextColor3 = Color3.new(0, 1, 0)


						


					elseif msg == "Center, face." then


						script.Parent.Parent.Helper.Text = "TURN CENTER"


						script.Parent.Parent.Helper.TextColor3 = Color3.new(0, 1, 0)


						


					elseif msg == "Control, face." then


						script.Parent.Parent.Helper.Text = "TRACK HOST"


						script.Parent.Parent.Helper.TextColor3 = Color3.new(0, 1, 0)


						


					elseif msg == "Right, incline." then


						script.Parent.Parent.Helper.Text = "INCLINE RIGHT"


						script.Parent.Parent.Helper.TextColor3 = Color3.new(0, 1, 0)


						


					elseif msg == "Left, incline." then


						script.Parent.Parent.Helper.Text = "INCLINE LEFT"


						script.Parent.Parent.Helper.TextColor3 = Color3.new(0, 1, 0)


						


					elseif msg == "About, face." then


						script.Parent.Parent.Helper.Text = "FACE OPPOSITE"


						script.Parent.Parent.Helper.TextColor3 = Color3.new(0, 1, 0)


						


					else


						script.Parent.Parent.Helper.Text = "INVALID FACE"


						script.Parent.Parent.Helper.TextColor3 = Color3.new(1, 0, 0)


						


						


					end


					


				else


					


					print("NOT PLAYER")


	


	


				end


	


			end)


	


		elseif script.Parent.Value.Value == true then


			script.Parent.Parent.Helper.Text = ""


			script.Parent.Text = "START FACE HELPER"


			script.Parent.TextColor3 = Color3.new(0.333333, 1, 0)


			script.Parent.Parent.Helper.Text = ""


			script.Parent.Parent.Helper.TextColor3 = Color3.new(0, 0, 0)


			script.Parent.Parent.TextBox.TextEditable = true


			script.Parent.Parent.TextBox.ClearTextOnFocus = true


			script.Parent.Value.Value = false


	


		end	


		


	end)


end


coroutine.wrap(OUAMTAD_fake_script)()


