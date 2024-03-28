MODULE.Name 	= "HUD"
MODULE.Author 	= "Q2F2 & Ghosty"
MODULE.Realm 	= 2

local tag = "BaseWars.HUD"

function MODULE:__INIT()
-- default value for base = 1080
local function respH(pixels, base)
  base = base or 1080
  return ScrH()/(base/pixels)
end
	surface.CreateFont(tag, {
		font = "Roboto",
		size = respH(16),
		weight = 800,
	})

	surface.CreateFont(tag .. ".Large", {
		font = "Roboto",
		size = respH(22),
		weight = 1200,
	})

	surface.CreateFont(tag .. ".Time", {
		font = "Roboto",
		size = respH(28),
		weight = 800,
	})

end

-- Icon
local heart = Material("icon16/heart.png")
local shield = Material("icon16/shield.png")
local money = Material("icon16/money.png")

local clamp = math.Clamp
local floor = math.floor
local round = math.Round

local function Calc(real, max, min, w)

	real = clamp(real,min or 0,max)
	real = real / max

	if w then

		local calw = w * real

		return calw, w - calw

	else

		return real

	end

end

local oldhW = 0
local oldHP = 0

local oldaW = 0
local oldAM = 0
-- base
--local shade = Color(0, 0, 0, 140)
--local trans = Color(255, 255, 255, 150)
--local textc = Color(100, 150, 200, 255)
--local hpbck = Color(255, 0  , 0  , 100)
--local pwbck = Color(0  , 0  , 255, 100)
--local red	= Color(255, 0  , 0	 , 245)

-- Autre
local bg	= Color(24, 68, 92)
local bg2   = Color(64, 100, 124)
local armor = Color(70, 130, 172)
local white = Color(255, 255, 255)
local red   = Color(256, 92, 132)
local orange= Color(232, 124, 28)
local yellow= Color(243, 244, 119)
local red3 = Color(200, 60, 80)

function SizeToClient(x,y) return ScrW()*(x/1920), ScrH()*(y/1080)
end

-- default value for base = 1920
local function respW(pixels, base)
	base = base or 1920
return ScrW()/(base/pixels)
end

-- default value for base = 1080
local function respH(pixels, base)
base = base or 1080
return ScrH()/(base/pixels)
end

function MODULE:DrawStructureInfo(ent)

	local xPos, yPos = ScrW() / 2, ScrH() / 1.1

	local name = (ent.PrintName or (ent.GetName and ent:GetName()) or (ent.Nick and ent:Nick()) or ent:GetClass()):Trim()
	local W = BaseWars.Config.HUD.EntW
	local H = BaseWars.Config.HUD.EntH

	local oldx, oldy = xPos, yPos
	local curx, cury = xPos, yPos
	local w, h
	local Font = BaseWars.Config.HUD.EntFont
	local Font2 = BaseWars.Config.HUD.EntFont2
	local Padding = 5
	local EndPad = -Padding * 2

	curx = curx - W / 2
	cury = cury - H / 2

	surface.SetDrawColor(bg)
	surface.DrawRect(curx, cury, W, H)

	surface.SetFont(Font)
	w, h = surface.GetTextSize(name)

	draw.DrawText(name, Font, oldx - w / 2, cury, bg)
	draw.DrawText(name, Font, oldx - w / 2, cury, white)

	if ent:Health() > 0 then

		cury = cury + H + 1

		surface.SetDrawColor(bg)
		surface.DrawRect(curx, cury, W, H)

		local MaxHealth = ent:GetMaxHealth() or 100
		local HealthStr = ent:Health() .. "/" .. MaxHealth .. " HP"

		local HPLen = W * (ent:Health() / MaxHealth)

		draw.RoundedBox(0, curx + Padding, cury + Padding, HPLen + EndPad, H + EndPad, red)

		surface.SetFont(Font2)
		w, h = surface.GetTextSize(HealthStr)

		draw.DrawText(HealthStr, Font2, oldx - w / 2, cury + Padding, bg)
		draw.DrawText(HealthStr, Font2, oldx - w / 2, cury + Padding, white)

	end

	if ent:BadlyDamaged() then

		cury = cury + H + 1

		surface.SetDrawColor(bg)
		surface.DrawRect(curx, cury, W, H)

		local Str = BaseWars.LANG.HealthFailure

		surface.SetFont(Font2)
		w, h = surface.GetTextSize(Str)

		draw.DrawText(Str, Font2, oldx - w / 2, cury + Padding - 1, bg)
		draw.DrawText(Str, Font2, oldx - w / 2, cury + Padding - 1, white)

	end

end

