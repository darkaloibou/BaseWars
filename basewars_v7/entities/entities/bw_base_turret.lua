AddCSLuaFile()

ENT.Base = "bw_base_electronics"
ENT.Type = "anim"

ENT.PrintName = "Turret"
ENT.AutomaticFrameAdvance = true
ENT.Model = "models/tf2defaultmodels/skirmisherstuff/turret_level1.mdl"

ENT.Drain = 35
ENT.Damage = 2
ENT.Radius = 750
ENT.ShootingDelay = 0.08
ENT.Ammo = -1
ENT.Angle = math.rad( 45 )
ENT.LaserColor = Color( 0, 255, 0 )

ENT.EyePosOffset 	= Vector( 0, 0, 0 )
ENT.Sounds 			= Sound( "npc/turret_floor/shoot1.wav" )
ENT.NoAmmoSound		= Sound( "weapons/pistol/pistol_empty.wav" )

ENT.AlwaysRaidable = true

ENT.Spread = 15
ENT.NextShot = 0

ENT.Editable			= false
ENT.Spawnable			= true
ENT.AdminOnly			= false
ENT.RenderGroup 		= RENDERGROUP_TRANSLUCENT
ENT.AutomaticFrameAdvance = true 

ENT.Rockets = 20
ENT.MRockets = 20
ENT.NextP = 0

ENT.Target = nil
ENT.yaw = 0
ENT.roll = 0

ENT.IdleAnim = "aim_nat"
ENT.TurMuz = "turret_muzzle"
ENT.TurBack = "turret_back"

function ENT:DoTurretAnim()
	if SERVER then
		net.Start( "Basewars.TurretMakeAnim" )
			net.WriteEntity( self )
		net.SendPVS( self:GetPos() )
	end

	local mBonB = self:LookupBone( self.TurBack )

	timer.Simple(0.02,function()
		if !IsValid( self ) then return end
		self:ManipulateBoneAngles( mBonB, Angle(0,0,-3), false )
		timer.Simple(0.04,function()
			if !IsValid( self ) then return end
			self:ManipulateBoneAngles( mBonB, Angle(0,0,-6), false )
			timer.Simple(0.5,function()
				if !IsValid( self ) then return end
				self:ManipulateBoneAngles( mBonB, Angle(0,0,-9), false )
				timer.Simple(0.6,function()
					if !IsValid( self ) then return end
					self:ManipulateBoneAngles( mBonB, Angle(0,0,-7), false )
					timer.Simple(0.8,function()
						if !IsValid( self ) then return end
						self:ManipulateBoneAngles( mBonB, Angle(0,0,-3), false )
					end)
				end)
			end)
		end)
	end)
				
	timer.Simple(0.1,function()
		if !IsValid( self ) then return end
		self:ManipulateBoneAngles( mBonB, Angle(0,0,0) )
	end)
end

local function findPlayersInCone(cone_origin, cone_direction, cone_radius_sqr, cone_angle)
	cone_direction:Normalize()
	local cos = math.cos(cone_angle)

	local result = {}
	local i = 0

	for _, entity in ipairs(player.GetAll()) do
		local pos = entity:GetPos()
		local dir = pos - cone_origin
		dir:Normalize()

		local dot = cone_direction:Dot(dir)

		if dot > cos and cone_origin:DistToSqr(pos) <= cone_radius_sqr then
			i = i + 1
			result[i] = entity
		end
	end

	return result, i
end

