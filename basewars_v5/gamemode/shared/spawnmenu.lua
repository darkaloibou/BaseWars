local SpawnList = {}

SpawnList = BaseWars.SpawnList

local function LimitDeduct(self, ent, ply)
	self.o_OnRemove = self.OnRemove
	self.OnRemove = function(e)
		local ply = BaseWars.Ents:ValidPlayer(ply)

		if ply then
			ply:GetTable()["limit_" .. ent] = ply:GetTable()["limit_" .. ent] - 1
		end

		e:o_OnRemove()
	end

	ply:GetTable()["limit_" .. ent] = ply:GetTable()["limit_" .. ent] + 1
end

if SERVER then
	local function setupEntity(ply, newEnt, ent, price, lim, always_raid, health)
		if newEnt.SetCreator then
			newEnt:SetCreator(ply)
		end

		if lim then
			LimitDeduct(newEnt, ent, ply)
		end

		if always_raid then
			newEnt.AlwaysRaidable = true
		end

		if health then
			newEnt:SetHealth(health)
		end

		newEnt.CurrentValue = price
		if newEnt.SetUpgradeCost and price then newEnt:SetUpgradeCost(price) end

		newEnt.DoNotDuplicate = true
	end


	local function Spawn(ply, cat, subcat, item)
		if ply.IsBanned and ply:IsBanned() then return end
		if not ply:Alive() then ply:Notify(BaseWars.LANG.DeadBuy, BASEWARS_NOTIFICATION_ERROR) return end

		local l = SpawnList and SpawnList
		if not l then return end

		if not cat or not item then return end

		local i = l[cat]
		if not i then return end

		i = i[subcat]
		if not i then return end

		i = i[item]
		if not i then return end

		local model, price, ent, sf, lim = i.Model, i.Price, i.ClassName, i.UseSpawnFunc, i.Limit, i.Props
		local gun, drug, ammo, ignore_raid, always_raid, force_model, health = i.Gun, i.Drug, i.Ammo, i.IgnoreRaid, i.AlwaysRaidable, i.ForceModel, i.Health
		local vip = i.VIP
		local HasVIP = not vip or (table.HasValue(BaseWars.Config.VIPRanks, ply:GetUserGroup()) or ply:IsAdmin())

		local level = i.Level
		if gun and (not level or level < BaseWars.Config.LevelSettings.BuyWeapons) then level = BaseWars.Config.LevelSettings.BuyWeapons end

		if (level and not ply:HasLevel(level)) or (vip and not HasVIP) then
			ply:EmitSound("buttons/button10.wav")
		return end

		local raid_item = i.Raid
		if raid_item and not (BaseWars.Raid:IsOnGoing() and ply:InRaid()) then
			ply:EmitSound("buttons/button10.wav")
		return end

		local tr

		if ent then
			tr = {}

			tr.start = ply:EyePos()
			tr.endpos = tr.start + ply:GetAimVector() * 85
			tr.filter = ply

			tr = util.TraceLine(tr)
		else
			tr = ply:GetEyeTraceNoCursor()

			if not tr.Hit then return end
		end

		local SpawnPos = tr.HitPos + BaseWars.Config.SpawnOffset
		local SpawnAng = ply:EyeAngles()
		SpawnAng.p = 0
		SpawnAng.y = SpawnAng.y + 180
		SpawnAng.y = math.Round(SpawnAng.y / 45) * 45

		if not gun and not drug and not ignore_raid and not ammo and not raid_item and ply:InRaid() then
			ply:Notify(BaseWars.LANG.CannotPurchaseRaid, BASEWARS_NOTIFICATION_ERROR)
		return end

		if lim then
			local Amount = ply:GetTable()["limit_" .. ent] or 0
			ply:GetTable()["limit_" .. ent] = Amount

			if lim and lim <= Amount then
				ply:Notify(string.format(BaseWars.LANG.EntLimitReached, ent), BASEWARS_NOTIFICATION_ERROR)
			return end
		end

		local Res, Msg
		if gun then
			Res, Msg = hook.Run("BaseWars_PlayerCanBuyGun", ply, ent) -- Player, Gun class
		elseif drug then
			Res, Msg = hook.Run("BaseWars_PlayerCanBuyDrug", ply, ent) -- Player, Drug type
		elseif ent then
			Res, Msg = hook.Run("BaseWars_PlayerCanBuyEntity", ply, ent) -- Player, Entity class
		else
			Res, Msg = hook.Run("BaseWars_PlayerCanBuyProp", ply, ent) -- Player, Entity class
		end

		if Res == false then
			if Msg then
				ply:Notify(Msg, BASEWARS_NOTIFICATION_ERROR)
			end
		return end

		if price > 0 then
			local plyMoney = ply:GetMoney()

			if plyMoney < price then
				ply:Notify(BaseWars.LANG.SpawnMenuMoney, BASEWARS_NOTIFICATION_ERROR)
			return end

			ply:SetMoney(plyMoney - price)
			ply:EmitSound("mvm/mvm_money_pickup.wav")

			ply:Notify(string.format(BaseWars.LANG.SpawnMenuBuy, item, BaseWars.NumberFormat(price)), BASEWARS_NOTIFICATION_MONEY)
		end

		if gun then
			ply:Give( ent )

			hook.Run("BaseWars_PlayerBuyGun", ply, Ent) -- Player, Gun entity
		return end

		if prop_physics then
  			RunConsoleCommand("gm_spawn", v.Model)
 		 	return
		end 

		if drug then
			local Rand = (ent == "Random")
			local Ent = ents.Create("bw_drink_drug")
				if not Rand then
					Ent:SetDrugEffect(ent)
					Ent.Random = false
				end

				Ent:SetPos(SpawnPos)
				Ent:SetAngles(SpawnAng)
			Ent:Spawn()
			Ent:Activate()
			Ent:CPPISetOwner(ply)

			if lim then
				LimitDeduct(Ent, ent, ply)
			end

			hook.Run("BaseWars_PlayerBuyDrug", ply, Ent) -- Player, Drug entity
		return end

		local prop
		local noundo

		if ent then
			local newEnt = ents.Create(ent)
			if not newEnt then return end

			if newEnt.SpawnFunction and sf then
				newEnt = newEnt:SpawnFunction(ply, tr, ent)
				setupEntity(ply, newEnt, ent, price, lim, always_raid, health)

				hook.Run("BaseWars_PlayerBuyEntity", ply, newEnt) -- Player, Entity
			return end

			setupEntity(ply, newEnt, ent, price, lim, always_raid, health)

			prop = newEnt
			noundo = true
		end

		if not prop then prop = ents.Create(ent or "prop_physics") end
		if not noundo then undo.Create("prop") end

		if not prop or not IsValid(prop) then return end

		prop:SetPos(SpawnPos)
		prop:SetAngles(SpawnAng)

		if model and (not ent or force_model) then
			prop:SetModel(model)
		end

		if lim and not ent then
			LimitDeduct(prop, ent, ply)
		end

		local vname = i.VehicleName
		local vt = list.Get("Vehicles")[vname]

		if vname and vt then
			if prop.SetVehicleClass then prop:SetVehicleClass(vname) end

			prop.VehicleTable = vt
			prop.ClassOverride = vt.Class
			prop.VehicleName = vname

			if vt.KeyValues then
				for k, v in pairs(vt.KeyValues) do
					prop:SetKeyValue(k, v)
				end
			end

			if vt.Members then
				table.Merge(prop, vt.Members)
			end

			if vt.Model then
				prop:SetModel(vt.Model)
			end
		end

		prop:Spawn()
		prop:Activate()

		if vname and vt then
			hook.Run("PlayerSpawnedVehicle", ply, prop)
		end

		prop:DropToFloor()

		local phys = prop:GetPhysicsObject()

		if IsValid(phys) then
			if i.ShouldFreeze then
				phys:EnableMotion(false)
			else
				phys:Wake()
			end
		end

		undo.AddEntity(prop)
		undo.SetPlayer(ply)
		undo.Finish()

		if prop.CPPISetOwner then
			prop:CPPISetOwner(ply)
		end

		if ent then
			hook.Run("BaseWars_PlayerBuyEntity", ply, prop) -- Player, Entity
		else
			hook.Run("BaseWars_PlayerBuyProp", ply, prop) -- Player, Prop
		end
	end

	concommand.Add("basewars_spawn",function(ply,_,args)
		if not IsValid(ply) then return end
		Spawn(ply, args[1], args[2], args[3], args[4])
	end)

	local function Disallow_Spawning(ply, ...)
		--BaseWars.UTIL.Log(ply, ...)

		if not ply:IsAdmin() then
			ply:Notify(BaseWars.LANG.UseSpawnMenu, BASEWARS_NOTIFICATION_ERROR)
			return true
		end
	end

	local name = "BaseWars.Disallow_Spawning"

	if BaseWars.Config.RestrictProps then
		hook.Add("PlayerSpawnObject", 	name, Disallow_Spawning)
	end

	hook.Add("PlayerSpawnSENT", 		name, Disallow_Spawning)
	hook.Add("PlayerGiveSWEP", 			name, Disallow_Spawning)
	hook.Add("PlayerSpawnSWEP", 		name, Disallow_Spawning)
	hook.Add("PlayerSpawnVehicle", 	name, Disallow_Spawning)
	hook.Add("PlayerSpawnNPC",			name, Disallow_Spawning)