function MODULE:DrawDisplay()

	local me = LocalPlayer()
	local Ent = me:GetEyeTrace().Entity
	if BaseWars.Ents:ValidClose(Ent, me, 200) and (Ent.IsElectronic or Ent.IsGenerator or Ent.DrawStructureDisplay) then
		self:DrawStructureInfo(Ent)
	elseif Ent:IsPlayer() then
		-- draw.RoundedBox( 15, ScrW() - respW( 210 ), ScrH() / 2 - respH( 15 ), respW( 200 ), respH( 50 ), bg )
		local textColor = Ent:GetNW2Bool("Armed", false) and red3 or armor
		draw.DrawText(Ent:GetNW2Bool("Armed", false) and "Armé" or "Non armé", tag .. ".Large", ScrW()/2 + 50, ScrH()/2, textColor, 1, 1)
		if Ent:InRaid() then
			draw.DrawText("EN RAID", tag .. ".Large", ScrW()/2 + 50, ScrH()/2 - 20, orange, 1, 1)
		end
	end

end

local StuckTime
local me = LocalPlayer and LocalPlayer()
local stuckstr = CLIENT and string.format(BaseWars.LANG.StuckText, (input.LookupBinding("+duck") or "NONE"):upper(), (input.LookupBinding("+jump") or "NONE"):upper())
local Key = CLIENT and (input.LookupBinding("+menu") or "NONE"):upper() .. BaseWars.LANG.SpawnMenuControl
local col2 = Color(159,1,1,150)
local col1 = Color(1,159,1,150)

local enable_keyinfo = CLIENT and CreateClientConVar("bw_enable_keyinfo", "1", true, false)

function MODULE:Paint()

	if not IsValid(me) then me = LocalPlayer() return end

	self:DrawDisplay()

	local hp, su = me:Health(), me:Armor()

	if not me:Alive() then hp = 0 su = 0 end

	local hpF = Lerp(0.15, oldHP, hp)
	oldHP = hpF

	local suF = Lerp(0.15, oldAM, su)
	oldAM = suF

	local pbarW, pbarH = 10, 6
	local sW, sH = ScrW(), ScrH()

	local Karma = me:GetKarma()
	local KarmaText = string.format(BaseWars.LANG.KarmaText, Karma)

	local Level = me:GetLevel()
	local XP = me:GetXP()
	local NextLevelXP = me:GetXPNextLevel()
	local LevelText = string.format(BaseWars.LANG.LevelText, Level)
	local XPText = string.format(BaseWars.LANG.XPText, XP, NextLevelXP)
	local LvlText = LevelText .. ",     " .. XPText
	


	local hW = Calc(hp, 100, 0, 285.75)
	local aW = Calc(su, 100, 0, 285.75)
	local lW = Calc(XP, NextLevelXP, 0, 1590)

	local nhW,naW = 0,0

	hW = Lerp(0.15,oldhW,hW)
	oldhW = hW
	nhW =  285.75 - hW

	aW = Lerp(0.15,oldaW,aW)
	oldaW = aW
	naW =  285.75 - aW

	if BaseWars.PSAText then

		surface.SetFont("BudgetLabel")
		local w, h = surface.GetTextSize(BaseWars.PSAText)

		local fw = sW + w * 2
		local x, y = ((SysTime() * 50) % fw) - w, 1

		local Col = HSVToColor(CurTime() % 6 * 60, 1, 1)

		draw.DrawText(BaseWars.PSAText, tag .. ".Large", x, y, Col, TEXT_ALIGN_LEFT)

	end

-----------------------------------------------------------------------------------------
-- RoundedBox
draw.RoundedBox(15, respW(7.5), respH(950), respW(300), respH(120), bg)

-- Armor
draw.RoundedBox(10, respW(15), respH(957), respW(285), respH(30), bg2)
draw.RoundedBox(0, respW(15), respH(972), respW(285), respH(15), bg2)

if su > 0 then
	draw.RoundedBox(10, respW(15), respH(957), respW(aW - 0.75), respH(30), armor)
	draw.RoundedBox(0, respW(15), respH(972), respW(aW), respH(15), armor)
end
draw.DrawText(round(suF), tag .. ".Large", respW(160), respH(961.25), white, TEXT_ALIGN_CENTER)

surface.SetDrawColor(white)
surface.SetMaterial(shield)
surface.DrawTexturedRect(respW(22.5), respH(963.5), respH(18.75), respW(18.75))

-- Hp
draw.RoundedBox(0, respW(15), respH(995), respW(285), respH(30), bg2)

draw.RoundedBox(0, respW(15), respH(995), respW(hW), respH(30), red)

draw.DrawText(round(hpF), tag .. ".Large", respW(160), respH(998.75), white, TEXT_ALIGN_CENTER)

surface.SetDrawColor(white)
surface.SetMaterial(heart)
surface.DrawTexturedRect(respW(22.5), respH(1002.5), respH(18.75), respW(18.75))

-- money
draw.RoundedBox(10, respW(15), respH(1032.5), respW(285), respH(30), bg2)
draw.RoundedBox(0, respW(15), respH(1032.5), respW(285), respH(15), bg2)


