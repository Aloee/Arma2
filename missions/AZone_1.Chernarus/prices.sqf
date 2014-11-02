weaponsParts_price = [

	["makarovSilencer", 1500], //0
	["bizonSilencer", 2500], //1
	["m9Silencer", 1500], //2
	["aks74uSilencer", 2000], //3
	["M4A1CamoSilencer", 2500], //4
	["MP5Silencer", 2000], //5
	["CSKobra", 2500], //6
	["PSO1", 3500], //7
	["GP25", 4500], //8
	["SDeotech", 4000], //9
	["Aim", 2500], //10
	["m8GL", 5500], //11
	["m16GL", 5000], //12
	["ACG", 4000], //13
	["1PN51", 4300], //14
	
	["flashlight", 250],
	["radiationDetector", 1200]
	
];

weapons_price = [
	//eq
	["Binocular", 500],
	["ItemCompass", 500],
	["ItemGPS", 1500],
	["ItemMap", 100],
	["ItemRadio", 2000],
	["ItemWatch", 500],
	["NVGoggles", 6000],
	//en
	["M16A2", 7000],
	["M16A2GL", 7000 + ((weaponsParts_price select 12) select 1)],
	["m16a4", 8000],
	["M16A4_GL", 8000 + ((weaponsParts_price select 12) select 1)],
	["m16a4_acg", 8000 + ((weaponsParts_price select 13) select 1)],
	["M16A4_ACG_GL", 8000 + ((weaponsParts_price select 12) select 1) + ((weaponsParts_price select 13) select 1)],
	["M4A1", 6500],
	["M4A1_AIM", 6500 + ((weaponsParts_price select 10) select 1)],
	["M4A1_AIM_CAMO", 6500 + ((weaponsParts_price select 10) select 1)],
	["M4A1_RCO_GL", 6500 + ((weaponsParts_price select 12) select 1)],
	["M4A1_AIM_SD_CAMO", 6500 + ((weaponsParts_price select 4) select 1)],
	["M4A1_HWS_GL", 7500 + ((weaponsParts_price select 12) select 1)],
	["M4A1_HWS_GL_CAMO", 7500 + ((weaponsParts_price select 12) select 1)],
	["M4A1_HWS_GL_SD_CAMO", 7500 + ((weaponsParts_price select 12) select 1) + ((weaponsParts_price select 4) select 1)],
	["M4SPR", 14000],
	["m8_Carbine", 9000  ],
	["m8_CarbineGL", 9000 + ((weaponsParts_price select 11) select 1)],
	["m8_Compact", 7500],
	["M8_SAW", 13000],
	["G36A", 10000],
	["G36K", 10000],
	["G36C", 7500],
	["G36_C_SD_Eotech", 7500 + ((weaponsParts_price select 9) select 1)],
	["MG36", 15000],
	["DMR", 17000],
	["MP5A5", 3500],
	["MP5SD", 3500 + ((weaponsParts_price select 5) select 1)],
	["M249", 16000],
	["M240", 15000],
	["MK_48", 18000],
	["M24", 19000],
	["M40A3", 20000],
	["m107", 22000],
	["M1014", 4000],
	["Colt1911", 2500],
	["M9", 2500],
	["M9SD", 2500 + ((weaponsParts_price select 2) select 1)],
	["M136", 10000],
	["SMAW", 15000],
	["Javelin", 20000],
	["Stinger", 25000],

	//rus
	["Saiga12K", 3500],
	["AK_47_S", 4500],
	["AK_47_M", 4500],
	["AK_74_GL", 5500 + ((weaponsParts_price select 8) select 1)],
	["AK_74", 5500],
	["AKS_74_Kobra", 4500 + ((weaponsParts_price select 6) select 1)],
	["AKS_74_PSO", 5500 + ((weaponsParts_price select 7) select 1)],
	["AKS_74_U", 4300],
	["AKS_74_UN_Kobra", 4300 + ((weaponsParts_price select 6) select 1)],
	["RPK_74", 8000],
	["PK", 12000],
	["SVD", 13000],
	["Makarov", 2000],
	["MakarovSD", 2000 + ((weaponsParts_price select 0) select 1)],
	["RPG7V", 12000],
	["RPG18", 10000],
	["Strela", 24000],
	["huntingrifle", 14000],
	["AK_107_Kobra", 6500],
	["AK_107_GL_Kobra", 6500 + ((weaponsParts_price select 8) select 1)],
	["AK_107_PSO", 6500 + ((weaponsParts_price select 7) select 1)],
	["AK_107_GL_PSO", 6500 + ((weaponsParts_price select 7) select 1) + ((weaponsParts_price select 8) select 1)],
	["bizon", 5000],
	["Bizon_Silenced", 5000 + ((weaponsParts_price select 1) select 1)],
	["Pecheneg", 18000 + ((weaponsParts_price select 14) select 1)],
	["SVD_Camo", 13500],
	["ksvk", 20000],
	["VSS_Vintorez", 11000],
	["MetisLauncher", 27000],
	["Igla", 30000]

];

