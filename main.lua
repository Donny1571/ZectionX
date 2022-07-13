if not isfile("KavoConfig.JSON") then writefile("ZectionXConfig.JSON","{}")
end
wait(0.55)
spawn(function()
	for i,v in pairs(game:GetService("Lighting"):GetChildren()) do
		if v:IsA("Atmosphere") or v:IsA("Sky") or v:IsA("PostEffect") then
			v:Remove()
		end
	end
	local sky = Instance.new("Sky")
	sky.StarCount = 5000
	sky.SkyboxUp = "rbxassetid://9468074724"
	sky.SkyboxLf = "rbxassetid://9468063157"
	sky.SkyboxFt = "rbxassetid://9468061027"
	sky.SkyboxBk = "rbxassetid://9468068462"
	sky.SkyboxDn = "rbxassetid://9468081097"
	sky.SkyboxRt = "rbxassetid://9468057091"
	sky.SunTextureId = ""
	sky.SunAngularSize = 11
	sky.MoonTextureId = ""
	sky.MoonAngularSize = 30
	sky.Parent = game:GetService("Lighting")
	local sunray = Instance.new("SunRaysEffect")
	sunray.Intensity = 0.03
	sunray.Parent = game:GetService("Lighting")
	local bloom = Instance.new("BloomEffect")
	bloom.Threshold = 2
	bloom.Intensity = 1
	bloom.Size = 2
	bloom.Parent = game:GetService("Lighting")
	local atmosphere = Instance.new("Atmosphere")
	atmosphere.Density = 0.3
	atmosphere.Offset = 0.25
	atmosphere.Color = Color3.fromRGB(198, 198, 198)
	atmosphere.Decay = Color3.fromRGB(104, 112, 124)
	atmosphere.Glare = 0
	atmosphere.Haze = 0
	atmosphere.Parent = game:GetService("Lighting")
end)
local colors = {
	SchemeColor = Color3.fromRGB(102,255,0),
	Background = Color3.fromRGB(102,255,0),
	Header = Color3.fromRGB(102,255,0),
	TextColor = Color3.fromRGB(0,0,0),
	ElementColor = Color3.fromRGB(102,255,0)
}
local kavoUi = loadstring(game:HttpGet("https://raw.githubusercontent.com/NTDCore/NightBedCommunityOfficial/main/Theme/Night/bed/lol/XD/Chill/long/kavo.lua"))()
local window = kavoUi.CreateLib("ZectionX 1.0", "Private")
local entity = loadstring(game:HttpGet("https://raw.githubusercontent.com/7GrandDadPGN/VapeV4ForRoblox/main/Libraries/entityHandler.lua", true))()

do
	local oldcharacteradded = entity.characterAdded
	entity.characterAdded = function(plr, char, localcheck)
		return oldcharacteradded(plr, char, localcheck, function() end)
	end
	entity.fullEntityRefresh()
end

local colorbox
local function makeRainbowText(text)
	spawn(function()
		colorbox = Color3.fromRGB(170,0,170)
		local x = 0
		while wait() do
			colorbox = Color3.fromHSV(x,1,1)
			x = x + 4.5/255
			if x >= 1 then
				x = 0
			end
		end
	end)
	spawn(function()
		repeat
			wait()
			text.TextColor3 = colorbox
		until true == false
	end)
end

local MainToggle = Instance.new("ScreenGui")
local Frame = Instance.new("Frame")
local TextLabel = Instance.new("TextLabel")
local UICorner = Instance.new("UICorner")
local ToggleBtn = Instance.new("ImageButton")

MainToggle.Name = "MainToggle"
MainToggle.Parent = game.CoreGui
MainToggle.ResetOnSpawn = false

Frame.Parent = MainToggle
Frame.BackgroundColor3 = Color3.fromRGB(24, 24, 24)
Frame.BackgroundTransparency = 0.200
Frame.BorderColor3 = Color3.fromRGB(0, 0, 0)
Frame.BorderSizePixel = 0
Frame.Position = UDim2.new(0.0109622413, 0, 0.0136186769, 0)
Frame.Size = UDim2.new(0, 149, 0, 149)

TextLabel.Parent = Frame
TextLabel.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
TextLabel.BackgroundTransparency = 1.000
TextLabel.BorderSizePixel = 0
TextLabel.Position = UDim2.new(0.0402684584, 0, 0.798657715, 0)
TextLabel.Size = UDim2.new(0, 132, 0, 30)
TextLabel.Font = Enum.Font.SourceSansLight
TextLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
TextLabel.TextScaled = true
TextLabel.TextSize = 14.000
TextLabel.TextWrapped = true
TextLabel.Text = "ZectonX 1.0"
makeRainbowText(TextLabel, true)