if SERVER then
	util.AddNetworkString( "Basewars.TurretMakeAnim" )

	function ENT:Init()
		self:SetModel( self.Model )
		self:SetSequence( self:LookupSequence( self.IdleAnim ) )
		self:SetPlaybackRate( 0.5 )
	end

	function ENT:GetBulletInfo( target, pos )
		local bullet = {}
		bullet.Num = 1
		bullet.Damage = self.Damage
		bullet.Force = 1
		bullet.TracerName = "AR2Tracer"
		bullet.Spread = Vector( self.Spread, self.Spread, 0 )
		bullet.Src = self.EyePosOffset
		bullet.Dir = pos - self.EyePosOffset

		return bullet
	end

	function ENT:Shoot( target )
		if self.beingPhysgunned and #self.beingPhysgunned > 0 then return end
		if timer.Exists( "IdleAnim" .. self:EntIndex() ) then timer.Remove( "IdleAnim" .. self:EntIndex() ) end

		timer.Simple(0.15,function()
			local Pos = target:LocalToWorld(target:OBBCenter()) + Vector(0, 0, 10)
			
			local tr = {}
			tr.start = self.EyePosOffset
			tr.endpos = Pos
			
			tr.filter = function(ent)
				return ent:IsPlayer() || ent:GetClass():find("prop_")
			end

			tr = util.TraceLine( tr )
		
			if tr.Entity == target then
				local Bullet = self:GetBulletInfo(target, Pos)
				self:FireBullets(Bullet)

				ParticleEffectAttach("muzzle_sentry",PATTACH_POINT ,self,4)
				
				self:DoTurretAnim()
		
				self:EmitSound(self.Sounds)

				self.Ammo = self.Ammo - 1
				self:ResetSequence( self:LookupSequence( "idle_off" ) )
				
				timer.Create( "IdleAnim" .. self:EntIndex(), 5, 1, function()
					if IsValid( self ) then
						self:ResetSequence( self:LookupSequence( self.IdleAnim ) )
						self:SetPlaybackRate( 0.5 )
					end
				end )
			end
		end)
	end

	function ENT:Think()
		self:ThinkFuncBypass()

		if self:BadlyDamaged() and math.random(0, 11) == 0 then
			self:Spark()
		end

		if self:WaterLevel() > 0 and not self:GetWaterProof() then
			if not self.FirstTime and self:Health() > 25 then
				self:SetHealth(25)
				self:Spark()
				self.FirstTime = true
			end

			if self.rtb == 2 then
				self.rtb = 0
				self:TakeDamage(1)
			else
				self.rtb = self.rtb + 1
			end
		else
			self.FirstTime = false
		end

		if self:BadlyDamaged() then
			if self:GetUsable() then self:SetUsable(false) end
			self:NextThink( CurTime() ) return true
		end

		local Res = self:CheckUsable()
		local State = Res ~= false

		if State ~= self:GetUsable() then
			self:SetUsable(State)
		end

		self:ThinkFunc()

		if self.NextShot > CurTime() then self:NextThink( CurTime() ) return true end
		self.NextShot = CurTime() + self.ShootingDelay

		if self.Ammo == 0 then self:EmitSound( self.NoAmmoSound ) self:NextThink( CurTime() ) return true end

		local Owner = BaseWars.Ents:ValidOwner( self )

		if Owner then
			local Forward = self:GetForward()
			self.EyePosOffset, _ = self:GetBonePosition( self:LookupBone( self.TurMuz ) )
			local pos = self:GetPos()
			self.RadiusSqr = self.RadiusSqr or ( self.Radius * self.Radius )
			local find, count = findPlayersInCone( self.EyePosOffset, Forward, self.RadiusSqr, self.Angle )

			local closest, dist = nil, math.huge

			for i = 1, count do
				local v = find[ i ]
				if Owner:IsEnemy( v ) then
					local d = pos:DistToSqr( v:GetPos() )
		
					if d < dist then
						closest = v
						dist = d
					end
				end
			end

			if IsValid( closest ) then
				local tB = closest:GetPos()

				if !closest:IsPlayer() then
					local att = closest:LookupBone( "ValveBiped.Bip01_Spine1" )
					local a,_ = closest:GetBonePosition( att )
					tB = a - Vector( 0, 0, 30 )
				end

				local fA = tB - pos

				fA:Normalize()

				self.yaw = -fA:Angle().y + self:GetAngles().y
				self:SetPoseParameter( "aim_yaw", self.yaw )

				if -fA:Angle().p < -270 then
					self:SetPoseParameter( "aim_pitch", 360 - fA:Angle().p )
				else
					self:SetPoseParameter( "aim_pitch", -fA:Angle().p )
				end
				
				self:Shoot( closest )
			end
		end

		self:NextThink( CurTime() )
		return true
	end
else
	net.Receive( "Basewars.TurretMakeAnim", function()
		local turret = net.ReadEntity()
		if !IsValid( turret ) || !turret.DoTurretAnim then return end

		turret:DoTurretAnim()
	end )
	
	function ENT:Draw()
		self:DrawModel()

		local Owner = BaseWars.Ents:ValidOwner( self )
		if !Owner then return end

		if self.beingPhysgunned and #self.beingPhysgunned > 0 then return end
		
		local Forward = self:GetForward()
		
		self.EyePosOffset, _ = self:GetBonePosition( self:LookupBone( self.TurMuz ) )

		local pos = self:GetPos()
		self.RadiusSqr = self.RadiusSqr or ( self.Radius * self.Radius )
		local find, count = findPlayersInCone( self.EyePosOffset, Forward, self.RadiusSqr, self.Angle )
			
		local closest, dist = nil, math.huge

		for i = 1, count do
			local v = find[ i ]
			if Owner:IsEnemy( v ) then
				local d = pos:DistToSqr( v:GetPos() )
	
				if d < dist then
					closest = v
					dist = d
				end
			end
		end

		if IsValid( closest ) then
			if not BaseWars.Ents:ValidPlayer( closest ) then return end
			
			if !Owner:IsEnemy( closest ) then return end
			
			local Pos = closest:LocalToWorld( closest:OBBCenter() ) + Vector( 0, 0, 10 )
		
			local tr = {}
			tr.start = self.EyePosOffset
			tr.endpos = Pos
			tr.filter = function( ent )
				return ent:IsPlayer() || ent:GetClass():find( "prop_" )
			end

			tr = util.TraceLine( tr )
			
			if tr.Entity ~= closest then return end
			
			render.DrawLine( self.EyePosOffset, Pos, self.LaserColor, true )
		end
	end
end