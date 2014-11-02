//if(!isDedicated && !isServer)exitWith{};
//********************************WEAPONS
//0 weapon
//1 pistol
//2 rp
//3 only weapons
//5 only magazines
ammo_minimal = [
	[[],["Makarov","8Rnd_9x18_Makarov"],[],["ItemMap", "ItemRadio"],["HandGrenade_Stone"]]
];
ammo_easy = [
	[["AKS_74_U","30Rnd_545x39_AKSD"],["Makarov","8Rnd_9x18_Makarov"],[],["Binocular"],[]],
	[["M1014","8Rnd_B_Beneli_74Slug"],["Makarov","8Rnd_9x18_Makarov"],[],["Binocular"],[]],
	[["MP5A5","30rnd_9x19_MP5SD"],["Makarov","8Rnd_9x18_Makarov"],[],["Binocular"],[]],
	[["AK_47_M","30Rnd_762x39_AK47"],["Makarov","8Rnd_9x18_Makarov"],[],["Binocular"],[]],
	[["Saiga12K","8Rnd_B_Saiga12_74Slug"],["Makarov","8Rnd_9x18_Makarov"],[],["Binocular"],[]],
	[["AK_47_S","30Rnd_762x39_AK47"],["Makarov","8Rnd_9x18_Makarov"],[],["Binocular"],[]]
];
ammo_medium = [
	[["AK_47_M","30Rnd_762x39_AK47"],["Makarov","8Rnd_9x18_Makarov"],[],["Binocular"],[]],
	[["AK_47_S","30Rnd_762x39_AK47"],["Makarov","8Rnd_9x18_Makarov"],[],["Binocular"],[]],
	[["AK_74","30Rnd_545x39_AKSD"],["Makarov","8Rnd_9x18_Makarov"],[],["Binocular"],[]],
	[["SVD","10Rnd_762x54_SVD"],["Makarov","8Rnd_9x18_Makarov"],[],["Binocular"],[]],
	[["AKS_74_Kobra","30Rnd_545x39_AKSD"],["Makarov","8Rnd_9x18_Makarov"],[],["Binocular"],[]],
	[["M4A1","30Rnd_556x45_StanagSD"],["Makarov","8Rnd_9x18_Makarov"],[],["Binocular"],[]],
	[["M16A2","30Rnd_556x45_StanagSD"],["Makarov","8Rnd_9x18_Makarov"],[],["Binocular"],[]]
];
ammo_mil = [
	[["AK_74","30Rnd_545x39_AKSD"],["Makarov","8Rnd_9x18_Makarov"],[],["Binocular","NVGoggles"],[]],
	[["AKS_74_PSO","30Rnd_545x39_AKSD"],["Makarov","8Rnd_9x18_Makarov"],[],["Binocular","NVGoggles"],[]],
	[["AK_107_PSO","30Rnd_545x39_AKSD"],["Makarov","8Rnd_9x18_Makarov"],[],["Binocular","NVGoggles"],[]],
	[["AK_107_Kobra", "30Rnd_545x39_AKSD"],["Makarov","8Rnd_9x18_Makarov"],["RPG7V","OG7"],["Binocular","NVGoggles"],[]],
	[["RPK_74","30Rnd_545x39_AKSD"],[],[],["Binocular","NVGoggles"],[]],
	[["PK","100Rnd_762x54_PK"],[],[],["Binocular","NVGoggles"],[]],
	[["SVD_Camo","10Rnd_762x54_SVD"],[],[],["Binocular","NVGoggles"],[]],
	[["VSS_Vintorez","20Rnd_9x39_SP5_VSS"],[],[],["Binocular","NVGoggles"],[]],
	[["AK_74_GL","30Rnd_545x39_AKSD"],["Makarov","8Rnd_9x18_Makarov"],[],["Binocular","NVGoggles"],["1Rnd_HE_GP25","FlareRed_GP25","FlareWhite_GP25","1Rnd_SMOKE_GP25"]]	
];
ammo_merc = [
	[["M16A2","30Rnd_556x45_Stanag"],["M9","15Rnd_9x19_M9SD"],[],["Binocular","NVGoggles"],[]],
	[["M4A1_AIM","30Rnd_556x45_Stanag"],["M9","15Rnd_9x19_M9SD"],[],["Binocular","NVGoggles"],[]],
	[["M4A1","30Rnd_556x45_Stanag"],["M9","15Rnd_9x19_M9SD"],[],["Binocular","NVGoggles"],[]],
	[["M16A4_GL","30Rnd_556x45_Stanag"],["M9","15Rnd_9x19_M9SD"],[],["Binocular","NVGoggles"],["1Rnd_HE_M203","1Rnd_HE_M203","1Rnd_HE_M203","1Rnd_HE_M203"]],
	[["G36C","30Rnd_556x45_Stanag"],["M9","15Rnd_9x19_M9SD"],[],["Binocular","NVGoggles"],[]],
	[["G36K","30Rnd_556x45_Stanag"],["M9","15Rnd_9x19_M9SD"],[],["Binocular","NVGoggles"],[]],
	[["M24","5Rnd_762x51_M24"],["M9","15Rnd_9x19_M9SD"],[],["Binocular","NVGoggles"],[]]
];


_unit = _this select 0;
_assembly = _this select 1;

removeallweapons _unit;

_pack = nil;

switch (_assembly)do{
	case "minimal":{
		_pack = ammo_minimal select (floor random (count ammo_minimal));	
	};
	case "easy_stalker":{
		_pack = ammo_easy select (floor random (count ammo_easy));	
	};
	case "medium_stalker":{
		_pack = ammo_medium select (floor random (count ammo_medium));	
	};
	case "military":{
		_pack = ammo_mil select (floor random (count ammo_mil));	
	};
	case "mercenaries":{
		_pack = ammo_merc select (floor random (count ammo_merc));	
	};
};

if(!isNil "_pack")then{
	if(count (_pack select 0) != 0)then{
		{_unit addmagazine ((_pack select 0)select 1)} foreach [0,0,0];	
		_unit addweapon ((_pack select 0)select 0);
	};
	if(count (_pack select 1) != 0)then{
		{_unit addmagazine ((_pack select 1)select 1)} foreach [0,0,0];	
		_unit addweapon ((_pack select 1)select 0);
	};
	if(count (_pack select 2) != 0)then{
		{_unit addmagazine ((_pack select 2)select 1)} foreach [0,0,0];
		_unit addweapon ((_pack select 2)select 0);
	};
	if(count (_pack select 4) != 0)then{{_unit addmagazine _x} foreach (_pack select 4);};
	if(count (_pack select 3) != 0)then{{_unit addweapon _x} foreach (_pack select 3);};
	
};

_unit selectWeapon (primaryWeapon _unit);
_muzzles = getArray(configFile>>"cfgWeapons" >> primaryWeapon _unit >> "muzzles");
_unit selectWeapon (_muzzles select 0);
_unit action ["SWITCHWEAPON", vehicle _unit, vehicle _unit, 1];