UICorner.Parent = Frame

ToggleBtn.Name = "ToggleBtn"
ToggleBtn.Parent = Frame
ToggleBtn.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
ToggleBtn.BackgroundTransparency = 1.000
ToggleBtn.Position = UDim2.new(0.137143791, 0, 0.0700296983, 0)
ToggleBtn.Size = UDim2.new(0, 110, 0, 110)
ToggleBtn.Image = "rbxassetid://10207624836"
ToggleBtn.MouseButton1Down:connect(function()
  kavoUi:ToggleUI()
end)

repeat task.wait() until (entity.isAlive)

local players = game:GetService("Players")
local lplr = players.LocalPlayer
local oldchar = lplr.Character
local cam = workspace.CurrentCamera
local uis = game:GetService("UserInputService")
local KnitClient = debug.getupvalue(require(game.Players.LocalPlayer.PlayerScripts.TS.knit).setup, 6)
local Client = require(game:GetService("ReplicatedStorage").TS.remotes).default.Client
local InventoryUtil = require(game:GetService("ReplicatedStorage").TS.inventory["inventory-util"]).InventoryUtil
local itemstuff = debug.getupvalue(require(game:GetService("ReplicatedStorage").TS.item["item-meta"]).getItemMeta, 1)
local RenderStepTable = {}
local StepTable = {}
local connectioninfjump
local killauraswing = {["Enabled"] = true}
local killaurasound = {["Enabled"] = true}
local killaurahitdelay = {["Value"] = 2}
local killaurasoundval = {["Value"] = 1}
local speedval = {["Value"] = 1}
local testtogttt = {["Value"] = 20}
local ACC1
local CloneGodModeFulldisablertroll
local ACC2
local AnticheatBypass = {["Enabled"] = false}
local AnticheatBypassCombatCheck = {["Enabled"] = false}
local anticheatfunny = false
local anticheatfunnyyes = false
local antivoidtransparent = {["Value"] = 50}
local antivoidcolor = {["Hue"] = 0.93, ["Sat"] = 1, ["Value"] = 1}
local reachval = {["Value"] = 18}
local autoclick = {["Enabled"] = true}
local origC0 = game.ReplicatedStorage.Assets.Viewmodel.RightHand.RightWrist.C0
local killaurafirstpersonanim = {["Value"] = true}
local killauraanimval = {["Value"] = "Cool"}
local SprintCont = KnitClient.Controllers.SprintController
local SwordCont = KnitClient.Controllers.SwordController
local KnockbackTable = debug.getupvalue(require(game:GetService("ReplicatedStorage").TS.damage["knockback-util"]).KnockbackUtil.calculateKnockbackVelocity, 1)
local ClientHandler = Client


local function isAlive(plr)
	if plr then
		return plr and plr.Character and plr.Character.Parent ~= nil and plr.Character:FindFirstChild("HumanoidRootPart") and plr.Character:FindFirstChild("Head") and plr.Character:FindFirstChild("Humanoid")
	end
	return lplr and lplr.Character and lplr.Character.Parent ~= nil and lplr.Character:FindFirstChild("HumanoidRootPart") and lplr.Character:FindFirstChild("Head") and lplr.Character:FindFirstChild("Humanoid")
end

local function runcode(func)
	func()
end

local AnticheatBypassNumbers = {
	TPSpeed = 111111111111111111111111111111111111111,
	TPCombat = 11111111111111111111111111111111,
	TPLerp = 111111111111111111111111111111111111111111111,
	TPCheck = 111111111111111111111111111111111111111111111111111111111111111111
}

local realchar
local clone
local function clonemake()
    realchar = lplr.Character
    realchar.Archivable = true
    clone = realchar:Clone()
    clone.Parent = workspace
    lplr.Character = clone
end

local clonetwo
local function secondclonemake()
    clonetwo = realchar:Clone()
    clonetwo.Parent = workspace
end

spawn(function()
    while wait(1) do
        matchState = clntstorehandlr:getState().Game.matchState
    end
end)

local function getremote(tab)
    for i,v in pairs(tab) do
        if v == "Client" then
            return tab[i + 1]
        end
    end
    return ""
end

function hash(p1)
    local hashmod = require(game:GetService("ReplicatedStorage").TS["remote-hash"]["remote-hash-util"])
    local toret = hashmod.RemoteHashUtil:prepareHashVector3(p1)
    return toret
