DeriveGamemode("sandbox")

// Charge tout
local function IncludeCS(File)
	include(File)
	if SERVER then
		AddCSLuaFile(File)
	end
end

local function LoadFileCS(File)
	if CLIENT then
		include(File)
	else
		AddCSLuaFile(File)
	end
end

local function IncludeSV(file)
	if SERVER then
		include(file)
	end
end

do
	IncludeCS("shared.lua")
	IncludeCS("language.lua")
	pcall(IncludeCS, "config.lua")

	IncludeCS("shared/spawnmenu.lua")

	IncludeCS("shared/cppi.lua")
	IncludeCS("shared/admin.lua")

	IncludeCS("shared/utf8_extender.lua")
	IncludeCS("shared/playuhr.lua")

	if BaseWars.Config.ExtraStuff then
		IncludeCS("shared/customnick.lua")
		IncludeCS("shared/hostnamefix.lua")
	end

	if ulib or ulx then
		IncludeCS("integration/bw_admin_ulx.lua")
	end
end

do
	LoadFileCS("client/cl_bwmenu.lua")
	LoadFileCS("client/cl_interactions.lua")
	LoadFileCS("client/cl_minimap.lua")
	LoadFileCS("client/gui_cleanup.lua")
end

do
	IncludeSV("server/commands.lua")
	IncludeSV("server/hooks.lua")

	IncludeSV("server/mysql.lua")
end
