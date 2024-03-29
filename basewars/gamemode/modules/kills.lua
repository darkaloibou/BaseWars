MODULE.Name 	= "Kills"
MODULE.Author 	= "Arkov Le Chauve"

local tag = "BaseWars.Kills"
local PLAYER = debug.getregistry().Player

local function isPlayer(ply)

	return (IsValid(ply) and ply:IsPlayer())
	
end

function MODULE:Get(ply)
	
	return tonumber(ply:GetNWString(tag)) or 0
	
end
PLAYER.GetKills = Curry(MODULE.Get)

if SERVER then

	function MODULE:Init(ply)
	
		BaseWars.MySQL.InitPlayer(ply, "kills", "0")
		
	end
	PLAYER.InitKills = Curry(MODULE.Init)

	for k, v in next, player.GetAll() do
		
		MODULE:Init(v)
	
	end

	function MODULE:Save(ply, amount)

		BaseWars.MySQL.SaveVar(ply, "kills", amount or self:Get(ply))
		
	end
	PLAYER.SaveKills = Curry(MODULE.Save)
	
	function MODULE:Load(ply)
	
		self:Init(ply)
		
		BaseWars.MySQL.LoadVar(ply, "kills", function(ply, var, val)
			if not IsValid(ply) then return end
			
			ply:SetNWString(tag, tostring(val))
		end)
		
	end
	PLAYER.LoadKills = Curry(MODULE.Load)

	function MODULE:Set(ply, amount)

		if not isnumber(amount) or amount < -100 then amount = -100 end
		if amount > 100 then amount = 100 end
		
		amount = math.Round(amount)
		self:Save(ply, amount)
		
		ply:SetNWString(tag, tostring(amount))
		
	end
	PLAYER.SetKills = Curry(MODULE.Set)

	function MODULE:Add(ply, amount)
		
		local Value = ply:GetKills()
		
		ply:SetKills(Value + amount)
		
	end
	PLAYER.AddKills = Curry(MODULE.Add)
	
	hook.Add("LoadData", tag .. ".Load", Curry(MODULE.Load))
	hook.Add("PlayerDisconnected", tag .. ".Save", Curry(MODULE.Save))
	

	hook.Add( "PlayerDeath", tag .. ".AddFrag", function( victim, _, atk )
		if victim == atk then return end
		if !victim:IsPlayer() || !atk:IsPlayer() then return end
		atk:AddKills( 1 )
	end )
end