end
  
local function playsound(id, volume) 
	local sound = Instance.new("Sound")
	sound.Parent = workspace
	sound.SoundId = id
	sound.PlayOnRemove = true 
	if volume then 
		sound.Volume = volume
	end
	sound:Destroy()
end

local function playanimation(id) 
	if isAlive() then 
		local animation = Instance.new("Animation")
		animation.AnimationId = id
		local animatior = lplr.Character.Humanoid.Animator
		animatior:LoadAnimation(animation):Play()
	end
end

function isNumber(str)
	if tonumber(str) ~= nil or str == 'inf' then
		return true
	end
end

function getinv(plr)
	local plr = plr or lplr
	local thingy, thingytwo = pcall(function() return InventoryUtil.getInventory(plr) end)
	return (thingy and thingytwo or {
		items = {},
		armor = {},
		hand = nil
	})
end

function getsword()
	local sd
	local higherdamage
	local swordslots
	local swords = getinv().items
	for i, v in pairs(swords) do
		if v.itemType:lower():find("sword") or v.itemType:lower():find("blade") then
			if higherdamage == nil or itemstuff[v.itemType].sword.damage > higherdamage then
				sd = v
				higherdamage = itemstuff[v.itemType].sword.damage
				swordslots = i
			end
		end
	end
	return sd, swordslots
end

local function getremote(tab)
	for i,v in pairs(tab) do
		if v == "Client" then
			return tab[i + 1]
		end
	end
	return ""
end

local function hvFunc(cock)
	return {hashedval = cock}
end

local function targetCheck(plr, check)
	return (check and plr.Character.Humanoid.Health > 0 and plr.Character:FindFirstChild("ForceField") == nil or check == false)
end

local function isPlayerTargetable(plr, target)
	return plr ~= lplr and plr and isAlive(plr) and targetCheck(plr, target)
end

local function GetAllNearestHumanoidToPosition(distance, amount)
	local returnedplayer = {}
	local currentamount = 0
	if entity.isAlive then -- alive check
		for i, v in pairs(game.Players:GetChildren()) do -- loop through players
			if isPlayerTargetable((v), true, true, v.Character ~= nil) and v.Character:FindFirstChild("HumanoidRootPart") and v.Character:FindFirstChild("Head") and currentamount < amount then -- checks
				local mag = (lplr.Character.HumanoidRootPart.Position - v.Character:FindFirstChild("HumanoidRootPart").Position).magnitude
				if mag <= distance then -- mag check
					table.insert(returnedplayer, v)
					currentamount = currentamount + 1
				end
			end
		end
		for i2,v2 in pairs(game:GetService("CollectionService"):GetTagged("Monster")) do -- monsters
			if v2:FindFirstChild("HumanoidRootPart") and currentamount < amount and v2.Name ~= "Duck" then -- no duck
				local mag = (lplr.Character.HumanoidRootPart.Position - v2.HumanoidRootPart.Position).magnitude
				if mag <= distance then -- magcheck
					table.insert(returnedplayer, {Name = (v2 and v2.Name or "Monster"), UserId = 1443379645, Character = v2}) -- monsters are npcs so I have to create a fake player for target info
					currentamount = currentamount + 1
				end
			end
		end
	end
	return returnedplayer -- table of attackable entities
end

local function BindToRenderStep(name, num, func)
	if RenderStepTable[name] == nil then
		RenderStepTable[name] = game:GetService("RunService").RenderStepped:connect(func)
	end
end
local function UnbindFromRenderStep(name)
	if RenderStepTable[name] then
		RenderStepTable[name]:Disconnect()
		RenderStepTable[name] = nil
	end
end

local function BindToStepped(name, num, func)
	if StepTable[name] == nil then
		StepTable[name] = game:GetService("RunService").Stepped:connect(func)
	end
end
local function UnbindFromStepped(name)
	if StepTable[name] then
		StepTable[name]:Disconnect()
		StepTable[name] = nil
	end
end

