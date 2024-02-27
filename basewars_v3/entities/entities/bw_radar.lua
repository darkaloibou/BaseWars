ENT.Base = "bw_base_electronics"
ENT.Type = "anim"

ENT.PrintName = "Radar Transmitter"
ENT.Model = "models/tf2defaultmodels/rayzarstuff/dispenser_level3_building.mdl"

ENT.PowerRequired = -1
ENT.PowerCapacity = 5000

ENT.AlwaysRaidable = true

if SERVER then
	AddCSLuaFile()

	function ENT:SetMinimap(ply, bool)
		ply:SetNW2Bool("BaseWars_HasRadar", bool)
	end

	function ENT:ThinkFuncBypass()
		local Owner = BaseWars.Ents:ValidOwner(self)
		if Owner then
			self:SetMinimap(Owner, self:IsPowered())
		end
	end

	function ENT:OnRemove()
		local Owner = BaseWars.Ents:ValidOwner(self)
		if Owner then
			self:SetMinimap(Owner, false)
		end
	end
end
