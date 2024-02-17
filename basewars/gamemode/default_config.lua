// Je ne sais pas a quoi cela sert ?






--[[
THIS IS NOT THE CONFIG FILE
DO NOT EDIT THIS FILE UNDER ANY CIRCUMSTANCES
SERIOUSLY. YOU CAN OVERRIDE IT WITH YOUR OWN CONFIG.
THIS JUST STOPS YOU MESSING THE GM UP IF YOU BREAK IT.
]]

--[[BASEWARS_CHOSEN_LANGUAGE = BASEWARS_CHOSEN_LANGUAGE or "ENGLISH"

local BaseWars_Config = {
	NonOwnedTakeDamage = true,
	AllTalk = true,
	WeaponDespawn = 60 * 3,
	SpawnRadius = 256,
	RadarRange = 4096,
	SBoxWeps = false,
	XPMultiplier = 1.0,
	Forums 		= "",
	SteamGroup 	= "",
	Workshop    = "",
	ScaleVIPPayDay = true,
	VIPRanks = {
	},
	MaximumPay = 10^4,
	BountyDelimiter = 2,
	PricesSize = 11,
	IconSize = 72,
	AllowPropPunt = false,
	SpawnBuilding = 1,
	Ents = {
		Electronics = {
			Explode		= true,
			WaterProof	= false,
		},
		SpawnPoint = {
			Offset 		= Vector(0, 0, 16),
		},
	},
	Drugs = {
		DoubleJump = {
			JumpHeight 	= Vector(0, 0, 320),
			Duration	= 120,
		},
		Steroid = {
			Walk 		= 330,
			Run 		= 580,
			Duration	= 120,
		},
		Regen = {
			Duration 	= 30,
		},
		Adrenaline = {
			Mult		= 1.5,
			Duration	= 120,
		},
		PainKiller = {
			Mult 		= .675,
			Duration	= 80,
		},
		Rage = {
			Mult 		= 1.675,
			Duration	= 120,
		},
		Shield = {
		},
		Antidote = {
		},
		CookTime	= 60 * 2,
	},
	Notifications = {
		LinesAmount = 11,
		Width		= 582,
		BackColor	= Color(30, 30, 30, 140),
		OpenTime	= 10,
	},
	Raid = {
		Time 			= 60 * 5,
		CoolDownTime	= 60 * 15,
		NeededPrinters	= 1,
		CertainInflictors = false,
		Inflictors = {
		},
	},
	AFK  = {
		Time 	= 30,
	},
	HUD = {
		EntFont = "TargetID",
		EntFont2 = "BudgetLabel",
		EntW	= 175,
		EntH	= 25,
	},
	Rules = {
		IsHTML 	= false,
		HTML	= "http://hexahedron.pw/default_rules.html",
	},
	HelpInfo = {
		IsHTML	= false,
		HTML	= "http://hexahedron.pw/default_helpinfo.html",
	},
	Adverts = {
		Time = 120,
	},
	SpawnWeps = {
		"weapon_physcannon",
		"hands",
	},
	WeaponDropBlacklist = {
		["weapon_physgun"] = true,
		["weapon_physcannon"] = true,
		["hands"] = true,
		["gmod_tool"] = true,
		["gmod_camera"] = true,
	},
	PhysgunBlockClasses = {
		["bw_spawnpoint"] = true,
		["bw_explosive_c4"] = true,
		["bw_explosive_bigbomb"] = true,
		["bw_explosive_bigbomb_fragment"] = true,
		["bw_explosive_mine"] = true,
		["bw_explosive_mine_speed"] = true,
		["bw_explosive_mine_power"] = true,
		["bw_explosive_mine_shock"] = true,
		["bw_explosive_nuke"] = true,
	},
	BlockedTools = {
	},
	ModelBlacklist = {
	},
	NPC = {
		FadeOut = 400,
	},
	AntiRDM = {
		HurtTime 		= 80,
		RDMSecondsAdd 	= 3,
		KarmaSecondPer 	= 4,
		KarmaLoss 		= -2,
		KarmaGlowLevel 	= 65,
	},
	PayDayBase 			= 500,
	PayDayMin			= 50,
	PayDayDivisor		= 1000,
	PayDayRate 			= 60 * 3,
	PayDayRandom		= 50,
	StartMoney 			= 5000,
	CustomChat			= true,
	ExtraStuff			= true,
	CleanProps			= false,
	AllowFriendlyFire	= false,
	DefaultWalk			= 180,
	DefaultRun			= 300,
	DefaultLimit		= 5,
	SpawnOffset			= Vector(0, 0, 40),
	UniversalPropConstant = 2.7,
	DestroyReturn 		= 0.6,
	RestrictProps 		= false,
	DispenserTime		= 0.5,
	LevelSettings = {
		BuyWeapons = 2,
		MaxLevel = 5000,
	},
}

BaseWars.Config = BaseWars.Config or BaseWars_Config
for k, v in pairs(BaseWars_Config) do
	BaseWars.Config[k] = (BaseWars.Config[k] == nil and v) or BaseWars.Config[k]
end

BaseWars.NPCTable = BaseWars.NPCTable or {}
BaseWars.AdvertTbl = BaseWars.AdvertTbl or {}

BaseWars.Config.Help = BaseWars.Config.Help or {}
BaseWars.Config.DrugHelp = BaseWars.Config.DrugHelp or {}
BaseWars.Config.CommandsHelp = BaseWars.Config.CommandsHelp or {}
]]--