local attackentitycont = Client:Get(getremote(debug.getconstants(getmetatable(KnitClient.Controllers.SwordController)["attackEntity"])))
local rgfejd = false
local DistVal = {["Value"] = 18}
function KillauraRemote()
	for i,v in pairs(game.Players:GetChildren()) do
		if v.Character and v.Name ~= game.Players.LocalPlayer.Name and v.Character:FindFirstChild("HumanoidRootPart") then
			local mag = (v.Character.HumanoidRootPart.Position - game.Players.LocalPlayer.Character.HumanoidRootPart.Position).Magnitude
			if mag <= DistVal["Value"] and v.Team ~= game.Players.LocalPlayer.Team and v.Character:FindFirstChild("Humanoid") then
				if v.Character.Humanoid.Health > 0 then
					rgfejd = true
					local GBW = getsword()
					local selfPosition = lplr.Character.HumanoidRootPart.Position + (DistVal["Value"] > 14 and (lplr.Character.HumanoidRootPart.Position - v.Character.HumanoidRootPart.Position).magnitude > 14 and (CFrame.lookAt(lplr.Character.HumanoidRootPart.Position, v.Character.HumanoidRootPart.Position).lookVector * 4) or Vector3.new(0, 0, 0))
					local Entity = v.Character
					local target = v.Character:GetPrimaryPartCFrame().Position
					attackentitycont:CallServer({
						["chargedAttack"] = {["chargeRatio"] = 1},
						["weapon"] = GBW ~= nil and GBW.tool,
						["entityInstance"] = Entity,
						["validate"] = {["targetPosition"] = {["value"] = target,
							["hash"] = hvFunc(target)},
						["raycast"] = {
							["cameraPosition"] = hvFunc(cam.CFrame.Position), 
							["cursorDirection"] = hvFunc(Ray.new(cam.CFrame.Position, v.Character:GetPrimaryPartCFrame().Position).Unit.Direction)
						},
						["selfPosition"] = {["value"] = selfPosition,
							["hash"] = hvFunc(selfPosition)
						}
						}
					})
					if killaurasound["Enabled"] then
						playsound("rbxassetid://6760544639", killaurasoundval["Value"])
					end
					if killauraswing["Enabled"] then
						playanimation("rbxassetid://4947108314")
					end
				end
			else
				rgfejd = false
			end
		end
	end
end

local itemtab = debug.getupvalue(require(game:GetService("ReplicatedStorage").TS.item["item-meta"]).getItemMeta, 1)
local CombatConstant = require(game:GetService("ReplicatedStorage").TS.combat["combat-constant"]).CombatConstant
local function getEquipped()
	local typetext = ""
	local obj = (entity.isAlive and lplr.Character:FindFirstChild("HandInvItem") and lplr.Character.HandInvItem.Value or nil)
	if obj then
		if obj.Name:find("sword") or obj.Name:find("blade") or obj.Name:find("baguette") or obj.Name:find("scythe") or obj.Name:find("dao") then
			typetext = "sword"
		end
		if obj.Name:find("wool") or itemtab[obj.Name]["block"] then
			typetext = "block"
		end
		if obj.Name:find("bow") then
			typetext = "bow"
		end
	end
	return {["Object"] = obj, ["Type"] = typetext}
end

local Combat = window:NewTab("Combat")
local Blatant = window:NewTab("Blatant")
local World = window:NewTab("World")
local Render = window:NewTab("Render")
local Utility = window:NewTab("Utility")
local ExecuterInfo = window:NewTab("Executer Info")
local Credits = window:NewTab("Credits")

local Reach = Combat:NewSection("Reach")
Reach:NewToggle("Reach", "Gives you more sword reach", function(state)
	if state then
		CombatConstant.RAYCAST_SWORD_CHARACTER_DISTANCE = (reachval["Value"] - 0.0001)
	else
		CombatConstant.RAYCAST_SWORD_CHARACTER_DISTANCE = 14.4
	end
end)

Reach:NewSlider("Range 18-1", "Configure Your Reach", 18, 1, function(val)
	reachval["Value"] = val
end)

local Sprint = Combat:NewSection("Sprint")
Sprint:NewToggle("Sprint", "Sets your sprint to true", function(state)
	if state then
		BindToStepped("Sprint", 1, function()
			if SprintCont.sprinting == false then
				SprintCont:startSprinting()
			end
		end)
	else
		UnbindFromStepped("Sprint")
		SprintCont:stopSprinting()
	end
end)

local NoFall = Combat:NewSection("NoFallDamage")
NoFall:NewToggle("NoFallDamage", "Disables FallDMG", function(state)
	if state then
		local NoFall = {["Enabled"] = true}
		local oldfall

		spawn(function()
			repeat task.wait(0.5)
				ClientHandler:Get("GroundHit"):SendToServer()
			until NoFall["Enabled"] == false
		end)
	end
end)

