local fontName = "BaseWars.MoneyPrinter"

ENT.Base = "bw_base_electronics"

ENT.Model = ""
ENT.Skin = 0

ENT.Capacity 		= 10000
ENT.Money 			= 0
ENT.XP 				= 0
ENT.MaxPaper		= 2500
ENT.PrintInterval 	= 1
ENT.PrintAmount		= 8
ENT.XPAmount		= 5 // Comme PrintAmount, a chaque seconde le printer gagne 5 d'exp
ENT.MaxLevel 		= 25
ENT.UpgradeCost 	= 1000
ENT.UpgradeAugPercent 	= 0.5 // A chaque levelup, le prix d'upgrade augmente de 50%

ENT.PrintName 		= "Basic Printer"

ENT.IsPrinter 		= true
ENT.IsValidRaidable = false

ENT.MoneyPickupSound = Sound("mvm/mvm_money_pickup.wav")
ENT.UpgradeSound = Sound("replay/rendercomplete.wav")

local Clamp = math.Clamp
function ENT:GSAT(vartype, slot, name, min, max)
	self:NetworkVar(vartype, slot, name)

	local getVar = function(minMax)
		if self[minMax] and isfunction(self[minMax]) then return self[minMax](self) end
		if self[minMax] and isnumber(self[minMax]) then return self[minMax] end
		return minMax or 0
	end

	self["Get" .. name] = function(self)
		return tonumber(self.dt[name])
	end

	self["Set" .. name] = function(self, var)
		if isstring(self.dt[name]) then
			self.dt[name] = tostring(var)
		else
			self.dt[name] = var
		end
	end

	self["Add" .. name] = function(_, var)
		local Val = self["Get" .. name](self) + var

		if min and max then
			Val = Clamp(Val or 0, getVar(min), getVar(max))
		end

		if isstring(self["Get" .. name](self)) then
			self["Set" .. name](self, Val)
		else
			self["Set" .. name](self, Val)
		end
	end

	self["Take" .. name] = function(_, var)
		local Val = self["Get" .. name](self) - var

		if min and max then
			Val = Clamp(Val or 0, getVar(min), getVar(max))
		end

		if isstring(self["Get" .. name](self)) then
			self["Set" .. name](self, Val)
		else
			self["Set" .. name](self, Val)
		end
	end
end

function ENT:StableNetwork()
	self:GSAT("String", 2, "Capacity")
	self:SetCapacity("0")
	self:GSAT("String", 3, "Money", 0, "GetCapacity")
	self:SetMoney("0")
	self:GSAT("Int", 5, "Paper", 0, "MaxPaper")
	self:GSAT("Int", 6, "Level", 0, "MaxLevel")
end