magazines_price = [

	["30Rnd_545x39_AK", 100],
	["30Rnd_545x39_AKSD", 100],
	["30Rnd_762x39_AK47", 80],
	["64Rnd_9x19_Bizon", 150],
	["64Rnd_9x19_SD_Bizon", 150],
	["5Rnd_127x108_KSVK", 50],
	["10Rnd_9x39_SP5_VSS", 50],
	["20Rnd_9x39_SP5_VSS", 100],
	["8Rnd_B_Saiga12_74Slug", 40],
	["8Rnd_B_Saiga12_Pellets ", 40],
	["75Rnd_545x39_RPK", 250],
	["100Rnd_762x54_PK", 300],
	["10Rnd_762x54_SVD", 50],
	["8Rnd_9x18_Makarov", 20],
	["8Rnd_9x18_MakarovSD", 20],
	["RPG18 ", 1500],
	["AT13 ", 6000],
	["Igla ", 7000],
	["PG7V", 2000],
	["PG7VL", 3000],
	["PG7VR", 3500],
	["OG7", 2500],
	["Strela", 5000],
	["5x_22_LR_17_HMR", 50],

	
	["20Rnd_556x45_Stanag", 80],
	["30Rnd_556x45_Stanag", 100],
	["30Rnd_556x45_StanagSD", 100],
	["30Rnd_556x45_G36", 100],
	["30Rnd_556x45_G36SD", 100],
	["100Rnd_556x45_BetaCMag", 300],
	["20Rnd_762x51_DMR", 100],
	["30rnd_9x19_MP5", 60],
	["30rnd_9x19_MP5SD", 60],
	["200Rnd_556x45_M249", 600],
	["100Rnd_762x51_M240", 300],
	["5Rnd_762x51_M24", 50],
	["10Rnd_127x99_M107", 100],
	["8Rnd_B_Beneli_74Slug", 30],
	["7Rnd_45ACP_1911", 30],
	["15Rnd_9x19_M9", 35],
	["15Rnd_9x19_M9SD", 35],
	["M136", 3500],
	["SMAW_HEAA", 5500],
	["SMAW_HEDP", 5500],
	["Javelin", 6500],
	["Stinger", 6000],

	
	["FlareWhite_GP25", 20],
	["FlareGreen_GP25", 20],
	["FlareRed_GP25", 20],
	["FlareYellow_GP25", 20],
	["1Rnd_SMOKE_GP25", 30],
	["1Rnd_SMOKERED_GP25", 30],
	["1Rnd_SMOKEGREEN_GP25", 30],
	["1Rnd_SMOKEYELLOW_GP25", 30],
	["1Rnd_HE_GP25", 50],
	["FlareWhite_M203", 20],
	["FlareGreen_M203", 20],
	["FlareRed_M203", 20],
	["FlareYellow_M203", 20],
	["1Rnd_HE_M203", 50],
	["1Rnd_Smoke_M203", 30],
	["1Rnd_SmokeRed_M203", 30],
	["1Rnd_SmokeGreen_M203", 30],
	["1Rnd_SmokeYellow_M203", 30],
	
	["PipeBomb", 1000],
	["Mine", 500],
	["SmokeShell", 150],
	["SmokeShellYellow", 150],
	["SmokeShellRed", 150],
	["SmokeShellGreen", 150],
	["SmokeShellPurple", 150],
	["SmokeShellBlue", 150],
	["SmokeShellOrange", 150],
	["HandGrenade", 250]

];

vehicles_price = [

	["TT650_Civ", 5000],
	["TT650_Ins", 5000],
	["TT650_Gue", 5000],
	["M1030", 5500],
	["MMT_USMC", 1500],
	["hilux1_civil_3_open", 25000],
	["hilux1_civil_2_covered", 25000],
	["datsun1_civil_3_open", 20000],
	["datsun1_civil_2_covered", 20000],
	["datsun1_civil_1_open", 23000],
	["Lada2", 15000],
	["car_hatchback", 13000],
	["VWGolf", 55000],
	["SkodaRed", 10000],
	["SkodaGreen", 10000],
	["Skoda", 10000],
	["SkodaBlue", 10000],
	["Pickup_PK_INS", 25000],
	["Pickup_PK_GUE", 25000],
	["Offroad_DSHKM_Ins", 35000],
	["Offroad_SPG9_Gue", 40000],
	["Offroad_DSHKM_Gue", 35000],
	["GAZ_Vodnik_HMG", 75000],
	["BRDM2_GUE", 86000],
	["UAZ_SPG9_INS", 35000],
	["UAZ_MG_INS", 26000],
	["UAZ_AGS30_INS", 28000],
	["UAZ_CDF", 22000],
	["UAZ_INS", 21000],
	["UAZ_RU", 23000],
	["HMMWV", 33000],
	["HMMWV_Ambulance", 36000],
	["HMMWV_Armored", 47000],
	["BMP2_Ambul_INS", 56000],
	["BMP2_Ambul_CDF", 56000],
	["BMP2_HQ_CDF", 63000],
	["BMP2_HQ_INS", 63000],
	["BRDM2_HQ_Gue", 55000],
	["BTR90_HQ", 85000]
	
];

artefacts_price = [
	
	["BLACKDRIP", 5000],
	["GRAVI", 6000],
	["EMPTY", 5000],
	["AMEBA", 7000],
	["CRYSTALL", 5000],
	["STONEBLOOD", 9000],
	["MEAT", 6000],
	["SOUL", 8000],
	["ELECTRA", 5000],
	["SPIKES", 8000],
	["BATTERY", 3000]
	
];

stuff_price = [
	
	["milDocuments", 10000],
	["scientsDevice", 3000]
	
];

work_price = [
	
	["sabotage", 20000],
	["capture", 10000],
	["cleanse", 10000],
	["mounting", 3000]
	
];

_costRatio = 0.7;
{
	_i = 0;
	_xx = _x;
	{
		_xx set [_i, [(_xx select _i) select 0, ((_xx select _i) select 1) * _costRatio]];
		_i = _i + 1;
	}foreach _xx;
}foreach [weaponsParts_price, weapons_price, magazines_price, vehicles_price];