local Velocity = Combat:NewSection("Velocity")
Velocity:NewToggle("Velocity", "Disables Knockback", function(state)
	if state then
		KnockbackTable["kbDirectionStrength"] = 0
		KnockbackTable["kbUpwardStrength"] = 0
	else
		KnockbackTable["kbDirectionStrength"] = 100
		KnockbackTable["kbUpwardStrength"] = 100
	end
end)

local Aura = Blatant:NewSection("KillAura")
Aura:NewToggle("KillAura", "Swings your sword when someone is near you", function(state)
	if state then
		BindToStepped("Killaura", 1, function()
			if entity.isAlive then
				KillauraRemote()
			end
		end)
	else
		UnbindFromStepped("Killaura")
	end
end)

Aura:NewSlider("Distance 1-20", "Increase your KillAura Range", 20, 1, function(val)
	DistVal["Value"] = val
end)

Aura:NewToggle("No Swing", "Disables your sword animations", function(state)
	if state then
		if killauraswing["Enabled"] == true then
			killauraswing["Enabled"] = false
		end
	else
		if killauraswing["Enabled"] == false then
			killauraswing["Enabled"] = true
		end
	end
end)

Aura:NewSlider("Sound 1-0", "Adjust killaura sound", 1, 0, function(val)
	killaurasoundval["Value"] = val
end)

function animfunc(id)
    local Animator = hmd:WaitForChild("Animator")
    local Animation = Instance.new("Animation", char)
    Animation.AnimationId = "rbxassetid://"..id
    Animation.Parent = char

    local PlayAnim = Animator:LoadAnimation(Animation)
    PlayAnim:Play()
end

function getbedsxd()
    local beds = {}
    local blocks = game:GetService("Workspace").Map.Blocks
    for _,Block in pairs(blocks:GetChildren()) do
        if Block.Name == "bed" and Block.Covers.BrickColor ~= game.Players.LocalPlayer.Team.TeamColor then
            table.insert(beds,Block)
        end
    end
    return beds
end

function getbedsblocks()
    local blockstb = {}
    local blocks = game:GetService("Workspace").Map.Blocks
    for i,v in pairs(blocks:GetChildren()) do
        if v:IsA("Part") then
            table.insert(blockstb,v)
        end
    end
    return blockstb
end

function blocks(bed)
    local aboveblocks = 0
    local Blocks = getbedsblocks()
    for _,Block in pairs(Blocks) do
        if Block.Position.X == bed.X and Block.Position.Z == bed.Z and Block.Name ~= "bed" and (Block.Position.Y - bed.Y) <= 9 and Block.Position.Y > bed.Y then
            aboveblocks = aboveblocks + 1
        end
    end
    return aboveblocks
end

function nuker()
    local beds = getbedsxd()
    for _,bed in pairs(beds) do
        local bedmagnitude = (bed.Position - game.Players.LocalPlayer.Character.PrimaryPart.Position).Magnitude
        if bedmagnitude < 27 then
            local upnum = blocks(bed.Position)
            local x = math.round(bed.Position.X/3)
            local y = math.round(bed.Position.Y/3) + upnum
            local z = math.round(bed.Position.Z/3)
            game:GetService("ReplicatedStorage").rbxts_include.node_modules.net.out._NetManaged.DamageBlock:InvokeServer({
                ["blockRef"] = {
                    ["blockPosition"] = Vector3.new(x,y,z)
                },
                ["hitPosition"] = Vector3.new(x,y,z),
                ["hitNormal"] = Vector3.new(x,y,z),
            })
        end
    end
end

function funinuker()
    if (not isclone) then
        local beds = getbedsxd()
        for _,bed in pairs(beds) do
            local bedmagnitude = (bed.Position - game.Players.LocalPlayer.Character.PrimaryPart.Position).Magnitude
            if bedmagnitude < 27 then
                game:GetService("ReplicatedStorage").rbxts_include.node_modules.net.out._NetManaged[landmineremote]:FireServer({
                    ["invisibleLandmine"] = bed
                })
            end
        end
    else
        local beds = getbedsxd()
        for _,bed in pairs(beds) do
            local bedmagnitude = (bed.Position - clone.PrimaryPart.Position).Magnitude
            if bedmagnitude < 27 then
                game:GetService("ReplicatedStorage").rbxts_include.node_modules.net.out._NetManaged[landmineremote]:FireServer({
                    ["invisibleLandmine"] = bed
                })
            end
        end
    end
end

