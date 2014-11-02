if(!isDedicated && !isServer)exitWith{};
_track = if(UPS_Debug == 1)then{"track"}else{"notrack"};
//initialize main bases objects
/* TEST BLOCK 
[
	[east, ["Ins_Soldier_2", "Ins_Soldier_MG", "Ins_Soldier_Sab","Ins_Soldier_2", "Ins_Soldier_MG", "Ins_Soldier_Sab"], "aitest", "easy_stalker",  [_track,"randomdn","FOLLOW"], 100]
] call PRECMPL_CREATEPATROLS;
*/
//-------------------------------------------MILITARY_BASE
//-------------------------defense

[
	["Mi24_D","mil_post1_helich", 250, 0, west, true, true, 5000]	
] call PRECMPL_CREATEDEFENCE;

//-------------------------------------------------------------------------------------------------------------DOLG_BASE
[
	["BMP2_INS", "dolg_post1_3p", 180, 0, east, true, false, 0]
] call PRECMPL_CREATEDEFENCE;
[
	[east, ["Ins_Soldier_MG", "Ins_Soldier_Sniper","Ins_Soldier_GL", "Ins_Soldier_2","Ins_Soldier_MG"], "dolg_area", "easy_stalker",  [_track,"randomdn","nofollow"], 200]
] call PRECMPL_CREATEPATROLS;

//------------------------------------------------------------------------------------------------------------SVOBODA_BASE
//-------------------------defense

[
	["ZSU_CDF", "svo_post1_3p", 260, 0, resistance, true, false, 0]
] call PRECMPL_CREATEDEFENCE;
[
	[resistance, ["GUE_Soldier_2", "GUE_Soldier_1","GUE_Soldier_3", "GUE_Soldier_MG", "GUE_Soldier_2"], "svoboda_area", "easy_stalker",  [_track,"randomdn","nofollow"], 200]
] call PRECMPL_CREATEPATROLS;

//------------------------------------------------------------------------------------------------------------SCIENTS_BASE
/*
[
	["KORD_high", "scient_post1_1p", 235, 2.5, cordon_staticGrp, true],
	["KORD_high", "scient_post1_2p", 230, 2.5, cordon_staticGrp, true],
	["KORD_high", "scient_post1_3p", 50, 2.5, cordon_staticGrp, true],
	["SearchLight", "scient_post2_1p", 355, 2.5, cordon_staticGrp, true],
	["SearchLight", "scient_post2_2p", 355, 2.5, cordon_staticGrp, true],
	["SearchLight", "scient_post2_3p", 85, 2.5, cordon_staticGrp, true],
	["SearchLight", "scient_post2_4p", 215, 2.5, cordon_staticGrp, true]
] call PRECMPL_CREATESTATIC;

[
	[civilian, ["FR_Commander", "FR_Corpsman", "FR_Miles"], "scient_area", "mercenaries",  [_track,"randomdn","nofollow"], 200],
	[civilian, ["FR_Corpsman", "FR_Assault_GL", "FR_Assault_R", "FR_Miles"], "scient_area",  "mercenaries",[_track,"randomdn","nofollow"], 200]	
] call PRECMPL_CREATEPATROLS;

*/
//-------------------------------------------City12
[
	["BTR90", "City12_area", 270, 0, west, true, true, 1000],
	["BMP3", "City12_area", 105, 0, west, true, true, 1000]
] call PRECMPL_CREATEDEFENCE;

[
	[west, ["CDF_Commander", "CDF_Soldier_MG","CDF_Soldier_Marksman", "CDF_Soldier_Medic","CDF_Soldier_MG"], "City12_area", "military", [_track,"randomdn","follow"], 300],
	[west, ["CDF_Commander", "CDF_Soldier_TL","CDF_Soldier_Engineer", "CDF_Soldier_Medic","CDF_Soldier_MG"], "City12_area", "military", [_track,"randomdn","follow"], 800],
	[west, ["CDF_Commander", "CDF_Soldier_TL","CDF_Soldier_Engineer", "CDF_Soldier_Medic", "CDF_Soldier_MG"], "City33_area", "military", [_track,"randomdn","follow"], 500]
] call PRECMPL_CREATEPATROLS;