if SERVER then
	AddCSLuaFile()

	function ENT:Init()
		self.time = CurTime()
		self.time_p = CurTime()

		self:SetCapacity(self.Capacity)
		self:SetPaper(self.MaxPaper)

		self:SetHealth(self.PresetMaxHealth or 100)

		self.rtb = 0

		self.FontColor = color_white
		self.BackColor = color_black

		self:SetNWInt("UpgradeCost", self.UpgradeCost)

		self:SetLevel(1)
	end

	function ENT:SetUpgradeCost(val)
		self.UpgradeCost = val
		self:SetNWInt("UpgradeCost", val)
	end

	function ENT:Upgrade(ply, supress)
		local lvl = self:GetLevel()
		local calcM = self:GetNWInt("UpgradeCost") + ( self:GetNWInt("UpgradeCost") * ( ( lvl - 1 ) * self.UpgradeAugPercent ) )

		if ply then
			local plyM = ply:GetMoney()

			if plyM < calcM then
				if not supress then ply:Notify(BaseWars.LANG.UpgradeNoMoney, BASEWARS_NOTIFICATION_ERROR) end
			return false end

			if lvl >= self.MaxLevel then
				if not supress then ply:Notify(BaseWars.LANG.UpgradeMaxLevel, BASEWARS_NOTIFICATION_ERROR) end
			return false end

			ply:TakeMoney(calcM)
		end

		self.CurrentValue = (self.CurrentValue or 0) + calcM

		self:AddLevel(1)
		self:EmitSound(self.UpgradeSound)

		return true
	end

	function ENT:ThinkFunc()
		if self.Disabled or self:BadlyDamaged() then return end
		local added

		local level = self:GetLevel() ^ 1.3

		if CurTime() >= self.PrintInterval + self.time and self:GetPaper() > 0 then
			local m = self:GetMoney()
			self:AddMoney(math.Round(self.PrintAmount * level))
			self.XP = self.XP + math.Round(self.XPAmount * level)
			self.time = CurTime()
			added = m ~= self:GetMoney()
		end

		if CurTime() >= self.PrintInterval * 2 + self.time_p and added then
			self.time_p = CurTime()
			self:TakePaper(1)
		end
	end

	function ENT:PlayerTakeMoney(ply)
		local money = self:GetMoney()
		local xp = self.XP

		local Res, Msg = hook.Run("BaseWars_PlayerCanEmptyPrinter", ply, self, money)

		if Res == false then
			if Msg then
				ply:Notify(Msg, BASEWARS_NOTIFICATION_ERROR)
			end

		return end

		self:TakeMoney(money)

		ply:GiveMoney(money)
		ply:AddXP(xp)
		self.XP = 0
		ply:EmitSound(self.MoneyPickupSound)

		hook.Run("BaseWars_PlayerEmptyPrinter", ply, self, money)
	end

	function ENT:UseFuncBypass(activator, caller, usetype, value)

		if self.Disabled then return end

		local mins, maxs = self:OBBMins() , self:OBBMaxs()

		if self:LocalToWorld(Vector(maxs.x-3,mins.y+5, 0)):Distance(activator:GetEyeTrace().HitPos) < 15 then

			if activator:IsPlayer() and caller:IsPlayer() and self:GetMoney() > 0 then

				self:PlayerTakeMoney(activator)

			end

		elseif self:LocalToWorld(Vector(maxs.x-2,maxs.y-5 , 0)):Distance(activator:GetEyeTrace().HitPos) < 15 then

			self:Upgrade(activator, false)

		end

	end


	function ENT:SetDisabled(a)
		self.Disabled = a and true or false
		self:SetNWBool("printer_disabled", a and true or false)
	end