local BNuker = Blatant:NewSection("BedNuker")
BNuker:NewToggle("BedNuker", "Auto break bed and covers", function(state)
	if state then
		local bedrekterval = state
        if bedrekterval then
            spawn(function()
                repeat
                    wait()
                    if entity.isAlive then
                        wait(0.25)
                        if (not bedrekterval) then return end
                        nuker()
                    end
                until (not bedrekterval)
            end)
        end
    end
end)

local ESPFolder
local ESP = Render:NewSection("ESP")
ESP:NewToggle("ESP", "coming next update", function(state)
	if state then
		local thing
        local espval = state
        if espval then
            spawn(function()
                ESPFolder = Instance.new("Folder")
                ESPFolder.Name = "ESPFolder"
                ESPFolder.Parent = ScreenGuitwo
                repeat
                    task.wait()
                    if (not espval) then break end
                    for i,plr in pairs(game.Players:GetChildren()) do
                        if ESPFolder:FindFirstChild(plr.Name) then
                            thing = ESPFolder[plr.Name]
                            thing.Visible = false
                        else
                            thing = Instance.new("ImageLabel")
                            thing.BackgroundTransparency = 1
                            thing.BorderSizePixel = 0
                            thing.Image = getcustomassetthingylol("ZectionX/assets/ESP.png")
                            thing.Visible = false
                            thing.Name = plr.Name
                            thing.Parent = ESPFolder
                            thing.Size = UDim2.new(0, 256, 0, 256)
                        end
                        
                        if isAlive(plr) and plr ~= lplr and plr.Team ~= tostring(lplr.Team) then
                            local rootPos, rootVis = cam:WorldToViewportPoint(plr.Character.HumanoidRootPart.Position)
                            local rootSize = (plr.Character.HumanoidRootPart.Size.X * 1200) * (cam.ViewportSize.X / 1920)
                            local headPos, headVis = cam:WorldToViewportPoint(plr.Character.HumanoidRootPart.Position + Vector3.new(0, 1 + (plr.Character.Humanoid.RigType == Enum.HumanoidRigType.R6 and 2 or plr.Character.Humanoid.HipHeight), 0))
                            local legPos, legVis = cam:WorldToViewportPoint(plr.Character.HumanoidRootPart.Position - Vector3.new(0, 1 + (plr.Character.Humanoid.RigType == Enum.HumanoidRigType.R6 and 2 or plr.Character.Humanoid.HipHeight), 0))
                            rootPos = rootPos
                            if rootVis then
                                thing.Visible = rootVis
                                thing.Size = UDim2.new(0, rootSize / rootPos.Z, 0, headPos.Y - legPos.Y)
                                thing.Position = UDim2.new(0, rootPos.X - thing.Size.X.Offset / 2, 0, (rootPos.Y - thing.Size.Y.Offset / 2) - 36)
                            end
                        end
                    end
                until (not espval)
            end)
            game.Players.PlayerRemoving:connect(function(plr)
                if ESPFolder:FindFirstChild(plr.Name) then
                    ESPFolder[plr.Name]:Remove()
                end
            end)
        else
            ESPFolder:remove()
            return
        end
    end
end)

local Infjump = Render:NewSection("InfJump")
Infjump:NewToggle("Infjump", "Allows you to hold space to fly up", function(state)
	if state then
		local InfJump = {["Enabled"] = true}
		connectioninfjump = uis.JumpRequest:connect(function(jump)
			if InfJump["Enabled"] then
				lplr.Character:FindFirstChildOfClass'Humanoid':ChangeState("Jumping")
			end
		end)
	else
		connectioninfjump:Disconnect()
	end
end)

local shopthingyshopshop = debug.getupvalue(require(game:GetService("ReplicatedStorage").TS.games.bedwars.shop["bedwars-shop"]).BedwarsShop.getShopItem, 2)
local oldnexttier
local oldtiered
local bypassstpidshoptiers = false
local ShopTierBypass = Blatant:NewSection("ShopTierBypass")
ShopTierBypass:NewToggle("ShopTierBypass", "Skipps tiers", function(state)
  if state then
   if (bypassstpidshoptiers) then
            for i,v in pairs(shopthingyshopshop) do
                oldtiered = oldtiered or v.tiered
                oldnexttier = oldnexttier or v.nextTier
            end
            for i,v in pairs(shopthingyshopshop) do
                v.tiered = nil
                v.nextTier = nil
            end
        else
            for i,v in pairs(shopthingyshopshop) do
                v.tiered = oldtiered
                v.nextTier = oldnexttier
            end
        end
    end
end)
