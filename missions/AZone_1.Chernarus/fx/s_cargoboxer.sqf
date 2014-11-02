if(!isServer && !isDedicated)exitwith{};
_vehicle = _this select 0;

[nil,nil,"per",rclearMagazineCargo, _vehicle] call RE;
[nil,nil,"per",rclearWeaponCargo, _vehicle] call RE;

magz_boxs = [
	[["30Rnd_545x39_AKSD",50],["30Rnd_762x39_AK47",30],["75Rnd_545x39_RPK", 30],["10Rnd_762x54_SVD",30]],
	[["30Rnd_556x45_Stanag",100],["20Rnd_9x39_SP5_VSS",30],["PG7V",10],["Strela",5],["MineE",10]],
	[["100Rnd_762x54_PK",30],["10Rnd_762x54_SVD",20],["30Rnd_545x39_AKSD",30],["30Rnd_762x39_AK47",50],["100Rnd_762x51_M240",20],["7Rnd_45ACP_1911",20]]
];
weap_boxs = [
	[["AK_107_Kobra",10],["AK_107_PSO",5],["SVD_Camo",5],["RPK_74",5]],
	[["M4A1",10],["VSS_Vintorez",5],["Strela",5],["RPG7V",3]],
	[["Pecheneg",3],["SVD",5],["AK_107_PSO",10],["AK_47_S",20],["M240",2],["Colt1911",5]]
	
];
_rand = floor (random count weap_boxs);
{
				
	_type = _x select 0;
	_count = _x select 1;				
	[nil,nil,"per",raddWeaponCargo, _vehicle, _type, _count] call RE;
					
}foreach (weap_boxs select _rand);
			
{
				
	_type = _x select 0;
	_count = _x select 1;				
	[nil,nil,"per",raddMagazineCargo, _vehicle, _type, _count] call RE;
					
}foreach (magz_boxs select _rand);