else

	function ENT:Initialize()
		if not self.FontColor then self.FontColor = color_white end
		if not self.BackColor then self.BackColor = color_black end
	end

	surface.CreateFont(fontName, {
		font = "Roboto",
		size = 20,
		weight = 800,
	})

	surface.CreateFont(fontName .. ".Huge", {
		font = "Roboto",
		size = 64,
		weight = 800,
	})

	surface.CreateFont(fontName .. ".Big", {
		font = "Roboto",
		size = 34,
		weight = 800,
	})

	surface.CreateFont(fontName .. ".MedBig", {
		font = "Roboto",
		size = 26,
		weight = 800,
	})

	surface.CreateFont(fontName .. ".Med", {
		font = "Roboto",
		size = 18,
		weight = 800,
	})

	local WasPowered
	if CLIENT then
		local function drawCircle(x, y, ang, seg, p, rad, color)
			local cirle = {}

			table.insert( cirle, { x = x, y = y} )
			for i = 0, seg do
				local a = math.rad( ( i / seg ) * -p + ang )
				table.insert( cirle, { x = x + math.sin( a ) * rad, y = y + math.cos( a ) * rad } )
			end
			surface.SetDrawColor( color )
			draw.NoTexture()
			surface.DrawPoly( cirle )
		end

		function ENT:DrawDisplay(pos, ang, scale)

			if LocalPlayer():GetPos():Distance(self:GetPos()) > 300 then return end

			local w, h = 610, 650
			local disabled = self:GetNWBool("printer_disabled")
			local Pw = self:IsPowered()
			local Lv = self:GetLevel()
			local Cp = self:GetCapacity()

			if not Pw then return end

			if disabled then

			return end

			if disabled then return end

			--Level
			surface.SetDrawColor(self.FontColor)
			draw.RoundedBox(0,-265,-245,530,530,self.FontColor)
			draw.RoundedBox(0,-260,-240,520,520,color_black)
			local money = tonumber(self:GetMoney()) or 0
			local cap = tonumber(Cp) or 0

			local moneyPercentage = math.Round( money / cap * 100 ,1)


			--Money/Maxmoney
			local currentMoney = string.format(BaseWars.LANG.CURFORMER, BaseWars.NumberFormat(money))
			local maxMoney = string.format(BaseWars.LANG.CURFORMER, BaseWars.NumberFormat(cap))
			local font = fontName .. ".Big"
			if #currentMoney > 16 then

				font = fontName .. ".MedBig"

			end
			if #currentMoney > 20 then

				font = fontName .. ".Med"

			end
			local fh = draw.GetFontHeight(font)

			--Paper
			local paper = math.floor(self:GetPaper())

			local NextCost = string.format(BaseWars.LANG.CURFORMER, BaseWars.NumberFormat(self:GetLevel() * self:GetCapacity() * 1.5))

			if self:GetLevel() >= self.MaxLevel then

				NextCost = BaseWars.LANG.MaxLevel

			end

			local BoxX = 88
			local BoxW = 265

			if cap > 0 and cap ~= math.huge then
				local moneyRatio = money / cap
				local maxWidth = math.floor(BoxW - 6)
				local curWidth = maxWidth * (1-moneyRatio)

				drawCircle(0, 0, 180, 100, (money / cap) * 360, 185, self.FontColor)
				drawCircle(0, 0, 180, 100, 360, 170, Color(0, 0, 0))
				draw.DrawText(self.PrintName, fontName, 0, -75, self.FontColor, TEXT_ALIGN_CENTER)
				draw.DrawText("LVL :", fontName .. ".MedBig", -245, -230, self.FontColor, TEXT_ALIGN_LEFT)
				draw.DrawText(string.format(BaseWars.LANG.LevelText, Lv):upper(), fontName .. ".MedBig", -190, -230, self.FontColor, TEXT_ALIGN_LEFT)
				draw.DrawText(string.format("Papier : ", paper):upper() .. paper, fontName .. ".MedBig", 250, -230, self.FontColor, TEXT_ALIGN_RIGHT)
				draw.DrawText( moneyPercentage .."%" , fontName .. ".Big", 0, -50, self.FontColor, TEXT_ALIGN_CENTER)
				draw.DrawText("Argent : " .. money, fontName .. ".Big", 0, -10, self.FontColor, TEXT_ALIGN_CENTER)

				draw.RoundedBox(10,-245,119,500,30,Color(0,0,0))

				draw.RoundedBox(10,-250,200,200,50,self.FontColor)
				draw.DrawText("Prendre l'argent", fontName .. ".MedBig", -150, 210, Color(0,0,0), TEXT_ALIGN_CENTER)

				draw.RoundedBox(10,90,200,160,50,self.FontColor)
				draw.DrawText("Améliorer", fontName .. ".Big", 175, 210, Color(0,0,0), TEXT_ALIGN_CENTER)
				
				local maxcost = self:GetNWInt("UpgradeCost") + ( self:GetNWInt("UpgradeCost") * ( ( Lv - 1 ) * self.UpgradeAugPercent ) )
				draw.DrawText(string.format(BaseWars.LANG.NextUpgrade, maxcost), fontName .. ".MedBig", 0, 120, self.FontColor, TEXT_ALIGN_CENTER)


			end

		end

		function ENT:Calc3D2DParams()

			local pos = self:GetPos()
			local ang = self:GetAngles()

			pos = pos + ang:Up() * 10
			pos = pos + ang:Forward() * -1
			pos = pos + ang:Right() * 0

			ang:RotateAroundAxis(ang:Up(), 90)
			ang:RotateAroundAxis(ang:Forward(), 5)

			return pos, ang, 0.1 / 2

		end

	end

	function ENT:Draw()

		self:DrawModel()

		if CLIENT then

			local pos, ang, scale = self:Calc3D2DParams()

			cam.Start3D2D(pos, ang, scale)
				pcall(self.DrawDisplay, self, pos, ang, scale)
			cam.End3D2D()

		end

	end

end
