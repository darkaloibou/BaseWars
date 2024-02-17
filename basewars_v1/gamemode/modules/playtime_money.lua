MODULE.Name 	= "PlayTime_Money"
MODULE.Author 	= "Q2F2 & Ghosty"

local tag = "BaseWars.PlayTime_Money"

if SERVER then

	-- FastDL stuff, it gets already automatically added

	return

end



local abs 		= math.abs
local floor 	= math.floor
local clamp 	= math.Clamp
-- Couleurs
local bg	= Color(24, 68, 92)
local bg2   = Color(64, 100, 124)
local armor = Color(70, 130, 172)
local white = Color(255, 255, 255)
local red   = Color(256, 92, 132)
local orange= Color(232, 124, 28)
local yellow= Color(243, 244, 119)

function MODULE:__INIT()

	surface.CreateFont(tag, {
		font = "Roboto",
		weight = 800,
		size = 24,
	})

	surface.CreateFont(tag .. ".Large", {
		font = "Roboto",
		size = 22,
		weight = 1200,
	})

end

local function playTime(n)

	local dat = n
	local str = ""

	if dat.h > 0 then

		str = str .. dat.h .. BaseWars.LANG.HoursShort .. " "

	end
	if dat.m > 0 then

		str = str .. dat.m ..  BaseWars.LANG.MinutesShort .. " "

	end
	if dat.s > 0 then

		str = str .. dat.s  ..  BaseWars.LANG.SecondsShort .. " "

	end

	return #str > 0 and str or "0s"

end

local me = LocalPlayer()
local shade = Color(0, 0, 0, 140)

local loss = false
local old = 0
local last = CurTime()
local triggered

local efx = {}
local remove = table.remove

local function addEffect(f)

	efx[#efx + 1] = f

end

local function popEffect(i)

	remove(efx,i)

end

local function drawEffects()

	for i = 1, #efx do

		local f = efx[i]

		if f then

			f(i)

		end

	end

end

local green = Color(42, 255, 0)
local red = Color(255, 0, 0)

local TryAgain = true

function MODULE:Paint()

	local sW, sH = ScrW(), ScrH()
	local cT = CurTime()

	if not IsValid(me) then me = LocalPlayer() return end

	local plTime = me.GetPlayTimeTable and me:GetPlayTimeTable() or {h = 0, m = 0, s = 0}
	local money = me.GetMoney and me:GetMoney() or 0

	local diff = 0

	old = money

	money = BaseWars.NumberFormat(money)

	draw.DrawText(playTime(plTime), tag .. ".Large", 450, 975, orange, TEXT_ALIGN_LEFT)
	draw.DrawText("Temps de jeu", tag .. ".Large", 322.5, 975, white, TEXT_ALIGN_LEFT)

end
hook.Add("HUDPaint", tag .. ".Paint", Curry(MODULE.Paint))
