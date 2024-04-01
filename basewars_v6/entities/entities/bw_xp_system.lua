timer.Simple(5,function()
	BaseWars.Config.XPMultiplier = 0
end)

local fontName = "BaseWars.MoneyPrinter"
if CLIENT then
	surface.CreateFont( "banksss", {
		font = "Roboto",
		size = 50,
		weight = 700,
		antialias = true,
	} )
end
ENT.Base = "bw_base_electronics"

ENT.Model = "models/props/cs_assault/MoneyPallet.mdl" --Model.
ENT.Skin = 0

ENT.Capacity 		= 260000000 --Pas de limite mettez la capacité de votre choix
ENT.Money 			= 0
ENT.MaxPaper		= 0
ENT.PrintInterval 	= 1
ENT.PrintAmount		= 3
ENT.MaxLevel 		= 5
ENT.UpgradeCost 	= 100000
ENT.PrintColor 		= Color(255,255,255) --Color of the model
ENT.PrintName 		= "Banque" --Title
ENT.IsPrinter 		= false
ENT.IsValidRaidable = false

local Clamp = math.Clamp
function ENT:GSAT(slot, name,  min, max)

	self:NetworkVar("Float", slot, name)

	local getVar = function(minMax)

		if self[minMax] and isfunction(self[minMax]) then return self[minMax](self) end
		if self[minMax] and isnumber(self[minMax]) then return self[minMax] end

		return minMax or 0

	end

	self["Add" .. name] = function(_, var)

			local Val = self["Get" .. name](self) + var

			if min and max then

				Val = Clamp(tonumber(Val) or 0, getVar(min), getVar(max))

			end

			self["Set" .. name](self, Val)

	end

	self["Take" .. name] = function(_, var)

		local Val = self["Get" .. name](self) - var

		if min and max then

			Val = Clamp(tonumber(Val) or 0, getVar(min), getVar(max))

		end

		self["Set" .. name](self, Val)

	end

end

function ENT:StableNetwork()

	self:GSAT(2, "Capacity")

	self:GSAT(3, "Money", 0, "GetCapacity")
	self:GSAT(4, "Paper", 0, "MaxPaper")
	self:GSAT(5, "Level", 0, "MaxLevel")

end

if SERVER then

	AddCSLuaFile()

	function ENT:Init()

		self.time = CurTime()
		self.time_p = CurTime()

		self:SetCapacity(self.Capacity)
		self:SetPaper(self.MaxPaper)

		self:SetHealth(self.PresetMaxHealth or 2000)

		self.rtb = 0

		self.FontColor = color_white
		self.BackColor = color_black
		self:SetColor(self.PrintColor)
		self:SetNWInt("UpgradeCost", self.UpgradeCost)

		self:SetLevel(1)
	end

	function ENT:SetUpgradeCost(val)

		self.UpgradeCost = val
		self:SetNWInt("UpgradeCost", val)

	end

	function ENT:Upgrade(ply)

		if ply then

			local lvl = self:GetLevel()

			local plyM = ply:GetMoney()

			local calcM = self:GetNWInt("UpgradeCost") * lvl

			if plyM < calcM then

				ply:Notify(BaseWars.LANG.UpgradeNoMoney, BASEWARS_NOTIFICATION_ERROR)

			return end

			if lvl >= self.MaxLevel then

				ply:Notify(BaseWars.LANG.UpgradeMaxLevel, BASEWARS_NOTIFICATION_ERROR)

			return end

			ply:TakeMoney(calcM)
			self.CurrentValue = (self.CurrentValue or 0) + calcM

		end

		self:AddLevel(1)


	end

	function ENT:ThinkFunc()

		if self.Disabled or self:BadlyDamaged() then return end
		local added

		local level = self:GetLevel() ^ 1.3


		for k, v in pairs( ents.FindByClass( "bw_xpprinter_*" ) ) do
			if v:CPPIGetOwner() == self:CPPIGetOwner() then
				if self:GetMoney() < self.Capacity then
					local allmoney = v:GetMoney()
					v:TakeMoney(allmoney)
					self:AddMoney(allmoney)
				end
			end
		end

		for k, v in pairs( ents.FindByClass( "bw_base_moneyprinter" ) ) do
			if v:CPPIGetOwner() == self:CPPIGetOwner() then
				if self:GetMoney() < self.Capacity then
					local allmoney = v:GetMoney()
					v:TakeMoney(allmoney)
					self:AddMoney(allmoney)
				end
			end
		end

		--[[
		Нужно ещё? Добавляйте след. способом:

		for k, v in pairs( ents.FindByClass( "bw_base_moneyprinter2" ) ) do
			if v:CPPIGetOwner() == self:CPPIGetOwner() then
				if self:GetMoney() < self.Capacity then
					local allmoney = v:GetMoney()
					v:TakeMoney(allmoney)
					self:AddMoney(allmoney)
				end
			end
		end

		]]

		if CurTime() >= self.PrintInterval * 2 + self.time_p and added then

			self.time_p = CurTime()

		end

	end
	function ENT:ReturnPly(ply)
		return ply, ply:UniqueID()
	end
	function ENT:PlayerTakeMoney(ply)

		--If u want it make private, delete the comment (--)
		--if self:CPPIGetOwner() != self:ReturnPly(ply) and BaseWars.Bank.IsPublic == false then ply:Notify("Money can take only the owner!", BASEWARS_NOTIFICATION_ERROR) return end

		local money = self:GetMoney()

		local Res, Msg = hook.Run("BaseWars_PlayerCanEmptyPrinter", ply, self, money)
		if Res == false then

			if Msg then

				ply:Notify(Msg, BASEWARS_NOTIFICATION_ERROR)

			end

		return end


		self:TakeMoney(money)

		ply:AddXP(money)


		hook.Run("BaseWars_PlayerEmptyPrinter", ply, self, money)

	end

	function ENT:UseFuncBypass(activator, caller, usetype, value)

		if self.Disabled then return end

		if activator:IsPlayer() and caller:IsPlayer() and self:GetMoney() > 0 then

			self:PlayerTakeMoney(activator)

		end

	end

	function ENT:SetDisabled(a)

		self.Disabled = a and true or false
		self:SetNWBool("printer_disabled", a and true or false)

	end

