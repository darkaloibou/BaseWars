-- This config is not basic, but is designed to be moron proofed.
-- If you are a DEVELOPER and want some more intermediate config see the following files
-- IGNORE THIS IF YOU CAN'T CODE AT AN INTERMEDIATE LEVEL WITH LUA!
-- README_SF.md for hooks and methods
-- gamemode/server/hooks.lua for XP and karma logic, along with some examples of how to use hooks
-- gamemode/server/commands.lua for chat commands
-- gamemode/server/mysql.lua for MySQL configuration, do not turn this on unless you know what you are doing!

-- The language the gamemode will run with, right now the built in languages are:
--ENGLISH
--FRENCH
--SPANISH
--DUTCH
--RUSSIAN
--GERMAN
--KOREAN

-- If you need another language, check language.lua for more information
-- The language file also contains the currency symbol.
BASEWARS_CHOSEN_LANGUAGE = "FRENCH"

BaseWars.Config = {
	RadarRange = 4096,	-- RadarRange: Range of the radar, in source units
	//AllTalk = true,	-- AllTalk: Should chat be global and ignore teams
	//WeaponDespawn = 60 * 3,	-- WeaponDespawn: Seconds until weapons despawn after being dropped, 0 to never despawn
	SpawnRadius = 50,	-- SpawnRadius: Radius of invunerability around spawnpoint entities, 0 to disable
	SBoxWeps = false,	-- SBoxWeps: The same as sbox_weapons, if players spawn with hl2 weapons
	XPMultiplier = 1.0,	-- XPMultiplier: Multiplier on XP earned through various actions	-- To further customize XP distribution see server/hooks.lua
	Forums 		= "http://hexahedron.pw/forums/",	-- Forums: Link to your forums, accessed with /forums
	SteamGroup 	= "http://steamcommunity.com/groups/hexahedronic",	-- SteamGroup: Link to your steam group, accessed with /steam
	Workshop    = "http://steamcommunity.com/sharedfiles/filedetails/?id=939081277",	-- Workshop: Link to your workshop download, accessed with /workshop
	Discord 	= "https://discord.gg/stdEJkF",	-- Discord: Link to your discord server, accessed with /discord
	ScaleVIPPayDay = true,	-- ScaleVIPPayDay: Should VIP ranks get better paydays, scaling with their money?
	VIPRanks = {"vip",},	-- VIPRanks: Table of ranks which VIP items and ScaleVIPPayDay, etc applies to
	MaximumPay = 5 * 10^4,	-- MaximumPay: Maximum amount players can give eachother, helps stop inflation
	BountyDelimiter = 2,	-- BountyDelimiter: When receiving a bounty players are limited by this * their current money or the maximum bounty amount, whichever is smallest
	PricesSize = 11,	-- PricesSize: Size of font for spawnmenu labels, change this if your language makes it look bad
	IconSize = 72,	-- IconSize: Size of icons on spawnmenu, change this if the text doesnt fit with your language
	AllowPropPunt = false,	-- AllowPropPunt: Should people be allowed to punt props with the gravgun
	SpawnBuilding = 1,	-- SpawnBuilding: 0 = Disabled, people can spawn any props at spawn, 1 = Admin only, only admins can spawn props, 2 and above = Nobody, nobody can spawn props at spawn
	Ents = {
		Electronics = {
			Explode		= true,			-- Explode: Should electronics detonate upon destruction
			WaterProof	= false,			-- WaterProof: Are electronics Water Proof by default
		},
		SpawnPoint = {Offset = Vector(0, 0, 16),},		-- Offset: How far above the spawnpoint should you spawn
	},
	--[[Drugs = {
		DoubleJump = {
			-- JumpHeight: The velocity vector applied when double jumping
			JumpHeight 	= Vector(0, 0, 320),
			-- Duration: Duration of the drug
			Duration	= 120,
		},
		Steroid = {
			-- Walk: New walk speed when using drug
			Walk 		= 330,
			-- Run: New run speed when using drug
			Run 		= 580,
			-- Duration: Duration of the drug
			Duration	= 120,
		},
		Regen = {
			-- Duration: Duration of the drug
			Duration 	= 30,
		},
		Adrenaline = {
			-- Mult: Health multiplier while using drug
			Mult		= 1.5,
			-- Duration: Duration of the drug
			Duration	= 120,
		},
		PainKiller = {
			-- Mult: Damage multiplier while using drug
			Mult 		= .675,
			-- Duration: Duration of the drug
			Duration	= 80,
		},
		Rage = {
			-- Mult: Damage multiplier while using drug
			Mult 		= 1.675,
			-- Duration: Duration of the drug
			Duration	= 120,
		},
		Shield = {

		},
		Antidote = {

		},
		-- CookTime: How long does the drug lab take
		CookTime	= 60 * 2,
	},]]
	Notifications = {
		LinesAmount = 11,		-- LinesAmount: Amount of lines on the notification HUD
		Width		= 582,		-- Width: Width of the notification HUD
		BackColor	= Color(30, 30, 30, 0),		-- BackColor: The background color of the notification HUD
		OpenTime	= 5,		-- OpenTime: Time notification HUD remains open after a notification
	},
	Raid = {
		Time 			= 60 * 5,		-- Time: Time a raid lasts for
		CoolDownTime	= 0,		-- CoolDownTime: Time after a raid the person being raided is protected for
		NeededPrinters	= 0,		-- NeededPrinters: Amount of valid raidables needed to be raided
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
		HTML	= "https://diamond-boutique.mtxserv.com/azurium/news/rules",		-- HTML: HTML string or valid URI
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
	//NPC = {FadeOut = 400,},	-- FadeOut: Fade distance for NPC title
	AntiRDM = {
		HurtTime 		= 80,		-- HurtTime: Time after getting attacked in which it's not 'rdm' to kill someone
		RDMSecondsAdd 	= 0,		-- RDMSecondsAdd: Seconds added to respawn timer per random kill
		KarmaSecondPer 	= 0,		-- KarmaSecondPer: Seconds added to respawn timer per X negative karma, whats X? fuck if i know
		KarmaLoss 		= -2,		-- KarmaLoss: Karma lost per random kill
		KarmaGlowLevel 	= 100,		-- KarmaGlowLevel: Level as which players glow green or red due to karma, set to > 100 to disable
	},

	PayDayBase 			= 2000,	-- PayDayBase: Base payday rate
	PayDayMin			= 50,	-- PayDayMin: Lowest amount per payday
	PayDayDivisor		= 2000,	-- PayDayDivisor: amt = baserate - (playermoney / divisor)
	PayDayRate 			= 60 * 3,	-- PayDayRate: Amount of seconds between paydays
	PayDayRandom		= 100,	-- PayDayRandom: Randomization rate from calculated value
	StartMoney 			= 5000,	-- StartMoney: Amount of money new players get
	///CustomChat			= false,	-- CustomChat: Load the built in custom chatbox, disable if you use your own (ours is better)
	ExtraStuff			= true,	-- ExtraStuff: Load some extra things such as source engine fixes and player nickname customiser, disable if you dont want this
	//CleanProps			= false,	-- CleanProps: Finds all physics props on the map and removes them when all the entities are frist initialized (AKA: When the map first loads)
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
		BuyWeapons = 10,		-- BuyWeapons: Level needed to buy weapons, this is 2 to stop people wasting their starter money
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
	[ "weapon_fists" ] = true,
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
	[ "weapon_vape" ] = true
}

-- How to use the NPC table:
-- Make a subtable with the key equal to your map name, for example
-- ["rp_downtown_craprp_v3_v4_v69d"] = {}
-- and in that subtable make a subtable for every help NPC you want to spawn
-- ["rp_downtown_craprp_v3_v4_v69d"] = {[1] = {}, [2] = {}}
-- Then in those, put Pos = Vector(x, y, z), and Ang = Angle(p, y, r),
-- If you didnt understand this, just look at the default ones
-- do getpos in your console for your position
--[[BaseWars.NPCTable = {
	["rp_downtown_v4c_v2"] = {

		[1] = {
			Pos = Vector(338, -1137, -193),
			Ang = Angle(0, 135, 0),
		},

	},

	["Basewars_Evocity_v2"] = {

			[1] = {
					Pos = Vector(380, 4305, 71),
					Ang = Angle(0, 180, 0),
			},

			[2] = {
					Pos = Vector(300, 2932, 71),
					Ang = Angle(0, 90, 0),
			},

			[3] = {
					Pos = Vector(-6297, -5742, 75),
					Ang = Angle(0, 45, 0),
			},

	},

	["rp_bangclaw"] = {

		[1] = {
			Pos = Vector(-1006, -1441, 75),
			Ang = Angle(0, 135, 0),
		},

		[2] = {
			Pos = Vector(2055, -2289, 75),
			Ang = Angle(0, 141, 0),
		},

		[3] = {
			Pos = Vector(1315, 2129, 147),
			Ang = Angle(0, -133, 0),
		},

		[4] = {
			Pos = Vector(3619, 364, 75),
			Ang = Angle(0, -145, 0),
		},

		[5] = {
			Pos = Vector(51, -1924, 75),
			Ang = Angle(0, -141, 0),
		},

		[6] = {
			Pos = Vector(712, -90, 74),
			Ang = Angle(0, 87, 0),
		},

	},

	["rp_eastcoast_v3"] = {
	    [1] = {
	        Pos = Vector(-3170, 2210, 4),
	        Ang = Angle(0, 135, 0),
	    },

	    [2] = {
	        Pos = Vector(-3878, 1869, 3),
            Ang = Angle(0, 40, 0),
        },

        [3] = {
            Pos = Vector(-2574, 894, 3),
            Ang = Angle(0, 135, 0),
        },

        [4] = {
            Pos = Vector(-3972, 798, 3),
            Ang = Angle(0, 0, 0),
        },
	},

}

-- You can make similar maps have the same NPCs like this
BaseWars.NPCTable.rp_eastcoast_v4 = BaseWars.NPCTable.rp_eastcoast_v3
BaseWars.NPCTable.basewars_bangclaw_v1 = BaseWars.NPCTable.rp_bangclaw]]

-- How to use the Advert Table:
-- add a new subtable containing a sequence of colors and string,
-- {Grey, "this server really is the worst, ", NiceGreen, "please leave", Grey, "."},
-- Look below for examples

-- Valid colors: NiceGreen, NiceBlue, Grey, White, Pink

-- Empty the table if you dont want this
BaseWars.AdvertTbl = {
	{Grey, "N'oubliez pas de lire notre ", NiceGreen, "règlement", Grey, "! (/rules)"},
	{Grey, "Pour en savoir plus, consultez le site ", NiceGreen, "Chill BaseWars", Grey, "! (/forums)"},
	{Grey, "Pour télécharger notre contenu manuellement, tapez ", NiceGreen, "/workshop"},
	{Grey, "Nous avons un ", NiceGreen, "discord ", Grey, "! (/discord)"}
}

if Prometheus then
	BaseWars.AdvertTbl[#BaseWars.AdvertTbl+1] = {Grey, "If you want to support this server, type ", NiceBlue, "!donate ", Grey, "or", NiceBlue, " contact the owner."}
end

-- How to use the Help Table:
-- Add subtables to add new entries to the Help NPC
-- each subtable contains strings, each string is a new line
-- Look below for examples
--[[BaseWars.Config.Help = {

	["What is this server?"] = {

		"This is a BaseWars server.",
		"It runs a version of BaseWars originally designed for Hexahedron!",
		"",
		"BaseWars is a gamemode about making money and raiding.",
		"It also contains cool guns and ways to defend your base!",

	},

	["What are the controls?"] = {

		"To spawn printers and other entities you can open the spawnmenu by holding [Q] or your binding for it,",
		"From here you can select the [Entities] sub-category of the [BaseWars] tab.",
		"",
		"To Raid or Create a Faction you can press [F3] to open the [Main Menu]. From here you can select [Factions],",
		"[Raids], [Rules] and in the future the [Store] and your [Equipment Inventory]!",

	},

	["How do I make a base?"] = {

		"Firstly find an area in the map which is secure, and you would be happy defending,",
		"Then use some props from the spawnmenu to secure the entrances,",
		"Finally use the [Fading Door] tool on the props to make yourself a secure way in and out.",
		"",
		"After you have secured the area, you can buy printers and generators from the [BaseWars] tab.",
		"You will need to make sure you have enough power to supply your printers!",

	},

	["How do I raid?"] = {

		"To raid you and your target must both have at least 1 copper or higher printer.",
		"",
		"If you are raidable, press F3, then select the [Raids] tab, followed by clicking on your target's name.",
		"Watch the [Notifications] in the top left corner to see if they are raidable. If they are, the raid menu",
		"will open. If they aren't, it will tell you why not.",
		"",
		"Once a raid has started you can destroy any props your enemy owns, along with electronics! But be careful!",
		"They can counter raid you while it is on-going!",

	},

	["Are there any rules?"] = {

		"Yes, press F3 then select the [Rules] tab!",

	},

	["How does the power system work?"] = {

		"Generators will transmit power to all nearby powered items in an area of effect.",
		"This means you do not need to worry about 'wiring' or similar.",
		"",
		"If an electronic has a [POWER FAILURE] then you may need more generators, or you might",
		"just need to wait for the power supply to stabilise.",
		"",
		"If a generator has a [POWER FAILURE] then that means its power generation is being strained,",
		"but it does not mean it is not working!",

	},

	["What about RDM (Killing people randomly)?"] = {

		"RDM is allowed. Do not complain and instead if you so desire, seek your own revenge.",
		"Beware though, killing people will decrease your karma. This increases your respawn time.",

	},

	["How do I upgrade my printers?"] = {

		"All you need to do is look at them and type /upg",
		"You can bind \"basewars upgrade\" to a key to do it automatically!",

	},

	["How do I sell my printers?"] = {

		"All you need to do is look at them and type /sell",
		"You can bind \"basewars sell\" to a key to do it automatically!",

	},

	["How do I level up?"] = {

		"There are several ways to increase your level. For example:",
		"Buying printers, generators or collecting your printer.",

	},

	["What does a higher level earn me?"] = {

		"When you level up, you unlock new items.",
		"They are usually more powerful or more efficient than the older version.",

	},

	["What is the 'E Use/Collect Money' thing?"] = {

		"It allows you to see if an entity has recharged yet.",
		"If you don't like it, you can disable it by typing",
		"'bw_interactions_enabled 0' into your console.",

	},

	["How do I own/lock or unlock doors?"] = {

		"Your hands double as what you may think of as 'keys',",
		"although you cannot 'own' a door, left clicking will lock a door",
		"and right clicking unlock a door.",

	},
}

-- This is the same as the Help Table but for the drugs section
BaseWars.Config.DrugHelp = {
	["What does the Regen drug do?"] = {

		"Regen does exactly what it says on the tin!",
		"You will regenerate HP (and armor) for 30 seconds.",

	},

	["What does the Steroid drug do?"] = {

		"Steroid increases your move speed!",
		"You will move 45% faster for 2 minutes.",

	},

	["What does the Adrenaline drug do?"] = {

		"Adrenaline increases your maximum health!",
		"Your max health will be increased by 50% for 2 minutes.",

	},

	["What does the DoubleJump drug do?"] = {

		"Do you really need a explanation for that?",
		"You can jump again while in the air.",

	},

	["What does the PainKiller drug do?"] = {

		"Painkillers will help you survive longer in a fight.",
		"You will experience 30% less damage.",

	},

	["What does the Shield drug do?"] = {

		"Shield will help you when you need it the most.",
		"You will be survive one killing blow.",

	},

	["What does the Rage drug do?"] = {

		"Rage will help you fight other players!",
		"You will deal 70% more damage for 2 minutes",

	},
}

-- This is the same as the Help and Drugs Table but for the commands section
BaseWars.Config.CommandsHelp = {
  ["Upgrade Items"] = {
    "Everyone loves a little efficiency.",
    "Look at your printer and use one of these.",
    "",
    "/upg        /upgrade        /upgr",

  },

  ["Sell Items"] = {
    "Didn't mean to buy that? Want to get rid of it? Need some your money back?.",
    "Look at your item and use one of these.",
    "",
    "/sell        /destroy        /remove",

  },


  ["Drop Weapons"] = {
    "Sometimes the noobs need a little extra defense.",
    "",
    "/dw        /dropweapon        /dropwep",


  },

  ["Private Message"] = {
    "Psst...",
    "",
    "/tell (playername)        /msg (playername)",

  },

  ["Give Money to Player"] = {
    "Share the wealth!",
    "",
    "/givemoney (playername) (amt)     /pay (playername) (amt)    /moneygive (playername) (amt)",


  },

  ["Place a Bounty"] = {
    "Need someone gone, but too lazy and rich? We have just the thing for you.",
    "",
    "/bounty  (playername)        /place (playername)        /placebounty (playername)",


  },
}]]

-- Spawnmenu Category Creation
-- First argument is the category name, second is the icon16 name
-- See http://www.famfamfam.com/lab/icons/silk/preview.php for a list of icon16 icons.
-- As of 1.2.1 the category names can now be multiple words
BaseWars.SpawnList.props =  BaseWars.NewCAT("Props", "icon16/world.png")
BaseWars.SpawnList.Entities = BaseWars.NewCAT("Entitées", "icon16/briefcase.png")
BaseWars.SpawnList.Loadout =  BaseWars.NewCAT("Armes", "icon16/gun.png")
BaseWars.SpawnList.farm =  BaseWars.NewCAT("Moyen de farm", "icon16/chart_pie.png")
BaseWars.SpawnList.printer =  BaseWars.NewCAT("Printer", "icon16/printer.png")
BaseWars.SpawnList.defense =  BaseWars.NewCAT("Défenses", "icon16/transmit.png")
BaseWars.SpawnList.fun =  BaseWars.NewCAT("Fun", "icon16/star.png")
BaseWars.SpawnList.raid =  BaseWars.NewCAT("Raid", "icon16/bomb.png")
-- Default weapons not working? Install these
-- https://steamcommunity.com/sharedfiles/filedetails/?id=349050451
-- https://steamcommunity.com/sharedfiles/filedetails/?id=358608166
-- https://steamcommunity.com/sharedfiles/filedetails/?id=359830105

-- This is the spawnmenu generator, this works similarly to the last few things
-- The key (["Crowbar"]) is the item name, then you make that equal to BaseWars.GSL{your values}
-- BaseWars.SpawnList.Loadout for weapons, BaseWars.SpawnList.Entities for entities
-- Valid values are:

--Gun (sets the object to spawn using the weapon handler)
--Drug (sets the object to spawn using the drug handler)
--ClassName (entity class, or weapon class if using Gun and drug effect if using Drug)
--Model (model displayed on the icon)
--Price (how much it costs, dont include for free)
--Level (level required for it)
--VIP (is it a VIP only item)
--VehicleName (The name of a registed vehicle to spawn, still requires you to know the vehicle's class and model)

-- Look below for a LOT of examples

------------------------------------------------------------------------
--                         PROPS
------------------------------------------------------------------------



------------------------------------------------------------------------
--                         FUN
------------------------------------------------------------------------
BaseWars.SpawnList.fun ["Fun & Game"] = {  

	["Piano"] = BaseWars.GSL{Model = "models/fishy/furniture/piano.mdl", Price = 10, ClassName = "gmt_instrument_piano" ,Level = 5}, 
	["SoccerBall"] = BaseWars.GSL{Model = "models/props_phx/misc/soccerball.mdl", Price = 10, ClassName = "sent_soccerball" ,Level = 5}, 
	["Radio"] = BaseWars.GSL{Model = "models/sligwolf/grocel/radio/ghettoblaster.mdl", Price = 10, ClassName = "numerix_radio" ,Level = 5}, 
	["Battel Bot"] = BaseWars.GSL{Model = "models/zerochain/props_battlebots/zbb_arena.mdl", Price = 10, ClassName = "zbb_arena" ,Level = 5}, 
	
}
------------------------------------------------------------------------
--                         FARM
------------------------------------------------------------------------
BaseWars.SpawnList.farm["MasterCook"] = {  

	["Cookbook"] = BaseWars.GSL{Model = "models/zerochain/props_kitchen/zmc_cookbook.mdl", Price = 10, ClassName = "zmc_cookbook" ,Level = 5}, 
	["Fridge"] = BaseWars.GSL{Model = "models/zerochain/props_kitchen/zmc_fridge.mdl", Price = 10, ClassName = "zmc_fridge" ,Level = 5}, 
	["Garbagebin"] = BaseWars.GSL{Model = "models/zerochain/props_kitchen/zmc_garbagebin.mdl", Price = 10, ClassName = "zmc_garbagepin" ,Level = 5}, 
	["Mixer"] = BaseWars.GSL{Model = "models/zerochain/props_kitchen/zmc_mixer.mdl", Price = 10, ClassName = "zmc_mixer" ,Level = 5}, 
	["Worktable"] = BaseWars.GSL{Model = "models/zerochain/props_kitchen/zmc_worktable.mdl", Price = 10, ClassName = "zmc_worktable" ,Level = 5}, 

	["Customer Table"] = BaseWars.GSL{Model = "models/props_c17/FurnitureTable001a.mdl", Price = 10, ClassName = "zmc_customertable" ,Level = 5}, 
	["Order Table"] = BaseWars.GSL{Model = "models/zerochain/props_kitchen/zmc_ordertable.mdl", Price = 10, ClassName = "zmc_ordertable" ,Level = 5}, 
	["Dish Table"] = BaseWars.GSL{Model = "models/zerochain/props_kitchen/zmc_dishtable.mdl", Price = 10, ClassName = "zmc_dishtable" ,Level = 5}, 

	["BoilPot"] = BaseWars.GSL{Model = "models/zerochain/props_kitchen/zmc_heater.mdl", Price = 10, ClassName = "zmc_boilpot" ,Level = 5}, 
	["Grill"] = BaseWars.GSL{Model = "models/zerochain/props_kitchen/zmc_heater.mdl", Price = 10, ClassName = "zmc_grill" ,Level = 5}, 
	["Oven"] = BaseWars.GSL{Model = "models/zerochain/props_kitchen/zmc_heater.mdl", Price = 10, ClassName = "zmc_oven" ,Level = 5}, 
	["SoupPot"] = BaseWars.GSL{Model = "models/zerochain/props_kitchen/zmc_heater.mdl", Price = 10, ClassName = "zmc_souppot" ,Level = 5}, 
	["Wok"] = BaseWars.GSL{Model = "models/zerochain/props_kitchen/zmc_heater.mdl", Price = 10, ClassName = "zmc_wok" ,Level = 5}, 
	
}
--BaseWars.SpawnList.farm["Pizza"] = {  -- Zero Pizza Maker
--	["Table"] = BaseWars.GSL{Model = "models/props_c17/FurnitureTable001a.mdl", Price = 10, ClassName = "zpiz_customertable" ,Level = 5}, 
--	["Open Sign"] = BaseWars.GSL{Model = "models/props_trainstation/TrackSign02.mdl", Price = 10, ClassName = "zpiz_opensign" ,Level = 5}, 
--	["Oven"] = BaseWars.GSL{Model = "models/zerochain/props_pizza/zpizmak_oven.mdl", Price = 10, ClassName = "zpiz_oven" ,Level = 5}, 
--	["Fridge"] = BaseWars.GSL{Model = "models/props_c17/FurnitureFridge001a.mdl", Price = 10, ClassName = "zpiz_fridge" ,Level = 5},
--}

BaseWars.SpawnList.farm["Meth Lab"] = {  -- Zero Pizza Maker
	["Combiner"] = BaseWars.GSL{Model = "models/zerochain/zmlab/zmlab_combiner.mdl", Price = 10, ClassName = "zmlab_combiner" ,Level = 5}, 
	["Filter"] = BaseWars.GSL{Model = "models/zerochain/zmlab/zmlab_filter.mdl", Price = 10, ClassName = "zmlab_filter" ,Level = 5}, 
	["Frezzer"] = BaseWars.GSL{Model = "models/zerochain/zmlab/zmlab_frezzer.mdl", Price = 10, ClassName = "zmlab_frezzer" ,Level = 5}, 
	["Aluminium"] = BaseWars.GSL{Model = "models/zerochain/zmlab/zmlab_aluminiumbox.mdl", Price = 10, ClassName = "zmlab_aluminium" ,Level = 5},
	["Methylamin"] = BaseWars.GSL{Model = "models/zerochain/zmlab/zmlab_methylamin.mdl", Price = 10, ClassName = "zmlab_methylamin" ,Level = 5},
	["Transport Crate"] = BaseWars.GSL{Model = "models/zerochain/zmlab/zmlab_transportcrate.mdl", Price = 10, ClassName = "zmlab_collectcrate" ,Level = 5},
}
BaseWars.SpawnList.farm["CrackerMaker"] = {  -- Zero Pizza Maker
	["Crackermachine"] = BaseWars.GSL{Model = "models/zerochain/props_crackermaker/zcm_base.mdl", Price = 10, ClassName = "zcm_crackermachine" ,Level = 5}, 
	["Paper"] = BaseWars.GSL{Model = "models/zerochain/props_crackermaker/zcm_paper.mdl", Price = 10, ClassName = "zcm_paperroll" ,Level = 5}, 
	["BlackPowder"] = BaseWars.GSL{Model = "models/zerochain/props_crackermaker/zcm_blackpowder.mdl", Price = 10, ClassName = "zmlab_frezzer" ,Level = 5}, 
}
BaseWars.SpawnList.farm["MasterCook"] = {  -- Zero Pizza Maker

	["Cookbook"] = BaseWars.GSL{Model = "models/zerochain/props_kitchen/zmc_cookbook.mdl", Price = 10, ClassName = "zmc_cookbook" ,Level = 5}, 
	["Fridge"] = BaseWars.GSL{Model = "models/zerochain/props_kitchen/zmc_fridge.mdl", Price = 10, ClassName = "zmc_fridge" ,Level = 5}, 
	["Garbagebin"] = BaseWars.GSL{Model = "models/zerochain/props_kitchen/zmc_garbagebin.mdl", Price = 10, ClassName = "zmc_garbagepin" ,Level = 5}, 
	["Mixer"] = BaseWars.GSL{Model = "models/zerochain/props_kitchen/zmc_mixer.mdl", Price = 10, ClassName = "zmc_mixer" ,Level = 5}, 
	["Worktable"] = BaseWars.GSL{Model = "models/zerochain/props_kitchen/zmc_worktable.mdl", Price = 10, ClassName = "zmc_worktable" ,Level = 5}, 

	["Customer Table"] = BaseWars.GSL{Model = "models/props_c17/FurnitureTable001a.mdl", Price = 10, ClassName = "zmc_customertable" ,Level = 5}, 
	["Order Table"] = BaseWars.GSL{Model = "models/zerochain/props_kitchen/zmc_ordertable.mdl", Price = 10, ClassName = "zmc_ordertable" ,Level = 5}, 
	["Dish Table"] = BaseWars.GSL{Model = "models/zerochain/props_kitchen/zmc_dishtable.mdl", Price = 10, ClassName = "zmc_dishtable" ,Level = 5}, 

	["BoilPot"] = BaseWars.GSL{Model = "models/zerochain/props_kitchen/zmc_heater.mdl", Price = 10, ClassName = "zmc_boilpot" ,Level = 5}, 
	["Grill"] = BaseWars.GSL{Model = "models/zerochain/props_kitchen/zmc_heater.mdl", Price = 10, ClassName = "zmc_grill" ,Level = 5}, 
	["Oven"] = BaseWars.GSL{Model = "models/zerochain/props_kitchen/zmc_heater.mdl", Price = 10, ClassName = "zmc_oven" ,Level = 5}, 
	["SoupPot"] = BaseWars.GSL{Model = "models/zerochain/props_kitchen/zmc_heater.mdl", Price = 10, ClassName = "zmc_souppot" ,Level = 5}, 
	["Wok"] = BaseWars.GSL{Model = "models/zerochain/props_kitchen/zmc_heater.mdl", Price = 10, ClassName = "zmc_wok" ,Level = 5}, 
	
}
BaseWars.SpawnList.farm["Weed"] = {  -- Zero Pizza Maker
	["Autopacker"] = BaseWars.GSL{Model = "models/zerochain/props_weedfarm/zwf_autopacker.mdl", Price = 10, ClassName = "zwf_autopacker" ,Level = 5}, 
	["Dooby Table"] = BaseWars.GSL{Model = "models/zerochain/props_weedfarm/zwf_doobytable.mdl", Price = 10, ClassName = "zwf_doobytable" ,Level = 5}, 
	["Dry Station"] = BaseWars.GSL{Model = "models/zerochain/props_weedfarm/zwf_drystation.mdl", Price = 10, ClassName = "zwf_drystation" ,Level = 5}, 
	["Flower Pot"] = BaseWars.GSL{Model = "models/zerochain/props_weedfarm/zwf_pot01.mdl", Price = 10, ClassName = "zwf_pot" ,Level = 5}, 
	["Fuel"] = BaseWars.GSL{Model = "models/zerochain/props_weedfarm/zwf_fuel.mdl", Price = 10, ClassName = "zwf_fuel" ,Level = 5}, 
	["Generator"] = BaseWars.GSL{Model = "models/zerochain/props_weedfarm/zwf_generator.mdl", Price = 10, ClassName = "zwf_generator" ,Level = 5}, 
	["Hydro Pot"] = BaseWars.GSL{Model = "models/zerochain/props_weedfarm/zwf_pot02.mdl", Price = 10, ClassName = "zwf_pot_hydro" ,Level = 5}, 
	["Lamp"] = BaseWars.GSL{Model = "models/zerochain/props_weedfarm/zwf_lamp01.mdl", Price = 10, ClassName = "zwf_lamp" ,Level = 5}, 
	["Mixer"] = BaseWars.GSL{Model = "models/zerochain/props_weedfarm/zwf_mixer.mdl", Price = 10, ClassName = "zwf_mixer" ,Level = 5}, 
	["Outlet"] = BaseWars.GSL{Model = "models/zerochain/props_weedfarm/zwf_outlets.mdl", Price = 10, ClassName = "zwf_outlet" ,Level = 5}, 
	["Oven"] = BaseWars.GSL{Model = "models/zerochain/props_weedfarm/zwf_oven.mdl", Price = 10, ClassName = "zwf_oven" ,Level = 5}, 
	["Packing Station"] = BaseWars.GSL{Model = "models/zerochain/props_weedfarm/zwf_packingstation.mdl", Price = 10, ClassName = "zwf_packingstation" ,Level = 5}, 
	["Seed Bank"] = BaseWars.GSL{Model = "models/zerochain/props_weedfarm/zwf_seedbank.mdl", Price = 10, ClassName = "zwf_seed_bank" ,Level = 5}, 
	["Seed lab"] = BaseWars.GSL{Model = "models/zerochain/props_weedfarm/zwf_seedlab.mdl", Price = 10, ClassName = "zwf_splice_lab" ,Level = 5}, 
	["Soil"] = BaseWars.GSL{Model = "models/zerochain/props_weedfarm/zwf_soil.mdl", Price = 10, ClassName = "zwf_soil" ,Level = 5}, 
	["Ventilator"] = BaseWars.GSL{Model = "models/zerochain/props_weedfarm/zwf_ventilator01.mdl", Price = 10, ClassName = "zwf_ventilator" ,Level = 5}, 
	["Water Tank"] = BaseWars.GSL{Model = "models/zerochain/props_weedfarm/zwf_watertank.mdl", Price = 10, ClassName = "zwf_watertank" ,Level = 5}, 
	["Watering can"] = BaseWars.GSL{Gun = true,Model = "models/zerochain/props_weedfarm/zwf_wateringcan_vm.mdl", Price = 10, ClassName = "zwf_wateringcan" ,Level = 5}, 
	["Cable"] = BaseWars.GSL{Gun = true,Model = "models/zerochain/props_weedfarm/zwf_cable_vm.mdl", Price = 10, ClassName = "zwf_cable" ,Level = 5}, 
}

------------------------------------------------------------------------
--                         ARMES
------------------------------------------------------------------------
BaseWars.SpawnList.Loadout["Couteaux"] = {
	["Crowbar"] = BaseWars.GSL{Gun = true, Model = "models/weapons/tfa_cso2/w_crowbar.mdl", Price = 10, ClassName = "tfa_cso2_crowbar" ,Level = 5}, 
	["Goldpop"] = BaseWars.GSL{Gun = true, Model = "models/weapons/tfa_cso2/w_goldpop.mdl", Price = 10, ClassName = "tfa_cso2_goldpop" ,Level = 5}, 
	["Harpoon"] = BaseWars.GSL{Gun = true, Model = "models/weapons/tfa_cso2/w_harpoon.mdl", Price = 10, ClassName = "tfa_cso2_harpoon" ,Level = 5}, 
	["Hunting Knife"] = BaseWars.GSL{Gun = true, Model = "models/weapons/tfa_cso2/w_huntknife.mdl", Price = 10, ClassName = "tfa_cso2_huntknife" ,Level = 5},
	["Karambit"] = BaseWars.GSL{Gun = true, Model = "models/weapons/tfa_cso2/w_knife_2017chicken.mdl", Price = 10, ClassName = "tfa_cso2_knife_chicken" ,Level = 5},
	["Knife"] = BaseWars.GSL{Gun = true, Model = "models/weapons/tfa_cso2/w_knife.mdl", Price = 10, ClassName = "tfa_cso2_knife" ,Level = 5}, 
	["Lolipop"] = BaseWars.GSL{Gun = true, Model = "models/weapons/tfa_cso2/w_lollipop.mdl", Price = 10, ClassName = "tfa_cso2_lollipop" ,Level = 5}, 
	["Microphone"] = BaseWars.GSL{Gun = true, Model = "models/weapons/tfa_cso2/w_mikeknife.mdl", Price = 10, ClassName = "tfa_cso2_mikeknife" ,Level = 5}, 
	["TaserKnife"] = BaseWars.GSL{Gun = true, Model = "models/weapons/tfa_cso2/w_taserknife.mdl", Price = 10, ClassName = "tfa_cso2_taserknife" ,Level = 5}, 
	["M9 Bayonet"] = BaseWars.GSL{Gun = true, Model = "models/weapons/tfa_cso2/w_m9bayonet.mdl", Price = 10, ClassName = "tfa_cso2_m9bayonet" ,Level = 5},
	["Huntknife gold"] = BaseWars.GSL{Gun = true, Model = "models/weapons/tfa_cso2/w_huntknife_gold.mdl", Price = 10, ClassName = "tfa_cso2_huntknife_gold" ,Level = 5},
	["Hunting Knife (Monkey)"] = BaseWars.GSL{Gun = true, Model = "models/weapons/tfa_cso2/w_huntknife_monkey1.mdl", Price = 10, ClassName = "tfa_cso2_huntknife_monkey" ,Level = 5}, 
	["Pickaxe"] = BaseWars.GSL{Gun = true, Model = "models/weapons/tfa_cso2/w_pickax.mdl", Price = 10, ClassName = "tfa_cso2_pickaxe" ,Level = 5}, 
	["Toy Hammer"] = BaseWars.GSL{Gun = true, Model = "models/weapons/tfa_cso2/w_toyhammer.mdl", Price = 10, ClassName = "tfa_cso2_toyhammer" ,Level = 5}, 
	["Toy Hammer Gold"] = BaseWars.GSL{Gun = true, Model = "models/weapons/tfa_cso2/w_toyhammer_gold.mdl", Price = 10, ClassName = "tfa_cso2_toyhammer_gold" ,Level = 5}, 
	["Survivor Knife"] = BaseWars.GSL{Gun = true, Model = "models/weapons/tfa_cso2/w_survivorknife.mdl", Price = 10, ClassName = "tfa_cso2_survivorknife" ,Level = 5},
	["Turbo Knife"] = BaseWars.GSL{Gun = true, Model = "models/weapons/tfa_cso2/w_athenaknfe.mdl", Price = 10, ClassName = "tfa_cso2_athenaknife" ,Level = 5},
	["Wrench"] = BaseWars.GSL{Gun = true, Model = "models/weapons/tfa_cso2/w_wrench.mdl", Price = 10, ClassName = "tfa_cso2_wrench" ,Level = 5},
}
BaseWars.SpawnList.Loadout["Pistol"] = {
	["Af2011a0"] = BaseWars.GSL{Gun = true, Model = "models/weapons/tfa_cso2/w_af2011a0.mdl", Price = 10, ClassName = "tfa_cso2_af2011a0" ,Level = 5}, 
	["Af2011A1"] = BaseWars.GSL{Gun = true, Model = "models/weapons/tfa_cso2/w_af2011a1.mdl", Price = 10, ClassName = "tfa_cso2_af2011a1" ,Level = 5}, 
	["Anaconda"] = BaseWars.GSL{Gun = true, Model = "models/weapons/tfa_cso2/w_anaconda.mdl", Price = 10, ClassName = "tfa_cso2_anaconda" ,Level = 5}, 
	["Desert Eagle"] = BaseWars.GSL{Gun = true, Model = "models/weapons/tfa_cso2/w_deserteagle.mdl", Price = 10, ClassName = "tfa_cso2_deserteagle" ,Level = 5},
	["Desert phoenix"] = BaseWars.GSL{Gun = true, Model = "models/weapons/tfa_cso2/w_dep.mdl", Price = 10, ClassName = "tfa_cso2_dep" ,Level = 5},
	["Desert Phoenixes"] = BaseWars.GSL{Gun = true, Model = "models/weapons/tfa_cso2/w_ddep.mdl", Price = 10, ClassName = "tfa_cso2_ddep" ,Level = 5},  
	["Dual Elite"] = BaseWars.GSL{Gun = true, Model = "models/weapons/tfa_cso2/w_elites_dropped.mdl", Price = 10, ClassName = "tfa_cso2_elites" ,Level = 5}, 
	["Five-Seven"] = BaseWars.GSL{Gun = true, Model = "models/weapons/tfa_cso2/w_fiveseven.mdl", Price = 10, ClassName = "tfa_cso2_fiveseven" ,Level = 5}, 
    ["Glock 18"] = BaseWars.GSL{Gun = true, Model = "models/weapons/tfa_cso2/w_glock18.mdl", Price = 10, ClassName = "tfa_cso2_glock18" ,Level = 5}, 
	["K5"] = BaseWars.GSL{Gun = true, Model = "models/weapons/tfa_cso2/w_k5.mdl", Price = 10, ClassName = "tfa_cso2_k5" ,Level = 5}, 
	["M1911a1"] = BaseWars.GSL{Gun = true, Model = "models/weapons/tfa_cso2/w_m1911a1.mdl", Price = 10, ClassName = "tfa_cso2_m1911a1" ,Level = 5},
	["MK23 SOCOM"] = BaseWars.GSL{Gun = true, Model = "models/weapons/tfa_cso2/w_mk23.mdl", Price = 10, ClassName = "tfa_cso2_mk23" ,Level = 5}, 
	["QSZ-92"] = BaseWars.GSL{Gun = true, Model = "models/weapons/tfa_cso2/w_qsz92.mdl", Price = 10, ClassName = "tfa_cso2_qsz92" ,Level = 5}, 
	["USP"] = BaseWars.GSL{Gun = true, Model = "models/weapons/tfa_cso2/w_usp.mdl", Price = 10, ClassName = "tfa_cso2_usp" ,Level = 5}, 
	["WALTHER PP"] = BaseWars.GSL{Gun = true, Model = "models/weapons/tfa_cso2/w_waltherpp.mdl",Price = 10, ClassName = "tfa_cso2_waltherpp" ,Level = 5},
	["Triple Action Thunder"] = BaseWars.GSL{Gun = true, Model = "models/weapons/tfa_cso2/w_thunder.mdl",Price = 10, ClassName = "tfa_cso2_thunder" ,Level = 5},
}
BaseWars.SpawnList.Loadout["Shotgun"] = {
	["DP 12"] = BaseWars.GSL{Gun = true, Model = "models/weapons/tfa_cso2/w_dp12.mdl", Price = 10, ClassName = "tfa_cso2_dp12" ,Level = 5},  
	["M3"] = BaseWars.GSL{Gun = true, Model = "models/weapons/tfa_cso2/w_m3.mdl", Price = 10, ClassName = "tfa_cso2_m3" ,Level = 5}, 
	["M3 BOOM"] = BaseWars.GSL{Gun = true, Model = "models/weapons/tfa_cso2/w_m3boom.mdl", Price = 10, ClassName = "tfa_cso2_m3boom" ,Level = 5}, 
	["M3 DRAGON"] = BaseWars.GSL{Gun = true, Model = "models/weapons/tfa_cso2/w_m3dragon.mdl", Price = 10, ClassName = "tfa_cso2_m3dragon" ,Level = 5}, 
	["double defence"] = BaseWars.GSL{Gun = true, Model = "models/weapons/tfa_cso2/w_dbarrel.mdl", Price = 10, ClassName = "tfa_cso2_dbarrel" ,Level = 5}, 
	["M870"] = BaseWars.GSL{Gun = true, Model = "models/weapons/tfa_cso2/w_m870.mdl", Price = 10, ClassName = "tfa_cso2_m870" ,Level = 5},
	["QBS-09"] = BaseWars.GSL{Gun = true, Model = "models/weapons/tfa_cso2/w_qbs09.mdl", Price = 10, ClassName = "tfa_cso2_qbs09" ,Level = 5}, 
	["STRIKER 12"] = BaseWars.GSL{Gun = true, Model = "models/weapons/tfa_cso2/w_striker12.mdl", Price = 10, ClassName = "tfa_cso2_striker12" ,Level = 5}, 
	["triple-barreled Shotgun"] = BaseWars.GSL{Gun = true, Model = "models/weapons/tfa_cso2/w_tribarrel.mdl", Price = 10, ClassName = "tfa_cso2_tribarrel" ,Level = 5}, 
	["XM1014"] = BaseWars.GSL{Gun = true, Model = "models/weapons/tfa_cso2/w_xm1014.mdl", Price = 10, ClassName = "tfa_cso2_xm1014" ,Level = 5},
}
BaseWars.SpawnList.Loadout["Assault Rifle"] = {
	["ACR"] = BaseWars.GSL{Gun = true, Model = "models/weapons/tfa_cso2/w_acr.mdl", Price = 10, ClassName = "tfa_cso2_acr", Level = 5},
	["AEK-971"] = BaseWars.GSL{Gun = true, Model = "models/weapons/tfa_cso2/w_aek971.mdl", Price = 10, ClassName = "tfa_cso2_aek971", Level = 5},
	["Ak-12"] = BaseWars.GSL{Gun = true, Model = "models/weapons/tfa_cso2/w_ak12.mdl", Price = 10, ClassName = "tfa_cso2_ak12", Level = 5},
["Ak-47"] = BaseWars.GSL{Gun = true, Model = "models/weapons/tfa_cso2/w_ak47.mdl", Price = 10, ClassName = "tfa_cso2_ak47", Level = 5},
["Ak-47 Flash"] = BaseWars.GSL{Gun = true, Model = "models/weapons/tfa_cso2/w_ak47_flash.mdl", Price = 10, ClassName = "tfa_cso2_ak47_flash", Level = 5},
["Ak-47  Gold"] = BaseWars.GSL{Gun = true, Model = "models/weapons/tfa_cso2/w_ak47_flash.mdl", Price = 10, ClassName = "tfa_cso2_ak47_gold", Level = 5},
["Ak-47"] = BaseWars.GSL{Gun = true, Model = "models/weapons/tfa_cso2/w_ak47_old.mdl", Price = 10, ClassName = "tfa_cso2_ak47_old", Level = 5},
["AKM"] = BaseWars.GSL{Gun = true, Model = "models/weapons/tfa_cso2/w_akm.mdl", Price = 10, ClassName = "tfa_cso2_akm", Level = 5},
["Aug A1"] = BaseWars.GSL{Gun = true, Model = "models/weapons/tfa_cso2/w_aug.mdl", Price = 10, ClassName = "tfa_cso2_aug", Level = 5},
["DR-200"] = BaseWars.GSL{Gun = true, Model = "models/weapons/tfa_cso2/w_dr200.mdl", Price = 10, ClassName = "tfa_cso2_dr200" ,Level = 5},
["F2000"] = BaseWars.GSL{Gun = true, Model = "models/weapons/tfa_cso2/w_f2000.mdl", Price = 10, ClassName = "tfa_cso2_f2000" ,Level = 5},
["FAL"] = BaseWars.GSL{Gun = true, Model = "models/weapons/tfa_cso2/w_fal.mdl", Price = 10, ClassName = "tfa_cso2_fal" ,Level = 5}, 
["FNC"] = BaseWars.GSL{Gun = true, Model = "models/weapons/tfa_cso2/w_fnc.mdl", Price = 10, ClassName = "tfa_cso2_fnc" ,Level = 5},
["G36K"] = BaseWars.GSL{Gun = true, Model = "models/weapons/tfa_cso2/w_g36k.mdl", Price = 10, ClassName = "tfa_cso2_g36k" ,Level = 5},
["G3KA4"] = BaseWars.GSL{Gun = true, Model = "models/weapons/tfa_cso2/w_g3ka4.mdl", Price = 10, ClassName = "tfa_cso2_g3ka4" ,Level = 5},
["Galil"] = BaseWars.GSL{Gun = true, Model = "models/weapons/tfa_cso2/w_galil.mdl", Price = 10, ClassName = "tfa_cso2_galil" ,Level = 5} ,
["Gilboa Carabine"] = BaseWars.GSL{Gun = true, Model = "models/weapons/tfa_cso2/w_gilboasnake.mdl", Price = 10, ClassName = "tfa_cso2_gilboasnake" ,Level = 5},
["KIA"] = BaseWars.GSL{Gun = true, Model = "models/weapons/tfa_cso2/w_k1a.mdl", Price = 10, ClassName = "tfa_cso2_k1a" ,Level = 5},
["K2C"] = BaseWars.GSL{Gun = true, Model = "models/weapons/tfa_cso2/w_k2c.mdl", Price = 10, ClassName = "tfa_cso2_k2c" ,Level = 5},
["LR200"] = BaseWars.GSL{Gun = true, Model = "models/weapons/tfa_cso2/w_lr300.mdl", Price = 10, ClassName = "tfa_cso2_lr300" ,Level = 5},
["M16A2"] = BaseWars.GSL{Gun = true, Model = "models/weapons/tfa_cso2/w_m16a2.mdl", Price = 10, ClassName = "tfa_cso2_m16a2" ,Level = 5},
["M16A4"] = BaseWars.GSL{Gun = true, Model = "models/weapons/tfa_cso2/w_m16a4.mdl", Price = 10, ClassName = "tfa_cso2_m16a4" ,Level = 5},
["M16M203"] = BaseWars.GSL{Gun = true, Model = "models/weapons/tfa_cso2/w_m16m203.mdl", Price = 10, ClassName = "tfa_cso2_m16m203" ,Level = 5},
["M4A1"] = BaseWars.GSL{Gun = true, Model = "models/weapons/tfa_cso2/w_m4a1.mdl", Price = 10, ClassName = "tfa_cso2_m4a1" ,Level = 5},
["M4A1 Flash"] = BaseWars.GSL{Gun = true, Model = "models/weapons/tfa_cso2/w_m4a1flash.mdl", Price = 10, ClassName = "tfa_cso2_m4a1_flash" ,Level = 5},
["M4A1 Gold"] = BaseWars.GSL{Gun = true, Model = "models/weapons/tfa_cso2/w_m4a1_gold.mdl", Price = 10, ClassName = "tfa_cso2_m4a1_gold" ,Level = 5},
["M4A1  Tan"] = BaseWars.GSL{Gun = true, Model = "models/weapons/tfa_cso2/w_m4a1_tan.mdl", Price = 10, ClassName = "tfa_cso2_m4a1_tan" ,Level = 5},
["MK18 Mod 1 "] = BaseWars.GSL{Gun = true, Model = "models/weapons/tfa_cso2/w_mk18.mdl", Price = 10, ClassName = "tfa_cso2_mk18" ,Level = 5},
["MSBS-B"] = BaseWars.GSL{Gun = true, Model = "models/weapons/tfa_cso2/w_msbs.mdl", Price = 10, ClassName = "tfa_cso2_msbs" ,Level = 5},
["QBZ-95B"] = BaseWars.GSL{Gun = true, Model = "models/weapons/tfa_cso2/w_qbz95.mdl", Price = 10, ClassName = "tfa_cso2_qbz95" ,Level = 5},
["Scar-H"] = BaseWars.GSL{Gun = true, Model = "models/weapons/tfa_cso2/w_scarh.mdl", Price = 10, ClassName = "tfa_cso2_scarh" ,Level = 5},
["Scar-L"] = BaseWars.GSL{Gun = true, Model = "models/weapons/tfa_cso2/w_scarl.mdl", Price = 10, ClassName = "tfa_cso2_scarl" ,Level = 5},
["SG552"] = BaseWars.GSL{Gun = true, Model = "models/weapons/tfa_cso2/w_sg552.mdl", Price = 10, ClassName = "tfa_cso2_sg552" ,Level = 5} ,
["T65KI"] = BaseWars.GSL{Gun = true, Model = "models/weapons/tfa_cso2/w_t65.mdl", Price = 10, ClassName = "tfa_cso2_t65" ,Level = 5},
["T86"] = BaseWars.GSL{Gun = true, Model = "models/weapons/tfa_cso2/w_t86.mdl", Price = 10, ClassName = "tfa_cso2_t86" ,Level = 5},
}
BaseWars.SpawnList.Loadout["SMG"] = {
["C505"] = BaseWars.GSL{Gun = true, Model = "models/weapons/tfa_cso2/w_csls06.mdl", Price = 10, ClassName = "tfa_cso2_csls06", Level = 5},
["AR-57 PDW"] = BaseWars.GSL{Gun = true, Model = "models/weapons/tfa_cso2/w_ar57.mdl", Price = 10, ClassName = "tfa_cso2_ar57", Level = 5},
["MAC-10 "] = BaseWars.GSL{Gun = true, Model = "models/weapons/tfa_cso2/w_mac10.mdl", Price = 10, ClassName = "tfa_cso2_mac10" ,Level = 5},
["MP5 Navy "] = BaseWars.GSL{Gun = true, Model = "models/weapons/tfa_cso2/w_mp5.mdl", Price = 10, ClassName = "tfa_cso2_mp5" ,Level = 5},
["MP7 Phoenix "] = BaseWars.GSL{Gun = true, Model = "models/weapons/tfa_cso2/w_mp7_ss_phoenix.mdl", Price = 10, ClassName = "tfa_cso2_mp7_phoenix" ,Level = 5},
["MP7 A1"] = BaseWars.GSL{Gun = true, Model = "models/weapons/tfa_cso2/w_mp7.mdl", Price = 10, ClassName = "tfa_cso2_mp7" ,Level = 5},
["P90"] = BaseWars.GSL{Gun = true, Model = "models/weapons/tfa_cso2/w_p90.mdl", Price = 10, ClassName = "tfa_cso2_p90" ,Level = 5},
["UMP85"] = BaseWars.GSL{Gun = true, Model = "models/weapons/tfa_cso2/w_ump45.mdl", Price = 10, ClassName = "tfa_cso2_ump45" ,Level = 5} ,
["Vector"] = BaseWars.GSL{Gun = true, Model = "models/weapons/tfa_cso2/w_krisssuperv.mdl", Price = 10, ClassName = "tfa_cso2_krisssuperv" ,Level = 5},
["MX4 Storm"] = BaseWars.GSL{Gun = true, Model = "models/weapons/tfa_cso2/w_mx4.mdl", Price = 10, ClassName = "tfa_cso2_mx4" ,Level = 5},
}
BaseWars.SpawnList.Loadout["Machine Gun"] = {
["K12"] = BaseWars.GSL{Gun = true, Model = "models/weapons/tfa_cso2/w_k12.mdl", Price = 10, ClassName = "tfa_cso2_k12" ,Level = 5} ,
["M2K9"] = BaseWars.GSL{Gun = true, Model = "models/weapons/tfa_cso2/w_m249.mdl", Price = 10, ClassName = "tfa_cso2_m249" ,Level = 5},
["M6OE4 "] = BaseWars.GSL{Gun = true, Model = "models/weapons/tfa_cso2/w_m60.mdl", Price = 10, ClassName = "tfa_cso2_m60" ,Level = 5},
["MG3 "] = BaseWars.GSL{Gun = true, Model = "models/weapons/tfa_cso2/w_mg3.mdl", Price = 10, ClassName = "tfa_cso2_mg3" ,Level = 5},
["PKM"] = BaseWars.GSL{Gun = true, Model = "models/weapons/tfa_cso2/w_pkm.mdl", Price = 10, ClassName = "tfa_cso2_pkm" ,Level = 5},
["PKM Fire"] = BaseWars.GSL{Gun = true, Model = "models/weapons/tfa_cso2/w_pkmfire.mdl", Price = 10, ClassName = "tfa_cso2_pkm_fire" ,Level = 5},
["QJY-88"] = BaseWars.GSL{Gun = true, Model = "models/weapons/tfa_cso2/w_qjy88.mdl", Price = 10, ClassName = "tfa_cso2_qjy88" ,Level = 5},
}
BaseWars.SpawnList.Loadout["Sniper"] = {
["AWM"] = BaseWars.GSL{Gun = true, Model = "models/weapons/tfa_cso2/w_awm.mdl", Price = 10, ClassName = "tfa_cso2_awm" ,Level = 5},
["AWM Gauss"] = BaseWars.GSL{Gun = true, Model = "models/weapons/tfa_cso2/w_awp_ss.mdl", Price = 10, ClassName = "tfa_cso2_awp_ss" ,Level = 5},
["AWP"] = BaseWars.GSL{Gun = true, Model = "models/weapons/tfa_cso2/w_awp.mdl", Price = 10, ClassName = "tfa_cso2_awp" ,Level = 5},
["AWP Tan"] = BaseWars.GSL{Gun = true, Model = "models/weapons/tfa_cso2/w_awp_tan.mdl", Price = 10, ClassName = "tfa_cso2_awp_tan" ,Level = 5},
["Galil SR"] = BaseWars.GSL{Gun = true, Model = "models/weapons/tfa_cso2/w_galilsniper.mdl", Price = 10, ClassName = "tfa_cso2_galilsr" ,Level = 5},
["G35G-1"] = BaseWars.GSL{Gun = true, Model = "models/weapons/tfa_cso2/w_g3sg1.mdl", Price = 10, ClassName = "tfa_cso2_g3sg1" ,Level = 5},
["M107A1"] = BaseWars.GSL{Gun = true, Model = "models/weapons/tfa_cso2/w_m107a1.mdl", Price = 10, ClassName = "tfa_cso2_m107a1" ,Level = 5},
["M14 EBR"] = BaseWars.GSL{Gun = true, Model = "models/weapons/tfa_cso2/w_m14ebr.mdl", Price = 10, ClassName = "tfa_cso2_m14" ,Level = 5},
["M99"] = BaseWars.GSL{Gun = true, Model = "models/weapons/tfa_cso2/w_m99.mdl", Price = 10, ClassName = "ttfa_cso2_m99" ,Level = 5},
["Mosin Nagant"] = BaseWars.GSL{Gun = true, Model = "models/weapons/tfa_cso2/w_mosinnagant.mdl", Price = 10, ClassName = "tfa_cso2_mosin" ,Level = 5},
["Svt-40"] = BaseWars.GSL{Gun = true, Model = "models/weapons/tfa_cso2/w_svt40.mdl", Price = 10, ClassName = "tfa_cso2_svt40" ,Level = 5},
["TAC-15"] = BaseWars.GSL{Gun = true, Model = "models/weapons/tfa_cso2/w_crossbow.mdl", Price = 10, ClassName = "tfa_cso2_crossbow" ,Level = 5},
["TRG-42"] = BaseWars.GSL{Gun = true, Model = "models/weapons/tfa_cso2/w_trg42.mdl", Price = 10, ClassName = "tfa_cso2_trg42" ,Level = 5},
}
----------------------------------------------------------------
--                         RAID TOOL
------------------------------------------------------------------------
BaseWars.SpawnList.raid["Raid Tools"] = {
	["Defuse Kit"] 			= BaseWars.GSL{Model = "models/weapons/tfa_cso2/w_defuser.mdl", Price = 85000, ClassName = "bw_defuse", Limit = 1, Level = 15, IgnoreRaid = true},
	["Blowtorch"]		= BaseWars.GSL{Gun = true, Model = "models/weapons/w_irifle.mdl", Price = 45000, ClassName = "bw_blowtorch", Level = 5, Raid = true},
	["C4"]					= BaseWars.GSL{Gun = true, Model = "models/weapons/tfa_cso2/w_c4_planted.mdl", Price = 5500000, ClassName = "bw_weapon_c4", Level = 30, Raid = true},
	["BigBomb"]			= BaseWars.GSL{Model = "models/props_phx/oildrum001_explosive.mdl", Price = 30*10^6, ClassName = "bw_explosive_bigbomb", Level = 50, Limit = 1, ShouldFreeze = false, Raid = true},
	["Nuke"]				= BaseWars.GSL{Model = "models/codww2/other/fritzxbomb.mdl", Price = 100*10^6, ClassName = "bw_explosive_nuke", Level = 85, Limit = 1, ShouldFreeze = false, Raid = true},

}

BaseWars.SpawnList.raid["Explosive Weapons"] = {
	["AK-47 Flash"]	= BaseWars.GSL{Gun = true, Model = "models/weapons/tfa_cso2/w_ak47_flash.mdl", Price = 10, ClassName = "tfa_cso2_ak47_flash", Level = 5, Raid = true},
	["M79"]	= BaseWars.GSL{Gun = true, Model = "models/weapons/tfa_cso2/w_m79.mdl", Price = 10, ClassName = "tfa_cso2_m79", Level = 5, Raid = true},
	["PAW 20"]	= BaseWars.GSL{Gun = true, Model = "models/weapons/tfa_cso2/w_paw20.mdl", Price = 10, ClassName = "tfa_cso2_paw20", Level = 5, Raid = true},
	["RPG 7"]	= BaseWars.GSL{Gun = true, Model = "models/weapons/tfa_cso2/w_rpg7.mdl", Price = 10, ClassName = "tfa_cso2_rpg7", Level = 5, Raid = true},

}
BaseWars.SpawnList.raid["Grenade"] = {
	["Fire Work"]	= BaseWars.GSL{Gun = true, Model = "models/weapons/tfa_cso2/w_fbfirework.mdl", Price = 10, ClassName = "tfa_cso2_fbfirework", Level = 5, Raid = true},
	["Flashbang"]	= BaseWars.GSL{Gun = true, Model = "models/weapons/tfa_cso2/w_flashbang.mdl", Price = 10, ClassName = "tfa_cso2_flashbang", Level = 5, Raid = true},
	["Frag grenade"]	= BaseWars.GSL{Gun = true, Model = "models/weapons/tfa_cso2/w_fraggrenade.mdl", Price = 10, ClassName = "tfa_cso2_flashbang", Level = 5, Raid = true},
	["Lucky Bag"]	= BaseWars.GSL{Gun = true, Model = "models/weapons/tfa_cso2/w_helucketbag.mdl", Price = 10, ClassName = "tfa_cso2_helucketbag", Level = 5, Raid = true},
	["MK2 grenade"]	= BaseWars.GSL{Gun = true, Model = "models/weapons/tfa_cso2/w_mk2grenade.mdl", Price = 10, ClassName = "tfa_cso2_mk2grenade", Level = 5, Raid = true},
	["Party grenade"]	= BaseWars.GSL{Gun = true, Model = "models/weapons/tfa_cso2/w_partygrenade.mdl", Price = 10, ClassName = "tfa_cso2_partygrenade", Level = 5, Raid = true},
	["Valentine Grenade"]	= BaseWars.GSL{Gun = true, Model = "models/weapons/tfa_cso2/w_valentinegrenade_thrown.mdl", Price = 10, ClassName = "tfa_cso2_hegrenade_heart", Level = 5, Raid = true},
	["Smoke Grendae"]= BaseWars.GSL{Gun = true, Model = "models/weapons/tfa_cso2/w_smokegrenade.mdl", Price = 10, ClassName = "tfa_cso2_smokegrenade", Level = 5, Raid = true},
}
------------------------------------------------------------------------
--                         DEFENCE
------------------------------------------------------------------------
BaseWars.SpawnList.defense ["Defense (T1)"] = {

	-- T1
	["Ballistic Turret T1"] 			= BaseWars.GSL{Model = "models/tf2defaultmodels/ledstuff/sentry_level1.mdl", Price = 85000, ClassName = "bw_turret_ballistic_t1", Limit = 1, Level = 15},
	["Laser Turret T1"] 					= BaseWars.GSL{Model = "models/tf2defaultmodels/skirmisherstuff/turret_level1.mdl", Price = 120000, ClassName = "bw_turret_laser_t1", Limit = 1, Level = 18},
	["Canon Turret T1"] 			= BaseWars.GSL{Model = "models/tf2defaultmodels/artillerysentrystuff/sentry_level1.mdl", Price = 85000, ClassName = "bw_turret_cannon_t1", Limit = 1, Level = 15},
	["Explosive Mine"] 				= BaseWars.GSL{Model = "models/props_combine/combine_mine01.mdl", Price = 40000, ClassName = "bw_explosive_mine", Limit = 8, Level = 9, ShouldFreeze = false},
}

BaseWars.SpawnList.defense ["Defense (T2)"] = {
	-- T2
	["Ballistic Turret T2"] 			= BaseWars.GSL{Model = "models/tf2defaultmodels/ledstuff/sentry_level2.mdl", Price = 85000, ClassName = "bw_turret_ballistic_t2", Limit = 1, Level = 15},
	["Laser Turret T2"] 					= BaseWars.GSL{Model = "models/tf2defaultmodels/skirmisherstuff/turret_level2.mdl", Price = 120000, ClassName = "bw_turret_laser_t2", Limit = 1, Level = 18},
	["Canon Turret T2"] 			= BaseWars.GSL{Model = "models/tf2defaultmodels/artillerysentrystuff/sentry_level2.mdl", Price = 85000, ClassName = "bw_turret_cannon_t2", Limit = 1, Level = 15},
	["Fast Mine"] 				= BaseWars.GSL{Model = "models/props_combine/combine_mine01.mdl", Price = 80000, ClassName = "bw_explosive_mine_speed", Limit = 5, Level = 20, ShouldFreeze = false},
	["Powerful Mine"] 			= BaseWars.GSL{Model = "models/props_combine/combine_mine01.mdl", Price = 150000, ClassName = "bw_explosive_mine_power", Limit = 5, Level = 25, ShouldFreeze = false},
	["Shock Mine"] 			= BaseWars.GSL{Model = "models/props_combine/combine_mine01.mdl", Price = 250000, ClassName = "bw_explosive_mine_shock", Limit = 3, Level = 30, ShouldFreeze = false},
	["Controllable Turret"] = BaseWars.GSL{Model = "models/props_combine/combine_barricade_short02a.mdl", Price = 750000, ClassName = "bw_turret_manual", Limit = 3, Level = 35},
	["Tesla Coil"]					= BaseWars.GSL{Model = "models/teslacoil_mini/teslacoil_mini.mdl", Price = 65000000, ClassName = "bw_tesla", Limit = 1, Level = 65},

}

BaseWars.SpawnList.defense ["Defense (T3)"] = {
	["Ballistic Turret T3"] 			= BaseWars.GSL{Model = "models/tf2defaultmodels/ledstuff/sentry_level3.mdl", Price = 85000, ClassName = "bw_turret_ballistic_t3", Limit = 1, Level = 15},
	["Laser Turret T3"] 					= BaseWars.GSL{Model = "models/tf2defaultmodels/skirmisherstuff/turret_level3.mdl", Price = 120000, ClassName = "bw_turret_laser_t3", Limit = 1, Level = 18},
	["Canon Turret T3"] 			= BaseWars.GSL{Model = "models/tf2defaultmodels/artillerysentrystuff/sentry_level3.mdl", Price = 85000, ClassName = "bw_turret_cannon_t3", Limit = 1, Level = 15},

}


------------------------------------------------------------------------
--                         PRINTER
------------------------------------------------------------------------

BaseWars.SpawnList.printer ["Printers (T1)"] = {

    ["Wood Printer"]                = BaseWars.GSL{Model = "models/livaco/advprinters2/livaco_printer.mdl", Price = 750, ClassName = "bw_printer_1_wood" , Limit = 3, Level = 0},
    ["Rock Printer"]                = BaseWars.GSL{Model = "models/livaco/advprinters2/livaco_printer.mdl", Price = 3500, ClassName = "bw_printer_2_rock" , Limit = 3, Level = 5},
    ["Cooper Printer"]                = BaseWars.GSL{Model = "models/livaco/advprinters2/livaco_printer.mdl", Price = 12000, ClassName = "bw_printer_3_cooper" , Limit = 3, Level = 15},
    ["Silver Printer"]                = BaseWars.GSL{Model = "models/livaco/advprinters2/livaco_printer.mdl", Price = 40000, ClassName = "bw_printer_4_silver" , Limit = 3, Level = 25},
    ["Gold Printer"]                = BaseWars.GSL{Model = "models/livaco/advprinters2/livaco_printer.mdl", Price = 85000, ClassName = "bw_printer_5_gold" , Limit = 3, Level = 50},
    ["Diamond Printer"]                = BaseWars.GSL{Model = "models/livaco/advprinters2/livaco_printer.mdl", Price = 150000, ClassName = "bw_printer_6_diamond" , Limit = 3, Level = 80},
    ["Platinum Printer"]                = BaseWars.GSL{Model = "models/livaco/advprinters2/livaco_printer.mdl", Price = 225000, ClassName = "bw_printer_7_platinum" , Limit = 3, Level = 120},
    ["Iridium Printer"]                = BaseWars.GSL{Model = "models/livaco/advprinters2/livaco_printer.mdl", Price = 375000, ClassName = "bw_printer_8_iridium" , Limit = 3, Level = 160},
    ["Uranium Printer"]                = BaseWars.GSL{Model = "models/livaco/advprinters2/livaco_printer.mdl", Price = 500000, ClassName = "bw_printer_9_uranium" , Limit = 3, Level = 220},
}
BaseWars.SpawnList.printer ["Printers (T2)"] = {

    ["Emerald Printer"]                = BaseWars.GSL{Model = "models/livaco/advprinters2/livaco_printer.mdl", Price = 1000000, ClassName = "bw_printer_10_emerald" , Limit = 3, Level = 250},
    ["Obsidian Printer"]                = BaseWars.GSL{Model = "models/livaco/advprinters2/livaco_printer.mdl", Price = 3000000, ClassName = "bw_printer_11_obsidian" , Limit = 3, Level = 300},
    ["Paladium Printer"]                = BaseWars.GSL{Model = "models/livaco/advprinters2/livaco_printer.mdl", Price = 6000000, ClassName = "bw_printer_12_paladium" , Limit = 3, Level = 370},
    ["Tanzanite Printer"]                = BaseWars.GSL{Model = "models/livaco/advprinters2/livaco_printer.mdl", Price = 12000000, ClassName = "bw_printer_13_tanzanite" , Limit = 3, Level = 450},
    ["Black-Opal Printer"]                = BaseWars.GSL{Model = "models/livaco/advprinters2/livaco_printer.mdl", Price = 20000000, ClassName = "bw_printer_14_blackopal" , Limit = 3, Level = 550},
    ["Red-Beryl Printer"]                = BaseWars.GSL{Model = "models/livaco/advprinters2/livaco_printer.mdl", Price = 35000000, ClassName = "bw_printer_15_redberyl" , Limit = 3, Level = 680},
    ["Lazuritr Printer"]                = BaseWars.GSL{Model = "models/livaco/advprinters2/livaco_printer.mdl", Price = 50000000, ClassName = "bw_printer_16_lazurite" , Limit = 3, Level = 800},
    ["Mesolite Printer"]                = BaseWars.GSL{Model = "models/livaco/advprinters2/livaco_printer.mdl", Price = 100000000, ClassName = "bw_printer_17_mesolite" , Limit = 3, Level = 950},
    ["Kyanite Printer"]                = BaseWars.GSL{Model = "models/livaco/advprinters2/livaco_printer.mdl", Price = 250000000, ClassName = "bw_printer_18_kyanite" , Limit = 3, Level = 1150},
}
BaseWars.SpawnList.printer ["Printers (T3)"] = {

    ["Ruby Printer"]                = BaseWars.GSL{Model = "models/livaco/advprinters2/livaco_printer.mdl", Price = 500000000, ClassName = "bw_printer_19_ruby" , Limit = 3, Level = 1300},
    ["Technetium Printer"]                = BaseWars.GSL{Model = "models/livaco/advprinters2/livaco_printer.mdl", Price = 800000000, ClassName = "bw_printer_20_technetium" , Limit = 3, Level = 1500},
    ["Promethium Printer"]                = BaseWars.GSL{Model = "models/livaco/advprinters2/livaco_printer.mdl", Price = 1300000000, ClassName = "bw_printer_21_promethium" , Limit = 3, Level = 1800},
    ["Polonium Printer"]                = BaseWars.GSL{Model = "models/livaco/advprinters2/livaco_printer.mdl", Price = 1800000000, ClassName = "bw_printer_22_polonium" , Limit = 3, Level = 2200},
    ["Astatine Printer"]                = BaseWars.GSL{Model = "models/livaco/advprinters2/livaco_printer.mdl", Price = 2500000000, ClassName = "bw_printer_23_astatine" , Limit = 3, Level = 2600},
    ["Radon Printer"]                = BaseWars.GSL{Model = "models/livaco/advprinters2/livaco_printer.mdl", Price = 3300000000, ClassName = "bw_printer_24_radon" , Limit = 3, Level = 3100},
    ["Francium Printer"]                = BaseWars.GSL{Model = "models/livaco/advprinters2/livaco_printer.mdl", Price = 4500000000, ClassName = "bw_printer_25_francium" , Limit = 3, Level = 3700},
    ["Mobuis Printer"]                = BaseWars.GSL{Model = "models/livaco/advprinters2/livaco_printer.mdl", Price = 5500000000, ClassName = "bw_printer_26_mobuis" , Limit = 3, Level = 4350},
    ["Dark-Matter Printer"]                = BaseWars.GSL{Model = "models/livaco/advprinters2/livaco_printer.mdl", Price = 8000000000, ClassName = "bw_printer_27_darkmatter" , Limit = 3, Level = 5000},
}
BaseWars.SpawnList.printer ["Printers (T4)"] = {

    ["Red-Matter Printer"]                = BaseWars.GSL{Model = "models/livaco/advprinters2/livaco_printer.mdl", Price = 11000000000, ClassName = "bw_printer_28_redmatter" , Limit = 3, Level = 5500},
    ["Monolithe Printer"]                = BaseWars.GSL{Model = "models/livaco/advprinters2/livaco_printer.mdl", Price = 15000000000, ClassName = "bw_printer_29_monolithe" , Limit = 3, Level = 6000},
    ["Quantium Printer"]                = BaseWars.GSL{Model = "models/livaco/advprinters2/livaco_printer.mdl", Price = 20000000000, ClassName = "bw_printer_30_quantium" , Limit = 3, Level = 6500},
    ["Bénitoïte Printer"]                = BaseWars.GSL{Model = "models/livaco/advprinters2/livaco_printer.mdl", Price = 28000000000, ClassName = "bw_printer_31_bénitoite" , Limit = 3, Level = 7000},
    ["Jade Printer"]                = BaseWars.GSL{Model = "models/livaco/advprinters2/livaco_printer.mdl", Price = 40000000000, ClassName = "bw_printer_32_jade" , Limit = 3, Level = 8250},
    ["Saphir Printer"]                = BaseWars.GSL{Model = "models/livaco/advprinters2/livaco_printer.mdl", Price = 55000000000, ClassName = "bw_printer_33_saphir" , Limit = 3, Level = 9500},
    ["Amber Printer"]                = BaseWars.GSL{Model = "models/livaco/advprinters2/livaco_printer.mdl", Price = 70000000000, ClassName = "bw_printer_34_amber" , Limit = 3, Level = 11000},
    ["Larimar Printer"]                = BaseWars.GSL{Model = "models/livaco/advprinters2/livaco_printer.mdl", Price = 90000000000, ClassName = "bw_printer_35_larimar" , Limit = 3, Level = 13000},
    ["Diopstase Printer"]                = BaseWars.GSL{Model = "models/livaco/advprinters2/livaco_printer.mdl", Price = 120000000000, ClassName = "bw_printer_36_diopstase" , Limit = 3, Level = 15000},
}
BaseWars.SpawnList.printer ["Printers (T5)"] = {

    ["Malachite Printer"]                = BaseWars.GSL{Model = "models/livaco/advprinters2/livaco_printer.mdl", Price = 260000000000, ClassName = "bw_printer_37_malachite" , Limit = 3, Level = 18000},
    ["Bauxite Printer"]                = BaseWars.GSL{Model = "models/livaco/advprinters2/livaco_printer.mdl", Price = 370000000000, ClassName = "bw_printer_38_bauxite" , Limit = 3, Level = 20500},
    ["Fluorite Printer"]                = BaseWars.GSL{Model = "models/livaco/advprinters2/livaco_printer.mdl", Price = 490000000000, ClassName = "bw_printer_39_fluorite" , Limit = 3, Level = 23000},
    ["Pyrite Printer"]                = BaseWars.GSL{Model = "models/livaco/advprinters2/livaco_printer.mdl", Price = 620000000000, ClassName = "bw_printer_40_pyrite" , Limit = 3, Level = 25000},
    ["Galenite Printer"]                = BaseWars.GSL{Model = "models/livaco/advprinters2/livaco_printer.mdl", Price = 770000000000, ClassName = "bw_printer_41_galenite" , Limit = 3, Level = 27800},
    ["Cassisterite Printer"]                = BaseWars.GSL{Model = "models/livaco/advprinters2/livaco_printer.mdl", Price = 890000000000, ClassName = "bw_printer_42_cassisterite" , Limit = 3, Level = 30000},
    ["Garniérite Printer"]                = BaseWars.GSL{Model = "models/livaco/advprinters2/livaco_printer.mdl", Price = 1200000000000, ClassName = "bw_printer_43_garniérite" , Limit = 3, Level = 33200},
    ["Zinc Printer"]                = BaseWars.GSL{Model = "models/livaco/advprinters2/livaco_printer.mdl", Price = 1600000000000, ClassName = "bw_printer_44_zinc" , Limit = 3, Level = 36000},
    ["Sulfur Printer"]                = BaseWars.GSL{Model = "models/livaco/advprinters2/livaco_printer.mdl", Price = 2200000000000, ClassName = "bw_printer_45_sulfur" , Limit = 3, Level = 40000},
}
BaseWars.SpawnList.printer ["Printers (T6)"] = {

    ["Pole-Star Printer"]                = BaseWars.GSL{Model = "models/livaco/advprinters2/livaco_printer.mdl", Price = 3000000000000, ClassName = "bw_printer_46_polestar" , Limit = 3, Level = 45000},
    ["Neptune Printer"]                = BaseWars.GSL{Model = "models/livaco/advprinters2/livaco_printer.mdl", Price = 4000000000000, ClassName = "bw_printer_47_neptune" , Limit = 3, Level = 51000},
    ["Black-Hole Printer"]                = BaseWars.GSL{Model = "models/livaco/advprinters2/livaco_printer.mdl", Price = 5200000000000, ClassName = "bw_printer_48_blackhole" , Limit = 3, Level = 60000},
    ["Quasar Printer"]                = BaseWars.GSL{Model = "models/livaco/advprinters2/livaco_printer.mdl", Price = 6800000000000, ClassName = "bw_printer_49_quasar" , Limit = 3, Level = 68000},
    ["Nova Printer"]                = BaseWars.GSL{Model = "models/livaco/advprinters2/livaco_printer.mdl", Price = 8000000000000, ClassName = "bw_printer_50_nova" , Limit = 3, Level = 75000},
    ["Pulsar Printer"]                = BaseWars.GSL{Model = "models/livaco/advprinters2/livaco_printer.mdl", Price = 10000000000000, ClassName = "bw_printer_51_pulsar" , Limit = 3, Level = 83000},
    ["Moon Printer"]                = BaseWars.GSL{Model = "models/livaco/advprinters2/livaco_printer.mdl", Price = 125000000000000, ClassName = "bw_printer_52_moon" , Limit = 3, Level = 95000},
    ["Comet Printer"]                = BaseWars.GSL{Model = "models/livaco/advprinters2/livaco_printer.mdl", Price = 16000000000000, ClassName = "bw_printer_53_comet" , Limit = 3, Level = 110000},
    ["Cosmos Printer"]                = BaseWars.GSL{Model = "models/livaco/advprinters2/livaco_printer.mdl", Price = 22000000000000, ClassName = "bw_printer_54_cosmos" , Limit = 3, Level = 125000},
}
BaseWars.SpawnList.printer ["Printers (T7)"] = {

    ["Hydrogen Printer"]                = BaseWars.GSL{Model = "models/livaco/advprinters2/livaco_printer.mdl", Price = 30000000000000, ClassName = "bw_printer_55_hydrogen" , Limit = 3, Level = 140000},
    ["Helium Printer"]                = BaseWars.GSL{Model = "models/livaco/advprinters2/livaco_printer.mdl", Price = 38000000000000, ClassName = "bw_printer_56_helium" , Limit = 3, Level = 147000},
    ["Lithium Printer"]                = BaseWars.GSL{Model = "models/livaco/advprinters2/livaco_printer.mdl", Price = 47000000000000, ClassName = "bw_printer_57_lithium" , Limit = 3, Level = 200000},
    ["Berryllium Printer"]                = BaseWars.GSL{Model = "models/livaco/advprinters2/livaco_printer.mdl", Price = 59000000000000, ClassName = "bw_printer_58_berryllium" , Limit = 3, Level = 225000},
    ["Boron Printer"]                = BaseWars.GSL{Model = "models/livaco/advprinters2/livaco_printer.mdl", Price = 74000000000000, ClassName = "bw_printer_59_boron" , Limit = 3, Level = 250000},
    ["Carbon Printer"]                = BaseWars.GSL{Model = "models/livaco/advprinters2/livaco_printer.mdl", Price = 85000000000000, ClassName = "bw_printer_60_carbon" , Limit = 3, Level = 280000},
    ["Nitrogen Printer"]                = BaseWars.GSL{Model = "models/livaco/advprinters2/livaco_printer.mdl", Price = 99000000000000, ClassName = "bw_printer_61_nitrogen" , Limit = 3, Level = 310000},
    ["Oxygen Printer"]                = BaseWars.GSL{Model = "models/livaco/advprinters2/livaco_printer.mdl", Price = 120000000000000, ClassName = "bw_printer_62_oxygen" , Limit = 3, Level = 350000},
    ["Fluorine Printer"]                = BaseWars.GSL{Model = "models/livaco/advprinters2/livaco_printer.mdl", Price = 145000000000000, ClassName = "bw_printer_63_fluorine" , Limit = 3, Level = 400000},
}
BaseWars.SpawnList.printer ["Printers (T8)"] = {

    ["Neon Printer"]                = BaseWars.GSL{Model = "models/livaco/advprinters2/livaco_printer.mdl", Price = 170000000000000, ClassName = "bw_printer_64_neon" , Limit = 3, Level = 450000},
    ["Sodium Printer"]                = BaseWars.GSL{Model = "models/livaco/advprinters2/livaco_printer.mdl", Price = 200000000000000, ClassName = "bw_printer_65_sodium" , Limit = 3, Level = 500000},
    ["Magnesium Printer"]                = BaseWars.GSL{Model = "models/livaco/advprinters2/livaco_printer.mdl", Price = 240000000000000, ClassName = "bw_printer_66_magnesium" , Limit = 3, Level = 570000},
    ["Aluminium Printer"]                = BaseWars.GSL{Model = "models/livaco/advprinters2/livaco_printer.mdl", Price = 300000000000000, ClassName = "bw_printer_67_aluminium" , Limit = 3, Level = 650000},
    ["Silicon Printer"]                = BaseWars.GSL{Model = "models/livaco/advprinters2/livaco_printer.mdl", Price = 370000000000000, ClassName = "bw_printer_68_silicon" , Limit = 3, Level = 740000},
    ["Phosphorus Printer"]                = BaseWars.GSL{Model = "models/livaco/advprinters2/livaco_printer.mdl", Price = 490000000000000, ClassName = "bw_printer_69_phosphorus" , Limit = 3, Level = 850000},
    ["Sulphur Printer"]                = BaseWars.GSL{Model = "models/livaco/advprinters2/livaco_printer.mdl", Price = 630000000000000, ClassName = "bw_printer_70_sulphur" , Limit = 3, Level = 980000},
    ["Chlorine Printer"]                = BaseWars.GSL{Model = "models/livaco/advprinters2/livaco_printer.mdl", Price = 820000000000000, ClassName = "bw_printer_71_chlorine" , Limit = 3, Level = 1130000},
    ["Argon Printer"]                = BaseWars.GSL{Model = "models/livaco/advprinters2/livaco_printer.mdl", Price = 1000000000000000, ClassName = "bw_printer_72_argon" , Limit = 3, Level = 1250000},
}
BaseWars.SpawnList.printer ["Printers (T9)"] = {

    ["Potassium Printer"]                = BaseWars.GSL{Model = "models/livaco/advprinters2/livaco_printer.mdl", Price = 1300000000000000, ClassName = "bw_printer_73_potassium" , Limit = 3, Level = 1500000},
    ["Calcium Printer"]                = BaseWars.GSL{Model = "models/livaco/advprinters2/livaco_printer.mdl", Price = 1700000000000000, ClassName = "bw_printer_74_calcium" , Limit = 3, Level = 17500000},
    ["Scandium Printer"]                = BaseWars.GSL{Model = "models/livaco/advprinters2/livaco_printer.mdl", Price = 2300000000000000, ClassName = "bw_printer_75_scandium" , Limit = 3, Level = 2000000},
    ["Titanium Printer"]                = BaseWars.GSL{Model = "models/livaco/advprinters2/livaco_printer.mdl", Price = 2900000000000000, ClassName = "bw_printer_76_titanium" , Limit = 3, Level = 2350000},
    ["Vanadium Printer"]                = BaseWars.GSL{Model = "models/livaco/advprinters2/livaco_printer.mdl", Price = 3600000000000000, ClassName = "bw_printer_77_vanadium" , Limit = 3, Level = 2750000},
    ["Chromium Printer"]                = BaseWars.GSL{Model = "models/livaco/advprinters2/livaco_printer.mdl", Price = 4500000000000000, ClassName = "bw_printer_78_chromium" , Limit = 3, Level = 3200000},
    ["Manganese Printer"]                = BaseWars.GSL{Model = "models/livaco/advprinters2/livaco_printer.mdl", Price = 5900000000000000, ClassName = "bw_printer_79_manganese" , Limit = 3, Level = 3850000},
    ["Cobalt Printer"]                = BaseWars.GSL{Model = "models/livaco/advprinters2/livaco_printer.mdl", Price = 7000000000000000, ClassName = "bw_printer_80_cobalt" , Limit = 3, Level = 4400000},
    ["Nickel Printer"]                = BaseWars.GSL{Model = "models/livaco/advprinters2/livaco_printer.mdl", Price = 10000000000000000, ClassName = "bw_printer_81_nickel" , Limit = 3, Level = 5000000},

}

-----------------------------------------------------------------------------------------------------------------------------




BaseWars.SpawnList.Loadout["Medical"] = {

	["Medkit"] 						= BaseWars.GSL{Model = "models/Items/HealthKit.mdl", Price = 15000, ClassName = "bw_medkit", Level = 5, IgnoreRaid = true},

}

BaseWars.SpawnList.Loadout["Weapons (T2)"] = {

	["Heal Gun"]					= BaseWars.GSL{Gun = true, Model = "models/weapons/w_physics.mdl", Price = 3500000, ClassName = "bw_health", Level = 45},

}



BaseWars.SpawnList.Entities["Dispensers (T1)"] = {

	["Ammo Dispenser"]				= BaseWars.GSL{Model = "models/tf2defaultmodels/artillerysentrystuff/woodbox.mdl", Price = 155000, ClassName = "bw_dispenser_ammo"},
	["Armour Dispenser"]			= BaseWars.GSL{Model = "models/props_combine/suit_charger001.mdl", Price = 35000, ClassName = "bw_dispenser_armor"},
	["Health Pad"] 						= BaseWars.GSL{Model = "models/buildables/dispenser_light.mdl", Price = 50000, ClassName = "bw_soin_t1", Level = 10, IgnoreRaid = true},
	["Bank"]						= BaseWars.GSL{Model = "models/livaco/advprinters2/livaco_printer.mdl", Price = 100, ClassName = "bw_bank_system", VIP = true},

}

BaseWars.SpawnList.Entities["Dispensers (T2)"] = {

	["Printer-Paper Refiller"]		= BaseWars.GSL{Model = "models/props_lab/plotter.mdl", Price = 150000000, ClassName = "bw_dispenser_paper", Limit = 1, Level = 100},
	["Health Pad v2"] 						= BaseWars.GSL{Model = "models/buildables/dispenser_lvl2_light.mdl", Price = 75000, ClassName = "bw_soin_t2", Level = 10, IgnoreRaid = true},

}

BaseWars.SpawnList.Entities["Dispensers (T3)"] = {

	["Ammo Dispenser v2"]				= BaseWars.GSL{Model = "models/tf2defaultmodels/artillerysentrystuff/woodbox.mdl", Price = 4*10^8, ClassName = "bw_dispenser_ammo2", Level = 125},
	["Armour Dispenser v2"]			= BaseWars.GSL{Model = "models/props_combine/suit_charger001.mdl", Price = 2*10^8, ClassName = "bw_dispenser_armor2", Level = 110},
	["Health Pad v3"] 						= BaseWars.GSL{Model = "models/buildables/dispenser_lvl3_light.mdl", Price = 100000, ClassName = "bw_soin_t3", Level = 15, IgnoreRaid = true},
}


BaseWars.SpawnList.Entities["Structures (T1)"] = {

	-- T1
	["Spawnpoint"]					= BaseWars.GSL{Model = "models/tf2defaultmodels/prefortress2teleporter/teleporter_light.mdl", Price = 15000, ClassName = "bw_spawnpoint", UseSpawnFunc = true},

}

BaseWars.SpawnList.Entities["Structures (T2)"] = {

	-- T2
	["Radar"]						= BaseWars.GSL{Model = "models/tf2defaultmodels/rayzarstuff/dispenser_level3_building.mdl", Price = 25000000, ClassName = "bw_radar",  Limit = 1, Level = 35},

}


BaseWars.SpawnList.Entities["Consumables (T1)"] = {

	["Repair Kit"]					= BaseWars.GSL{Model = "models/tf2defaultmodels/skirmisherstuff/toolbox.mdl", Price = 30000, ClassName = "bw_repairkit", UseSpawnFunc = true},
	["Armour Kit"]					= BaseWars.GSL{Model = "models/tf2defaultmodels/skirmisherstuff/toolbox.mdl", Price = 85000, ClassName = "bw_entityarmor", UseSpawnFunc = true},
	["Capacity Kit"]				= BaseWars.GSL{Model = "models/livaco/advprinters2/livaco_repair.mdl", Price = 100000, ClassName = "bw_printercap", UseSpawnFunc = true},
	["Printer Paper"]				= BaseWars.GSL{Model = "models/livaco/advprinters2/livaco_ink.mdl", Price = 2000, ClassName = "bw_printerpaper", UseSpawnFunc = true},

}

BaseWars.SpawnList.Entities["Consumables (T2)"] = {

	["Heavy Armour Kit"]					= BaseWars.GSL{Model = "models/tf2defaultmodels/skirmisherstuff/toolbox.mdl", Price = 8500000, ClassName = "bw_armor_heavy", UseSpawnFunc = true, Level = 75},
	["Heavy Capacity Kit"]					= BaseWars.GSL{Model = "models/livaco/advprinters2/livaco_repair.mdl", Price = 12500000, ClassName = "bw_cap_heavy", UseSpawnFunc = true, Level = 75},

}

