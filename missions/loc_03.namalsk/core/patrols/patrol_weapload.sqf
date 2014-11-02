//if(!isDedicated && !isServer)exitWith{};
//********************************WEAPONS
//0 weapon
//1 pistol
//2 rp
//3 only weapons
//5 only magazines

//dap_flashlight

ammo_minimal = [
	[[],["VIL_PYA","VIL_17Rnd_9x19_PYA"],[],["Binocular"],[]],
	[[],["Makarov","8Rnd_9x18_Makarov"],[],["Binocular"],[]],
	[[],["VIL_TT33","VIL_8Rnd_TT"],[],["Binocular"],[]],
	[[],["VIL_APS","VIL_20Rnd_9x18_aps"],[],["Binocular"],[]],
	[[],["revolver_EP1","6Rnd_45ACP"],[],["Binocular"],[]]
];
ammo_easy = [
	//[["Sa61_EP1","10Rnd_B_765x17_Ball"],["VIL_TT33","VIL_8Rnd_TT"],[],["Binocular"],[]],
	//[["UZI_EP1","30Rnd_9x19_MP5"],["VIL_TT33","VIL_8Rnd_TT"],[],["Binocular"],[]],
	[["VIL_MPi","30Rnd_762x39_AK47"],["VIL_TT33","VIL_8Rnd_TT"],[],["Binocular"],[]],
	[["VIL_AKS_47","30Rnd_762x39_AK47"],["VIL_APS","VIL_20Rnd_9x18_aps"],[],["Binocular"],[]],
	[["VIL_AKS_74p","vil_45Rnd_545x39_AK"],["Makarov","8Rnd_9x18_Makarov"],[],["Binocular"],[]],
	[["VIL_AKS_74_u","30Rnd_545x39_AK"],["VIL_PYA","VIL_17Rnd_9x19_PYA"],[],["Binocular"],[]],
	[["VIL_SKS","VIL_10Rnd_762x39_SKS"],["VIL_PYA","VIL_17Rnd_9x19_PYA"],[],["Binocular"],[]],
	[["VIL_M70","30Rnd_762x39_AK47"],["VIL_PYA","VIL_17Rnd_9x19_PYA"],[],["Binocular"],[]],
	[["MP5A5","30rnd_9x19_MP5SD"],["Makarov","8Rnd_9x18_Makarov"],[],["Binocular"],[]],
	[["Saiga12K","8Rnd_B_Saiga12_74Slug"],["Makarov","8Rnd_9x18_Makarov"],[],["Binocular"],[]]
];
ammo_medium = [
	[["VIL_AK_74P","30Rnd_545x39_AKSD"],["VIL_TT33","VIL_8Rnd_TT"],[],["Binocular"],[]],
	[["VIL_AKS_74p_GP","30Rnd_545x39_AKSD"],["VIL_TT33","VIL_8Rnd_TT"],[],["Binocular"],["1Rnd_HE_GP25","1Rnd_HE_GP25","1Rnd_HE_GP25","1Rnd_HE_GP25"]],
	[["VIL_AK_74","30Rnd_545x39_AKSD"],["VIL_TT33","VIL_8Rnd_TT"],[],["Binocular"],[]],
	[["AKS_74_PSO","30Rnd_545x39_AKSD"],["VIL_PYA","VIL_17Rnd_9x19_PYA"],[],["Binocular"],[]],
	[["VIL_AK_74M_p29","30Rnd_545x39_AKSD"],["VIL_TT33","VIL_8Rnd_TT"],[],["Binocular"],[]],
	[["VIL_AK_74M_GP_29","30Rnd_545x39_AKSD"],["VIL_TT33","VIL_8Rnd_TT"],[],["Binocular"],["1Rnd_HE_GP25","1Rnd_HE_GP25","1Rnd_HE_GP25","1Rnd_HE_GP25"]],
	[["VIL_AKMS","vil_40Rnd_762x39_AK47"],["VIL_TT33","VIL_17Rnd_9x19_PYA"],[],["Binocular"],[]],
	[["VIL_AKM_GL","30Rnd_762x39_AK47"],["VIL_TT33","VIL_8Rnd_TT"],[],["Binocular"],["1Rnd_HE_GP25","1Rnd_HE_GP25","1Rnd_HE_GP25","1Rnd_HE_GP25"]],
	[["AK_47_S","30Rnd_762x39_AK47"],["VIL_APS","VIL_20Rnd_9x18_aps"],[],["Binocular"],[]],
	[["AK_74","30Rnd_545x39_AKSD"],["VIL_PYA","VIL_17Rnd_9x19_PYA"],[],["Binocular"],[]],
	[["SVD","10Rnd_762x54_SVD"],["Makarov","8Rnd_9x18_Makarov"],[],["Binocular"],[]],
	[["VIL_SVD_M","10Rnd_762x54_SVD"],["Makarov","8Rnd_9x18_Makarov"],[],["Binocular"],[]],
	[["VIL_SVU","10Rnd_762x54_SVD"],["Makarov","8Rnd_9x18_Makarov"],[],["Binocular"],[]],
	[["M4A1","30Rnd_556x45_StanagSD"],["VIL_PYA","VIL_17Rnd_9x19_PYA"],[],["Binocular"],[]],
	[["M16A2","30Rnd_556x45_StanagSD"],["VIL_TT33","VIL_8Rnd_TT"],[],["Binocular"],[]],
	[["M16A2","30Rnd_556x45_Stanag"],["VIL_APS","VIL_20Rnd_9x18_aps"],[],["Binocular","NVGoggles"],[]],
	[["M4A1_AIM","30Rnd_556x45_Stanag"],["VIL_APS","VIL_20Rnd_9x18_aps"],[],["Binocular","NVGoggles"],[]],
	[["M4A1","30Rnd_556x45_Stanag"],["VIL_APS","VIL_20Rnd_9x18_aps"],[],["Binocular","NVGoggles"],[]],
	[["M16A4_GL","30Rnd_556x45_Stanag"],["VIL_APS","VIL_20Rnd_9x18_aps"],[],["Binocular","NVGoggles"],["1Rnd_HE_M203","1Rnd_HE_M203","1Rnd_HE_M203","1Rnd_HE_M203"]],
	[["G36C","30Rnd_556x45_Stanag"],["VIL_APS","VIL_20Rnd_9x18_aps"],[],["Binocular","NVGoggles"],[]],
	[["G36K","30Rnd_556x45_Stanag"],["VIL_APS","VIL_20Rnd_9x18_aps"],[],["Binocular","NVGoggles"],[]],
	[["M24","5Rnd_762x51_M24"],["VIL_APS","VIL_20Rnd_9x18_aps"],[],["Binocular","NVGoggles"],[]]
];
ammo_mil = [
	[["VIL_AK_74M","30Rnd_545x39_AKSD"],["VIL_TT33","VIL_8Rnd_TT"],["VIL_RPG7V_PGO", "VIL_PGO_PG7VR"],["Binocular","NVGoggles"],[]],
	[["VIL_AK_74M_PSO","30Rnd_545x39_AKSD"],["VIL_PYA","VIL_17Rnd_9x19_PYA"],[],["Binocular","NVGoggles"],[]],
	[["AK_107_PSO","30Rnd_545x39_AKSD"],["Makarov","8Rnd_9x18_Makarov"],[],["Binocular","NVGoggles"],[]],
	[["VIL_AKS_74p_GP", "30Rnd_545x39_AKSD"],["VIL_TT33","VIL_8Rnd_TT"],["RPG7V","OG7"],["Binocular","NVGoggles"],[]],
	[["vil_RPK75","vil_40Rnd_762x39_AK47"],[],[],["Binocular","NVGoggles"],[]],
	[["VIL_RPK74M","VIL_45Rnd_545x39_AK"],[],[],["Binocular","NVGoggles"],[]],
	[["PK","100Rnd_762x54_PK"],[],[],["Binocular","NVGoggles"],[]],
	[["VIL_SVD_M","10Rnd_762x54_SVD"],[],[],["Binocular","NVGoggles"],[]],
	[["VIL_SV_98_SD","VIL_10Rnd_762x54_SV"],[],[],["Binocular","NVGoggles"],[]],
	[["VSS_Vintorez","20Rnd_9x39_SP5_VSS"],[],[],["Binocular","NVGoggles"],[]],
	[["VIL_VSS_PSO","20Rnd_9x39_SP5_VSS"],[],[],["Binocular","NVGoggles"],[]],
	[["VIL_VAL","20Rnd_9x39_SP5_VSS"],[],[],["Binocular","NVGoggles"],[]],
	[["AK_74_GL","30Rnd_545x39_AKSD"],["VIL_PYA","VIL_17Rnd_9x19_PYA"],[],["Binocular","NVGoggles"],["1Rnd_HE_GP25","FlareRed_GP25","FlareWhite_GP25","1Rnd_SMOKE_GP25"]]	
];

private ["_unit", "_assembly", "_pack", "_muzzles"];

_unit = _this select 0;
_assembly = _this select 1;

/*fix for stalkers*/
if(_unit call fz_sfx_isStalker)then{
	_unit setVariable ["DAP_ST_GEAR_NORANDOM", 1];
	
	_unit execFSM "core\misc\flashlight.fsm";
	_unit setVariable ["flashlight_on", true, true];
	
	_unit addBackPack (FZ_BACKPACKS select floor random count FZ_BACKPACKS);
};

removeallweapons _unit;
{_unit removemagazine _x} foreach magazines _unit;

_pack = nil;

switch (_assembly)do{
	case "ammo_minimal":{
		_pack = ammo_minimal select (floor random (count ammo_minimal));	
	};
	case "ammo_easy":{
		_pack = ammo_easy select (floor random (count ammo_easy));	
	};
	case "ammo_medium":{
		_pack = ammo_medium select (floor random (count ammo_medium));	
	};
	case "ammo_mil":{
		_pack = ammo_mil select (floor random (count ammo_mil));	
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