return end
local overlayFont = "BaseWars.SpawnList.Overlay"
surface.CreateFont(overlayFont,{

	font = "Roboto",
	size = 20,
	weight = 900,

})

local overlayFont2 = "BaseWars.SpawnList.Overlay.Small"
surface.CreateFont(overlayFont2,{

	font = "Roboto",
	size = 15,
	weight = 700,
	shadow = true,

})

local PANEL = {}

function PANEL:Init()
	self.Panels = {}
end

function PANEL:AddPanel(name,pnl)
	self.Panels[name] = pnl

	if not self.CurrentPanel then
		pnl:Show()
		self.CurrentPanel = pnl
	else
		pnl:Hide()
	end
end

function PANEL:SwitchTo(name,instant)
	local pnl = self.Panels[name]
	if not pnl then return end

	local oldpnl = self.CurrentPanel
	if pnl == oldpnl then return end

	if oldpnl then
		oldpnl:AlphaTo(0, instant and 0 or 0.2, 0, function(_,pnl) pnl:Hide() end)
	end

	pnl:Show()
	pnl:AlphaTo(255, instant and 0 or 0.2, 0, function() end)

	self.CurrentPanel = pnl
end

vgui.Register("BaseWars.PanelCollection", PANEL, "Panel")

local PANEL = {}