else

	function ENT:Initialize()

		self.FontColor = Color(0,255,255)
		if not self.FontColor then self.FontColor = Color(255,255,255) end
		if not self.BackColor then self.BackColor = color_black end

	end


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

			local w, h = 222 * 2, 136 * 2
			local disabled = self:GetNWBool("printer_disabled")
			local Pw = self:IsPowered()
			local Lv = self:GetLevel()
			local Cp = self:GetCapacity()

			--draw.RoundedBox(0, -260, 610, 530, 300, Pw and self.BackColor or color_black)
			drawCircle(0, 900, 180, 100, 360, 300, Color(0, 0, 0))

			if not Pw then

				draw.DrawText(self.PrintName, "banksss", w / 2-220, 700, self.FontColor, TEXT_ALIGN_CENTER)
				draw.DrawText("Génerateur requis !", "banksss", w - 4-430, 100+620, Color(255,0,0), TEXT_ALIGN_CENTER)

      return end

			if disabled then

				draw.DrawText(BaseWars.LANG.PrinterBeen, "banksss", w / 2, h / 2 - 48, self.FontColor, TEXT_ALIGN_CENTER)
				draw.DrawText(BaseWars.LANG.Disabled, "banksss", w / 2, h / 2 - 32, Color(255,0,0), TEXT_ALIGN_CENTER)

			return end

			if disabled then return end

			local money = tonumber(self:GetMoney()) or 0
			local cap = tonumber(Cp) or 0

			local moneyPercentage = math.Round( money / cap * 100 ,1)


			local currentMoney = BaseWars.LANG.CURRENCY .. BaseWars.NumberFormat(money)
			local maxMoney = BaseWars.LANG.CURRENCY .. BaseWars.NumberFormat(cap)
			local font = "banksss"
			if #currentMoney > 16 then

				font = "banksss"

			end
			if #currentMoney > 20 then

				font = "banksss"

			end
			local fh = draw.GetFontHeight(font)

			local StrW,StrH = surface.GetTextSize("")
			local moneyW,moneyH = surface.GetTextSize(currentMoney)



			local NextCost = BaseWars.LANG.CURRENCY .. BaseWars.NumberFormat(self:GetLevel() * self:GetNWInt("UpgradeCost"))

			if self:GetLevel() >= self.MaxLevel then

				NextCost = "---"

			end

			local timeRemaining = 0
			timeRemaining = math.Round( (cap - money) / (self.PrintAmount * Lv / self.PrintInterval) )

			if timeRemaining > 0 then

				local PrettyHours = math.floor(timeRemaining/3600)
				local PrettyMinutes = math.floor(timeRemaining/60) - PrettyHours*60
				local PrettySeconds = timeRemaining - PrettyMinutes*60 - PrettyHours*3600
				local PrettyTime = (PrettyHours > 0 and PrettyHours.."h " or "") .. (PrettyMinutes > 0 and PrettyMinutes.."min " or "") .. PrettySeconds .." sec"

			end



			local BoxX = 94
			local BoxW = 265


			if cap > 0 and cap ~= math.huge then
				local moneyRatio = money / cap
				local maxWidth = math.floor(BoxW - 6)
				local curWidth = maxWidth * (1-moneyRatio)

				drawCircle(0, 900, 180, 100, (money / cap) * 360, 400, Color(220,20,60, 255))
				drawCircle(0, 900, 180, 100, 360, 300, Color(0, 0, 0))
				draw.DrawText("XP / " .. BaseWars.LANG.CURRENCY .. BaseWars.NumberFormat(cap), font, 0, ("banksss" and 106 or 105 + fh / 4)+785, Color(220,20,60, 255), TEXT_ALIGN_CENTER)
				draw.DrawText(self.PrintName, "banksss", 0, 800, Color(220,20,60, 255), TEXT_ALIGN_CENTER)
				draw.DrawText(moneyPercentage .. "%" , "banksss",	0, 71 + 780, Color(220,20,60, 255), TEXT_ALIGN_CENTER)

			end


		end

		function ENT:Calc3D2DParams()

			local pos = self:GetPos()
			local ang = self:GetAngles()

			pos = pos + ang:Up() * 85
			pos = pos + ang:Forward() * 32
			pos = pos + ang:Right() * 0

			ang:RotateAroundAxis(ang:Right(), -90)
			ang:RotateAroundAxis(ang:Up(), 90)

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
