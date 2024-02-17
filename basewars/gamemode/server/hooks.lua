hook.Add("BaseWars_PlayerBuyEntity", "XPRewards", function(ply, ent)
	if ply:GetLevel() > 20 then return end

	local ent = BaseWars.Ents:Valid(ent)
	if not ent then return end

	local mult = BaseWars.Config.XPMultiplier
	local class = ent:GetClass()

	if class:match("bw_printer_") or class == "bw_base_moneyprinter" then
		local lvl = (ent.CurrentValue or 1000) / 1000
		ply:AddXP(55 * lvl * mult)
	elseif class:match("bw_gen_") then
		ply:AddXP(125 * mult)
	elseif class == "bw_printerpaper" then
		ply:AddXP(25 * mult)
	end
end)

hook.Add("BaseWars_PlayerEmptyPrinter", "XPRewards", function(ply, ent, money)
	local mult = BaseWars.Config.XPMultiplier
	ply:AddXP(math.max(0, (money / 500) * mult))
end)

timer.Create("BaseWars_KarmaRecover", 5 * 60, 0, function()
	for k, v in next, player.GetAll() do
		if v:GetKarma() < 0 then
			v:AddKarma(2)
		else
			v:AddKarma(1)
		end
	end
end)

hook.Add("EntityTakeDamage", "fuck_grenades", function(t, d)
	local inf = d:GetInflictor()
	if IsValid(inf) and inf:GetClass() == "cw_grenade_thrown" and IsValid(t) and not t:IsPlayer() then
		d:ScaleDamage(0.025)
	elseif t:IsPlayer() && !t:GetNW2Bool( "Armed", false ) then
		d:ScaleDamage( 0.05 )
	end
end)

hook.Add( "PlayerLoadout", "verif_weapons", function( ply )
	timer.Simple( 1, function()
		local armed = false

		for _, v in ipairs( ply:GetWeapons() ) do
			if !BaseWars.Config.BlacklistArmes[ v:GetClass() ] then
				armed = true
				break
			end
		end
	
		if armed != ply:GetNW2Bool( "Armed", false ) then 
			ply:SetNW2Bool( "Armed", armed )
		end
	end )
end )

hook.Add( "WeaponEquip", "verif_equip_wep", function( wep, owner )
	if !BaseWars.Config.BlacklistArmes[ wep:GetClass() ] then
		owner:SetNW2Bool( "Armed", true )
	end
end )

hook.Add( "PlayerDroppedWeapon", "verif_drop_wep", function( owner, wep )
	local armed = false

	for _, v in ipairs( owner:GetWeapons() ) do
		if !BaseWars.Config.BlacklistArmes[ v:GetClass() ] then
			armed = true
			break
		end
	end

	if armed != ply:GetNW2Bool( "Armed", false ) then 
		ply:SetNW2Bool( "Armed", armed )
	end
end )

if aowl then
	hook.Add("PlayerIsRaidable", "stop_raiding_newfags", function(ply)
		if ply.GetPlayTimeTable and ply:GetPlayTimeTable().h < 3 then
			return false, "Less than 3 hours of playtime."
		end
	end)

	hook.Add("BaseWars_PlayerCanEmptyPrinter", "stop_breaking_the_economy", function(ply, ent, amt)
		if ply ~= ent:CPPIGetOwner() --[[and amt > (ply:GetMoney() / 8)]] then
			return false
		end
	end)
end

g_VaultLookup = g_VaultLookup or {}
hook.Add("BaseWars_PlayerCanBuyEntity", "money_vault", function(ply, class)
	if class:match("bw_vault") and IsValid(g_VaultLookup[ply:SteamID64()]) then
		return false, "You already own a money vault."
	end
end)

hook.Add("BaseWars_PlayerBuyEntity", "money_vault", function(ply, ent)
	if ent:GetClass():match("bw_vault") then
		g_VaultLookup[ply:SteamID64()] = ent
	end
end)

util.AddNetworkString( "BaseWars_Leaderboard" )

hook.Add( "ShowTeam", "leaderboard_show", function( ply )
	local leaderboard = {}

	BaseWars.MySQL.GetLDB( "kills", function( data )
		leaderboard[ "kills" ] = data

		BaseWars.MySQL.GetLDB( "time", function( data )
			leaderboard[ "time" ] = data

			BaseWars.MySQL.GetLDB( "level", function( data )
				leaderboard[ "level" ] = data

				BaseWars.MySQL.GetLDB( "money", function( data )
					leaderboard[ "money" ] = data
					
					net.Start( "BaseWars_Leaderboard" )
						net.WriteTable( leaderboard )
					net.Send( ply )
				end )
			end )
		end )
	end )
end )