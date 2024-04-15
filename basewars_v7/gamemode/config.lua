BASEWARS_CHOSEN_LANGUAGE = "FRENCH"

BaseWars.Config = {
	RadarRange = 4096,	-- RadarRange: Range of the radar, in source units
	SpawnRadius = 100,	-- SpawnRadius: Radius of invunerability around spawnpoint entities, 0 to disable
	SBoxWeps = false,	-- SBoxWeps: The same as sbox_weapons, if players spawn with hl2 weapons
	XPMultiplier = 1.0,	-- XPMultiplier: Multiplier on XP earned through various actions	-- To further customize XP distribution see server/hooks.lua
	Forums 		= "https://chill.mtxserv.com/",	-- Forums: Link to your forums, accessed with /forums
	SteamGroup 	= "https://chill.mtxserv.com/news/rules",	-- SteamGroup: Link to your steam group, accessed with /steam
	Workshop    = "https://steamcommunity.com/sharedfiles/filedetails/?id=3206265069",	-- Workshop: Link to your workshop download, accessed with /workshop
	Discord 	= "https://discord.gg/eqhGk5taYH",	-- Discord: Link to your discord server, accessed with /discord
	ScaleVIPPayDay = false,	-- ScaleVIPPayDay: Should VIP ranks get better paydays, scaling with their money?
	VIPRanks = {},	-- VIPRanks: Table of ranks which VIP items and ScaleVIPPayDay, etc applies to
	MaximumPay = 5 * 10^4,	-- MaximumPay: Maximum amount players can give eachother, helps stop inflation
	BountyDelimiter = 2,	-- BountyDelimiter: When receiving a bounty players are limited by this * their current money or the maximum bounty amount, whichever is smallest
	PricesSize = 11,	-- PricesSize: Size of font for spawnmenu labels, change this if your language makes it look bad
	IconSize = 72,	-- IconSize: Size of icons on spawnmenu, change this if the text doesnt fit with your language
	AllowPropPunt = true,	-- AllowPropPunt: Should people be allowed to punt props with the gravgun
	SpawnBuilding = 1,	-- SpawnBuilding: 0 = Disabled, people can spawn any props at spawn, 1 = Admin only, only admins can spawn props, 2 and above = Nobody, nobody can spawn props at spawn
	NonOwnedTakeDamage ={ -- ligne 103 init.lua
		"zpn_boss",
		"zpn_minion",
		"zpn_bomb"
	},
	Ents = {
		Electronics = {
			Explode		= true,			-- Explode: Should electronics detonate upon destruction
			WaterProof	= false,			-- WaterProof: Are electronics Water Proof by default
		},
		SpawnPoint = {Offset = Vector(0, 0, 16),},		-- Offset: How far above the spawnpoint should you spawn
	},
	Notifications = {
		LinesAmount = 11,		-- LinesAmount: Amount of lines on the notification HUD
		Width		= 582,		-- Width: Width of the notification HUD
		BackColor	= Color(64, 100, 124, 0),		-- BackColor: The background color of the notification HUD
		OpenTime	= 5,		-- OpenTime: Time notification HUD remains open after a notification
	},
	Raid = {
		Time 			= 60 * 5,		-- Time: Time a raid lasts for
		CoolDownTime	= 60*30,		-- CoolDownTime: Time after a raid the person being raided is protected for
		NeededPrinters	= 2,		-- NeededPrinters: Amount of valid raidables needed to be raided
		CertainInflictors = false,		-- CertainInflictors: Only allow certain inflictors to hurt props, enable this if you liked the old style blowtorch system
		Inflictors = {		-- Inflictors: If you have CertainInflictors enabled, these are the classes which can damage props		-- NOTE: bw_blowtorch can ALWAYS damage props, no matter the setting			-- NOTE: Inverted table! [class] = true-- NOTE: Inverted table! [class] = true
			["bw_blowtorch"] = true,
			["bw_explosive_c4"] = true,
			["bw_explosive_bigbomb"] = true,
			["bw_explosive_bigbomb_fragment"] = true,
			["bw_explosive_nuke"] = true,
		},
	},
	AFK  = {Time = 30,},	-- Time: Time in seconds before AFK HUD shows (DOES NOT KICK)
	HUD = {
		EntFont = "TargetID",		-- EntFont: Title font for ent HUD overlay
		EntFont2 = "BudgetLabel",		-- EntFont2: Subtitle font for ent HUD overlay
		EntW	= 175,		-- EntW: Width of ent HUD overlay
		EntH	= 25,		-- EntH: Height of ent HUD overlay
	},
	Rules = {
		IsHTML 	= false,		-- IsHTML: Is the next variable HTML, if not it is a URI to a valid HTML file
		HTML	= "https://chill.mtxserv.com/news/rules",		-- HTML: HTML string or valid URI
	},
	Adverts = {Time = 120,},		-- Time: Time between adverts by the system
	SpawnWeps = {"weapon_physcannon","hands",},	-- SpawnWeps: Weapons that everyone gets when they spawn
	WeaponDropBlacklist = {	-- WeaponDropBlacklist: Weapons nobody can drop using /dropweapon	-- NOTE: Inverted table! [class] = true
		["weapon_physgun"] = true,
		["weapon_physcannon"] = true,
		["hands"] = true,
		["gmod_tool"] = true,
		["gmod_camera"] = true,
	},
	PhysgunBlockClasses = {	-- PhysgunBlockClasses: Entity classes that you cant physgun	-- NOTE: Inverted table! [class] = true
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
	BlockedTools = {	-- BlockedTools: Tools which only admins can use	-- NOTE: Inverted table! [model] = true
		["dynamite"] = true,
		["duplicator"] = true,
		["paint"] = true,
	},
	ModelBlacklist = {	-- ModelBlacklist: Models which nobody can spawn	-- NOTE: Inverted table! [model] = true	-- Models which cause crashes
		["models/props_phx/wheels/metal_wheel1.mdl"] = true,
		["models/props_phx/wheels/metal_wheel2.mdl"] = true,
		["models/props_phx/misc/potato_launcher_chamber.mdl"] = true,
		["models/props_c17/oildrum001_explosive.mdl"] = true,
		["models/props_c17/FurnitureMattress001a.mdl"] = true,
	},
	AntiRDM = {
		HurtTime 		= 80,		-- HurtTime: Time after getting attacked in which it's not 'rdm' to kill someone
		RDMSecondsAdd 	= 0,		-- RDMSecondsAdd: Seconds added to respawn timer per random kill
		KarmaSecondPer 	= 0,		-- KarmaSecondPer: Seconds added to respawn timer per X negative karma, whats X? fuck if i know
		KarmaLoss 		= -2,		-- KarmaLoss: Karma lost per random kill
		KarmaGlowLevel 	= 100,		-- KarmaGlowLevel: Level as which players glow green or red due to karma, set to > 100 to disable
	},
	PayDayBase 			= 4000,	-- PayDayBase: Base payday rate
	PayDayMin			= 50,	-- PayDayMin: Lowest amount per payday
	PayDayDivisor		= 2000,	-- PayDayDivisor: amt = baserate - (playermoney / divisor)
	PayDayRate 			= 60 * 3,	-- PayDayRate: Amount of seconds between paydays
	PayDayRandom		= 100,	-- PayDayRandom: Randomization rate from calculated value
	StartMoney 			= 5000,	-- StartMoney: Amount of money new players get
	ExtraStuff			= true,	-- ExtraStuff: Load some extra things such as source engine fixes and player nickname customiser, disable if you dont want this
	AllowFriendlyFire	= false,	-- AllowFriendlyFire: Can people hurt other people in their faction
	DefaultWalk			= 140,	-- DefaultWalk: Default walking speed with no drugs
	DefaultRun			= 300,	-- DefaultRun: Default running speed with no drugs,
	DefaultLimit		= 3,	-- DefaultLimit: If no limit for an entity is specified this will be used, set to math.huge if you like your server crashing
	SpawnOffset			= Vector(0, 0, 40),	-- SpawnOffset: Height offset for spawning entities
	UniversalPropConstant = 3,	-- UniversalPropConstant: Like the universal gravitational constant except it dictates how much damage props can take
	DestroyReturn 		= 0.6,	-- DestroyReturn: Fraction of the value of an entity which is returned/given to the raider if it is destroyed
	RestrictProps 		= true,	-- RestrictProps: Use the BaseWars menu for spawning props as well as entities, not recommended
	DispenserTime		= 0.5,	-- DispenserTime: Time taken for a dispenser to reload
	LevelSettings = {
		BuyWeapons = 1,		-- BuyWeapons: Level needed to buy weapons, this is 2 to stop people wasting their starter money
		MaxLevel = 99999999,		-- MaxLevel: Maximum level you can be
	},
}
BaseWars.Config.BlacklistArmes = { // SWEPS qui ne sont pas considérés comme des armes pour le script "Armé/Non armé"
	[ "bw_blowtorch" ] = true,
	[ "hands" ] = true,
	[ "bw_health" ] = true,
	[ "weapon_bugbait" ] = true,
	[ "weapon_physcannon" ] = true,
	[ "riot_shield" ] = true,
	[ "numerix_radio_swep" ] = true,
	[ "gmod_camera" ] = true,
	[ "manhack_welder" ] = true,
	[ "weapon_medkit" ] = true,
	[ "gmod_tool" ] = true,
	[ "none" ] = true,
	[ "keypad_cracker" ] = true,
	[ "weapon_physgun" ] = true,
	[ "tfa_cso2_barehands" ] = true,
	[ "weapon_wrench" ] = true,
	[ "weapon_pda" ] = true,
	[ "weapon_vape_american" ] = true,
	[ "weapon_vape_butterfly" ] = true,
	[ "weapon_vape_custom" ] = true,
	[ "weapon_vape_dragon" ] = true,
	[ "weapon_vape_golden" ] = true,
	[ "weapon_vape_hallucinogenic" ] = true,
	[ "weapon_vape_helium" ] = true,
	[ "weapon_vape_juicy" ] = true,
	[ "weapon_vape_medicinal" ] = true,
	[ "weapon_vape_mega" ] = true,
	[ "weapon_vape" ] = true,
	[ "zpf_constructor" ] = true,
	[ "aact_weapact" ]	=	true,
	[ "itemstore_pickup" ] = true,

}
-- Empty the table if you dont want this
BaseWars.AdvertTbl = {
	{Grey, "N'oubliez pas de lire notre ", NiceGreen, "règlement", Grey, "! (/rules)"},
	{Grey, "Pour en savoir plus, consultez le site ", NiceGreen, "Chill BaseWars", Grey, "! (/forums)"},
	{Grey, "Pour télécharger notre contenu manuellement, tapez ", NiceGreen, "/workshop"},
	{Grey, "Ne ratez pas les nouveautés grâce à notre ", NiceGreen, "discord ", Grey, "! (/discord)"}
}

BaseWars.SpawnList.Loadout 	=  	BaseWars.NewCAT("Armes", "icon16/gun.png")
BaseWars.SpawnList.raid 	=  	BaseWars.NewCAT("Raid", "icon16/bomb.png")
BaseWars.SpawnList.printer 	=  	BaseWars.NewCAT("Printer", "icon16/printer.png")
BaseWars.SpawnList.farm 	=  	BaseWars.NewCAT("Moyen de farm", "icon16/chart_pie.png")
BaseWars.SpawnList.Dispenser = 	BaseWars.NewCAT("Distributeur", "icon16/heart.png")
BaseWars.SpawnList.Entities = 	BaseWars.NewCAT("Entitées", "icon16/briefcase.png")
BaseWars.SpawnList.defense 	=  	BaseWars.NewCAT("Défenses", "icon16/transmit.png")
BaseWars.SpawnList.fun 		=  	BaseWars.NewCAT("Fun", "icon16/star.png")
BaseWars.SpawnList.prop 		=  	BaseWars.NewCAT("Défences & décorations", "icon16/brick.png")

------------------------------------------------------------------------
--                         porps
------------------------------------------------------------------------
BaseWars.SpawnList.prop["1 - Protections classiques"] = {
	["borealis_door001a"]	= BaseWars.GSL{Model = "models/props_borealis/borealis_door001a.mdl", Price = 1, Level = 1, props=true},
	["bluebarrel001"]	= BaseWars.GSL{Model = "models/props_borealis/bluebarrel001.mdl", Price = 1, Level = 1, props=true},
	["concrete_barrier001a"]	= BaseWars.GSL{Model = "models/props_c17/concrete_barrier001a.mdl", Price = 1, Level = 1, props=true},
	["blastdoor001c"]	= BaseWars.GSL{Model = "models/props_lab/blastdoor001c.mdl", Price = 1, Level = 1, props=true},
	["blastdoor001b"]	= BaseWars.GSL{Model = "models/props_lab/blastdoor001b.mdl", Price = 1, Level = 1, props=true},
	["TrashDumpster01a"]	= BaseWars.GSL{Model = "models/props_junk/TrashDumpster01a.mdl", Price = 1, Level = 1, props=true},
	["door03_slotted_left"]	= BaseWars.GSL{Model = "models/props_doors/door03_slotted_left.mdl", Price = 1, Level = 1, props=true},
	["fence01a"]	= BaseWars.GSL{Model = "models/props_c17/fence01a.mdl", Price = 1, Level = 1, props=true},
}
BaseWars.SpawnList.prop["2 - Protections portes"] = {
	["5x100x100_doorway"]	= BaseWars.GSL{Model = "models/nightreaper/concrete/5x100x100_doorway.mdl", Price = 1, Level = 1, props=true},
	["5x100x100_double_doorway"]	= BaseWars.GSL{Model = "models/nightreaper/concrete/5x100x100_double_doorway.mdl", Price = 1, Level = 1, props=true},
	["5x100x100_high_window"]	= BaseWars.GSL{Model = "models/nightreaper/concrete/5x100x100_high_window.mdl", Price = 1, Level = 1, props=true},
	["5x100x100_window"]	= BaseWars.GSL{Model = "models/nightreaper/concrete/5x100x100_window.mdl", Price = 1, Level = 1, props=true},
	["5x100x25_panel_flat"]	= BaseWars.GSL{Model = "models/nightreaper/concrete/5x100x25_panel_flat.mdl", Price = 1, Level = 1, props=true},
	["5x100x50_panel_flat"]	= BaseWars.GSL{Model = "models/nightreaper/concrete/5x100x50_panel_flat.mdl", Price = 1, Level = 1, props=true},
	["5x100x75_panel_flat"]	= BaseWars.GSL{Model = "models/nightreaper/concrete/5x100x75_panel_flat.mdl", Price = 1, Level = 1, props=true},
	["5x50x100_high_window"]	= BaseWars.GSL{Model = "models/nightreaper/concrete/5x50x100_high_window.mdl", Price = 1, Level = 1, props=true},
	["5x50x100_window"]	= BaseWars.GSL{Model = "models/nightreaper/concrete/5x50x100_window.mdl", Price = 1, Level = 1, props=true},
	["5x50x25_panel_flat"]	= BaseWars.GSL{Model = "models/nightreaper/concrete/5x50x25_panel_flat.mdl", Price = 1, Level = 1, props=true},
}
BaseWars.SpawnList.prop["3 - Protection métaliques"] = {
	["metal_plate1"]	= BaseWars.GSL{Model = "models/props_phx/construct/metal_plate1.mdl", Price = 1, Level = 1, props=true},
	["metal_plate1_tri"]	= BaseWars.GSL{Model = "models/props_phx/construct/metal_plate1_tri.mdl", Price = 1, Level = 1, props=true},
	["metal_plate2x2"]	= BaseWars.GSL{Model = "models/props_phx/construct/metal_plate2x2.mdl", Price = 1, Level = 1, props=true},
	["metal_plate2x4"]	= BaseWars.GSL{Model = "models/props_phx/construct/metal_plate2x4.mdl", Price = 1, Level = 1, props=true},
	["metal_plate2x2_tri"]	= BaseWars.GSL{Model = "models/props_phx/construct/metal_plate2x2_tri.mdl", Price = 1, Level = 1, props=true},
	["metal_tube"]	= BaseWars.GSL{Model = "models/props_phx/construct/metal_tube.mdl", Price = 1, Level = 1, props=true},
	["metal_tubex2"]	= BaseWars.GSL{Model = "models/props_phx/construct/metal_tubex2.mdl", Price = 1, Level = 1, props=true},
	["window_curve90x1"]	= BaseWars.GSL{Model = "models/props_phx/construct/windows/window_curve90x1.mdl", Price = 1, Level = 1, props=true},
	["window_curve180x2"]	= BaseWars.GSL{Model = "models/props_phx/construct/windows/window_curve180x2.mdl", Price = 1, Level = 1, props=true},
	["window_curve90x2"]	= BaseWars.GSL{Model = "models/props_phx/construct/windows/window_curve90x2.mdl", Price = 1, Level = 1, props=true},
}
BaseWars.SpawnList.prop["4 - Protections plastiques"] = {
	["cube1x3x1"]	= BaseWars.GSL{Model = "models/hunter/blocks/cube1x3x1.mdl", Price = 1, Level = 1, props=true},
	["cube1x4x1"]	= BaseWars.GSL{Model = "models/hunter/blocks/cube1x4x1.mdl", Price = 1, Level = 1, props=true},
	["cube1x6x1"]	= BaseWars.GSL{Model = "models/hunter/blocks/cube1x6x1.mdl", Price = 1, Level = 1, props=true},
	["1x1x1"]	= BaseWars.GSL{Model = "models/hunter/triangles/1x1x1.mdl", Price = 1, Level = 1, props=true},
	["stair1x1"]	= BaseWars.GSL{Model = "models/hunter/misc/stair1x1.mdl", Price = 1, Level = 1, props=true},
	["3x2x2"]	= BaseWars.GSL{Model = "models/hunter/triangles/3x2x2.mdl", Price = 1, Level = 1, props=true},
}
BaseWars.SpawnList.prop["5 - Décorations"] = {
	["controlroom_chair001a"]	= BaseWars.GSL{Model = "models/props_wasteland/controlroom_chair001a.mdl", Price = 1, Level = 1, props=true},
	["doll01"]	= BaseWars.GSL{Model = "models/props_c17/doll01.mdl", Price = 1, Level = 1, props=true},
	["tv_monitor01"]	= BaseWars.GSL{Model = "models/props_c17/tv_monitor01.mdl", Price = 1, Level = 1, props=true},
	["breenbust"]	= BaseWars.GSL{Model = "models/props_combine/breenbust.mdl", Price = 1, Level = 1, props=true},
	["breenchair"]	= BaseWars.GSL{Model = "models/props_combine/breenchair.mdl", Price = 1, Level = 1, props=true},
	["breendesk"]	= BaseWars.GSL{Model = "models/props_combine/breendesk.mdl", Price = 1, Level = 1, props=true},
	["breenclock"]	= BaseWars.GSL{Model = "models/props_combine/breenclock.mdl", Price = 1, Level = 1, props=true},
	["breenglobe"]	= BaseWars.GSL{Model = "models/props_combine/breenglobe.mdl", Price = 1, Level = 1, props=true},
	["Furniture_Couch02a"]	= BaseWars.GSL{Model = "models/props_interiors/Furniture_Couch02a.mdl", Price = 1, Level = 1, props=true},
	["Furniture_Couch01a"]	= BaseWars.GSL{Model = "models/props_interiors/Furniture_Couch01a.mdl", Price = 1, Level = 1, props=true},
	["Furniture_chair03a"]	= BaseWars.GSL{Model = "models/props_interiors/Furniture_chair03a.mdl", Price = 1, Level = 1, props=true},
	["Furniture_shelf01a"]	= BaseWars.GSL{Model = "models/props_interiors/Furniture_shelf01a.mdl", Price = 1, Level = 1, props=true},
	["Furniture_Lamp01a"]	= BaseWars.GSL{Model = "models/props_interiors/Furniture_Lamp01a.mdl", Price = 1, Level = 1, props=true},
	["Furniture_Vanity01a"]	= BaseWars.GSL{Model = "models/props_interiors/Furniture_Vanity01a.mdl", Price = 1, Level = 1, props=true},
	["TrashBin01a"]	= BaseWars.GSL{Model = "models/props_junk/TrashBin01a.mdl", Price = 1, Level = 1, props=true},
	["cactus"]	= BaseWars.GSL{Model = "models/props_lab/cactus.mdl", Price = 1, Level = 1, props=true},
	["huladoll"]	= BaseWars.GSL{Model = "models/props_lab/huladoll.mdl", Price = 1, Level = 1, props=true},
	["frame002a"]	= BaseWars.GSL{Model = "models/props_lab/frame002a.mdl", Price = 1, Level = 1, props=true},
	["barricade002a"]	= BaseWars.GSL{Model = "models/props_wasteland/barricade002a.mdl", Price = 1, Level = 1, props=true},
}
------------------------------------------------------------------------
--                         Dispensers
------------------------------------------------------------------------
BaseWars.SpawnList.Dispenser["Distributeurs d'armures"] = {
	["Distributeur d'armure V1"]				= BaseWars.GSL{Model = "models/props_combine/suit_charger001.mdl", Price = 750, ClassName = "bw_dispenser_armor_v1",Limit = 1, Level = 5},
	["Distributeur d'armure V2"]				= BaseWars.GSL{Model = "models/props_combine/suit_charger001.mdl", Price = 100000, ClassName = "bw_dispenser_armor_v2",Limit = 1, Level = 150},
	["Distributeur d'armure V3"]				= BaseWars.GSL{Model = "models/props_combine/suit_charger001.mdl", Price = 40000000, ClassName = "bw_dispenser_armor_v3",Limit = 1, Level = 1100},
}
BaseWars.SpawnList.Dispenser["Distributeurs de santé"] = {
	["Distributeur de santé V1"]				= BaseWars.GSL{Model = "models/props_spytech/supplystation.mdl", Price = 500, ClassName = "bw_healthpad_v1",Limit = 1, Level = 5},
	["Distributeur de santé V2"]				= BaseWars.GSL{Model = "models/props_spytech/supplystation.mdl", Price = 70000, ClassName = "bw_healthpad_v2",Limit = 1, Level = 200},
	["Distributeur de santé V3"]				= BaseWars.GSL{Model = "models/props_spytech/supplystation.mdl", Price = 50000000, ClassName = "bw_healthpad_v3",Limit = 1, Level = 1200},
}
BaseWars.SpawnList.Dispenser["Distributeur de munitions"] = {
	["Distributeur de munitions V1"]				= BaseWars.GSL{Model = "models/tf2defaultmodels/artillerysentrystuff/woodbox.mdl", Price = 1000, ClassName = "bw_dispenser_ammo_v1",Limit = 1, Level = 5},
	["Distributeur de munitions V2"]				= BaseWars.GSL{Model = "models/tf2defaultmodels/artillerysentrystuff/woodbox.mdl", Price = 50000, ClassName = "bw_dispenser_ammo_v2",Limit = 1, Level = 300},
	["Distributeur de munitions V3"]				= BaseWars.GSL{Model = "models/tf2defaultmodels/artillerysentrystuff/woodbox.mdl", Price = 60000000, ClassName = "bw_dispenser_ammo_v3",Limit = 1, Level = 1500},
}
------------------------------------------------------------------------
--                         FUN
------------------------------------------------------------------------
BaseWars.SpawnList.fun ["Divertissement & Jeu"] = {
	["Piano"] = BaseWars.GSL{Model = "models/fishy/furniture/piano.mdl", Price = 20000, ClassName = "gmt_instrument_piano" ,Limit = 1, Level = 50}, 
	["Ballon de foot"] = BaseWars.GSL{Model = "models/props_phx/misc/soccerball.mdl", Price = 5000, ClassName = "sent_soccerball" ,Limit = 1, Level = 100}, 
	["Radio"] = BaseWars.GSL{Model = "models/sligwolf/grocel/radio/ghettoblaster.mdl", Price = 7000, ClassName = "numerix_radio" ,Limit = 1, Level = 150}, 
	["Poings"] = BaseWars.GSL{Gun = true,Model = "models/props_combine/breenglobe.mdl", Price = 20, ClassName = "weapon_fists" ,Limit = 1, Level = 150}, 
}
BaseWars.SpawnList.fun ["Chill Factory - Tuto: !factory"] = {
	["Outil Multi-fonction"] = BaseWars.GSL{Gun = true,Model = "models/zerochain/props_factory/zpf_w_multitool.mdl", Price = 20, ClassName = "zpf_constructor" ,Limit = 1, Level = 10}, 
	["Table de travail"] = BaseWars.GSL{Model = "models/zerochain/props_factory/zpf_workbench.mdl", Price = 20, ClassName = "zpf_workbench" ,Limit = 1, Level = 10}, 
	["Inventaire"] = BaseWars.GSL{Gun = true,Model = "models/tfa_cso/entities/w_backpack.mdl", Price = 20, ClassName = "itemstore_pickup" ,Limit = 1, Level = 10}, 
}
BaseWars.SpawnList.fun ["Vapes"] = {
	["Vape à l'hélium"] = BaseWars.GSL{Gun = true,Model = "models/swamponions/vape.mdl", Price = 20, ClassName = "weapon_vape_helium" ,Limit = 1, Level = 150}, 
	["Vape médicinale"] = BaseWars.GSL{Gun = true,Model = "models/swamponions/vape.mdl", Price = 20, ClassName = "weapon_vape_medicinal" ,Limit = 1, Level = 100}, 
	["American"] = BaseWars.GSL{Gun = true,Model = "models/swamponions/vape.mdl", Price = 20, ClassName = "weapon_vape_american" ,Limit = 1, Level = 50}, 
}

------------------------------------------------------------------------
--                         FARM
------------------------------------------------------------------------
BaseWars.SpawnList.farm["T01 - Feux d'artifice - Tuto: !artifice"] = {
	["Machine à feux d'artifice"] = BaseWars.GSL{Model = "models/zerochain/props_crackermaker/zcm_base.mdl", Price = 1500, ClassName = "zcm_crackermachine" ,Limit = 1, Level = 5}, 
	["Papier"] = BaseWars.GSL{Model = "models/zerochain/props_crackermaker/zcm_paper.mdl", Price = 500, ClassName = "zcm_paperroll" ,Limit = 3, Level = 5, ShouldFreeze = false}, 
	["Poudre noire"] = BaseWars.GSL{Model = "models/zerochain/props_crackermaker/zcm_blackpowder.mdl", Price = 500, ClassName = "zcm_blackpowder" ,Limit = 3, Level = 5, ShouldFreeze = false}, 
	["Boîte"] = BaseWars.GSL{Model = "models/zerochain/props_crackermaker/zcm_box.mdl", Price = 2500, ClassName = "zcm_box" ,Limit = 1, Level = 5, ShouldFreeze = false}, 
}

BaseWars.SpawnList.farm["T01 - Meth - Tuto: !meth"] = {
	["Combiner"] = BaseWars.GSL{Model = "models/zerochain/zmlab/zmlab_combiner.mdl", Price = 70000, ClassName = "zmlab_combiner" ,Limit = 1, Level = 35}, 
	["Filtre"] = BaseWars.GSL{Model = "models/zerochain/zmlab/zmlab_filter.mdl", Price = 4000, ClassName = "zmlab_filter" ,Limit = 1, Level = 35, ShouldFreeze = false}, 
	["Congélateur"] = BaseWars.GSL{Model = "models/zerochain/zmlab/zmlab_frezzer.mdl", Price = 30000, ClassName = "zmlab_frezzer" ,Limit = 1, Level = 35}, 
	["Aluminium"] = BaseWars.GSL{Model = "models/zerochain/zmlab/zmlab_aluminiumbox.mdl", Price = 3000, ClassName = "zmlab_aluminium" ,Limit = 3, Level = 35, ShouldFreeze = false},
	["Méthylamine"] = BaseWars.GSL{Model = "models/zerochain/zmlab/zmlab_methylamin.mdl", Price = 2000, ClassName = "zmlab_methylamin" ,Limit = 3, Level = 35, ShouldFreeze = false},
	["Boîte de transport"] = BaseWars.GSL{Model = "models/zerochain/zmlab/zmlab_transportcrate.mdl", Price = 1000, ClassName = "zmlab_collectcrate" ,Limit = 3, Level = 35, ShouldFreeze = false},
}
BaseWars.SpawnList.farm["T02 - Pizza - Tuto: !pizza"] = {
	["Table"] = BaseWars.GSL{Model = "models/props_c17/FurnitureTable001a.mdl", Price = 100000, ClassName = "zpiz_customertable" ,Limit = 1, Level = 80}, 
	["Enseigne"] = BaseWars.GSL{Model = "models/props_trainstation/TrackSign02.mdl", Price = 50000, ClassName = "zpiz_opensign" ,Limit = 1, Level = 80}, 
	["Four"] = BaseWars.GSL{Model = "models/zerochain/props_pizza/zpizmak_oven.mdl", Price = 60000, ClassName = "zpiz_oven" ,Limit = 1, Level = 80},
	["Frigo"] = BaseWars.GSL{Model = "models/props_c17/FurnitureFridge001a.mdl", Price = 150000, ClassName = "zpiz_fridge" ,Limit = 1, Level = 80},
}

BaseWars.SpawnList.farm["T03 - Cigarettes - Tuto: !cigarette "] = { 
	["Auto-Cig 2000"] = BaseWars.GSL{Model = "models/cigarette_factory/cf_machine.mdl", Price = 1500000, ClassName = "cf_cigarette_machine" ,Limit = 3, Level = 170},  
	["Mise à niveau du moteur"] = BaseWars.GSL{Model = "models/maxofs2d/thruster_propeller.mdl", Price = 500000, ClassName = "cf_engine_upgrade" ,Limit = 1, Level = 170, ShouldFreeze = false},  
	["Mise à niveau du stockage"] = BaseWars.GSL{Model = "models/thrusters/jetpack.mdl", Price = 50000, ClassName = "cf_storage_upgrade" ,Limit = 1, Level = 170, ShouldFreeze = false},  
	["Boîte d'exportation"] = BaseWars.GSL{Model = "models/props_junk/cardboard_box003a.mdl", Price = 250000, ClassName = "cf_delievery_box" ,Limit = 2, Level = 170, ShouldFreeze = false},  
	["Paquet de tabac"] = BaseWars.GSL{Model = "models/cigarette_factory/cf_tobacco_pack.mdl", Price = 100000, ClassName = "cf_tobacco_pack" ,Limit = 3, Level = 170, ShouldFreeze = false}, 
	["Papier"] = BaseWars.GSL{Model = "models/cigarette_factory/cf_rollpaper.mdl", Price = 50000, ClassName = "cf_roll_paper" ,Limit = 3, Level = 170, ShouldFreeze = false},  
 
}
BaseWars.SpawnList.farm["T04 - Barman - Tuto: !barman"] = { 
	["Bar"] = BaseWars.GSL{Model = "models/blues-bar/bar.mdl", Price = 80000000, ClassName = "blue_bar" ,Level = 500},  
}

BaseWars.SpawnList.farm["T05 - Alcohol - Tuto: !alcohol"] = { 
	["Eau froide"] = BaseWars.GSL{Model = "models/zerochain/props_yeastbeast/yb_water.mdl", Price = 10000000, ClassName = "zyb_water" ,Limit = 3, Level = 1200, ShouldFreeze = false},
	["Condenseur"] = BaseWars.GSL{Model = "models/zerochain/props_yeastbeast/yb_crate.mdl", Price = 400000000, ClassName = "zyb_constructionkit_condenser" ,Limit = 1, Level = 1200}, 
	["Distillerie"] = BaseWars.GSL{Model = "models/zerochain/props_yeastbeast/yb_distillery_heater.mdl", Price = 200000000, ClassName = "zyb_distillery" ,Limit = 1, Level = 1200}, 
	["Refroidisseur"] = BaseWars.GSL{Model = "models/zerochain/props_yeastbeast/yb_crate.mdl", Price = 300000000, ClassName = "zyb_constructionkit_cooler" ,Limit = 1, Level = 1200}, 
	["Baril de fermentation"] = BaseWars.GSL{Model = "models/zerochain/props_yeastbeast/yb_barrel.mdl", Price = 200000000, ClassName = "zyb_fermbarrel" ,Limit = 3, Level = 1200, ShouldFreeze = false}, 
	["Broyeur"] = BaseWars.GSL{Model = "models/zerochain/props_yeastbeast/yb_grinder.mdl", Price = 4000000, ClassName = "zyb_yeastgrinder" ,Limit = 2, Level = 1200}, 
	["Moteur"] = BaseWars.GSL{Model = "models/zerochain/props_yeastbeast/yb_motor.mdl", Price = 20000000, ClassName = "zyb_motor" ,Limit = 2, Level = 1200, ShouldFreeze = false}, 
	["Boîte à pots"] = BaseWars.GSL{Model = "models/zerochain/props_yeastbeast/yb_jarcrate.mdl", Price = 60000000, ClassName = "zyb_jarcrate" ,Limit = 2, Level = 1200, ShouldFreeze = false}, 
	["Paquet de pots"] = BaseWars.GSL{Model = "models/zerochain/props_yeastbeast/yb_jarpack.mdl", Price = 15000000, ClassName = "zyb_jarpack" ,Limit = 3, Level = 1200, ShouldFreeze = false}, 
	["Sac en papier"] = BaseWars.GSL{Model = "models/zerochain/props_yeastbeast/yb_paperbag.mdl", Price = 5000000, ClassName = "zyb_paperbag" ,Limit = 3, Level = 1200, ShouldFreeze = false}, 
	["Sucre"] = BaseWars.GSL{Model = "models/zerochain/props_yeastbeast/yb_sugar.mdl", Price = 1000000, ClassName = "zyb_sugar" ,Limit = 3, Level = 1200, ShouldFreeze = false}, 
	["Bois"] = BaseWars.GSL{Model = "models/zerochain/props_yeastbeast/yb_wood.mdl", Price = 2000000, ClassName = "zyb_fuel" ,Limit = 2, Level = 1200, ShouldFreeze = false}, 
	["Levure"] = BaseWars.GSL{Model = "models/zerochain/props_yeastbeast/yb_yeast.mdl", Price = 1500000, ClassName = "zyb_yeast" ,Limit = 3, Level = 1200}, 
}

BaseWars.SpawnList.farm["T06 - Agriculture - Tuto: !farm"] = { 
	["Graine de carotte"] = BaseWars.GSL{Model = "models/bluechu/bfarm/seed.mdl", Price = 10000000, ClassName = "bfarm_seed_carrot" ,Limit = 3, Level = 2100, ShouldFreeze = false},  
	["Graine de laitue"] = BaseWars.GSL{Model = "models/bluechu/bfarm/seed.mdl", Price = 20000000, ClassName = "bfarm_seed_lettuce" ,Limit = 3, Level = 2100, ShouldFreeze = false},  
	["Petit pot"] = BaseWars.GSL{Model = "models/bluechu/bfarm/pot_01.mdl", Price = 500000000, ClassName = "bfarm_pot_01" ,Limit = 4, Level = 2100},  
	["Grand pot"] = BaseWars.GSL{Model = "models/bluechu/bfarm/pot_04.mdl", Price = 1000000000, ClassName = "bfarm_pot_04" ,Limit = 4, Level = 2100},  
	["Graine de pomme de terre"] = BaseWars.GSL{Model = "models/bluechu/bfarm/seed.mdl", Price = 30000000, ClassName = "bfarm_seed_potato" ,Limit = 3, Level = 2100, ShouldFreeze = false},  
	["Caisse d'expédition"] = BaseWars.GSL{Model = "models/bluechu/bfarm/crate.mdl", Price = 40000000, ClassName = "bfarm_shipping_crate" ,Limit = 1, Level = 2100},
	["Sac de terre"] = BaseWars.GSL{Model = "models/bluechu/bfarm/bagdirt.mdl", Price = 20000000, ClassName = "bfarm_soil_bag" ,Limit = 1, Level = 2100, ShouldFreeze = false},  
	["Arrosoir"] = BaseWars.GSL{Model = "models/bluechu/bfarm/watercan.mdl", Price = 10000000, ClassName = "bfarm_water_can" ,Limit = 1, Level = 2100, ShouldFreeze = false},  

}
BaseWars.SpawnList.farm["T07 - Médicaments - Tuto: !medic"] = { 
	["Guide"] = BaseWars.GSL{Model = "models/blues_pharm/book.mdl", Price = 50000000, ClassName = "bp_guide_book" ,Limit = 1, Level = 3000},  
	["Bécher"] = BaseWars.GSL{Model = "models/blues_pharm/beaker.mdl", Price = 250000000, ClassName = "bp_beaker" ,Limit = 8, Level = 3000, ShouldFreeze = false},  
	["Brûleur Bunsen"] = BaseWars.GSL{Model = "models/blues_pharm/bunsen_burner.mdl", Price = 100000000, ClassName = "bp_bunsen_burner" ,Limit = 4, Level = 3000},  
	["Congélateur"] = BaseWars.GSL{Model = "models/blues_pharm/freezer.mdl", Price = 5000000000, ClassName = "bp_freezer" ,Limit = 1, Level = 3000},  
	["Presse à pilules"] = BaseWars.GSL{Model = "models/blues_pharm/pill_presser.mdl", Price = 3000000000, ClassName = "bp_pill_press" ,Limit = 1, Level = 3000},  
	["Acide céto"] = BaseWars.GSL{Model = "models/blues_pharm/jar_1.mdl", Price = 3000000, ClassName = "bp_chemical_keto_acid" ,Limit = 2, Level = 3000},  
	["Acide propionique"] = BaseWars.GSL{Model = "models/blues_pharm/jar_2.mdl", Price = 2000000, ClassName = "bp_chemical_prop_acid" ,Limit = 2, Level = 3000},  
	["Acide salicylique"] = BaseWars.GSL{Model = "models/blues_pharm/jar_2.mdl", Price = 1000000, ClassName = "bp_chemical_sali_acid" ,Limit = 2, Level = 3000},  
	["Méthyltestostérone"] = BaseWars.GSL{Model = "models/blues_pharm/jar_3.mdl", Price = 5000000, ClassName = "bp_chemical_17alph" ,Limit = 2, Level = 3000},  
	["2-Naphtol"] = BaseWars.GSL{Model = "models/blues_pharm/jar_3.mdl", Price = 6000000, ClassName = "bp_chemical_2nap" ,Limit = 2, Level = 3000},  
	["Progestérone"] = BaseWars.GSL{Model = "models/blues_pharm/jar_3.mdl", Price = 7000000, ClassName = "bp_chemical_prog" ,Limit = 2, Level = 3000},  
	["Acétone"] = BaseWars.GSL{Model = "models/blues_pharm/jar_3.mdl", Price = 9000000, ClassName = "bp_chemical_acet2" ,Limit = 2, Level = 3000},  
	["Anhydride acétique"] = BaseWars.GSL{Model = "models/blues_pharm/jar_4.mdl", Price = 15000000, ClassName = "bp_chemical_acet" ,Limit = 2, Level = 3000},  
	["Dioxyde de sélénium"] = BaseWars.GSL{Model = "models/blues_pharm/jar_4.mdl", Price = 20000000, ClassName = "bp_chemical_sele" ,Limit = 2, Level = 3000},  
	["Eau désionisée"] = BaseWars.GSL{Model = "models/blues_pharm/jar_5.mdl", Price = 25000000, ClassName = "bp_chemical_deio" ,Limit = 2, Level = 3000},  
	["Marché des pilules"] = BaseWars.GSL{Model = "models/Kleiner.mdl", Price = 2000000000, ClassName = "bp_pill_market" ,Limit = 1, Level = 3000},  
	
}

BaseWars.SpawnList.farm["T08 - Meth Pro - Tuto: !methpro"] = { 
	["Brise-glace automatique"] = BaseWars.GSL{Model = "models/zerochain/props_methlab/zmlab2_autobreaker.mdl", Price = 1000000000, ClassName = "zmlab2_item_autobreaker" ,Limit = 1, Level = 3900},  
	["Boîte"] = BaseWars.GSL{Model = "models/zerochain/props_methlab/zmlab2_crate.mdl", Price = 500000000, ClassName = "zmlab2_item_crate" ,Limit = 1, Level = 3900, ShouldFreeze = false},  
	["Remplisseur"] = BaseWars.GSL{Model = "models/zerochain/props_methlab/zmlab2_filler.mdl", Price = 5000000000, ClassName = "zmlab2_machine_filler" ,Limit = 1, Level = 3900},  
	["Filtre"] = BaseWars.GSL{Model = "models/zerochain/props_methlab/zmlab2_filter.mdl", Price = 10000000000, ClassName = "zmlab2_machine_filter" ,Limit = 1, Level = 3900},  
	["Congélateur"] = BaseWars.GSL{Model = "models/zerochain/props_methlab/zmlab2_frezzer.mdl", Price = 7000000000, ClassName = "zmlab2_machine_frezzer" ,Limit = 1, Level = 3900},  
	["Four"] = BaseWars.GSL{Model = "models/zerochain/props_methlab/zmlab2_furnance.mdl", Price = 4000000000, ClassName = "zmlab2_machine_furnace" ,Limit = 1, Level = 3900},  
	["Mélangeur"] = BaseWars.GSL{Model = "models/zerochain/props_methlab/zmlab2_mixer.mdl", Price = 2000000000, ClassName = "zmlab2_machine_mixer" ,Limit = 1, Level = 3900},  
	["Table"] = BaseWars.GSL{Model = "models/zerochain/props_methlab/zmlab2_table.mdl", Price = 1000000000, ClassName = "zmlab2_table" ,Limit = 1, Level = 3900},  
	//["Ventilation"] = BaseWars.GSL{Model = "models/zerochain/props_methlab/zmlab2_ventilation.mdl", Price = 10, ClassName = "zmlab2_machine_ventilation" ,Limit = 1, Level = 3900},  
	["Acide"] = BaseWars.GSL{Model = "models/zerochain/props_methlab/zmlab2_acid.mdl", Price = 50000000, ClassName = "zmlab2_item_acid" ,Limit = 1, Level = 3900, ShouldFreeze = false},  
	["Méthylamine"] = BaseWars.GSL{Model = "models/zerochain/props_methlab/zmlab2_methylamine.mdl", Price = 700000000, ClassName = "zmlab2_item_methylamine" ,Limit = 1, Level = 3900, ShouldFreeze = false},  
	["Aluminium"] = BaseWars.GSL{Model = "models/zerochain/props_methlab/zmlab2_aluminium.mdl", Price = 800000000, ClassName = "zmlab2_item_aluminium" ,Limit = 1, Level = 3900, ShouldFreeze = false},  
	["Oxygène Liquide"] = BaseWars.GSL{Model = "models/zerochain/props_methlab/zmlab2_lox.mdl", Price = 90000000, ClassName = "zmlab2_item_lox" ,Limit = 1, Level = 3900, ShouldFreeze = false},  

}
BaseWars.SpawnList.farm["T09 - Weed - Tuto: !weed"] = {
	["Arrosoir"] = BaseWars.GSL{Gun = true,Model = "models/zerochain/props_weedfarm/zwf_wateringcan_vm.mdl", Price = 7000000000, ClassName = "zwf_wateringcan" ,Limit = 1, Level = 4800}, 
	["Câble"] = BaseWars.GSL{Gun = true,Model = "models/zerochain/props_weedfarm/zwf_cable_vm.mdl", Price = 8000000000, ClassName = "zwf_cable" ,Limit = 1, Level = 4800}, 
	["Tablette de magasin"] = BaseWars.GSL{Model = "models/zerochain/props_weedfarm/zwf_tablet_vm.mdl", Price = 9000000000, ClassName = "zwf_shoptablet" ,Limit = 1, Level = 4800}, 

}

BaseWars.SpawnList.farm["T10 - MasterCook - Tuto: !cook"] = {  

	["Livre de cuisine"] = BaseWars.GSL{Model = "models/zerochain/props_kitchen/zmc_cookbook.mdl", Price = 95000000000, ClassName = "zmc_cookbook" ,Limit = 1, Level = 5700}, 
	["Réfrigérateur"] = BaseWars.GSL{Model = "models/zerochain/props_kitchen/zmc_fridge.mdl", Price = 100000000000, ClassName = "zmc_fridge" ,Limit = 1, Level = 5700}, 
	["Poubelle"] = BaseWars.GSL{Model = "models/zerochain/props_kitchen/zmc_garbagebin.mdl", Price = 5000000000, ClassName = "zmc_garbagepin" ,Limit = 1, Level = 5700}, 
	["Mixeur"] = BaseWars.GSL{Model = "models/zerochain/props_kitchen/zmc_mixer.mdl", Price = 45000000000, ClassName = "zmc_mixer" ,Limit = 1, Level = 5700}, 
	["Table de travail"] = BaseWars.GSL{Model = "models/zerochain/props_kitchen/zmc_worktable.mdl", Price = 85000000000, ClassName = "zmc_worktable" ,Limit = 1, Level = 5700}, 

	["Tableau des clients"] = BaseWars.GSL{Model = "models/props_c17/FurnitureTable001a.mdl", Price = 20000000000, ClassName = "zmc_customertable" ,Limit = 1, Level = 5700}, 
	["Tableau de commande"] = BaseWars.GSL{Model = "models/zerochain/props_kitchen/zmc_ordertable.mdl", Price = 30000000000, ClassName = "zmc_ordertable" ,Limit = 1, Level = 5700}, 
	["Table à plat"] = BaseWars.GSL{Model = "models/zerochain/props_kitchen/zmc_dishtable.mdl", Price = 40000000000, ClassName = "zmc_dishtable" ,Limit = 1, Level = 5700}, 

	["Marmite"] = BaseWars.GSL{Model = "models/zerochain/props_kitchen/zmc_heater.mdl", Price = 50000000000, ClassName = "zmc_boilpot" ,Limit = 1, Level = 5700}, 
	["Gril"] = BaseWars.GSL{Model = "models/zerochain/props_kitchen/zmc_heater.mdl", Price = 60000000000, ClassName = "zmc_grill" ,Limit = 1, Level = 5700}, 
	["Four"] = BaseWars.GSL{Model = "models/zerochain/props_kitchen/zmc_heater.mdl", Price = 70000000000, ClassName = "zmc_oven" ,Limit = 1, Level = 5700}, 
	["Pot de soupe"] = BaseWars.GSL{Model = "models/zerochain/props_kitchen/zmc_heater.mdl", Price = 80000000000, ClassName = "zmc_souppot" ,Limit = 1, Level = 5700}, 
	["Wok"] = BaseWars.GSL{Model = "models/zerochain/props_kitchen/zmc_heater.mdl", Price = 90000000000, ClassName = "zmc_wok" ,Limit = 1, Level = 5700}, 
	
	["Gaz"] = BaseWars.GSL{Model = "models/zerochain/props_kitchen/zmc_gastank.mdl", Price = 9000000000, ClassName = "zmc_gastank" ,Limit = 1, Level = 5700}, 

}
BaseWars.SpawnList.farm["T11 - Bitmineur - Tuto: !bitmineur"] = {
	["Bitmineur 1"] = BaseWars.GSL{Model = "models/bitminers2/bitminer_1.mdl", Price = 400000000000, ClassName = "bm2_bitminer_1" ,Limit = 4, Level = 6600}, 
	["Bitmineur 2"] = BaseWars.GSL{Model = "models/bitminers2/bitminer_3.mdl", Price = 100000000000, ClassName = "bm2_bitminer_2" ,Limit = 4, Level = 6600},
	["Bitmineur Rack"] = BaseWars.GSL{Model = "models/bitminers2/bitminer_rack.mdl", Price = 70000000000, ClassName = "bm2_bitminer_rack" ,Limit = 2, Level = 6600}, 
	["Bitmineur Server"] = BaseWars.GSL{Model = "models/bitminers2/bitminer_2.mdl", Price = 200000000000, ClassName = "bm2_bitminer_server" ,Limit = 16, Level = 6600, ShouldFreeze = false},
	["Rallonge"] = BaseWars.GSL{Model = "models/bitminers2/bitminer_plug_3.mdl", Price = 1000000000, ClassName = "bm2_extention_lead" ,Limit = 2, Level = 6600, ShouldFreeze = false},
	["Carburant"] = BaseWars.GSL{Model = "models/props_junk/gascan001a.mdl", Price = 9000000000, ClassName = "bm2_fuel" ,Limit = 2, Level = 6600, ShouldFreeze = false},
	["Générateur"] = BaseWars.GSL{Model = "models/bitminers2/generator.mdl", Price = 50000000000, ClassName = "bm2_generator" ,Limit = 3, Level = 6600},
	["Câble d'alimentation"] = BaseWars.GSL{Model = "models/bitminers2/bitminer_plug_1.mdl", Price = 2000000000, ClassName = "bm2_power_lead" ,Limit = 12, Level = 6600, ShouldFreeze = false},
}
BaseWars.SpawnList.farm["T12 - Tartes - Tuto: !tartes"] = {
	["Pommes"] = BaseWars.GSL{Model = "models/zerochain/props_animalfarm/zafa_apple_box.mdl", Price = 400000000000, ClassName = "zpm_item_apple" ,Limit = 3, Level = 9000}, 
	["Myrtilles"] = BaseWars.GSL{Model = "models/zerochain/props_animalfarm/zafa_blueberries.mdl", Price = 400000000000, ClassName = "zpm_item_blueberries" ,Limit = 3, Level = 9000}, 
	["Machine"] = BaseWars.GSL{Model = "models/zerochain/props_animalfarm/zafa_buildkit.mdl", Price = 400000000000, ClassName = "zpm_buildkit" ,Limit = 3, Level = 9000}, 
	["Beurs"] = BaseWars.GSL{Model = "models/zerochain/props_animalfarm/zafa_butter_box.mdl", Price = 400000000000, ClassName = "zpm_item_butter" ,Limit = 3, Level = 9000}, 
	["Fromages"] = BaseWars.GSL{Model = "models/zerochain/props_animalfarm/zafa_cheese_wheel.mdl", Price = 400000000000, ClassName = "zpm_item_cheese" ,Limit = 3, Level = 9000}, 
	["Cerises"] = BaseWars.GSL{Model = "models/zerochain/props_animalfarm/zafa_cherries.mdl", Price = 400000000000, ClassName = "zpm_item_cherries" ,Limit = 3, Level = 9000}, 
	["Poulets"] = BaseWars.GSL{Model = "models/zerochain/props_animalfarm/zafa_chicken_raw.mdl", Price = 400000000000, ClassName = "zpm_item_chicken" ,Limit = 3, Level = 9000}, 
	["Œufs"] = BaseWars.GSL{Model = "models/zerochain/props_animalfarm/zafa_chicken_raw.mdl", Price = 400000000000, ClassName = "zpm_item_egg" ,Limit = 3, Level = 9000}, 
	["Farine"] = BaseWars.GSL{Model = "models/zerochain/props_animalfarm/zafa_bag_flour.mdl", Price = 400000000000, ClassName = "zpm_item_flour" ,Limit = 3, Level = 9000}, 
	["Lait"] = BaseWars.GSL{Model = "models/zerochain/props_animalfarm/zafa_milk.mdl", Price = 400000000000, ClassName = "zpm_item_milk" ,Limit = 3, Level = 9000}, 
	["Vendeur"] = BaseWars.GSL{Model = "models/humans/group03/male_09.mdl", Price = 400000000000, ClassName = "zpm_npc" ,Limit = 3, Level = 9000}, 
	["Citrouille"] = BaseWars.GSL{Model = "models/zerochain/props_animalfarm/zafa_pumpkin.mdl", Price = 400000000000, ClassName = "models/humans/group03/male_09.mdl" ,Limit = 3, Level = 9000}, 
	["Piment"] = BaseWars.GSL{Model = "models/zerochain/props_animalfarm/zafa_bag_spice.mdl", Price = 400000000000, ClassName = "zpm_item_spice" ,Limit = 3, Level = 9000}, 
	["Sucre"] = BaseWars.GSL{Model = "models/zerochain/props_animalfarm/zafa_bag_sugar.mdl", Price = 400000000000, ClassName = "zpm_item_sugar" ,Limit = 3, Level = 9000}, 
}
----------------------------------------------------------------
--                         RAID TOOL
------------------------------------------------------------------------
BaseWars.SpawnList.raid["Outils de raid"] = {
	["Kit de désamorçage"] 			= BaseWars.GSL{Model = "models/weapons/tfa_cso2/w_defuser.mdl", Price = 8500, ClassName = "bw_defuse", Limit = 1, Level = 75, IgnoreRaid = true},
	["Chalumeau"]		= BaseWars.GSL{Gun = true, Model = "models/weapons/w_irifle.mdl", Price = 500, ClassName = "bw_blowtorch", Level = 5, Raid = true},
	["C4"]					= BaseWars.GSL{Gun = true, Model = "models/weapons/tfa_cso2/w_c4_planted.mdl", Price = 10000, ClassName = "bw_weapon_c4", Level = 100, Raid = true},
	["BigBomb"]			= BaseWars.GSL{Model = "models/props_phx/oildrum001_explosive.mdl", Price = 100000000, ClassName = "bw_explosive_bigbomb", Level = 750, Limit = 1, ShouldFreeze = false, Raid = true},
	["Nuke"]				= BaseWars.GSL{Model = "models/codww2/other/fritzxbomb.mdl", Price = 10000000000, ClassName = "bw_explosive_nuke", Level = 5000, Limit = 1, ShouldFreeze = false, Raid = true},
}
------------------------------------------------------------------------
--                         DEFENCE
------------------------------------------------------------------------
BaseWars.SpawnList.defense ["1 - Tourelle contrôlable"] = {
	["Tourelle contrôlable"] 		= BaseWars.GSL{Model = "models/props_combine/combine_barricade_short02a.mdl", Price = 750, ClassName = "bw_turret_manual", Limit = 1, Level = 5},
}
BaseWars.SpawnList.defense ["2 - Tourelle balistique"] = {
	["Tourelle balistique T1"] 		= BaseWars.GSL{Model = "models/tf2defaultmodels/ledstuff/sentry_level1.mdl", Price = 2500, ClassName = "bw_turret_ballistic_t1", Limit = 4, Level = 30},
	["Tourelle balistique T2"] 		= BaseWars.GSL{Model = "models/tf2defaultmodels/ledstuff/sentry_level2.mdl", Price = 600000, ClassName = "bw_turret_ballistic_t2", Limit = 4, Level = 150},
	["Tourelle balistique T3"] 		= BaseWars.GSL{Model = "models/tf2defaultmodels/ledstuff/sentry_level3.mdl", Price = 1000000000, ClassName = "bw_turret_ballistic_t3", Limit = 4, Level = 1000},
}
BaseWars.SpawnList.defense ["3 - Tourelle laser"] = {
	["Tourelle laser T1"] 			= BaseWars.GSL{Model = "models/tf2defaultmodels/skirmisherstuff/turret_level1.mdl", Price = 16000, ClassName = "bw_turret_laser_t1", Limit = 4, Level = 60},
	["Tourelle laser T2"] 			= BaseWars.GSL{Model = "models/tf2defaultmodels/skirmisherstuff/turret_level2.mdl", Price = 2500000, ClassName = "bw_turret_laser_t2", Limit = 4, Level = 250},
	["Tourelle laser T3"] 			= BaseWars.GSL{Model = "models/tf2defaultmodels/skirmisherstuff/turret_level3.mdl", Price = 10000000000, ClassName = "bw_turret_laser_t3", Limit = 4, Level = 2500},
}

BaseWars.SpawnList.defense ["4 - Tourelle Canon"] = {
	["Tourelle Canon T1"] 			= BaseWars.GSL{Model = "models/tf2defaultmodels/artillerysentrystuff/sentry_level1.mdl", Price = 250000, ClassName = "bw_turret_cannon_t1", Limit = 4, Level = 90},
	["Tourelle Canon T2"] 			= BaseWars.GSL{Model = "models/tf2defaultmodels/artillerysentrystuff/sentry_level2.mdl", Price = 5000000, ClassName = "bw_turret_cannon_t2", Limit = 4, Level = 500},
	["Tourelle Canon T3"] 			= BaseWars.GSL{Model = "models/tf2defaultmodels/artillerysentrystuff/sentry_level3.mdl", Price = 20000000000, ClassName = "bw_turret_cannon_t3", Limit = 4, Level = 5000},
}
BaseWars.SpawnList.defense ["5 - Bobine de Tesla"] = {
	["Bobine de Tesla"]					= BaseWars.GSL{Model = "models/teslacoil_mini/teslacoil_mini.mdl", Price = 250000000, ClassName = "bw_tesla", Limit = 1, Level = 2000},
}
BaseWars.SpawnList.defense ["6 - Mines"] = {
	["Mine explosive"] 				= BaseWars.GSL{Model = "models/props_combine/combine_mine01.mdl", Price = 4000, ClassName = "bw_explosive_mine", Limit = 4, Level = 9, ShouldFreeze = false},
	["Mine rapide"] 					= BaseWars.GSL{Model = "models/props_combine/combine_mine01.mdl", Price = 8000, ClassName = "bw_explosive_mine_speed", Limit = 4, Level = 20, ShouldFreeze = false},
	["Mine puissante"] 				= BaseWars.GSL{Model = "models/props_combine/combine_mine01.mdl", Price = 15000, ClassName = "bw_explosive_mine_power", Limit = 4, Level = 25, ShouldFreeze = false},
	["Mine choc"] 					= BaseWars.GSL{Model = "models/props_combine/combine_mine01.mdl", Price = 25000, ClassName = "bw_explosive_mine_shock", Limit = 4, Level = 30, ShouldFreeze = false},
}
------------------------------------------------------------------------
--                         ARMES
------------------------------------------------------------------------
BaseWars.SpawnList.Loadout["1 - Couteaux"] = {
	["Crowbar"] 		= BaseWars.GSL{Gun = true, Model = "models/weapons/tfa_cso2/w_crowbar.mdl", Price = 10, ClassName = "tfa_cso2_crowbar" ,Level = 5}, 
	["Goldpop"] 		= BaseWars.GSL{Gun = true, Model = "models/weapons/tfa_cso2/w_goldpop.mdl", Price = 10, ClassName = "tfa_cso2_goldpop" ,Level = 5, vip=true}, 
	["Harpoon"] 		= BaseWars.GSL{Gun = true, Model = "models/weapons/tfa_cso2/w_harpoon.mdl", Price = 10, ClassName = "tfa_cso2_harpoon" ,Level = 5}, 
	["Hunting Knife"] 	= BaseWars.GSL{Gun = true, Model = "models/weapons/tfa_cso2/w_huntknife.mdl", Price = 10, ClassName = "tfa_cso2_huntknife" ,Level = 5},
	["Karambit"] 		= BaseWars.GSL{Gun = true, Model = "models/weapons/tfa_cso2/w_knife_2017chicken.mdl", Price = 10, ClassName = "tfa_cso2_knife_chicken" ,Level = 5, vip=true},
	["Knife"] 			= BaseWars.GSL{Gun = true, Model = "models/weapons/tfa_cso2/w_knife.mdl", Price = 10, ClassName = "tfa_cso2_knife" ,Level = 5}, 
	["Lolipop"] 		= BaseWars.GSL{Gun = true, Model = "models/weapons/tfa_cso2/w_lollipop.mdl", Price = 10, ClassName = "tfa_cso2_lollipop" ,Level = 5}, 
	["Microphone"] 		= BaseWars.GSL{Gun = true, Model = "models/weapons/tfa_cso2/w_mikeknife.mdl", Price = 10, ClassName = "tfa_cso2_mikeknife" ,Level = 5}, 
	["TaserKnife"] 		= BaseWars.GSL{Gun = true, Model = "models/weapons/tfa_cso2/w_taserknife.mdl", Price = 10, ClassName = "tfa_cso2_taserknife" ,Level = 5}, 
	["M9 Bayonet"] 		= BaseWars.GSL{Gun = true, Model = "models/weapons/tfa_cso2/w_m9bayonet.mdl", Price = 10, ClassName = "tfa_cso2_m9bayonet" ,Level = 5},
	["Huntknife gold"] 	= BaseWars.GSL{Gun = true, Model = "models/weapons/tfa_cso2/w_huntknife_gold.mdl", Price = 10, ClassName = "tfa_cso2_huntknife_gold" ,Level = 5, vip=true},
	//["Hunting Knife (Monkey)"] = BaseWars.GSL{Gun = true, Model = "models/weapons/tfa_cso2/w_huntknife_monkey1.mdl", Price = 10, ClassName = "tfa_cso2_huntknife_monkey" ,Level = 5}, 
	["Pickaxe"] 		= BaseWars.GSL{Gun = true, Model = "models/weapons/tfa_cso2/w_pickax.mdl", Price = 10, ClassName = "tfa_cso2_pickaxe" ,Level = 5}, 
	["Toy Hammer"] 		= BaseWars.GSL{Gun = true, Model = "models/weapons/tfa_cso2/w_toyhammer.mdl", Price = 10, ClassName = "tfa_cso2_toyhammer" ,Level = 5}, 
	["Toy Hammer Gold"] = BaseWars.GSL{Gun = true, Model = "models/weapons/tfa_cso2/w_toyhammer_gold.mdl", Price = 10, ClassName = "tfa_cso2_toyhammer_gold" ,Level = 5, vip=true}, 
	//["Survivor Knife"] 	= BaseWars.GSL{Gun = true, Model = "models/weapons/tfa_cso2/w_survivorknife.mdl", Price = 10, ClassName = "tfa_cso2_survivorknife" ,Level = 5},
	//["Turbo Knife"] 	= BaseWars.GSL{Gun = true, Model = "models/weapons/tfa_cso2/w_athenaknfe.mdl", Price = 10, ClassName = "tfa_cso2_athenaknife" ,Level = 5},
	["Wrench"] 			= BaseWars.GSL{Gun = true, Model = "models/weapons/tfa_cso2/w_wrench.mdl", Price = 10, ClassName = "tfa_cso2_wrench" ,Level = 5},
}
BaseWars.SpawnList.Loadout["2 - Pistol"] = {
	//["Af2011a0"] 		= BaseWars.GSL{Gun = true, Model = "models/weapons/tfa_cso2/w_af2011a0.mdl", Price = 10, ClassName = "tfa_cso2_af2011a0" ,Level = 5}, 
	//["Af2011A1"] 		= BaseWars.GSL{Gun = true, Model = "models/weapons/tfa_cso2/w_af2011a1.mdl", Price = 10, ClassName = "tfa_cso2_af2011a1" ,Level = 5},
	["M1911a1"] 		= BaseWars.GSL{Gun = true, Model = "models/weapons/tfa_cso2/w_m1911a1.mdl", Price = 100, ClassName = "tfa_cso2_m1911a1" ,Level = 1}, 
	["Anaconda"] 		= BaseWars.GSL{Gun = true, Model = "models/weapons/tfa_cso2/w_anaconda.mdl", Price = 200, ClassName = "tfa_cso2_anaconda" ,Level = 5}, 
	["K5"] 				= BaseWars.GSL{Gun = true, Model = "models/weapons/tfa_cso2/w_k5.mdl", Price = 500, ClassName = "tfa_cso2_k5" ,Level = 10}, 
	["Glock 18"] 		= BaseWars.GSL{Gun = true, Model = "models/weapons/tfa_cso2/w_glock18.mdl", Price = 750, ClassName = "tfa_cso2_glock18" ,Level = 15}, 
	["USP"] 			= BaseWars.GSL{Gun = true, Model = "models/weapons/tfa_cso2/w_usp.mdl", Price = 1000, ClassName = "tfa_cso2_usp" ,Level = 20}, 
	["Five-Seven"]		= BaseWars.GSL{Gun = true, Model = "models/weapons/tfa_cso2/w_fiveseven.mdl", Price = 1500, ClassName = "tfa_cso2_fiveseven" ,Level = 25}, 
	["Dual Elite"] 		= BaseWars.GSL{Gun = true, Model = "models/weapons/tfa_cso2/w_elites_dropped.mdl", Price = 2000, ClassName = "tfa_cso2_elites" ,Level = 30},
	["MK23 SOCOM"] 		= BaseWars.GSL{Gun = true, Model = "models/weapons/tfa_cso2/w_mk23.mdl", Price = 2500, ClassName = "tfa_cso2_mk23" ,Level = 35}, 
	["QSZ-92"] 			= BaseWars.GSL{Gun = true, Model = "models/weapons/tfa_cso2/w_qsz92.mdl", Price = 3500, ClassName = "tfa_cso2_qsz92" ,Level = 40},  
	["Desert Eagle"] 	= BaseWars.GSL{Gun = true, Model = "models/weapons/tfa_cso2/w_deserteagle.mdl", Price = 5000, ClassName = "tfa_cso2_deserteagle" ,Level = 50},
	["WALTHER PP"] 		= BaseWars.GSL{Gun = true, Model = "models/weapons/tfa_cso2/w_waltherpp.mdl",Price = 50, ClassName = "tfa_cso2_waltherpp" ,Level = 1,vip=true},
	//["Triple Action Thunder"] = BaseWars.GSL{Gun = true, Model = "models/weapons/tfa_cso2/w_thunder.mdl",Price = 10, ClassName = "tfa_cso2_thunder" ,Level = 5},
	//["Desert phoenix"] 	= BaseWars.GSL{Gun = true, Model = "models/weapons/tfa_cso2/w_dep.mdl", Price = 10, ClassName = "tfa_cso2_dep" ,Level = 5},
	//["Desert Phoenixes"]= BaseWars.GSL{Gun = true, Model = "models/weapons/tfa_cso2/w_ddep.mdl", Price = 10, ClassName = "tfa_cso2_ddep" ,Level = 5},  
}
BaseWars.SpawnList.Loadout["3 - Shotgun"] = {
	//["DP 12"] 			= BaseWars.GSL{Gun = true, Model = "models/weapons/tfa_cso2/w_dp12.mdl", Price = 10, ClassName = "tfa_cso2_dp12" ,Level = 5},  
	//["M3 BOOM"] 		= BaseWars.GSL{Gun = true, Model = "models/weapons/tfa_cso2/w_m3boom.mdl", Price = 10, ClassName = "tfa_cso2_m3boom" ,Level = 5}, 
	//["M3 DRAGON"] 		= BaseWars.GSL{Gun = true, Model = "models/weapons/tfa_cso2/w_m3dragon.mdl", Price = 10, ClassName = "tfa_cso2_m3dragon" ,Level = 5}, 
	//["triple-barreled Shotgun"] = BaseWars.GSL{Gun = true, Model = "models/weapons/tfa_cso2/w_tribarrel.mdl", Price = 10, ClassName = "tfa_cso2_tribarrel" ,Level = 5}, 
	["M3"] 				= BaseWars.GSL{Gun = true, Model = "models/weapons/tfa_cso2/w_m3.mdl", Price = 6000, ClassName = "tfa_cso2_m3" ,Level = 60}, 
	["double defence"] 	= BaseWars.GSL{Gun = true, Model = "models/weapons/tfa_cso2/w_dbarrel.mdl", Price = 7000, ClassName = "tfa_cso2_dbarrel" ,Level = 70}, 
	["M870"] 			= BaseWars.GSL{Gun = true, Model = "models/weapons/tfa_cso2/w_m870.mdl", Price = 8000, ClassName = "tfa_cso2_m870" ,Level = 80},
	["QBS-09"] 			= BaseWars.GSL{Gun = true, Model = "models/weapons/tfa_cso2/w_qbs09.mdl", Price = 9000, ClassName = "tfa_cso2_qbs09" ,Level = 90}, 
	["UAS12"] 			= BaseWars.GSL{Gun = true, Model = "models/weapons/tfa_cso2/w_usas12.mdl", Price = 10000, ClassName = "tfa_cso2_usas" ,Level = 100}, 
	["XM1014"] 			= BaseWars.GSL{Gun = true, Model = "models/weapons/tfa_cso2/w_xm1014.mdl", Price = 11000, ClassName = "tfa_cso2_xm1014" ,Level = 120},
	["STRIKER 12"] 		= BaseWars.GSL{Gun = true, Model = "models/weapons/tfa_cso2/w_striker12.mdl", Price = 15000, ClassName = "tfa_cso2_striker12" ,Level = 140}, 
}
BaseWars.SpawnList.Loadout["4 - SMG"] = {
	//["MP7 Phoenix "] 	= BaseWars.GSL{Gun = true, Model = "models/weapons/tfa_cso2/w_mp7_ss_phoenix.mdl", Price = 10, ClassName = "tfa_cso2_mp7_phoenix" ,Level = 5},
	["MAC-10 "] 		= BaseWars.GSL{Gun = true, Model = "models/weapons/tfa_cso2/w_mac10.mdl", Price = 20000, ClassName = "tfa_cso2_mac10" ,Level = 150},
	["MP5 Navy "] 		= BaseWars.GSL{Gun = true, Model = "models/weapons/tfa_cso2/w_mp5.mdl", Price = 25000, ClassName = "tfa_cso2_mp5" ,Level = 175},
	["UMP85"] 			= BaseWars.GSL{Gun = true, Model = "models/weapons/tfa_cso2/w_ump45.mdl", Price = 30000, ClassName = "tfa_cso2_ump45" ,Level = 200} ,
	["MP7 A1"] 			= BaseWars.GSL{Gun = true, Model = "models/weapons/tfa_cso2/w_mp7.mdl", Price = 35000, ClassName = "tfa_cso2_mp7" ,Level = 225},
	["P90"] 			= BaseWars.GSL{Gun = true, Model = "models/weapons/tfa_cso2/w_p90.mdl", Price = 40000, ClassName = "tfa_cso2_p90" ,Level = 250},
	["MX4 Storm"] 		= BaseWars.GSL{Gun = true, Model = "models/weapons/tfa_cso2/w_mx4.mdl", Price = 45000, ClassName = "tfa_cso2_mx4" ,Level = 275},
	["Vector"] 			= BaseWars.GSL{Gun = true, Model = "models/weapons/tfa_cso2/w_krisssuperv.mdl", Price = 50000, ClassName = "tfa_cso2_krisssuperv" ,Level = 300},
	["TPM"] 			= BaseWars.GSL{Gun = true, Model = "models/weapons/tfa_cso2/w_tmp.mdl", Price = 55000, ClassName = "tfa_cso2_tmp" ,Level = 325},
	["C505"] 			= BaseWars.GSL{Gun = true, Model = "models/weapons/tfa_cso2/w_csls06.mdl", Price = 60000, ClassName = "tfa_cso2_csls06", Level = 350},
	["AR-57 PDW"] 		= BaseWars.GSL{Gun = true, Model = "models/weapons/tfa_cso2/w_ar57.mdl", Price = 65000, ClassName = "tfa_cso2_ar57", Level = 400},
}
BaseWars.SpawnList.Loadout["5 - Assault Rifle"] = {
	["Galil"] 			= BaseWars.GSL{Gun = true, Model = "models/weapons/tfa_cso2/w_galil.mdl", Price = 70000, ClassName = "tfa_cso2_galil" ,Level = 450} ,
	["Ak-47 Old"] 		= BaseWars.GSL{Gun = true, Model = "models/weapons/tfa_cso2/w_ak47_old.mdl", Price = 75000, ClassName = "tfa_cso2_ak47_old", Level = 500},
	//["M4A1 Gold"] 	= BaseWars.GSL{Gun = true, Model = "models/weapons/tfa_cso2/w_m4a1_gold.mdl", Price = 200, ClassName = "tfa_cso2_m4a1_gold", Level = 900, vip=true},
	//["Ak-47  Gold"] 	= BaseWars.GSL{Gun = true, Model = "models/weapons/tfa_cso2/w_ak47_flash.mdl", Price = 200, ClassName = "tfa_cso2_ak47_gold", Level = 1200, vip=true},
	["G36K"] 			= BaseWars.GSL{Gun = true, Model = "models/weapons/tfa_cso2/w_g36k.mdl", Price = 80000, ClassName = "tfa_cso2_g36k" ,Level = 600},
	["M16A2"] 			= BaseWars.GSL{Gun = true, Model = "models/weapons/tfa_cso2/w_m16a2.mdl", Price = 85000, ClassName = "tfa_cso2_m16a2" ,Level = 700},
	["AKM"] 			= BaseWars.GSL{Gun = true, Model = "models/weapons/tfa_cso2/w_akm.mdl", Price = 90000, ClassName = "tfa_cso2_akm", Level = 800},
	["MSBS-B"] 			= BaseWars.GSL{Gun = true, Model = "models/weapons/tfa_cso2/w_msbs.mdl", Price = 95000, ClassName = "tfa_cso2_msbs" ,Level = 900},
	["Q	BZ-95B"] 		= BaseWars.GSL{Gun = true, Model = "models/weapons/tfa_cso2/w_qbz95.mdl", Price = 100000, ClassName = "tfa_cso2_qbz95" ,Level = 1000},
	["DR-200"] 			= BaseWars.GSL{Gun = true, Model = "models/weapons/tfa_cso2/w_dr200.mdl", Price = 110000, ClassName = "tfa_cso2_dr200" ,Level = 1100},
	["FAL"] 			= BaseWars.GSL{Gun = true, Model = "models/weapons/tfa_cso2/w_fal.mdl", Price = 120000, ClassName = "tfa_cso2_fal" ,Level = 1200}, 
	["Scar-H"] 			= BaseWars.GSL{Gun = true, Model = "models/weapons/tfa_cso2/w_scarh.mdl", Price = 130000, ClassName = "tfa_cso2_scarh" ,Level = 1300},
	["Scar-L"] 			= BaseWars.GSL{Gun = true, Model = "models/weapons/tfa_cso2/w_scarl.mdl", Price = 140000, ClassName = "tfa_cso2_scarl" ,Level = 1400},
	["G3KA4"] 			= BaseWars.GSL{Gun = true, Model = "models/weapons/tfa_cso2/w_g3ka4.mdl", Price = 150000, ClassName = "tfa_cso2_g3ka4" ,Level = 1500},
	["FNC"] 			= BaseWars.GSL{Gun = true, Model = "models/weapons/tfa_cso2/w_fnc.mdl", Price = 160000, ClassName = "tfa_cso2_fnc" ,Level = 1600},
	["Gilboa Carabine"] = BaseWars.GSL{Gun = true, Model = "models/weapons/tfa_cso2/w_gilboasnake.mdl", Price = 170000, ClassName = "tfa_cso2_gilboasnake" ,Level = 1700},
	["Ak-47"] 			= BaseWars.GSL{Gun = true, Model = "models/weapons/tfa_cso2/w_ak47.mdl", Price = 180000, ClassName = "tfa_cso2_ak47", Level = 1800},
	["M16A4"] 			= BaseWars.GSL{Gun = true, Model = "models/weapons/tfa_cso2/w_m16a4.mdl", Price = 190000, ClassName = "tfa_cso2_m16a4" ,Level = 1900},
	["Ak-12"] 			= BaseWars.GSL{Gun = true, Model = "models/weapons/tfa_cso2/w_ak12.mdl", Price = 200000, ClassName = "tfa_cso2_ak12", Level = 2000},
	["SG552"] 			= BaseWars.GSL{Gun = true, Model = "models/weapons/tfa_cso2/w_sg552.mdl", Price = 210000, ClassName = "tfa_cso2_sg552" ,Level = 2250},
	["M4A1"] 			= BaseWars.GSL{Gun = true, Model = "models/weapons/tfa_cso2/w_m4a1.mdl", Price = 220000, ClassName = "tfa_cso2_m4a1" ,Level = 2500},
	["LR200"] 			= BaseWars.GSL{Gun = true, Model = "models/weapons/tfa_cso2/w_lr300.mdl", Price = 230000, ClassName = "tfa_cso2_lr300" ,Level = 2750},
	["KIA"] 			= BaseWars.GSL{Gun = true, Model = "models/weapons/tfa_cso2/w_k1a.mdl", Price = 240000, ClassName = "tfa_cso2_k1a" ,Level = 3000},
	["ACR"] 			= BaseWars.GSL{Gun = true, Model = "models/weapons/tfa_cso2/w_acr.mdl", Price = 250000, ClassName = "tfa_cso2_acr", Level = 3250},
	["T86"] 			= BaseWars.GSL{Gun = true, Model = "models/weapons/tfa_cso2/w_t86.mdl", Price = 260000, ClassName = "tfa_cso2_t86" ,Level = 3500},
	["F2000"] 			= BaseWars.GSL{Gun = true, Model = "models/weapons/tfa_cso2/w_f2000.mdl", Price = 270000, ClassName = "tfa_cso2_f2000" ,Level = 3750},
	["MK18 Mod 1 "] 	= BaseWars.GSL{Gun = true, Model = "models/weapons/tfa_cso2/w_mk18.mdl", Price = 280000, ClassName = "tfa_cso2_mk18" ,Level = 4000},
	["K2C"] 			= BaseWars.GSL{Gun = true, Model = "models/weapons/tfa_cso2/w_k2c.mdl", Price = 290000, ClassName = "tfa_cso2_k2c" ,Level = 4250},
	["Aug A1"] 			= BaseWars.GSL{Gun = true, Model = "models/weapons/tfa_cso2/w_aug.mdl", Price = 300000, ClassName = "tfa_cso2_aug", Level = 4500},
	["T65K1"] 			= BaseWars.GSL{Gun = true, Model = "models/weapons/tfa_cso2/w_t65.mdl", Price = 325000, ClassName = "tfa_cso2_t65" ,Level = 4750},
	["M4A1  Tan"] 		= BaseWars.GSL{Gun = true, Model = "models/weapons/tfa_cso2/w_m4a1_tan.mdl", Price = 350000, ClassName = "tfa_cso2_m4a1_tan" ,Level = 4000},
	["AEK-971"] 		= BaseWars.GSL{Gun = true, Model = "models/weapons/tfa_cso2/w_aek971.mdl", Price = 375000, ClassName = "tfa_cso2_aek971", Level = 4250},
	["SG550"] 			= BaseWars.GSL{Gun = true, Model = "models/weapons/tfa_cso2/w_sg550.mdl", Price = 400000, ClassName = "tfa_cso2_sg550" ,Level = 4500},
	//["Ak-47 Flash"] 	= BaseWars.GSL{Gun = true, Model = "models/weapons/tfa_cso2/w_ak47_flash.mdl", Price = 10, ClassName = "tfa_cso2_ak47_flash", Level = 5},
	//["M4A1 Gold"] 	= BaseWars.GSL{Gun = true, Model = "models/weapons/tfa_cso2/w_m4a1_gold.mdl", Price = 10, ClassName = "tfa_cso2_m4a1_gold", Level = 5},
	//["Ak-47  Gold"] 	= BaseWars.GSL{Gun = true, Model = "models/weapons/tfa_cso2/w_ak47_flash.mdl", Price = 10, ClassName = "tfa_cso2_ak47_gold", Level = 5},
	//["M16M203"] 		= BaseWars.GSL{Gun = true, Model = "models/weapons/tfa_cso2/w_m16m203.mdl", Price = 10, ClassName = "tfa_cso2_m16m203" ,Level = 5},
	//["M4A1 Flash"]		= BaseWars.GSL{Gun = true, Model = "models/weapons/tfa_cso2/w_m4a1flash.mdl", Price = 10, ClassName = "tfa_cso2_m4a1_flash" ,Level = 5},
	//["M4A1 Gold"] 		= BaseWars.GSL{Gun = true, Model = "models/weapons/tfa_cso2/w_m4a1_gold.mdl", Price = 10, ClassName = "tfa_cso2_m4a1_gold" ,Level = 5},
}
BaseWars.SpawnList.Loadout["6 - Sniper"] = {	
	//["AWM Gauss"] = BaseWars.GSL{Gun = true, Model = "models/weapons/tfa_cso2/w_awp_ss.mdl", Price = 10, ClassName = "tfa_cso2_awp_ss" ,Level = 5},
	//["M107A1"] = BaseWars.GSL{Gun = true, Model = "models/weapons/tfa_cso2/w_m107a1.mdl", Price = 10, ClassName = "tfa_cso2_m107a1" ,Level = 5},
	//["TAC-15"] = BaseWars.GSL{Gun = true, Model = "models/weapons/tfa_cso2/w_crossbow.mdl", Price = 10, ClassName = "tfa_cso2_crossbow" ,Level = 5},
	["M14 EBR"] = BaseWars.GSL{Gun = true, Model = "models/weapons/tfa_cso2/w_m14ebr.mdl", Price = 500000, ClassName = "tfa_cso2_m14" ,Level = 4600},
	["Galil SR"] = BaseWars.GSL{Gun = true, Model = "models/weapons/tfa_cso2/w_galilsniper.mdl", Price = 600000, ClassName = "tfa_cso2_galilsr" ,Level = 4700},
	["G35G-1"] = BaseWars.GSL{Gun = true, Model = "models/weapons/tfa_cso2/w_g3sg1.mdl", Price = 700000, ClassName = "tfa_cso2_g3sg1" ,Level = 4800},
	["Mosin Nagant"] = BaseWars.GSL{Gun = true, Model = "models/weapons/tfa_cso2/w_mosinnagant.mdl", Price = 800000, ClassName = "tfa_cso2_mosin" ,Level = 4900},
	["Svt-40"] = BaseWars.GSL{Gun = true, Model = "models/weapons/tfa_cso2/w_svt40.mdl", Price = 900000, ClassName = "tfa_cso2_svt40" ,Level = 5000},	
	["AWP"] = BaseWars.GSL{Gun = true, Model = "models/weapons/tfa_cso2/w_awp.mdl", Price = 1000000, ClassName = "tfa_cso2_awp" ,Level = 5100,vip=true},	
	["AWM"] = BaseWars.GSL{Gun = true, Model = "models/weapons/tfa_cso2/w_awm.mdl", Price = 1000000, ClassName = "tfa_cso2_awm" ,Level = 5100},
	["AWP Tan"] = BaseWars.GSL{Gun = true, Model = "models/weapons/tfa_cso2/w_awp_tan.mdl", Price = 2000000, ClassName = "tfa_cso2_awp_tan" ,Level = 5200,vip=true},
	["TRG-42"] = BaseWars.GSL{Gun = true, Model = "models/weapons/tfa_cso2/w_trg42.mdl", Price = 2000000, ClassName = "tfa_cso2_trg42" ,Level = 5200},
	["M99"] = BaseWars.GSL{Gun = true, Model = "models/weapons/tfa_cso2/w_m99.mdl", Price = 3000000, ClassName = "tfa_cso2_m99" ,Level = 5300},
}
BaseWars.SpawnList.Loadout["7 - Machine Gun"] = {
	["K12"] = BaseWars.GSL{Gun = true, Model = "models/weapons/tfa_cso2/w_k12.mdl", Price = 10000000, ClassName = "tfa_cso2_k12" ,Level = 5400} ,
	["M2K9"] = BaseWars.GSL{Gun = true, Model = "models/weapons/tfa_cso2/w_m249.mdl", Price = 10000000, ClassName = "tfa_cso2_m249" ,Level = 5400},
	["M6OE4 "] = BaseWars.GSL{Gun = true, Model = "models/weapons/tfa_cso2/w_m60.mdl", Price = 10000000, ClassName = "tfa_cso2_m60" ,Level = 5400},
	["MG3 "] = BaseWars.GSL{Gun = true, Model = "models/weapons/tfa_cso2/w_mg3.mdl", Price = 10000000, ClassName = "tfa_cso2_mg3" ,Level = 5400},
	["PKM"] = BaseWars.GSL{Gun = true, Model = "models/weapons/tfa_cso2/w_pkm.mdl", Price = 10000000, ClassName = "tfa_cso2_pkm" ,Level = 5400},
	//["PKM Fire"] = BaseWars.GSL{Gun = true, Model = "models/weapons/tfa_cso2/w_pkmfire.mdl", Price = 10000000, ClassName = "tfa_cso2_pkm_fire" ,Level = 5400},
	["QJY-88"] = BaseWars.GSL{Gun = true, Model = "models/weapons/tfa_cso2/w_qjy88.mdl", Price = 10000000, ClassName = "tfa_cso2_qjy88" ,Level = 5400},
}

BaseWars.SpawnList.Loadout["HealGun"] = {
	["Heal Gun"]					= BaseWars.GSL{Gun = true, Model = "models/weapons/w_physics.mdl", Price = 35000, ClassName = "bw_health", Level = 250},
	["Detector"]					= BaseWars.GSL{Gun = true, Model = "models/weapons/w_c4.mdl", Price = 6000, ClassName = "weapon_sh_detector", Level = 45},
}
------------------------------------------------------------------------
--                         PRINTER
------------------------------------------------------------------------

BaseWars.SpawnList.printer ["Printers (T01)"] = {
    //["Banque"]                = BaseWars.GSL{Model = "models/akulla/case/military.mdl", Price = 2500, ClassName = "bw_bank_t1" , Limit = 1, Level = 0},

    ["Wood Printer"]                = BaseWars.GSL{Model = "models/livaco/advprinters2/livaco_printer.mdl", Price = 3500, ClassName = "bw_printer_1_wood" , Limit = 3, Level = 0},
    ["Rock Printer"]                = BaseWars.GSL{Model = "models/livaco/advprinters2/livaco_printer.mdl", Price = 7200, ClassName = "bw_printer_2_rock" , Limit = 3, Level = 5},
    ["Cooper Printer"]                = BaseWars.GSL{Model = "models/livaco/advprinters2/livaco_printer.mdl", Price = 14400, ClassName = "bw_printer_3_cooper" , Limit = 3, Level = 10},
    ["Silver Printer"]                = BaseWars.GSL{Model = "models/livaco/advprinters2/livaco_printer.mdl", Price = 21600, ClassName = "bw_printer_4_silver" , Limit = 3, Level = 15},
    ["Gold Printer"]                = BaseWars.GSL{Model = "models/livaco/advprinters2/livaco_printer.mdl", Price = 36000, ClassName = "bw_printer_5_gold" , Limit = 3, Level = 20},
    ["Diamond Printer"]                = BaseWars.GSL{Model = "models/livaco/advprinters2/livaco_printer.mdl", Price = 46800, ClassName = "bw_printer_6_diamond" , Limit = 3, Level = 25},
    ["Platinum Printer"]                = BaseWars.GSL{Model = "models/livaco/advprinters2/livaco_printer.mdl", Price = 61200, ClassName = "bw_printer_7_platinum" , Limit = 3, Level = 30},
    ["Iridium Printer"]                = BaseWars.GSL{Model = "models/livaco/advprinters2/livaco_printer.mdl", Price = 169200, ClassName = "bw_printer_8_iridium" , Limit = 3, Level = 40},
    ["Uranium Printer"]                = BaseWars.GSL{Model = "models/livaco/advprinters2/livaco_printer.mdl", Price = 237600, ClassName = "bw_printer_9_uranium" , Limit = 3, Level = 50},
}
BaseWars.SpawnList.printer ["Printers (T02)"] = {
    //["Banque"]                = BaseWars.GSL{Model = "models/akulla/case/military.mdl", Price = 300000, ClassName = "bw_bank_t2" , Limit = 1, Level = 60},

    ["Emerald Printer"]                = BaseWars.GSL{Model = "models/livaco/advprinters2/livaco_printer.mdl", Price = 316800, ClassName = "bw_printer_10_emerald" , Limit = 3, Level = 60},
    ["Obsidian Printer"]                = BaseWars.GSL{Model = "models/livaco/advprinters2/livaco_printer.mdl", Price = 410400, ClassName = "bw_printer_11_obsidian" , Limit = 3, Level = 70},
    ["Paladium Printer"]                = BaseWars.GSL{Model = "models/livaco/advprinters2/livaco_printer.mdl", Price = 518400, ClassName = "bw_printer_12_paladium" , Limit = 3, Level = 80},
    ["Tanzanite Printer"]                = BaseWars.GSL{Model = "models/livaco/advprinters2/livaco_printer.mdl", Price = 644400, ClassName = "bw_printer_13_tanzanite" , Limit = 3, Level = 90},
    ["Black-Opal Printer"]                = BaseWars.GSL{Model = "models/livaco/advprinters2/livaco_printer.mdl", Price = 788400, ClassName = "bw_printer_14_blackopal" , Limit = 3, Level = 100},
    ["Red-Beryl Printer"]                = BaseWars.GSL{Model = "models/livaco/advprinters2/livaco_printer.mdl", Price = 954000, ClassName = "bw_printer_15_redberyl" , Limit = 3, Level = 110},
    ["Lazuritr Printer"]                = BaseWars.GSL{Model = "models/livaco/advprinters2/livaco_printer.mdl", Price = 1144800, ClassName = "bw_printer_16_lazurite" , Limit = 3, Level = 120},
    ["Mesolite Printer"]                = BaseWars.GSL{Model = "models/livaco/advprinters2/livaco_printer.mdl", Price = 1360800, ClassName = "bw_printer_17_mesolite" , Limit = 3, Level = 130},
    ["Kyanite Printer"]                = BaseWars.GSL{Model = "models/livaco/advprinters2/livaco_printer.mdl", Price = 1609200, ClassName = "bw_printer_18_kyanite" , Limit = 3, Level = 140},
}
BaseWars.SpawnList.printer ["Printers (T03)"] = {
	//["Banque"]                = BaseWars.GSL{Model = "models/akulla/case/military.mdl", Price = 1000000, ClassName = "bw_bank_t3" , Limit = 1, Level = 150},

    ["Ruby Printer"]                = BaseWars.GSL{Model = "models/livaco/advprinters2/livaco_printer.mdl", Price = 1893600, ClassName = "bw_printer_19_ruby" , Limit = 3, Level = 150},
    ["Technetium Printer"]                = BaseWars.GSL{Model = "models/livaco/advprinters2/livaco_printer.mdl", Price = 4579200, ClassName = "bw_printer_20_technetium" , Limit = 3, Level = 170},
    ["Promethium Printer"]                = BaseWars.GSL{Model = "models/livaco/advprinters2/livaco_printer.mdl", Price = 5641200, ClassName = "bw_printer_21_promethium" , Limit = 3, Level = 190},
    ["Polonium Printer"]                = BaseWars.GSL{Model = "models/livaco/advprinters2/livaco_printer.mdl", Price = 6868800, ClassName = "bw_printer_22_polonium" , Limit = 3, Level = 210},
    ["Astatine Printer"]                = BaseWars.GSL{Model = "models/livaco/advprinters2/livaco_printer.mdl", Price = 8280000, ClassName = "bw_printer_23_astatine" , Limit = 3, Level = 230},
    ["Radon Printer"]                = BaseWars.GSL{Model = "models/livaco/advprinters2/livaco_printer.mdl", Price = 9896400, ClassName = "bw_printer_24_radon" , Limit = 3, Level = 250},
    ["Francium Printer"]                = BaseWars.GSL{Model = "models/livaco/advprinters2/livaco_printer.mdl", Price = 31053600, ClassName = "bw_printer_25_francium" , Limit = 3, Level = 300},
    ["Mobuis Printer"]                = BaseWars.GSL{Model = "models/livaco/advprinters2/livaco_printer.mdl", Price = 40208400, ClassName = "bw_printer_26_mobuis" , Limit = 3, Level = 350},
    ["Dark-Matter Printer"]                = BaseWars.GSL{Model = "models/livaco/advprinters2/livaco_printer.mdl", Price = 50835600, ClassName = "bw_printer_27_darkmatter" , Limit = 3, Level = 400},
}
BaseWars.SpawnList.printer ["Printers (T04)"] = {
	//["Banque"]                = BaseWars.GSL{Model = "models/akulla/case/military.mdl", Price = 60000000, ClassName = "bw_bank_t4" , Limit = 1, Level = 450},

    ["Red-Matter Printer"]                = BaseWars.GSL{Model = "models/livaco/advprinters2/livaco_printer.mdl", Price = 63133200, ClassName = "bw_printer_28_redmatter" , Limit = 3, Level = 450},
    ["Monolithe Printer"]                = BaseWars.GSL{Model = "models/livaco/advprinters2/livaco_printer.mdl", Price = 77320800, ClassName = "bw_printer_29_monolithe" , Limit = 3, Level = 500},
    ["Quantium Printer"]                = BaseWars.GSL{Model = "models/livaco/advprinters2/livaco_printer.mdl", Price = 93650400, ClassName = "bw_printer_30_quantium" , Limit = 3, Level = 550},
    ["Bénitoïte Printer"]                = BaseWars.GSL{Model = "models/livaco/advprinters2/livaco_printer.mdl", Price = 112402800, ClassName = "bw_printer_31_benitoite" , Limit = 3, Level = 600},
    ["Jade Printer"]                = BaseWars.GSL{Model = "models/livaco/advprinters2/livaco_printer.mdl", Price = 133891200, ClassName = "bw_printer_32_jade" , Limit = 3, Level = 650},
    ["Saphir Printer"]                = BaseWars.GSL{Model = "models/livaco/advprinters2/livaco_printer.mdl", Price = 158472000, ClassName = "bw_printer_33_saphir" , Limit = 3, Level = 700},
    ["Amber Printer"]                = BaseWars.GSL{Model = "models/livaco/advprinters2/livaco_printer.mdl", Price = 385916400, ClassName = "bw_printer_34_amber" , Limit = 3, Level = 800},
    ["Larimar Printer"]                = BaseWars.GSL{Model = "models/livaco/advprinters2/livaco_printer.mdl", Price = 479304000, ClassName = "bw_printer_35_larimar" , Limit = 3, Level = 900},
    ["Diopstase Printer"]                = BaseWars.GSL{Model = "models/livaco/advprinters2/livaco_printer.mdl", Price = 587062800, ClassName = "bw_printer_36_diopstase" , Limit = 3, Level = 1000},
}
BaseWars.SpawnList.printer ["Printers (T05)"] = {
	//["Banque"]                = BaseWars.GSL{Model = "models/akulla/case/military.mdl", Price = 70000000, ClassName = "bw_bank_t5" , Limit = 1, Level = 1100},

    ["Malachite Printer"]                = BaseWars.GSL{Model = "models/livaco/advprinters2/livaco_printer.mdl", Price = 711082800, ClassName = "bw_printer_37_malachite" , Limit = 3, Level = 1100},
    ["Bauxite Printer"]                = BaseWars.GSL{Model = "models/livaco/advprinters2/livaco_printer.mdl", Price = 853502400, ClassName = "bw_printer_38_bauxite" , Limit = 3, Level = 1200},
    ["Fluorite Printer"]                = BaseWars.GSL{Model = "models/livaco/advprinters2/livaco_printer.mdl", Price = 1016708400, ClassName = "bw_printer_39_fluorite" , Limit = 3, Level = 1300},
    ["Pyrite Printer"]                = BaseWars.GSL{Model = "models/livaco/advprinters2/livaco_printer.mdl", Price = 1203375600, ClassName = "bw_printer_40_pyrite" , Limit = 3, Level = 1400},
    ["Galenite Printer"]                = BaseWars.GSL{Model = "models/livaco/advprinters2/livaco_printer.mdl", Price = 1416506400, ClassName = "bw_printer_41_galenite" , Limit = 3, Level = 1500},
    ["Cassisterite Printer"]                = BaseWars.GSL{Model = "models/livaco/advprinters2/livaco_printer.mdl", Price = 1659459600, ClassName = "bw_printer_42_cassisterite" , Limit = 3, Level = 1600},
    ["Garniérite Printer"]                = BaseWars.GSL{Model = "models/livaco/advprinters2/livaco_printer.mdl", Price = 1935993600, ClassName = "bw_printer_43_garnierite" , Limit = 3, Level = 1700},
    ["Zinc Printer"]                = BaseWars.GSL{Model = "models/livaco/advprinters2/livaco_printer.mdl", Price = 2250320400, ClassName = "bw_printer_44_zinc" , Limit = 3, Level = 1800},
    ["Sulfur Printer"]                = BaseWars.GSL{Model = "models/livaco/advprinters2/livaco_printer.mdl", Price = 2607145200,ClassName = "bw_printer_45_sulfur" , Limit = 3, Level = 1900},
}
BaseWars.SpawnList.printer ["Printers (T06)"] = {
	//["Banque"]                = BaseWars.GSL{Model = "models/akulla/case/military.mdl", Price = 3000000000, ClassName = "bw_bank_t6" , Limit = 1, Level = 2000},

    ["Pole-Star Printer"]                = BaseWars.GSL{Model = "models/livaco/advprinters2/livaco_printer.mdl", Price = 3011731200, ClassName = "bw_printer_46_polestar" , Limit = 3, Level = 2000},
    ["Neptune Printer"]                = BaseWars.GSL{Model = "models/livaco/advprinters2/livaco_printer.mdl", Price = 3469957200, ClassName = "bw_printer_47_neptune" , Limit = 3, Level = 2100},
    ["Black-Hole Printer"]                = BaseWars.GSL{Model = "models/livaco/advprinters2/livaco_printer.mdl", Price = 3988389600, ClassName = "bw_printer_48_blackhole" , Limit = 3, Level = 2200},
    ["Quasar Printer"]                = BaseWars.GSL{Model = "models/livaco/advprinters2/livaco_printer.mdl", Price = 4574368800, ClassName = "bw_printer_49_quasar" , Limit = 3, Level = 2300},
    ["Nova Printer"]                = BaseWars.GSL{Model = "models/livaco/advprinters2/livaco_printer.mdl", Price = 5236081200, ClassName = "bw_printer_50_nova" , Limit = 3, Level = 2400},
    ["Pulsar Printer"]                = BaseWars.GSL{Model = "models/livaco/advprinters2/livaco_printer.mdl", Price = 5982667200, ClassName = "bw_printer_51_pulsar" , Limit = 3, Level = 2500},
    ["Moon Printer"]                = BaseWars.GSL{Model = "models/livaco/advprinters2/livaco_printer.mdl", Price = 6824322000, ClassName = "bw_printer_52_moon" , Limit = 3, Level = 2600},
    ["Comet Printer"]                = BaseWars.GSL{Model = "models/livaco/advprinters2/livaco_printer.mdl", Price = 7772414400, ClassName = "bw_printer_53_comet" , Limit = 3, Level = 2700},
    ["Cosmos Printer"]                = BaseWars.GSL{Model = "models/livaco/advprinters2/livaco_printer.mdl", Price = 8839623600, ClassName = "bw_printer_54_cosmos" , Limit = 3, Level = 2800},
}
BaseWars.SpawnList.printer ["Printers (T07)"] = {
	//["Banque"]                = BaseWars.GSL{Model = "models/akulla/case/military.mdl", Price = 10000000000, ClassName = "bw_bank_t7" , Limit = 1, Level = 2900},

    ["Hydrogen Printer"]                = BaseWars.GSL{Model = "models/livaco/advprinters2/livaco_printer.mdl", Price = 10040079600, ClassName = "bw_printer_55_hydrogen" , Limit = 3, Level = 2900},
    ["Helium Printer"]                = BaseWars.GSL{Model = "models/livaco/advprinters2/livaco_printer.mdl", Price = 11389528800, ClassName = "bw_printer_56_helium" , Limit = 3, Level = 3000},
    ["Lithium Printer"]                = BaseWars.GSL{Model = "models/livaco/advprinters2/livaco_printer.mdl", Price = 12905510400, ClassName = "bw_printer_57_lithium" , Limit = 3, Level = 3100},
    ["Berryllium Printer"]                = BaseWars.GSL{Model = "models/livaco/advprinters2/livaco_printer.mdl", Price = 14607558000, ClassName = "bw_printer_58_berryllium" , Limit = 3, Level = 3200},
    ["Boron Printer"]                = BaseWars.GSL{Model = "models/livaco/advprinters2/livaco_printer.mdl", Price = 16517422800, ClassName = "bw_printer_59_boron" , Limit = 3, Level = 3300},
    ["Carbon Printer"]                = BaseWars.GSL{Model = "models/livaco/advprinters2/livaco_printer.mdl", Price = 18659314800, ClassName = "bw_printer_60_carbon" , Limit = 3, Level = 3400},
    ["Nitrogen Printer"]                = BaseWars.GSL{Model = "models/livaco/advprinters2/livaco_printer.mdl", Price = 21060183600, ClassName = "bw_printer_61_nitrogen" , Limit = 3, Level = 3500},
    ["Oxygen Printer"]                = BaseWars.GSL{Model = "models/livaco/advprinters2/livaco_printer.mdl", Price = 23749999200, ClassName = "bw_printer_62_oxygen" , Limit = 3, Level = 3600},
    ["Fluorine Printer"]                = BaseWars.GSL{Model = "models/livaco/advprinters2/livaco_printer.mdl", Price = 26762115600, ClassName = "bw_printer_63_fluorine" , Limit = 3, Level = 3700},
}
BaseWars.SpawnList.printer ["Printers (T08)"] = {
	//["Banque"]                = BaseWars.GSL{Model = "models/akulla/case/military.mdl", Price = 30000000000, ClassName = "bw_bank_t8" , Limit = 1, Level = 3800},

    ["Neon Printer"]                	= BaseWars.GSL{Model = "models/livaco/advprinters2/livaco_printer.mdl", Price = 30133616400, ClassName = "bw_printer_64_neon" , Limit = 3, Level = 3800},
    ["Sodium Printer"]                	= BaseWars.GSL{Model = "models/livaco/advprinters2/livaco_printer.mdl", Price = 33905739600, ClassName = "bw_printer_65_sodium" , Limit = 3, Level = 3900},
    ["Magnesium Printer"]               = BaseWars.GSL{Model = "models/livaco/advprinters2/livaco_printer.mdl", Price = 38124324000, ClassName = "bw_printer_66_magnesium" , Limit = 3, Level = 4000},
    ["Aluminium Printer"]               = BaseWars.GSL{Model = "models/livaco/advprinters2/livaco_printer.mdl", Price = 42840320400, ClassName = "bw_printer_67_aluminium" , Limit = 3, Level = 4100},
    ["Silicon Printer"]                	= BaseWars.GSL{Model = "models/livaco/advprinters2/livaco_printer.mdl", Price = 48110349600, ClassName = "bw_printer_68_silicon" , Limit = 3, Level = 4200},
    ["Phosphorus Printer"]              = BaseWars.GSL{Model = "models/livaco/advprinters2/livaco_printer.mdl", Price = 53997307200, ClassName = "bw_printer_69_phosphorus" , Limit = 3, Level = 4300},
    ["Sulphur Printer"]                	= BaseWars.GSL{Model = "models/livaco/advprinters2/livaco_printer.mdl", Price = 60571072800, ClassName = "bw_printer_70_sulphur" , Limit = 3, Level = 4400},
    ["Chlorine Printer"]                = BaseWars.GSL{Model = "models/livaco/advprinters2/livaco_printer.mdl", Price = 67909240800, ClassName = "bw_printer_71_chlorine" , Limit = 3, Level = 4500},
    ["Argon Printer"]                	= BaseWars.GSL{Model = "models/livaco/advprinters2/livaco_printer.mdl", Price = 76097991600, ClassName = "bw_printer_72_argon" , Limit = 3, Level = 4600},
}
BaseWars.SpawnList.printer ["Printers (T09)"] = {
	//["Banque"]                = BaseWars.GSL{Model = "models/akulla/case/military.mdl", Price = 80000000000, ClassName = "bw_bank_t9" , Limit = 1, Level = 4700},

    ["Potassium Printer"]               = BaseWars.GSL{Model = "models/livaco/advprinters2/livaco_printer.mdl", Price = 85232991600, ClassName = "bw_printer_73_potassium" , Limit = 3, Level = 4700},
    ["Calcium Printer"]                	= BaseWars.GSL{Model = "models/livaco/advprinters2/livaco_printer.mdl", Price = 95420437200, ClassName = "bw_printer_74_calcium" , Limit = 3, Level = 4800},
    ["Scandium Printer"]                = BaseWars.GSL{Model = "models/livaco/advprinters2/livaco_printer.mdl", Price = 106778199600, ClassName = "bw_printer_75_scandium" , Limit = 3, Level = 4900},
    ["Titanium Printer"]                = BaseWars.GSL{Model = "models/livaco/advprinters2/livaco_printer.mdl", Price = 119437070400, ClassName = "bw_printer_76_titanium" , Limit = 3, Level = 5000},
    ["Vanadium Printer"]                = BaseWars.GSL{Model = "models/livaco/advprinters2/livaco_printer.mdl", Price = 133542180000, ClassName = "bw_printer_77_vanadium" , Limit = 3, Level = 5100},
    ["Chromium Printer"]                = BaseWars.GSL{Model = "models/livaco/advprinters2/livaco_printer.mdl", Price = 149254513200, ClassName = "bw_printer_78_chromium" , Limit = 3, Level = 5200},
    ["Manganese Printer"]               = BaseWars.GSL{Model = "models/livaco/advprinters2/livaco_printer.mdl", Price = 166752648000, ClassName = "bw_printer_79_manganese" , Limit = 3, Level = 5300},
    ["Cobalt Printer"]                	= BaseWars.GSL{Model = "models/livaco/advprinters2/livaco_printer.mdl", Price = 186234634800, ClassName = "bw_printer_80_cobalt" , Limit = 3, Level = 5400},
    ["Nickel Printer"]                	= BaseWars.GSL{Model = "models/livaco/advprinters2/livaco_printer.mdl", Price = 207920077200, ClassName = "bw_printer_81_nickel" , Limit = 3, Level = 5500}, // 232052468400
}
BaseWars.SpawnList.printer["Printers (T10)"] = {
	//["Banque"]                = BaseWars.GSL{Model = "models/akulla/case/military.mdl", Price = 200000000000, ClassName = "bw_bank_t10" , Limit = 1, Level = 5600},

    ["Moonlight Printer"]           = BaseWars.GSL{Model = "models/livaco/advprinters2/livaco_printer.mdl", Price = 232052468400, ClassName = "bw_printer_82_moonlight", Limit = 3, Level = 5600},
    ["Coral Printer"]               = BaseWars.GSL{Model = "models/livaco/advprinters2/livaco_printer.mdl", Price = 522385394400, ClassName = "bw_printer_83_coral", Limit = 3,     Level = 5800},
    ["Lush Green Printer"]          = BaseWars.GSL{Model = "models/livaco/advprinters2/livaco_printer.mdl", Price = 592598970000, ClassName = "bw_printer_84_lushgreen", Limit = 3,Level = 6000},
    ["Ocean Blue Printer"]          = BaseWars.GSL{Model = "models/livaco/advprinters2/livaco_printer.mdl", Price = 671477569200, ClassName = "bw_printer_85_oceanblue", Limit = 3,Level = 6200},
    ["Sunshine Printer"]            = BaseWars.GSL{Model = "models/livaco/advprinters2/livaco_printer.mdl", Price = 760037630400, ClassName = "bw_printer_86_sunshine", Limit = 3, Level = 6400},
    ["Raspberry Printer"]           = BaseWars.GSL{Model = "models/livaco/advprinters2/livaco_printer.mdl", Price = 859410871200, ClassName = "bw_printer_87_raspberry", Limit = 3,Level = 6600},
    ["Ivory Printer"]               = BaseWars.GSL{Model = "models/livaco/advprinters2/livaco_printer.mdl", Price = 970857057600, ClassName = "bw_printer_88_ivory", Limit = 3,    Level = 6800},
    ["Mango Printer"]               = BaseWars.GSL{Model = "models/livaco/advprinters2/livaco_printer.mdl", Price = 1095778162800, ClassName = "bw_printer_89_mango", Limit = 3,   Level = 7000},
    ["Skyline Printer"]             = BaseWars.GSL{Model = "models/livaco/advprinters2/livaco_printer.mdl", Price = 1235734052400, ClassName = "bw_printer_90_skyline", Limit = 3, Level = 7200},
}
BaseWars.SpawnList.printer["Printers (T11)"] = {
	//["Banque"]                = BaseWars.GSL{Model = "models/akulla/case/military.mdl", Price = 1000000000000, ClassName = "bw_bank_t11" , Limit = 1, Level = 7400},

    ["Citrus Printer"]              = BaseWars.GSL{Model = "models/livaco/advprinters2/livaco_printer.mdl", Price = 1392459872400, ClassName = "bw_printer_91_citrus", Limit = 3,    Level = 7400},
    ["Blush Printer"]               = BaseWars.GSL{Model = "models/livaco/advprinters2/livaco_printer.mdl", Price = 1567885338000, ClassName = "bw_printer_92_blush", Limit = 3,     Level = 7600},
    ["Minty Printer"]               = BaseWars.GSL{Model = "models/livaco/advprinters2/livaco_printer.mdl", Price = 1764156096000, ClassName = "bw_printer_93_minty", Limit = 3,    Level = 7800},
    ["Lilac Printer"]               = BaseWars.GSL{Model = "models/livaco/advprinters2/livaco_printer.mdl", Price = 1983657380400, ClassName = "bw_printer_94_lilac", Limit = 3,    Level = 8000},
    ["Peach Printer"]               = BaseWars.GSL{Model = "models/livaco/advprinters2/livaco_printer.mdl", Price = 2229040260000, ClassName = "bw_printer_95_peach", Limit = 3,    Level = 8200},
    ["Aqua Printer"]                = BaseWars.GSL{Model = "models/livaco/advprinters2/livaco_printer.mdl", Price = 2503250668800, ClassName = "bw_printer_96_aqua", Limit = 3,     Level = 8400},
    ["Emerald Printer"]             = BaseWars.GSL{Model = "models/livaco/advprinters2/livaco_printer.mdl", Price = 2809561608000, ClassName = "bw_printer_97_emerald", Limit = 3,  Level = 8600},
    ["Lemon Printer"]               = BaseWars.GSL{Model = "models/livaco/advprinters2/livaco_printer.mdl", Price = 3151608768000, ClassName = "bw_printer_98_lemon", Limit = 3,   Level = 8800},
    ["Lavender Printer"]            = BaseWars.GSL{Model = "models/livaco/advprinters2/livaco_printer.mdl", Price = 3533430016800, ClassName = "bw_printer_99_lavender", Limit = 3,Level = 9000},
}
BaseWars.SpawnList.printer["Printers (T12)"] = {   
	//["Banque"]                = BaseWars.GSL{Model = "models/akulla/case/military.mdl", Price = 3000000000000, ClassName = "bw_bank_t12" , Limit = 1, Level = 9200},

    ["Peach Printer"]               = BaseWars.GSL{Model = "models/livaco/advprinters2/livaco_printer.mdl", Price = 3959509089600, ClassName = "bw_printer_100_sunset", Limit = 3,  Level = 9200},
    ["Teal Printer"]                = BaseWars.GSL{Model = "models/livaco/advprinters2/livaco_printer.mdl", Price = 4434823990800, ClassName = "bw_printer_101_teal", Limit = 3,    Level = 9400},
    ["Orchid Printer"]              = BaseWars.GSL{Model = "models/livaco/advprinters2/livaco_printer.mdl", Price = 4964900558400, ClassName = "bw_printer_102_orchid", Limit = 3,  Level = 9600},
    ["Apricot Printer"]             = BaseWars.GSL{Model = "models/livaco/advprinters2/livaco_printer.mdl", Price = 5555871759600, ClassName = "bw_printer_103_apricot", Limit = 3,Level = 9800},
    ["Azure Printer"]               = BaseWars.GSL{Model = "models/livaco/advprinters2/livaco_printer.mdl", Price = 6214543351200, ClassName = "bw_printer_104_azure", Limit = 3,  Level = 10000},
    ["Tangerine Printer"]           = BaseWars.GSL{Model = "models/livaco/advprinters2/livaco_printer.mdl", Price = 6948466491600, ClassName = "bw_printer_105_tangerine", Limit = 3,Level = 10200},
    ["Pearl Printer"]               = BaseWars.GSL{Model = "models/livaco/advprinters2/livaco_printer.mdl", Price = 7766018164800, ClassName = "bw_printer_106_pearl", Limit = 3,    Level = 10400},
    ["Cinnamon Printer"]            = BaseWars.GSL{Model = "models/livaco/advprinters2/livaco_printer.mdl", Price = 8676490100400, ClassName = "bw_printer_107_cinnamon", Limit = 3,Level = 10600},
    ["Cornflower Printer"]          = BaseWars.GSL{Model = "models/livaco/advprinters2/livaco_printer.mdl", Price = 9690187233600, ClassName = "bw_printer_108_cornflower", Limit = 3,Level = 10800},
}
BaseWars.SpawnList.printer["Printers (T13)"] = {  
	//["Banque"]                = BaseWars.GSL{Model = "models/akulla/case/military.mdl", Price = 10000000000000, ClassName = "bw_bank_t13" , Limit = 1, Level = 11000},

    ["Papaya Printer"]              = BaseWars.GSL{Model = "models/livaco/advprinters2/livaco_printer.mdl", Price = 10818536565600, ClassName = "bw_printer_109_papaya", Limit = 3,  Level = 11000},
    ["Jadeite Printer"]             = BaseWars.GSL{Model = "models/livaco/advprinters2/livaco_printer.mdl", Price = 12074207637600, ClassName = "bw_printer_110_jadeite", Limit = 3, Level = 11200},
    ["Seashell Printer"]            = BaseWars.GSL{Model = "models/livaco/advprinters2/livaco_printer.mdl", Price = 13471245766800, ClassName = "bw_printer_111_seashell", Limit = 3,Level = 11400},
    ["Mulberry Printer"]            = BaseWars.GSL{Model = "models/livaco/advprinters2/livaco_printer.mdl", Price = 15025219423200, ClassName = "bw_printer_112_mulberry", Limit = 3,Level = 11600},
    ["Honeydew Printer"]            = BaseWars.GSL{Model = "models/livaco/advprinters2/livaco_printer.mdl", Price = 16753383208800, ClassName = "bw_printer_113_honeydew", Limit = 3,Level = 11800},
    ["Sky Blue Printer"]            = BaseWars.GSL{Model = "models/livaco/advprinters2/livaco_printer.mdl", Price = 18674858120400, ClassName = "bw_printer_114_skyblue", Limit = 3,  Level = 12000},
    ["Sandstone Printer"]           = BaseWars.GSL{Model = "models/livaco/advprinters2/livaco_printer.mdl", Price = 20810830845600, ClassName = "bw_printer_115_sandstone", Limit = 3,Level = 12200},
    ["Peacock Printer"]             = BaseWars.GSL{Model = "models/livaco/advprinters2/livaco_printer.mdl", Price = 23184774136800, ClassName = "bw_printer_116_peacock", Limit = 3, Level = 12500},
    ["Blossom Printer"]             = BaseWars.GSL{Model = "models/livaco/advprinters2/livaco_printer.mdl", Price = 32601133800000, ClassName = "bw_printer_117_blossom", Limit = 3, Level = 12750},
}
BaseWars.SpawnList.printer["Printers (T14)"] = {
	//["Banque"]                = BaseWars.GSL{Model = "models/akulla/case/military.mdl", Price = 30000000000000, ClassName = "bw_bank_t14" , Limit = 1, Level = 13000},

    ["Dark Printer"]                = BaseWars.GSL{Model = "models/livaco/advprinters2/livaco_printer.mdl", Price = 36436967229600, ClassName = "bw_printer_118_cobalt", Limit = 3, Level = 13000},
    ["Primrose Printer"]            = BaseWars.GSL{Model = "models/livaco/advprinters2/livaco_printer.mdl", Price = 40708769576400, ClassName = "bw_printer_119_primrose", Limit = 3, Level = 13250},
    ["Coral Reef Printer"]           = BaseWars.GSL{Model = "models/livaco/advprinters2/livaco_printer.mdl", Price = 45464890165200, ClassName = "bw_printer_120_coralreef", Limit = 3, Level = 13500},
    ["Mint Chip Printer"]           = BaseWars.GSL{Model = "models/livaco/advprinters2/livaco_printer.mdl", Price = 50758942964400, ClassName = "bw_printer_121_mintchip", Limit = 3, Level = 13750},
    ["Sunflower Printer"]               = BaseWars.GSL{Model = "models/livaco/advprinters2/livaco_printer.mdl", Price = 56650371739200, ClassName = "bw_printer_122_sunflower", Limit = 3,  Level = 14000},
    ["Denim Printer"]             = BaseWars.GSL{Model = "models/livaco/advprinters2/livaco_printer.mdl", Price = 63205075238400, ClassName = "bw_printer_123_denim", Limit = 3,  Level = 14250},
    ["Vanilla Printer"]               = BaseWars.GSL{Model = "models/livaco/advprinters2/livaco_printer.mdl", Price = 70496098617600, ClassName = "bw_printer_124_vanilla", Limit = 3,    Level = 14500},
    ["Frost Printer"]            = BaseWars.GSL{Model = "models/livaco/advprinters2/livaco_printer.mdl", Price = 78604398198000, ClassName = "bw_printer_125_frost", Limit = 3, Level = 14750},
    ["Amethyst Printer"]             = BaseWars.GSL{Model = "models/livaco/advprinters2/livaco_printer.mdl", Price = 87619687124400, ClassName = "bw_printer_126_amethyst", Limit = 3, Level = 15000},
   
}
BaseWars.SpawnList.printer["Printers (T15)"] = {
	//["Banque"]                = BaseWars.GSL{Model = "models/akulla/case/military.mdl", Price = 90000000000000, ClassName = "bw_bank_t15" , Limit = 1, Level = 15250},

    ["Scarlet Printer"]           = BaseWars.GSL{Model = "models/livaco/advprinters2/livaco_printer.mdl", Price = 97641370494000, ClassName = "bw_printer_127_scarlet", Limit = 3, Level = 15250},
    ["Mint Frost Printer"]           = BaseWars.GSL{Model = "models/livaco/advprinters2/livaco_printer.mdl", Price = 108779579359200, ClassName = "bw_printer_128_mintfrost", Limit = 3, Level = 15500},   
    ["Buttercup Printer"]          = BaseWars.GSL{Model = "models/livaco/advprinters2/livaco_printer.mdl", Price = 121156313853600, ClassName = "bw_printer_129_buttercup", Limit = 3, Level = 15750},
    ["Caribbean Printer"]           = BaseWars.GSL{Model = "models/livaco/advprinters2/livaco_printer.mdl", Price = 134906707004400, ClassName = "bw_printer_130_caribbean", Limit = 3, Level = 16000},
    ["Bubblegum Printer"]          = BaseWars.GSL{Model = "models/livaco/advprinters2/livaco_printer.mdl", Price = 150180421770000, ClassName = "bw_printer_131_bubblegum", Limit = 3, Level = 16250},
    ["Amber Glow Printer"]            = BaseWars.GSL{Model = "models/livaco/advprinters2/livaco_printer.mdl", Price = 167143195274400, ClassName = "bw_printer_132_amberglow", Limit = 3, Level = 16500},
    ["Snowflake Printer"]      = BaseWars.GSL{Model = "models/livaco/advprinters2/livaco_printer.mdl", Price = 185978545596000, ClassName = "bw_printer_133_snowflake", Limit = 3, Level = 16750},
    ["Ocean Wave Printer"]            = BaseWars.GSL{Model = "models/livaco/advprinters2/livaco_printer.mdl", Price = 206889658135200, ClassName = "bw_printer_134_oceanwave", Limit = 3, Level = 17000},
    ["Ruby Red Printer"]         = BaseWars.GSL{Model = "models/livaco/advprinters2/livaco_printer.mdl", Price = 230101470266400, ClassName = "bw_printer_135_rubyred", Limit = 3, Level = 17250},
}
BaseWars.SpawnList.printer["Printers (T16)"] = {
	//["Banque"]                = BaseWars.GSL{Model = "models/akulla/case/military.mdl", Price = 200000000000000, ClassName = "bw_bank_t16" , Limit = 1, Level = 17500},

    ["Frosty Pine Printer"]          = BaseWars.GSL{Model = "models/livaco/advprinters2/livaco_printer.mdl", Price = 255862974956400, ClassName = "bw_printer_136_frostypine", Limit = 3, Level = 17500},
    ["Cherry Blossom Printer"]               = BaseWars.GSL{Model = "models/livaco/advprinters2/livaco_printer.mdl", Price = 284449766230800, ClassName = "bw_printer_137_cherryblossom", Limit = 3, Level = 17750},
    ["Serenity Printer"]              = BaseWars.GSL{Model = "models/livaco/advprinters2/livaco_printer.mdl", Price = 316166851616400, ClassName = "bw_printer_138_serenity", Limit = 3, Level = 18000},
    ["Mango Tango Printer"]            = BaseWars.GSL{Model = "models/livaco/advprinters2/livaco_printer.mdl", Price = 351351759416400, ClassName = "bw_printer_139_mangotango", Limit = 3, Level = 18250},
    ["Periwinkle Printer"]             = BaseWars.GSL{Model = "models/livaco/advprinters2/livaco_printer.mdl", Price = 390377971483200, ClassName = "bw_printer_140_periwinkle", Limit = 3, Level = 18500},
    ["Flame Printer"]               = BaseWars.GSL{Model = "models/livaco/advprinters2/livaco_printer.mdl", Price = 433658715339600, ClassName = "bw_printer_141_flame", Limit = 3, Level = 18750},
    ["Meadow Printer"]              = BaseWars.GSL{Model = "models/livaco/advprinters2/livaco_printer.mdl", Price = 481651153002000, ClassName = "bw_printer_142_meadow", Limit = 3, Level = 19000},
    ["Paradise Printer"]         = BaseWars.GSL{Model = "models/livaco/advprinters2/livaco_printer.mdl", Price = 534861007758000, ClassName = "bw_printer_143_paradise", Limit = 3, Level = 19250},
    ["Fuchsia "]              = BaseWars.GSL{Model = "models/livaco/advprinters2/livaco_printer.mdl", Price = 593847674319600 , ClassName = "bw_printer_144_fuchsia", Limit = 3, Level = 19500},
}
BaseWars.SpawnList.printer["Printers (T17)"] = {    
	//["Banque"]                = BaseWars.GSL{Model = "models/akulla/case/military.mdl", Price = 600000000000000, ClassName = "bw_bank_t17" , Limit = 1, Level = 19750},

    ["Mocha Printer"]          = BaseWars.GSL{Model = "models/livaco/advprinters2/livaco_printer.mdl", Price = 659229862582800, ClassName = "bw_printer_145_mocha", Limit = 3, Level = 19750},
    ["Arctic Printer"]          = BaseWars.GSL{Model = "models/livaco/advprinters2/livaco_printer.mdl", Price = 731691830264400, ClassName = "bw_printer_146_arctic", Limit = 3, Level = 20000},
    ["Orchid Haze Printer"]        = BaseWars.GSL{Model = "models/livaco/advprinters2/livaco_printer.mdl", Price = 811990265558400, ClassName = "bw_printer_147_orchidhaze", Limit = 3, Level = 20250},
    ["Citron Printer"]          = BaseWars.GSL{Model = "models/livaco/advprinters2/livaco_printer.mdl", Price = 900961887088800, ClassName = "bw_printer_148_citron", Limit = 3, Level = 20500}, 
    ["Berry Burst Printer"]          = BaseWars.GSL{Model = "models/livaco/advprinters2/livaco_printer.mdl", Price = 2011178914714800, ClassName = "bw_printer_149_berryburst", Limit = 3, Level = 21000},
    ["Deep Ocean Printer"]        = BaseWars.GSL{Model = "models/livaco/advprinters2/livaco_printer.mdl", Price = 2257279280290800, ClassName = "bw_printer_150_deepocean", Limit = 3, Level = 21500},
    ["Coral Sunset Printer"]              = BaseWars.GSL{Model = "models/livaco/advprinters2/livaco_printer.mdl", Price = 2532091457397600, ClassName = "bw_printer_151_coralsunset", Limit = 3, Level = 22000},
    ["Velvet Sky Printer"]             = BaseWars.GSL{Model = "models/livaco/advprinters2/livaco_printer.mdl", Price = 2838859627510800, ClassName = "bw_printer_152_velvetsky", Limit = 3, Level = 22500},
    ["Peppermint Printer"]                = BaseWars.GSL{Model = "models/livaco/advprinters2/livaco_printer.mdl", Price = 3181186206093600, ClassName = "bw_printer_153_peppermint", Limit = 3, Level = 23000},
}
BaseWars.SpawnList.printer["Printers (T18)"] = {
	//["Banque"]                = BaseWars.GSL{Model = "models/akulla/case/military.mdl", Price = 1000000000000000, ClassName = "bw_bank_t18" , Limit = 1, Level = 23500},

    ["Plum Perfect Printer"]          = BaseWars.GSL{Model = "models/livaco/advprinters2/livaco_printer.mdl", Price = 1771957419483600, ClassName = "bw_printer_154_plumperfect", Limit = 3, Level = 23500},
    ["Lagoon Printer"]         = BaseWars.GSL{Model = "models/livaco/advprinters2/livaco_printer.mdl", Price = 3988952855028000, ClassName = "bw_printer_155_lagoon", Limit = 3, Level = 24000},
    ["Caramel Printer"]         = BaseWars.GSL{Model = "models/livaco/advprinters2/livaco_printer.mdl", Price = 4463760089008800, ClassName = "bw_printer_156_caramel", Limit = 3, Level = 24500},
    ["Iris Printer"]            = BaseWars.GSL{Model = "models/livaco/advprinters2/livaco_printer.mdl", Price = 4992960440145600, ClassName = "bw_printer_157_iris", Limit = 3, Level = 25000},
    ["Lemon Zest Printer"]          = BaseWars.GSL{Model = "models/livaco/advprinters2/livaco_printer.mdl", Price = 5582620826445600, ClassName = "bw_printer_158_lemonzest", Limit = 3, Level = 25500},  
    ["Aqua Splash Printer"]             = BaseWars.GSL{Model = "models/livaco/advprinters2/livaco_printer.mdl", Price = 6239471656507200, ClassName = "bw_printer_159_aquasplash", Limit = 3, Level = 26000},
    ["Sunset Gold Printer"]          = BaseWars.GSL{Model = "models/livaco/advprinters2/livaco_printer.mdl", Price = 6970978300190400, ClassName = "bw_printer_160_sunsetgold", Limit = 3, Level = 26500},
    ["Twilight Printer"]             = BaseWars.GSL{Model = "models/livaco/advprinters2/livaco_printer.mdl", Price = 7785420166332000, ClassName = "bw_printer_161_twilight", Limit = 3, Level = 27000},
    ["Berry Blue Printer"]           = BaseWars.GSL{Model = "models/livaco/advprinters2/livaco_printer.mdl", Price = 8691978189196800, ClassName = "bw_printer_162_berryblue", Limit = 3, Level = 27500},
}
BaseWars.SpawnList.printer["Printers (T19)"] = {
	//["Banque"]                = BaseWars.GSL{Model = "models/akulla/case/military.mdl", Price = 9000000000000000, ClassName = "bw_bank_t19" , Limit = 1, Level = 28000},

    ["Saffron Printer"]    = BaseWars.GSL{Model = "models/livaco/advprinters2/livaco_printer.mdl", Price = 9700831609430400, ClassName = "bw_printer_163_saffron", Limit = 3, Level = 28000},
    ["Rainforest Printer"]    = BaseWars.GSL{Model = "models/livaco/advprinters2/livaco_printer.mdl", Price = 10823265027590400, ClassName = "bw_printer_164_rainforest", Limit = 3, Level = 28500},
    ["Paprika Printer"]          = BaseWars.GSL{Model = "models/livaco/advprinters2/livaco_printer.mdl", Price = 12071786810641200, ClassName = "bw_printer_165_paprika", Limit = 3, Level = 29000},
    ["Starlight Printer"]         = BaseWars.GSL{Model = "models/livaco/advprinters2/livaco_printer.mdl", Price = 13460260044488400, ClassName = "bw_printer_166_starlight", Limit = 3, Level = 29500},
    ["Enchanted Forest Printer"]       = BaseWars.GSL{Model = "models/livaco/advprinters2/livaco_printer.mdl", Price = 15004047350005200, ClassName = "bw_printer_167_enchantedforest", Limit = 3, Level = 30000},
    ["Raspberry Sorbet Printer"]         = BaseWars.GSL{Model = "models/livaco/advprinters2/livaco_printer.mdl", Price = 16720171017444000, ClassName = "bw_printer_168_raspberrysorbet", Limit = 3, Level = 30500},
    ["Ocean Mist Printer"]     = BaseWars.GSL{Model = "models/livaco/advprinters2/livaco_printer.mdl", Price = 18627490065564000, ClassName = "bw_printer_169_oceanmist", Limit = 3, Level = 31000},
    ["Desert Rose Printer"]         = BaseWars.GSL{Model = "models/livaco/advprinters2/livaco_printer.mdl", Price = 20746895999130000, ClassName = "bw_printer_170_desertrose", Limit = 3, Level = 31500},
    ["Mint Macaroon Printer"]         = BaseWars.GSL{Model = "models/livaco/advprinters2/livaco_printer.mdl", Price = 23101529222916000, ClassName = "bw_printer_171_mintmacaroon", Limit = 3, Level = 32000},

}
BaseWars.SpawnList.printer["Printers (T20)"] = {
	//["Banque"]                = BaseWars.GSL{Model = "models/akulla/case/military.mdl", Price = 50000000000000000, ClassName = "bw_bank_t20" , Limit = 1, Level = 33000},

    ["Golden Hour Printer"]       = BaseWars.GSL{Model = "models/livaco/advprinters2/livaco_printer.mdl", Price = 51832743828177600, ClassName = "bw_printer_172_goldenhour", Limit = 3, Level = 33000},
    ["Lavender Fields Printer"]          = BaseWars.GSL{Model = "models/livaco/advprinters2/livaco_printer.mdl", Price = 58554388088809200, ClassName = "bw_printer_173_lavenderfields", Limit = 3, Level = 34000},
    ["Desert Sand Printer"]      = BaseWars.GSL{Model = "models/livaco/advprinters2/livaco_printer.mdl", Price = 66088751541444000, ClassName = "bw_printer_174_desertsand", Limit = 3, Level = 35000},
    ["Cobalt Cove Printer"]       = BaseWars.GSL{Model = "models/livaco/advprinters2/livaco_printer.mdl", Price = 74529915596445600, ClassName = "bw_printer_175_cobaltcove", Limit = 3, Level = 36000},
    ["Lemon Chiffon Printer"]       = BaseWars.GSL{Model = "models/livaco/advprinters2/livaco_printer.mdl", Price = 83982533931687600, ClassName = "bw_printer_176_lemonchiffon", Limit = 3, Level = 37000},
    ["Arctic Fox Printer"]        = BaseWars.GSL{Model = "models/livaco/advprinters2/livaco_printer.mdl", Price = 94562995184751600, ClassName = "bw_printer_177_arcticfox", Limit = 3, Level = 38000},
    ["Cherry Cordial Printer"]        = BaseWars.GSL{Model = "models/livaco/advprinters2/livaco_printer.mdl", Price = 106400711435684400, ClassName = "bw_printer_178_cherrycordial", Limit = 3, Level = 39000},
    ["Citrus Splash Printer"]        = BaseWars.GSL{Model = "models/livaco/advprinters2/livaco_printer.mdl", Price = 134439394795722000, ClassName = "bw_printer_179_citrussplash", Limit = 3, Level = 40000},
    ["Mulberry Mist Printer"]         = BaseWars.GSL{Model = "models/livaco/advprinters2/livaco_printer.mdl", Price = 147339960676621200, ClassName = "bw_printer_180_mulberrymist", Limit = 3, Level = 41000},//165465514779861600
}
    
------------------------------------------------------------------------
--                         ENTITEES
------------------------------------------------------------------------
BaseWars.SpawnList.Entities["Amélioration de la capacité de l'imprimante"] = {
	["Capacité V1"]		= BaseWars.GSL{Model = "models/livaco/advprinters2/livaco_repair.mdl", Price = 150, ClassName = "bw_capacity_v1",Limit = 3, Level = 15, ShouldFreeze = false},
	["Capacité V2"]		= BaseWars.GSL{Model = "models/livaco/advprinters2/livaco_repair.mdl", Price = 9000, ClassName = "bw_capacity_v2",Limit = 3, Level = 90, ShouldFreeze = false},
	["Capacité V3"]		= BaseWars.GSL{Model = "models/livaco/advprinters2/livaco_repair.mdl", Price = 21000, ClassName = "bw_capacity_v3",Limit = 3, Level = 210, ShouldFreeze = false},
	["Capacité V4"]		= BaseWars.GSL{Model = "models/livaco/advprinters2/livaco_repair.mdl", Price = 60000, ClassName = "bw_capacity_v4",Limit = 3, Level = 600, ShouldFreeze = false},
	["Capacité V5"]		= BaseWars.GSL{Model = "models/livaco/advprinters2/livaco_repair.mdl", Price = 140000, ClassName = "bw_capacity_v5",Limit = 3, Level = 1400, ShouldFreeze = false},
	["Capacité V6"]		= BaseWars.GSL{Model = "models/livaco/advprinters2/livaco_repair.mdl", Price = 230000, ClassName = "bw_capacity_v6",Limit = 3, Level = 2300, ShouldFreeze = false},
	["Capacité V7"]		= BaseWars.GSL{Model = "models/livaco/advprinters2/livaco_repair.mdl", Price = 320000, ClassName = "bw_capacity_v7",Limit = 3, Level = 3200, ShouldFreeze = false},
	["Capacité V8"]		= BaseWars.GSL{Model = "models/livaco/advprinters2/livaco_repair.mdl", Price = 410000, ClassName = "bw_capacity_v8",Limit = 3, Level = 4100, ShouldFreeze = false},
}
BaseWars.SpawnList.Entities["Kit d'armure"] = {
	["Kit d'armure V1"]					= BaseWars.GSL{Model = "models/tf2defaultmodels/skirmisherstuff/toolbox.mdl", Price = 200, ClassName = "bw_armor_v1", ShouldFreeze = false, Level = 20},
	["Kit d'armure V2"]					= BaseWars.GSL{Model = "models/tf2defaultmodels/skirmisherstuff/toolbox.mdl", Price = 10000, ClassName = "bw_armor_v2", ShouldFreeze = false, Level = 100},
	["Kit d'armure V3"]					= BaseWars.GSL{Model = "models/tf2defaultmodels/skirmisherstuff/toolbox.mdl", Price = 230000, ClassName = "bw_armor_v3", ShouldFreeze = false, Level = 230},
	["Kit d'armure V4"]					= BaseWars.GSL{Model = "models/tf2defaultmodels/skirmisherstuff/toolbox.mdl", Price = 650000, ClassName = "bw_armor_v4", ShouldFreeze = false, Level = 650},
	["Kit d'armure V5"]					= BaseWars.GSL{Model = "models/tf2defaultmodels/skirmisherstuff/toolbox.mdl", Price = 1500000, ClassName = "bw_armor_v5", ShouldFreeze = false, Level = 1500},
	["Kit d'armure V6"]					= BaseWars.GSL{Model = "models/tf2defaultmodels/skirmisherstuff/toolbox.mdl", Price = 2400000, ClassName = "bw_armor_v6", ShouldFreeze = false, Level = 2400},
	["Kit d'armure V7"]					= BaseWars.GSL{Model = "models/tf2defaultmodels/skirmisherstuff/toolbox.mdl", Price = 3300000, ClassName = "bw_armor_v7", ShouldFreeze = false, Level = 3300},
	["Kit d'armure V8"]					= BaseWars.GSL{Model = "models/tf2defaultmodels/skirmisherstuff/toolbox.mdl", Price = 22000000, ClassName = "bw_armor_v8", ShouldFreeze = false, Level = 4200},
}
BaseWars.SpawnList.Entities["Structures"] = {
	["Point d'aparition"]					= BaseWars.GSL{Model = "models/tf2defaultmodels/prefortress2teleporter/teleporter_light.mdl", Price = 100, ClassName = "bw_spawnpoint", UseSpawnFunc = true},
	["Radar"]								= BaseWars.GSL{Model = "models/tf2defaultmodels/rayzarstuff/dispenser_level3_building.mdl", Price = 25000000, ClassName = "bw_radar",  Limit = 1, Level = 1500},
	["Poubelle à armes"]					= BaseWars.GSL{Model = "models/props_junk/trashbin01a.mdl", Price = 250, ClassName = "bw_trashgun",  Limit = 1, Level = 5,},
	["Distributeur à Papier"]					= BaseWars.GSL{Model = "models/props_lab/plotter.mdl", Price = 50000, ClassName = "bw_dispenser_paper",  Limit = 1, Level = 50,},

}
BaseWars.SpawnList.Entities["Consommables"] = {
	["Kit de réparation"]					= BaseWars.GSL{Model = "models/tf2defaultmodels/skirmisherstuff/toolbox.mdl", Price = 50, ClassName = "bw_repairkit", ShouldFreeze = false},
	["Papier imprimante"]					= BaseWars.GSL{Model = "models/livaco/advprinters2/livaco_ink.mdl", Price = 100, ClassName = "bw_printerpaper", ShouldFreeze = false},
}


