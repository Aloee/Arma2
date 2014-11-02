waitUntil{!(isNil "BIS_MPF_InitDone")};

player allowdamage false;
onMapSingleClick "player setpos _pos";

//[getpos player, 3000] execVM "DAPSURGE\Scripts\Surge.sqf";

FZ_MILITARY_UNITS = [
	"CDF_Soldier", "CDF_Soldier_MG", "CDF_Commander"
];

FZ_FREEDOM_UNITS = [
	"gsc_eco_stalker_mask_camo2","gsc_freedom_leader_head","gsc_freedom_recon_head","gsc_freedom_sniper_head",
	"gsc_eco_stalker_mask_fred2","gsc_freedom_leader_mask","gsc_freedom_recon_mask","gsc_freedom_sniper_mask",
	"gsc_eco_stalker_mask_camo2_b","gsc_freedom_leader_head_b","gsc_freedom_recon_head_b","gsc_freedom_sniper_head_b"
];

FZ_DUTY_UNITS = [
	"gsc_eco_stalker_head_duty_b","gsc_dolg_leader_head_b","gsc_dolg_recon_head_b","gsc_dolg_sniper_head_b",
	"gsc_eco_stalker_mask_duty","gsc_dolg_leader_mask","gsc_dolg_recon_mask","gsc_dolg_sniper_mask",
	"gsc_eco_stalker_head_duty","gsc_dolg_leader_head","gsc_dolg_recon_head","gsc_dolg_sniper_head"
];

FZ_ZOMBIED_UNITS = [
	"bloodsucker", "gsc_eco_stalker_head_duty_z","MVD_Soldier_z","Doctor_z","Citizen4_z","Citizen1_z","Citizen3_z",
	"Citizen2_z","Villager3_z","Villager2_z","Villager1_z","Villager4_z","Woodlander4_z","Woodlander3_z",
	"Woodlander2_z","Woodlander1_z","Policeman_z","RU_Soldier_Officer_z","Pilot_z","Assistant_z","Worker2_z",
	"Worker4_z","Worker1_z","Worker3_z","RUS_Soldier_z","Rocker4_z","Rocker2_z","Rocker3_z","Rocker1_z",
	"Priest_z","gsc_eco_stalker_head_duty_z","gsc_eco_stalker_mask_fred_z","gsc_eco_stalker_mask_camo_z",
	"gsc_eco_stalker_mask_camo2_z","gsc_eco_stalker_mask_camo2_z"
];

	execVM "fx.sqf";
	
if(isServer)then{
	civilianCenter = createCenter civilian;
	militaryCenter = createCenter east;
	dutyCenter = createCenter west;
	freedomCenter = createCenter resistance;
	enemyCenter = createCenter sideEnemy;
	logicCenter = createCenter sideLogic;
	 
	LOGICGRP = createGroup (createCenter sideLogic);

	freedomCenter setFriend [civilianCenter, 0];
	freedomCenter setFriend [militaryCenter, 0];
	freedomCenter setFriend [dutyCenter, 0];
	
	militaryCenter setFriend [civilianCenter, 0];
	militaryCenter setFriend [freedomCenter, 0];
	militaryCenter setFriend [dutyCenter, 0];
	
	dutyCenter setFriend [civilianCenter, 0];
	dutyCenter setFriend [freedomCenter, 0];
	dutyCenter setFriend [militaryCenter, 0];
	
	civilianCenter setFriend [freedomCenter, 0];
	civilianCenter setFriend [militaryCenter, 0];
	civilianCenter setFriend [dutyCenter, 0];

	
	PRECMPL_BIS_TASKPATROL = compile preprocessFileLineNumbers "patrols\BIS_taskPatrol.sqf";
	PRECMPL_CREATEPATROLS = compile preprocessFileLineNumbers "patrols\create_patrols.sqf";
	PRECMPL_PATROLWEAPLOAD = compile preprocessFileLineNumbers "patrols\patrol_weapload.sqf";
	PRECMPL_DSAYER = compile preprocessFileLineNumbers "dsayer\sayer.sqf";
	PRECMPL_DEADGROUPS = compile preprocessFileLineNumbers "deadGrp.sqf";

	#include "zombies\init.sqf";
	
	CLY_debug = true;
	UPS_Debug = 1;
	
	FZ_MAX_ZOMBIE_COUNT = 250;
	FZ_ABONDED_DIST = 100;

	FZ_ZONES = [];
	FZ_ZOMBIES = [];
	FZ_DEAD_BODYS = [];
	FZ_BROK_VEHICLES = [];
	
	FZ_DELAY_BODY_REMOVE = 30;
	FZ_DELAY_BROKEN_VEHICLE_REMOVE = 30;
	
	FZ_DELAY_RESPAWN_PATROLS = 60;
	FZ_DELAY_RESPAWN_DEFENSE = 60;
	FZ_DELAY_RESPAWN_VEHICLES = 60;
	
	execVM "sfx.sqf";
	execVM "z_eye.sqf";
	execVM "z_garbage.sqf";
	execVM "checkGrps.sqf";

	
	[
		[freedomCenter, ["gsc_eco_stalker_mask_camo2","gsc_freedom_leader_head","gsc_freedom_recon_head"], getMarkerPos "scient_area_1", "medium_stalker", 50, false]		
	] call PRECMPL_CREATEPATROLS;
	
	[
		[dutyCenter, ["gsc_eco_stalker_head_duty_b","gsc_dolg_leader_head_b","gsc_dolg_recon_head_b","gsc_dolg_sniper_head_b"], getMarkerPos "scient_area",  "medium_stalker", 50, false]
	] call PRECMPL_CREATEPATROLS;
	
	[
		[militaryCenter, ["CDF_Soldier", "CDF_Soldier_MG", "CDF_Commander","CDF_Soldier", "CDF_Soldier_MG","CDF_Soldier", "CDF_Soldier_MG"], getMarkerPos "scient_area_2",  "military", 50, false]
	] call PRECMPL_CREATEPATROLS;
	// _group1 = createGroup resistance;
	// _battery = _group1 createUnit ["DAP_ZOMBIEDCIVILIANS_MODULE", getpos player , [], 0, ""];
	
};
	execVM "z_anomalies.sqf";
	
if(local player)then{	

	waitUntil{!isNull (findDisplay 46)};
	keyspressed = compile preprocessFile "keyspressed.sqf";
	_displayID = (findDisplay 46) displaySetEventHandler ["KeyDown","_this call keyspressed"];
	
	player execfsm "flashlight.fsm";
	_dw = [] execVM "DynamicWeatherEffects.sqf";
};