local white = Color(255, 255, 255)
local gray = Color(192, 192, 192)
local black = Color(0, 0, 0)
local errorcolor = Color(255, 100, 100)
local highlight = Color(100, 100, 100, 200)
local orange = Color (255, 165, 0, 200)

function PANEL:CheckError()
	return false
end

function PANEL:Paint(w, h)
	draw.RoundedBox(4, 0, 0, w, h, black)
	draw.RoundedBox(4, 1, 1, w - 2, h - 2, self:CheckError() and errorcolor or white)

	self:DrawTextEntryText(black, highlight, gray)

	return false
end

vgui.Register("BaseWars.ErrorCheckTextEntry", PANEL, "DTextEntry")

local white = Color(255, 255, 255)
local trans = Color(0, 0, 0, 0)

local blue 	= Color(0, 90, 200, 180)
local green = Color(90, 200, 0, 180)
local grey	= Color(90, 90, 90, 180)
local red	= Color(200, 0, 20, 180)

local shade = Color(0, 0, 0, 200)

local SpawnList = BaseWars.SpawnList
if not SpawnList then return end

local Models = SpawnList

local enable_popup = CreateClientConVar("bw_enable_popup", "1", true, false)

local function MakeTab(type)
	return function(pnl)
		local cats = pnl:Add("DCategoryList")
			cats:Dock(FILL)
			function cats:Paint() end

		for catName, subT in SortedPairs(Models[type]) do
			if catName == "__inf" then continue end

			local cat = cats:Add(catName)
			local iLayout = vgui.Create("DIconLayout")

			iLayout:Dock(FILL)

			iLayout:SetSpaceX(4)
			iLayout:SetSpaceY(4)

			for name, tab in SortedPairsByMemberValue(subT, "Price") do
				local model = tab.Model
				local money = tab.Price
				local level = tab.Level
				local vip = tab.VIP

				if tab.Gun and (not level or level < BaseWars.Config.LevelSettings.BuyWeapons) then level = BaseWars.Config.LevelSettings.BuyWeapons end

				local mainPanel = iLayout:Add("DPanel")
					local iw, ih = 220,70
					mainPanel:SetSize(iw,ih)
					
					function mainPanel:Paint(w,h)
						draw.RoundedBox(4,0,0,w,h,Color(24,24,24,150))
						draw.RoundedBox(4,1,1,w-2,h-2,Color(230,230,230))
					end
					
					local iconPanel = mainPanel:Add("DPanel")
					iconPanel:SetPos(5,(70-60)/2)
					iconPanel:SetSize(60,60)
					
					function iconPanel:Paint(w,h)
						draw.RoundedBox(4,0,0,w,h,Color(24,24,24,150))
						draw.RoundedBox(4,1,1,w-2,h-2,Color(200,200,200))
					end

					local icon = vgui.Create( "DModelPanel", iconPanel)
					icon:SetPos(5,5)
					icon:SetSize(50,50)
					icon:SetModel( model )
					
					-- Limite l'entité dans la case du spawnmenu
					local mn, mx = icon.Entity:GetRenderBounds()
					local size = 0
					size = math.max( size, math.abs( mn.x ) + math.abs( mx.x ) )
					size = math.max( size, math.abs( mn.y ) + math.abs( mx.y ) )
					size = math.max( size, math.abs( mn.z ) + math.abs( mx.z ) )

					icon:SetFOV( 45 )
					icon:SetCamPos( Vector( size, size, size ) )
					icon:SetLookAt( ( mn + mx ) * 0.5 )
					--
					function icon:LayoutEntity( Entity ) return end -- Enlevez cet ligne si vous voulez que les models fassent des rotations sur eux mêmes
						
					local panelW = mainPanel:Add("DPanel")
					
					panelW:SetPos(70,0)
					panelW:SetSize(220-75,65)
					
					local button = panelW:Add("DButton")
					button:SetPos(5,70-25)
					button:SetSize(220-80,20)

					function button:DoClick()
						local HasLevel = not level or LocalPlayer():HasLevel(level)
						local HasVIP = not vip or (table.HasValue(BaseWars.Config.VIPRanks, LocalPlayer():GetUserGroup()) or LocalPlayer():IsAdmin())
						if not HasLevel or not HasVIP then
							surface.PlaySound("buttons/button10.wav")
						return end

						local myMoney = LocalPlayer():GetMoney()
						surface.PlaySound("ui/buttonclickrelease.wav")

						local a1, a2, a3 = type, catName, name

						local function DoIt()
							RunConsoleCommand("basewars_spawn", type, catName, name)
						end

						if money > 0 and not (myMoney / 100 > money) then
							if myMoney < money then
								Derma_Message(BaseWars.LANG.SpawnMenuMoney, "Error")
							return end

							if enable_popup:GetBool() then
								Derma_Query(string.format(BaseWars.LANG.SpawnMenuBuyConfirm, name, BaseWars.NumberFormat(money)),
									BaseWars.LANG.SpawnMenuConf, "   " .. BaseWars.LANG.Yes .. "   ", DoIt, "   " .. BaseWars.LANG.No .. "   ")
							else
								DoIt()
							end
						else
							DoIt()
						end
					end
					
					local name_a = string.Split(name, " ")
					surface.SetFont(overlayFont)
					local w_s = surface.GetTextSize(name)
					
					function panelW:Paint(w,h)
						draw.RoundedBox(0,0,5,2,h-5,Color(46,46,46,125))
						if w_s + 5 > w then
							draw.DrawText(name_a[1], overlayFont,5,5,Color(46,46,46)) 
							if name_a[2] and !name_a[3] then
								draw.DrawText(name_a[2], overlayFont,5,20,Color(46,46,46))
							elseif name_a[3] then
								draw.DrawText(name_a[2] .. " " .. name_a[3], overlayFont,5,20,Color(46,46,46))
							end
						else
							draw.DrawText(name, overlayFont,5,5,Color(46,46,46))
						end
					end

					function button:Paint(w, h)

						local myMoney = LocalPlayer():GetMoney()
						local HasLevel = not level or LocalPlayer():HasLevel(level)
						local HasVIP = not vip or (table.HasValue(BaseWars.Config.VIPRanks, LocalPlayer():GetUserGroup()) or LocalPlayer():IsAdmin())

						local DrawCol = green
						
						local text
												
						local HasVIP = not vip or (table.HasValue(BaseWars.Config.VIPRanks, LocalPlayer():GetUserGroup()) or LocalPlayer():IsAdmin())
						if not HasVIP then
							text = "VIP SEULEMENT"
						else
							local HasLevel = not level or LocalPlayer():HasLevel(level)
							if not HasLevel then
								text = "LVL " .. level
							else 
								if money > 0 then
									text = string.format(BaseWars.LANG.CURFORMER, BaseWars.NumberFormat(money))
								end
							end
						end
						button:SetFont(overlayFont2)
						button:SetText(text)
						button:SetTextColor(Color(255,255,255))

						if not HasVIP then
							DrawCol = orange
						elseif not HasLevel then
							DrawCol = red
						elseif money <= 0 then
							DrawCol = trans
						elseif money >= myMoney * 2 then
							DrawCol = grey
						elseif money > myMoney then
							DrawCol = red
						elseif money < myMoney / 100 then
							DrawCol = green
						end

						draw.RoundedBox(4,0,0,w,h,Color(24,24,24,255))
						draw.RoundedBox(4,1,1,w-2,h-2,DrawCol)

					end
					
			end

			cat:SetContents(iLayout)
			cat:SetExpanded(true)
		end
	end
