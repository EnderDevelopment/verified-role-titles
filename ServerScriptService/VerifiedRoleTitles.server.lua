local Players = game:GetService("Players")

-- Replace these example IDs with the Roblox UserIds for your team.
local OWNER_USER_IDS = {
	[123456789] = true,
}

local ADMIN_USER_IDS = {
	[234567890] = true,
}

local TESTER_USER_IDS = {
	[345678901] = true,
}

local ROLE_CONFIG = {
	Owner = {
		Title = "OWNER",
		Color = Color3.fromRGB(75, 170, 255),
	},
	Admin = {
		Title = "ADMIN",
		Color = Color3.fromRGB(75, 170, 255),
	},
	Tester = {
		Title = "TESTER",
		Color = Color3.fromRGB(75, 170, 255),
	},
}

local function getRoleForPlayer(player)
	if OWNER_USER_IDS[player.UserId] then
		return "Owner"
	end

	if ADMIN_USER_IDS[player.UserId] then
		return "Admin"
	end

	if TESTER_USER_IDS[player.UserId] then
		return "Tester"
	end

	return nil
end

local function createRoleTitle(player, character)
	local roleName = getRoleForPlayer(player)
	if not roleName then
		return
	end

	local head = character:WaitForChild("Head", 10)
	if not head then
		return
	end

	local oldTitle = head:FindFirstChild("VerifiedRoleTitle")
	if oldTitle then
		oldTitle:Destroy()
	end

	local role = ROLE_CONFIG[roleName]
	local billboard = Instance.new("BillboardGui")
	billboard.Name = "VerifiedRoleTitle"
	billboard.Adornee = head
	billboard.AlwaysOnTop = true
	billboard.MaxDistance = 100
	billboard.Size = UDim2.fromOffset(190, 34)
	billboard.StudsOffset = Vector3.new(0, 2.8, 0)
	billboard.Parent = head

	local layout = Instance.new("UIListLayout")
	layout.FillDirection = Enum.FillDirection.Horizontal
	layout.HorizontalAlignment = Enum.HorizontalAlignment.Center
	layout.VerticalAlignment = Enum.VerticalAlignment.Center
	layout.SortOrder = Enum.SortOrder.LayoutOrder
	layout.Padding = UDim.new(0, 4)
	layout.Parent = billboard

	local checkmark = Instance.new("TextLabel")
	checkmark.Name = "BlueCheckmark"
	checkmark.BackgroundTransparency = 1
	checkmark.LayoutOrder = 1
	checkmark.Size = UDim2.fromOffset(26, 30)
	checkmark.Font = Enum.Font.GothamBold
	checkmark.Text = "✓"
	checkmark.TextColor3 = role.Color
	checkmark.TextSize = 24
	checkmark.TextStrokeTransparency = 0.45
	checkmark.Parent = billboard

	local title = Instance.new("TextLabel")
	title.Name = "RoleTitle"
	title.BackgroundTransparency = 1
	title.LayoutOrder = 2
	title.Size = UDim2.fromOffset(150, 30)
	title.Font = Enum.Font.GothamBold
	title.Text = role.Title
	title.TextColor3 = Color3.fromRGB(255, 255, 255)
	title.TextSize = 16
	title.TextStrokeTransparency = 0.35
	title.Parent = billboard
end

local function handlePlayer(player)
	player.CharacterAdded:Connect(function(character)
		createRoleTitle(player, character)
	end)

	if player.Character then
		createRoleTitle(player, player.Character)
	end
end

Players.PlayerAdded:Connect(handlePlayer)

for _, player in Players:GetPlayers() do
	handlePlayer(player)
end
