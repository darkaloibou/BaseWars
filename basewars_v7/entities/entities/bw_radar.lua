ENT.Base = "bw_base_electronics"
ENT.Type = "anim"

ENT.PrintName = "Radar Transmitter"
ENT.Model = "models/tf2defaultmodels/rayzarstuff/dispenser_level3_building.mdl"

ENT.AlwaysRaidable = false

if SERVER then
	AddCSLuaFile()

	function ENT:SetMinimap(ply, bool)
		ply:SetNW2Bool("BaseWars_HasRadar", bool)
	end

	function ENT:ThinkFuncBypass()
		local Owner = BaseWars.Ents:ValidOwner(self)
		if Owner then
			self:SetMinimap(Owner, true)
		end
	end

	function ENT:OnRemove()
		local Owner = BaseWars.Ents:ValidOwner(self)
		if Owner then
			self:SetMinimap(Owner, false)
		end
	end
end