end

local Panels = {
	Default = function(pnl)
		local lbl = pnl:Add("ContentHeader")
			lbl:SetPos(16, 0)

			lbl:SetText(BaseWars.LANG.BaseWarsSpawnlist)

		local lbl = pnl:Add("DLabel")
			lbl:SetPos(16, 64)

			lbl:SetFont("DermaLarge")
			lbl:SetText(BaseWars.LANG.CategoryLeft)

			lbl:SetBright(true)

			lbl:SizeToContents()
	end,
}

local function MakeSpawnList()
	local pnl = vgui.Create("DPanel")
		function pnl:Paint(w,h) end

	local leftPanel = pnl:Add("DPanel")
		leftPanel:Dock(LEFT)
		leftPanel:SetWide(256 - 64)
		leftPanel:DockPadding(1, 1, 1, 1)

	local tree = leftPanel:Add("DTree")
		function tree:Paint() end
		tree:Dock(FILL)

	local rightPanel = pnl:Add("BaseWars.PanelCollection")
		rightPanel:Dock(FILL)

		rightPanel:SetMouseInputEnabled(true)
		rightPanel:SetKeyboardInputEnabled(true)

	local defaultNode = tree:AddNode(BaseWars.LANG.BaseWarsSpawnlist)
		function defaultNode:OnNodeSelected()
			rightPanel:SwitchTo("Default")
		end

		defaultNode:SetIcon("icon16/application_view_tile.png")

		defaultNode:SetExpanded(true, true)
		defaultNode:GetRoot():SetSelectedItem(defaultNode)

	local i = 0
	for key, build in SortedPairs(BaseWars.SpawnList) do
		i = i + 1
		local idx = tostring(i)

		local node = defaultNode:AddNode(build.__inf.name or "(UNNAMED)")

		local ico = build.__inf.icon or "icon16/cancel.png"
		node:SetIcon(ico)

		local container = rightPanel:Add("DPanel")
		function container:Paint() end
		container:Dock(FILL)

		local ap = MakeTab(key)
		pcall(ap, container)

		rightPanel:AddPanel(idx, container)

		function node:OnNodeSelected()
			rightPanel:SwitchTo(idx)
		end
	end

	for name, build in next, Panels do
		local container = rightPanel:Add("DPanel")
		function container:Paint() end
		container:Dock(FILL)

		pcall(build, container)
		rightPanel:AddPanel(name, container)
	end

	rightPanel:SwitchTo("Default", true)

	return pnl
