BaseWars.Commands = {
	cmds = {},
}

if ulx or ulib then
	BaseWars.Commands.Pattern = "[/|%.]"
else
	BaseWars.Commands.Pattern = "[!|/|%.]"
end

function BaseWars.Commands.ParseArgs(str, ply)
	local ret 		= {}
	local InString 	= false
	local strchar 	= ""
	local chr 		= ""
	local escaped 	= false

	for i = 1, #str do
		local char = str[i]

		if escaped then
			chr = chr..char
			escaped = false
		continue end

		if char:find("[\"|']") and not InString and not escaped then
			InString 	= true
			strchar 	= char
		elseif char:find("[\\]") then
			escaped 	= true

			continue
		elseif InString and char == strchar then
			ret[#ret+1] = chr:Trim()
			chr 		= ""
			InString 	= false
		elseif char:find("[ ]") and not InString and chr ~= "" then
			ret[#ret+1] = chr
			chr 		= ""
		else
			chr = chr .. char
		end
	end

	if chr:Trim():len() ~= 0 then
		ret[#ret+1] = chr
	end

	return ret
end

function BaseWars.Commands.CallCommand(ply, cmd, line, args)
	if ply.IsBanned and ply:IsBanned() then
		ply:EmitSound("buttons/button8.wav")
		ply:SendLua(string.format([[local s = "%s" notification.AddLegacy(s, 1, 4)]], "Banned players use no commands!"))

		return
	end

	if easylua then
		for _, v in ipairs(args) do
			if v[1] == "#" and v ~= "#me" and ply and not ply:IsAdmin() then
				ply:EmitSound("buttons/button8.wav")
				ply:SendLua(string.format([[local s = "%s" notification.AddLegacy(s, 1, 4)]], "LOUDNO!!!"))

				return
			end
		end
	end

	BaseWars.UTIL.Log("COMMAND: ", ply, " -> ", cmd, "[", line, "]")

	local ok, msg = pcall(function()
		local allowed, reason = hook.Run("BaseWarsCommand", cmd, ply, line, unpack(args))

		cmd = BaseWars.Commands.cmds[cmd]
		if allowed ~= false then
			if easylua then easylua.Start(ply) end
				allowed, reason = cmd.CallBack(ply, line, unpack(args))
			if easylua then easylua.End() end
		end

		if ply:IsValid() then
			if allowed == false then
				ply:EmitSound("buttons/button8.wav")

				if reason then
					ply:SendLua(string.format([[local s = "%s" notification.AddLegacy(s, 1, 4)]], reason))
				end
			end
		end
	end)

	if not ok then
		ErrorNoHalt(msg)

		return msg
	end
end

function BaseWars.Commands.ConCommand(ply, cmd, args, line)
	local Cmd = args[1]
	if not Cmd then return end

	local TblCmd = BaseWars.Commands.cmds[Cmd]
	if not TblCmd then return end

	if not BaseWars.Ents:Valid(ply) or (TblCmd.IsAdmin and not ply:IsAdmin()) then return end
	if ply.IsBanned and ply:IsBanned() and not ply:IsAdmin() then return end

	table.remove(args, 1)

	BaseWars.Commands.CallCommand(ply, Cmd, table.concat(args, " "), args)
end

function BaseWars.Commands.SayCommand(ply, txt, team)
	if not txt:sub(1, 1):find(BaseWars.Commands.Pattern) then return end

	local cmd 	= txt:match(BaseWars.Commands.Pattern .. "(.-) ") or txt:match(BaseWars.Commands.Pattern .. "(.+)") or ""
	local line 	= txt:match(BaseWars.Commands.Pattern .. ".- (.+)")

	cmd = cmd:lower()

	if not cmd then return end

	local TblCmd = BaseWars.Commands.cmds[cmd]
	if not TblCmd then return end

	if not BaseWars.Ents:Valid(ply) or (TblCmd.IsAdmin and not ply:IsAdmin()) then return end

	BaseWars.Commands.CallCommand(ply, cmd, line, line and BaseWars.Commands.ParseArgs(line) or {})

	return ""
end

function BaseWars.Commands.AddCommand(cmd, callback, admin)
	if istable(cmd) then
		for k, v in next, cmd do
			BaseWars.Commands.AddCommand(v, callback, admin)
		end

		return
	end

	BaseWars.Commands.cmds[cmd] 	= {CallBack = callback, IsAdmin = admin, Cmd = cmd}
end

concommand.Add("basewars", BaseWars.Commands.ConCommand)
hook.Add("PlayerSay", "BaseWars.Commands", BaseWars.Commands.SayCommand)

local dist = 100^2
local function Upgradable(ply, ent)
	local Eyes = ply:EyePos()
	local Class = ent:GetClass()

	return BaseWars.Ents:Valid(ent) and Eyes:DistToSqr(ent:GetPos()) < dist and ent.Upgrade
end
BaseWars.Commands.AddCommand({"upg", "upgrade", "upgr"}, function(ply, line, level)

	
	local trace = ply:GetEyeTrace()

	local Ent = trace.Entity
	if not Upgradable(ply, Ent) then return false end
	if (Ent.CPPIGetOwner and Ent:CPPIGetOwner() ~= ply) then return false end -- no
	local up = tonumber(level)

	if not Ent.CurrentValue then return false end

	local Owner = BaseWars.Ents:ValidOwner(Ent)
	if Owner ~= ply then return false end


	if up and up > 1 and up < 1024 then
		for i = 1, up do
			local r = Ent:Upgrade(ply)
			if r == false then break end
		end
	else
		Ent:Upgrade(ply)
	end
end, false)

BaseWars.Commands.AddCommand({"maxupg", "max", "maxupgr", "maxupgrade"}, function(ply, line, level)
	local trace = ply:GetEyeTrace()
	
	local Ent = trace.Entity
	if not Upgradable(ply, Ent) then return false end
	if (Ent.CPPIGetOwner and Ent:CPPIGetOwner() ~= ply) then return false end -- no

	if not Ent.CurrentValue then return false end

	local Owner = BaseWars.Ents:ValidOwner(Ent)
	if Owner ~= ply then return false end

	for i = 1, (Ent.MaxLevel or 1024) do
		local r = Ent:Upgrade(ply, true)
		if r == false then break end
	end
end, false)

BaseWars.Commands.AddCommand("psa", function(ply, line, text)
	if text then
		local l = line:gsub("\\", "\\\\")
		l = l:gsub("\"", "\\\"")
		BroadcastLua([[BaseWars.PSAText = "]] .. l .. [["]])
	else
		BroadcastLua([[BaseWars.PSAText = nil]])
	end
end, true)


BaseWars.Commands.AddCommand({"sell", "destroy", "remove", "delete"}, function(ply)
	local trace = ply:GetEyeTrace()

	local Ent = trace.Entity
	if not Ent.CurrentValue then return false end

	local Owner = BaseWars.Ents:ValidOwner(Ent)
	if Owner ~= ply then return false end

	if ply:InRaid() then return false end

	BaseWars.UTIL.PayOut(Ent, ply)
	Ent:Remove()
end, false)

BaseWars.Commands.AddCommand({"steam", "sg", "group"}, function(ply)
	ply:SendLua([[gui.OpenURL"]] .. BaseWars.Config.SteamGroup .. [["]])
end, false)

BaseWars.Commands.AddCommand({"forums", "forum", "f"}, function(ply)
	ply:SendLua([[gui.OpenURL"]] .. BaseWars.Config.Forums .. [["]])
end, false)

BaseWars.Commands.AddCommand({"addons", "workshop", "collection", "content"}, function(ply)
	ply:SendLua([[gui.OpenURL"]] .. BaseWars.Config.Workshop .. [["]])
end, false)

BaseWars.Commands.AddCommand("discord", function(ply)
	ply:SendLua([[gui.OpenURL"]] .. BaseWars.Config.Discord .. [["]])
end, false)