//-------------------------------------------City35
[
	["BTR90", "City35_area", 140, 0, west, true, true, 1000],
	["BRDM2_CDF", "City35_area", 309, 0, west, true, true, 1000]
]  call PRECMPL_CREATEDEFENCE;
[
	[west, ["CDF_Commander", "CDF_Soldier_MG","CDF_Soldier_Marksman", "CDF_Soldier_Medic", "CDF_Soldier_MG"], "City35_area", "military", [_track,"randomdn","follow"], 300],
	[west, ["CDF_Commander", "CDF_Soldier_TL","CDF_Soldier_Engineer", "CDF_Soldier_Medic", "CDF_Soldier_MG"], "City35_area", "military", [_track,"randomdn","follow"], 800],
	[west, ["CDF_Commander", "CDF_Soldier_TL","CDF_Soldier_Engineer", "CDF_Soldier_Medic", "CDF_Soldier_MG"], "City33_area", "military", [_track,"randomdn","follow"], 500]	
]  call PRECMPL_CREATEPATROLS;

//-------------------------------------------City33
[
	["T72_CDF", "City33_area", 140, 0, west, true, true, 1000],
	["BRDM2_CDF", "City33_area", 309, 0, west, true, true, 1000]
]  call PRECMPL_CREATEDEFENCE;
[
	[west, ["CDF_Commander", "CDF_Soldier_MG","CDF_Soldier_Marksman", "CDF_Soldier_Medic", "CDF_Soldier_MG"], "City33_area", "military", [_track,"randomdn","follow"], 300],
	[west, ["CDF_Commander", "CDF_Soldier_TL","CDF_Soldier_Engineer", "CDF_Soldier_Medic", "CDF_Soldier_MG"], "City33_area", "military", [_track,"randomdn","follow"], 800],	
	[west, ["CDF_Commander", "CDF_Soldier_TL","CDF_Soldier_Engineer", "CDF_Soldier_Medic", "CDF_Soldier_MG"], "City33_area", "military", [_track,"randomdn","follow"], 500]	
]  call PRECMPL_CREATEPATROLS;
/*
//------------------------------------------------------------------------------------------------------------CORDON_BASE

[
	["BMP2_CDF", "cordon_post1_3p", 180, 0, civilian, true, false, 0]
] call PRECMPL_CREATEDEFENCE;

[
	["Fort_Nest_M240", "cordon_post1_4p", 180, 0, cordon_staticGrp, true],
	["DSHKM_Ins", "cordon_post1_5p", 180, 4, cordon_staticGrp, true],
	["SearchLight", "cordon_search4", 90, 4.2, cordon_staticGrp, true],
	["SearchLight", "cordon_search3", 90, 0, cordon_staticGrp, true],
	["SearchLight", "cordon_search1", 180, 0, cordon_staticGrp, true],
	["SearchLight", "cordon_search2", 180, 0, cordon_staticGrp, true]
] call PRECMPL_CREATESTATIC;

[
	[civilian, ["Worker4", "Worker3", "Worker1"], "kardon_area", "easy_stalker",  [_track,"randomdn","nofollow"], 200],
	[civilian, ["Worker2", "Villager4", "Villager3", "Villager2"], "kardon",  "easy_stalker",[_track,"randomdn","nofollow"], 200]	
] call PRECMPL_CREATEPATROLS;

//------------------------------------------------------------------------------------------------------------BANDITS_BASE

[
	["KORD_high", "band_post1_1p", 210, 0, cordon_staticGrp, true],
	["KORD_high", "band_post1_2p", 210, 0, cordon_staticGrp, true],
	["SearchLight", "band_search3", 180, 0, cordon_staticGrp, true],
	["SearchLight", "band_search1", 180, 0, cordon_staticGrp, true],
	["SearchLight", "band_search4", 240, 0, cordon_staticGrp, true],
	["SearchLight", "band_search2", 0, 0,  cordon_staticGrp, true]
] call PRECMPL_CREATESTATIC;
*/
[
	[west, ["Profiteer1", "Profiteer1", "INS_Lopotev"], "band_area_1", "easy_stalker",  [_track,"randomdn","follow"], (getMarkerSize "band_area_1") select 0],
	[west, ["INS_Lopotev", "Profiteer1", "Profiteer1"], "band_area_2", "easy_stalker",  [_track,"randomdn","follow"], (getMarkerSize "band_area_2") select 0],
	[west, ["INS_Lopotev", "Profiteer1", "Profiteer2", "Profiteer3"], "band_area_0", "easy_stalker",  [_track,"randomdn","nofollow"], (getMarkerSize "band_area_0") select 0],
	[west, ["Profiteer2", "Profiteer3", "Profiteer1"], "band_area_3", "easy_stalker",  [_track,"randomdn","follow"], (getMarkerSize "band_area_3") select 0]
] call PRECMPL_CREATEPATROLS;

/*
test
*/
[
	[west, ["Profiteer2", "Profiteer3", "Profiteer1"], "test_area", "easy_stalker",  [_track,"randomdn","follow"], (getMarkerSize "test_area") select 0]
] call PRECMPL_CREATEPATROLS;