end

spawnmenu.AddCreationTab("#spawnmenu.category.basewars", MakeSpawnList, "icon16/building.png", BaseWars.Config.RestrictProps and -100 or 2)

spawnmenu.Reload = spawnmenu.Reload or concommand.GetTable().spawnmenu_reload
concommand.Add("spawnmenu_reload", function(...)
	spawnmenu.Reload(...)
	if GetConVar("developer"):GetInt() < 2 then
		local toRemove = {
			--"#spawnmenu.category.saves",
			--"#spawnmenu.category.dupes",
			--"#spawnmenu.category.postprocess",
			--"#spawnmenu.category.vehicles",
			--"#spawnmenu.category.weapons",
			--"#spawnmenu.category.npcs",
			--"#spawnmenu.category.entities",
			--"#spawnmenu.content_tab",
			
		}
		local i = 1
		for k, v in next, g_SpawnMenu.CreateMenu.Items do
			if table.HasValue(toRemove, v.Name) then
				g_SpawnMenu.CreateMenu.tabScroller.Panels[i] = nil
				g_SpawnMenu.CreateMenu.Items[k] = nil
				v.Tab:Remove()
			end
			i = i + 1
		end
	end
end)

if CLIENT then
  	RunConsoleCommand("spawnmenu_reload")
end  

BaseWars.SpawnMenuReload = BaseWars.SpawnMenuReload or concommand.GetTable().spawnmenu_reload
