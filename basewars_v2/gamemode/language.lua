-- CURRENCY: The currency used for the gamemode
local CURRENCY = "€"

-- category: The name of the spawnmenu category
-- This is done with language.Add since it's already handled by gmod
if CLIENT then
	language.Add("spawnmenu.category.basewars", "BaseWars")
end

-- GO NO FURTHER IF YOU ARE NOT AT LEAST SEMI-EXPERIENCED WITH LUA

-- To create a new language, copy the english language lookup, and paste a second copy
-- below it. Change _LANGUAGELOOK.ENGLISH to _LANGUAGELOOK.YOURLANGUAGE then translate any strings.
-- When done go back to the config and change the selected language

-- If you create a language table which we dont have already, or notice any spelling or grammar mistakes
-- in the existing ones, open a support ticket or mail @ q2f2@hexahedron.pw and we will add it to the gamemode and you to the credits.

-- Korean: Unfinished

BaseWars.LANG = {}
BaseWars.LANG.__LANGUAGELOOK = {}

BaseWars.LANG.__LANGUAGELOOK.FRENCH = {
	Numbers = {
		[5] = {10^6, "Million"},
		[4] = {10^9, "Billion"},
		[3] = {10^12, "Trillion"},
		[2] = {10^15, "Quadrillion"},
		[1] = {10^18, "Quintillion"},
	},

	CURFORMER								= "%s " .. CURRENCY,
	CURRENCY								= CURRENCY,

	Yes										= "Oui",
	No										= "Non",
	Level									= "Niveau",
	Remaining								= "Restant",
	Seconds									= "Secondes",
	Mins									= "Minutes",
	You										= "Vous",

	NaNResult								= "Impossible de détruire le système, mon gars.",
	MaximumPay								= "Le montant maximum est " .. CURRENCY .. "%s. S'il vous plaît ne dérangez pas l'économie.",
	MinimumPay								= "Le montant minimum est " .. CURRENCY .. "1.",
	PayRateLimit							= "Vous venez d'être limité! %s secondes restantes.",

	FactionNameTaken						= "Ce nom de faction est déjà utilisé!",
	FactionNotExist							= "Cette faction n'existe pas!",
	FactionCantDisband						= "Seulement le chef de la faction peut la dissoudre!",
	FactionWrongPass						= "Mot de passe incorrect!",
	FactionCantLeaveLeader					= "Vous ne pouvez pas quitter la faction en tant que chef, vous devez la dissoudre!",
	FactionCantPassword						= "Seul le chef de la faction peut changer le mot de passe de celle-ci!",

	PayDay									= "Jour de paie! Vous avez reçu " .. CURRENCY .. "%s!",

	DontBuildSpawn							= "Ne mettez pas d'objets autour du spawn.",
	SpawnKill								= "N'essayez pas de spawnkill.",
	SpawnCamp								= "N'essayez pas de spawncamp.",

	RaidOngoing								= "Il y a déjà un raid qui se déroule!",
	RaidSelfUnraidable						= "Vous ne pouvez pas être raidé! (%s)",
	RaidTargetUnraidable					= "Vous ne pouvez pas raider cette cible! (%s)",
	RaidOver								= "Le raid entre %s et %s est TERMINÉ!",
	RaidStart								= "Un raid entre %s et %s a COMMENCÉ!",
	RaidTargNoFac							= "Vous ne pouvez pas raid un joueur sans faction en tant que faction!",
	RaidSelfNoFac							= "Vous ne pouvez pas raid une faction en tant que joueur!",
	RaidNoFaction							= "Vous ne pouvez pas utiliser les fonctions d'une faction pendant un raid!",
	CantRaidSelf							= "Vous ne pouvez pas commencer un raid contre vous-même ou votre faction!",

	CannotPurchaseRaid						= "Vous ne pouvez pas acheter ça pendant un raid!",

	NoPrinters								= "Vous n'avez pas assez d'imprimantes raidables!",
	OnCoolDown								= "Vous êtes en ce moment en temps de rechargement pour être raidé!",

	PayOutOwner								= "Vous avez reçu " .. CURRENCY .. "%s pour la destruction de votre %s!",
	PayOut									= "Vous avez reçu " .. CURRENCY .. "%s pour la destruction d'un %s!",

	SteroidEffect							= "Vous vous sentez plein d'énergie...",
	SteroidRemove							= "Votre énergie passe...",
	RegenEffect								= "Vous sentez vos plaies se refermer d'elle-mêmes...",
	RegenRemove								= "Votre chair cesse de se soigner...",
	PainKillerEffect						= "Vous ne sentez plus de douleur...",
	PainKillerRemove						= "Vous ressentez la douleur de nouveau...",
	AntidoteEffect							= "Vous vous sentez en très bonne santé et moins affecté par le poison...",
	AntidoteRemove							= "Vous ne vous sentez plus en très bonne santé...",
	AdrenalineEffect						= "Vous vous sentez puissant(e)...",
	AdrenalineRemove						= "Vous ne vous sentez plus puissant(e)...",
	DoubleJumpEffect						= "Vous vous sentez très léger...",
	DoubleJumpRemove						= "Vous vous sentez soudainement comme du plomb...",
	ShieldEffect							= "Vous sentez de l'énergie se rassemblant autour de vous...",
	ShieldRemove							= "L'énergie qui vous protégeait auparavant se dissipe...",
	ShieldSave								= "La personne que vous avez attaquée a été sauvée par un bouclier d'énergie.",
	RageEffect								= "TUEEEEEEEEEEEEER!!!",
	RageRemove								= "Oulà, j'en ai peut-être fait un peu trop...",

	PowerFailure							= "PLUS D'ÉNERGIE!",
	HealthFailure							= "DOMMAGES CRITIQUES!",

	NewSpawnPoint							= "Votre nouveau point d'apparition a été établi!",

	UseSpawnMenu							= "Utilisez la spawnlist de BaseWars!",
	SpawnMenuMoney							= "Vous n'avez pas assez d'argent pour ça.",
	SpawnMenuBuy							= "Vous avez acheté un(e) \"%s\" pour " .. CURRENCY .. "%s.",
	SpawnMenuBuyConfirm						= "Êtes-vous sûr(e) de vouloir acheter un(e) \"%s\" pour " .. CURRENCY .. "%s?",
	SpawnMenuConf							= "Confirmation d'achat",
	DeadBuy									= "Vous ne pouvez rien acheter en étant mort!",
	EntLimitReached							= "Vous avez atteint la limite de \"%s\"s.",

	StuckText								= "Vous êtes bloqué! Restez calme et appuyez sur [%s], si ça ne fonctionne pas appuyez sur [%s].",

	MainMenuControl							= "F3 - Ouvrir le menu principal (règles, factions, raids)",
	SpawnMenuControl						= " - Ouvrir le menu d'achat (entités, armes)",
	KarmaText								= "%s",
	LevelText            					= "%s",
	XPText               					= "%s/%s XP",

	AFKFor									= "Vous étiez absent pendant",
	RespawnIn								= "Vous pouvez réapparaître dans",

	UpgradeNoMoney							= "Vous n'avez pas assez d'argent pour mettre à niveau!",
	UpgradeMaxLevel							= "Vous ne pouvez plus mettre à niveau cette imprimante!",

	WelcomeBackCrash						= "Bon retour, la dernière fois que vous jouiez le serveur a planté.",
	Refunded								= "Vous avez été remboursé de " .. CURRENCY .. " %s.",

	GivenMoney								= "%s vous a donné " .. CURRENCY .. "%s.",
	GaveMoney								= "Vous avez donné à %s un montant de " .. CURRENCY .. "%s.",

	BountyNotEnoughMoney					= "Vous n'avez pas assez d'argent pour placer une prime.",

	InvalidPlayer							= "Joueur invalide!",
	InvalidAmount							= "Montant invalide!",
	TooPoor									= "Vous êtes trop pauvre pour cettre transaction!",

	BaseWarsMenu							= "BaseWars Menu",
	Factions								= "Factions",
	Faction									= "Faction",
	Player									= "Joueur",
	Raids									= "Raids",
	Rules									= "Règles",
	NoFaction								= "<AUCUNE>",

	ConfirmLeave						= [[
Êtes-vous sûr de vouloir quitter cette faction?
Si vous en êtes le leader, elle sera dissoute!]],
	JoinWarning							= [[
Note: si vous êtes le leader d'une faction, en rejoindre une autre dissoudera votre précédente.]],
	CreateNotice						= [[
Avertissement: La création d'une faction est soumise a quelque règles:
- Vous ne pouvez pas créer de faction durant un raid.
- Si vous êtes le leader d'une faction existante, cette faction sera dissoute.
Veuillez procéder avec précaution.]],

	CreateFaction						= "Créer une faction",
	FactionName							= "Nom de la faction:",
	FactionPassword						= "Mot de passe (non-requis)",

	Create								= "CRÉER",
	Nevermind							= "ANNULER", -- hhhhhhhhhhhhhhhhhhhhhhhhhhhh

	JoinFaction							= "Rejoindre la faction",
	Join								= "REJOINDRE",

	LeaveFaction						= "Quitter la faction",
	Leave								= "QUITTER",

	YouNotFaction						= "Vous n'êtes actuellement dans aucune faction.",
	YourFaction							= "Votre faction: ",

	StartRaid							= "Démarrer un raid",
	ConceedRaid							= "Capituler le raid",

	Use									= "Utiliser",
	Collect								= "Récupérer",
	Activate							= "Activer",
	LookAt								= "Regarder à",
	Drink								= "Boire",
	TalkTo								= "Parler à",

	Door								= "Porte",
	Money								= "Argent",
	Drug								= "Drogue",
	Soda								= "Soda",
	HelpNPC								= "PNJ d'aide",
	Spawnpoint							= "Point d'apparition",
	Defusing							= "Désamorcer...",
	Plant								= "Planter",
	Defuse								= "Désamorcer",

	Entities							= "Entités",
	Loadout								= "Équipement",
	BaseWarsSpawnlist					= "Spawnlist BaseWars",
	CategoryLeft						= "Cliquez sur une des catégories sur la gauche.",

	PrinterBeen							= "Cette imprimante a été",
	Disabled							= "DÉSACTIVÉE",
	Cash								= "ARGENT",
	MaxLevel							= "!Niveau Maximum!",
	Paper								= "Papier: %s feuilles",
	UntilFull							= "%s avant le plein",
	Full								= "PLEIN",
	NextUpgrade							= "PROCHAINE MISE À NIVEAU: %s",

	HoursShort							= "h",
	MinutesShort						= "m",
	SecondsShort						= "s",

	VS									= " vs ",
}

local INVALID_LANGUAGE	= "INVALID LANGUAGE SELECTED! NOTIFY THE SERVER ADMIN!"
local INVALID_STRING		= "INVALID STRING TRANSLATION! NOTIFY THE SERVER ADMIN!"

setmetatable(BaseWars.LANG, {
	__index = function(t, k)

		local L = BaseWars.LANG.__LANGUAGELOOK[BASEWARS_CHOSEN_LANGUAGE]
		if not L then
			return INVALID_LANGUAGE
		end
		if not L[k] then
			ErrorNoHalt("[BaseWars-Lang] You messed up a string localization:")
			debug.Trace()

			return INVALID_STRING
		end
		return L[k]

	end
})
