/*
	Author: Horner
	Description: Sets up the weapon arrays for my loot system
	
	Syntax:
	["Weapon", "Magazine", [MinimumMagAmount, MaximumMagAmount - 2]]
*/

// 60% Chance
hrn_commonWepArray =
[
	["ItemGPS", 		"", 						[1, 2]],
	["Binocular",		"",							[1, 2]],
	["", 				"SmokeShell",				[1, 4]],
	["Colt1911", 		"7Rnd_45ACP_1911",			[2, 6]],
	["M9",				"15Rnd_9x19_M9",			[2, 6]],
	["Makarov",			"8Rnd_9x18_Makarov",		[2, 6]]
];

// 25% Chance
hrn_semiCommonWepArray =
[
	["Huntingrifle",	"5x_22_LR_17_HMR",			[2, 10]],
	["AK_47_M",			"30Rnd_762x39_AK47",		[2, 10]],
	["AK_47_S",			"30Rnd_762x39_AK47",		[2, 10]],
	["M16A2",			"30Rnd_556x45_Stanag",		[2, 10]],
	["M16A4",			"30Rnd_556x45_Stanag",		[2, 10]],
	["M4A1",			"30Rnd_556x45_Stanag",		[2, 10]],
	["G36a",			"30Rnd_556x45_G36",			[2, 10]],
	["G36C",			"30Rnd_556x45_G36",			[2, 10]],
	["AK_74",			"30Rnd_545x39_AK",			[2, 10]],
	["G36K",			"30Rnd_556x45_G36",			[2, 10]],
	["M9SD",			"15Rnd_9x19_M9SD",			[2, 6]],
	["MakarovSD",		"8Rnd_9x18_MakarovSD",		[2, 6]]
];

// 10% Chance
hrn_semiRareWepArray =
[
	["M1014",			"8Rnd_B_Beneli_74Slug",		[2, 10]],
	["M16A4_ACG",		"30Rnd_556x45_Stanag",		[2, 10]],
	["",				"HandGrenade_West",			[2, 3]]
];

// 4% Chance
hrn_rareWepArray =
[
	["KSVK",			"5Rnd_127x108_KSVK",		[2, 10]],
	["",				"PipeBomb",					[0, 1]]
];

// 1% Chance
hrn_veryRareWepArray =
[
	["RPG7V",			"PG7V",						[2, 6]]
];