include("include.lua")
include("modules.lua")

BaseWars.ModuleLoader:Load()

// WTF IS THIS
local a
local b
local function PreventDefocus()
	if system.HasFocus() and not a then
		a = true
		b = false
		gui.EnableScreenClicker(false)
	elseif not system.HasFocus() and not b then
		a = false
		b = true
		gui.EnableScreenClicker(true)
	end
end
hook.Add("Think", "preventdefocusclick", PreventDefocus)

local PLAYER = debug.getregistry().Player

PLAYER.__SetMuted = PLAYER.__SetMuted or PLAYER.SetMuted
function PLAYER:SetMuted(bool)
	if bool and self:IsAdmin() then return end

	self:__SetMuted(bool)
end

--16:19 - Tenrys: q2f2 please add a convar to disable halos pls
local drawhalo = CreateClientConVar("enable_halos", "1", true, false)
haloAdd = haloAdd or halo.Add

function halo.Add(...)
	if not drawhalo:GetBool() then return end

	haloAdd(...)
end

-- I encourage making modifications, I do not however like in
-- the slightest you fucking with this information.
-- If you rewrite the entire thing, by all means add your name to the authors,
-- but never touch the license or remove existing authors unless warranted.
local function copyright()
	print("Gamemode Copyright Info:")

	print(GAMEMODE.Author or "\nAUTHOR MISSING\n")
	print(GAMEMODE.Credits or "\nCREDITS MISSING\n")
	print(GAMEMODE.Copyright or "\nCOPYRIGHT MISSING\n")
	print(GAMEMODE.Translators or "\nTRANSLATORS MISSING\n")

	print("Licensed to: {{ user_id }}")
	print("SF INFO -> {{ script_version_name }}\n")

	-- Omg big backdoor confirmed!!!1111
	-- sick of servers stopping me from seeing who the admins are.
	print("Server Admins:")
	for k, v in pairs(player.GetAll()) do
		if v:IsAdmin() then print(v) end
	end
end
concommand.Add("bw_copyright", copyright)