surface.SetDrawColor(white)
surface.SetMaterial(money)
surface.DrawTexturedRect(respW(22.5), respH(1037.5), respW(18.75), respH(18.75))

-- level
draw.RoundedBox(100, respW(318.75), respH(1062.5), respW(1590), respH(5.25), bg)
draw.RoundedBox(100, respW(318.75), respH(1062.5), lW, respH(5.25), orange)
draw.DrawText(LvlText, tag .. ".Large", respW(360), respH(1035), orange, TEXT_ALIGN_LEFT)
draw.DrawText("LVL", tag .. ".Large", respW(322.5), respH(1035), white, TEXT_ALIGN_LEFT)

-- Karma
draw.DrawText(KarmaText, tag .. ".Large", respW(382), respH(1016), yellow, TEXT_ALIGN_LEFT)
draw.DrawText("Karma", tag .. ".Large", respW(322), respH(1016), white, TEXT_ALIGN_LEFT)

-- time
draw.DrawText(os.date("%H:%M"), tag .. ".Large", respW(375), respH(995), yellow, TEXT_ALIGN_LEFT)
draw.DrawText("Heure", tag .. ".Large", respW(322.5), respH(995), white, TEXT_ALIGN_LEFT)
	local money = me.GetMoney and me:GetMoney() or 0
	local mon = string.format(BaseWars.LANG.CURFORMER, BaseWars.NumberFormat(money))
draw.DrawText(mon, tag .. ".Large", respW(160), respH(1037.5), white, TEXT_ALIGN_CENTER)

------------------------------------------------------------------------------------

	-- Karma, XP + Controls
	
	if enable_keyinfo:GetBool() then
		draw.DrawText(BaseWars.LANG.MainMenuControl, tag, sW - 5, (BaseWars.PSAText and 20 or 3), red, TEXT_ALIGN_RIGHT)
		draw.DrawText(Key, tag, sW - 5, (BaseWars.PSAText and 33 or 16), red, TEXT_ALIGN_RIGHT)
	end
	

	if me.Stuck and me:Stuck() and me:GetMoveType() == MOVETYPE_WALK then

		if not StuckTime then StuckTime = CurTime() end

		if CurTime() > StuckTime + 1 then
			
			draw.DrawText(stuckstr, tag .. ".Large", sW / 2 + 2, sH / 2 + 2, white, TEXT_ALIGN_CENTER, TEXT_ALIGN_CENTER)
	

		end

	else

		StuckTime = nil

	end

end
hook.Add("HUDPaint", tag .. ".Paint", Curry(MODULE.Paint))

function HideHUD(name)

    for k, v in next, {"CHudHealth", "CHudBattery", --[["CHudAmmo", "CHudSecondaryAmmo"]]} do

        if name == v then

			return false

		end

    end

end
hook.Add("HUDShouldDraw", tag .. ".HideOldHUD", HideHUD)

if CLIENT then
	surface.CreateFont( "AVHUD:PlayerName", {
		font = "Roboto",
		size = ScreenScale( 30 ),
		weight = ScreenScale( 500 ),
	} )

	surface.CreateFont( "AVHUD:PlayerFac", {
		font = "Roboto",
		size = ScreenScale( 15 ),
		weight = ScreenScale( 500 ),
	} )

	hook.Add( "PostDrawOpaqueRenderables", "AVHUD:DrawPlayerInfos", function()
		local ply = LocalPlayer()
		
		for _, v in ipairs( player.GetAll() ) do
			if v == ply then continue end
			if v:GetRenderMode() == RENDERMODE_TRANSALPHA then continue end
			if FAdmin and v:FAdmin_GetGlobal("FAdmin_clocked") then continue end
			
			local ang = v:GetAngles()
			local plyAng = ply:GetAngles()
			local pos = v:GetPos() + ang:Up() * 87
		 
			ang:RotateAroundAxis( ang:Forward(), 90 )
			ang:RotateAroundAxis( ang:Right(), 90 )

			plyAng:RotateAroundAxis( plyAng:Up(), -90 )
		 
			cam.Start3D2D( pos, Angle( 0, plyAng.y, 90 ), 0.1 )
				if v:InRaid() and BaseWars.Raid:IsOnGoing() then
					draw.DrawText("EN RAID", "AVHUD:PlayerName", 0,-75, orange, 1 )
				end
				draw.DrawText( v:Nick(), "AVHUD:PlayerName", 0, 0, color_white, 1 )
				draw.DrawText( team.GetName( v:Team() ), "AVHUD:PlayerFac", 0, 75, team.GetColor( v:Team() ), 1 )
				draw.DrawText( "Niveau " .. v:GetLevel(), "AVHUD:PlayerFac", 0, 115, color_white, 1 )
			cam.End3D2D()
		end
	end )
end