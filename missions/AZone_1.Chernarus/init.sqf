//player setCaptive true;
//player allowdamage false;
//onMapSingleClick "player setpos _pos";


if(isServer || isDedicated)then{
	/* DEBAGS */
	CLY_debug=false; //show zombies markers
	Z_TRACERWAY =false;
	UPS_Debug = 0; //show UPS patrols markers

	resistance setFriend [civilian, 1];
	resistance setFriend [east, 0];
	resistance setFriend [west, 0];
	
	east setFriend [civilian, 1];
	east setFriend [resistance, 0];
	east setFriend [west, 0];
	
	west setFriend [civilian, 1];
	west setFriend [resistance, 0];
	west setFriend [east, 0];
	
	civilian setFriend [resistance, 1];
	civilian setFriend [east, 1];
	civilian setFriend [west, 1];
	
	//PRECMPL frequently used
	//main
	PRECMPL_CREATEDEFENCE = compile preprocessFileLineNumbers "main\create_defense.sqf";
	PRECMPL_CREATEPATROLS = compile preprocessFileLineNumbers "main\create_patrols.sqf";
	PRECMPL_CREATESTATIC = compile preprocessFileLineNumbers "main\create_static.sqf";
	PRECMPL_UPS = compile preprocessFileLineNumbers  "patrols\ups.sqf";
	PRECMPL_PLAYERCONNECT = compile preprocessFileLineNumbers "storage\playerConnect.sqf";
	PRECMPL_DEADGROUPS = compile preprocessFileLineNumbers "main\dead_grp.sqf";
	PRECMPL_CLYZOMBIEINIT = compile preprocessFileLineNumbers "zombies\cly_z_init.sqf";
	PRECMPL_CLYZOMBIEROUT = compile preprocessFileLineNumbers "zombies\cly_z_routines.sqf";
	//fx
	PRECMPL_MOVESEARCH = compile preprocessFileLineNumbers "fx\movesearch.sqf";
	PRECMPL_ATTACKSAY = compile preprocessFileLineNumbers "fx\attack_say.sqf";
};
PRECMPL_PATROLWEAPLOAD = compile preprocessFileLineNumbers "main\patrol_weapload.sqf";

LOGICGRP = createGroup (createCenter sideLogic);
T_INIT = false;
T_Server = false; T_Client = false; T_JIP = false;

if (playersNumber east + playersNumber west + playersNumber resistance + playersNumber civilian > 0) then { T_MP = true } else { T_MP = false };

if (isServer) then
{
  T_Server = true;
  if (!(isNull player)) then { T_Client = true };
  T_INIT = true;
} else {
  T_Client = true;
  if (isNull player) then
  {
      T_JIP = true;
      [] spawn { waitUntil { !(isNull player) }; T_INIT = true };
  } else {
      T_INIT = true;
  };
};

waitUntil{T_INIT};
waitUntil{!(isNil "BIS_MPF_InitDone")};
//******************************************************************************

//for all
CORDON =[side player, "Papa_bear"];
INFORM =[side player, "Airbase"];

HABAR_STYLE = "Land_A_tent";
HQMARKERNAME = "HQMarker";
DYNAMIC_BLUR_BACKGROUND = false;
saveact = true;
camped = false;
habar = [0,0,0];
habars = [];
break_anomalies = false;
MIN_DIST_ACTIVATE_ANOMALIE = 500; //must be more all anomalies range
MIN_DIST_CAMPCITYS = 200; //min city distance deploy camp pos
MARKED_ANOMALIES_AFTERHIDE = 0; //sec or 0
NO_TK_ZONES = [];
NEUTRAL_ZONES = [];
anomalies_name = ["Burn", "Gravi", "Electro", "Mincer", "Psy", "Radiation"];
citys = [["City1",200],["City2",300],["City3",200],["City4",200],["City5",250],["City6",200],["City7",200],["City8",100],["City9",250],["City10",100],["City11",100],["City12",200],["City13",200],["City14",200],["City15",300],["City16",200],["City17",200],["City18",200],["City19",200],["City20",500],["City21",300],["City22",300],["City23",300],["City24",300],["City25",300],["City26",300],["City27",300],["City28",300],["City29",300],["City30",300],["City31",300],["City32",300],["City33",200],["City34",200],["City35",200],["City36",200],["City37",200]];
capturingLocations = ["location_greenm", "location_artdealer", "location_dump", "location_mil"]; 
s_players = ["SVOB1", "SVOB2", "SVOB3", "SVOB4", "SVOB5", "SVOB6", "SVOB7", "SVOB8", "SVOB9", "SVOB10", "SVOB11", "SVOB12", "SVOB13", "SVOB14", "SVOB15", "SVOB16", "SVOB18", "SVOB19", "SVOB20", "svotest", "svotest1"];
d_players = ["DOLG1", "DOLG2", "DOLG3", "DOLG4", "DOLG5", "DOLG6", "DOLG7", "DOLG8", "DOLG9", "DOLG10", "DOLG11", "DOLG12", "DOLG13", "DOLG14", "DOLG15", "DOLG16", "DOLG18", "DOLG19", "DOLG20"];

#include "l_functions.sqf";
#include "s_functions.sqf";


call fx_backgroundDynamicBlur;
[] execvm "fx\clear_map.sqf";

//for server
if(isDedicated || isServer)then{
		
	oClock = [17,30];
	OVERDUEACCOUNTDAYS = 90;
	ISSETANOMALIES = true;
	ANOMALIES_COUNT = 250;
	SURGE_PERIOD = 7200;//7200;
	SURGE_TIMEOUT = 30;
	MIN_RESPAWNS_DISTANCE_ANOMALIES = 300;
	
	DELAY_CREATEHABAR = 120;
	
	NO_ANOMALIES_MARKERS = ["respawn_east", "respawn_guerrila", "kardon_area", "markerAirport", "markerArtDealer", "markerJanky", "markerBandits", "markerBar", "markerScientists", "City1", "City2", "City3", "City4", "City5", "City6", "City7", "City8", "City9", "City10", "City11", "City12", "City13", "City14", "City15", "City16", "City17", "City18", "City19", "City20", "City21", "City22", "City23", "City24", "City25", "City26", "City27", "City28", "City29", "City30", "City31", "City32", "City33", "City34", "City35", "City36", "City37"];
	MARKED_ANOMALIES = false;
	
	MAX_ZOMBIE_COUNT = 75;
	ABONDED_DIST = 500;
	
	DELAY_BODY_REMOVE = 120;
	DELAY_BROKEN_VEHICLE_REMOVE = 60;
	
	DELAY_RESPAWN_PATROLS = 60;
	DELAY_RESPAWN_DEFENSE = 60;
	DELAY_RESPAWN_VEHICLES = 60;
	
	DELAY_HELIWAY = 300;
	CONVOYS_DELAY_SPAWN = 2400;
	
	DOLG_STYLE = ["Ins_Soldier_Sab","Ins_Soldier_Sniper","Ins_Soldier_GL"];
	SVOB_STYLE = ["GUE_Soldier_2", "GUE_Soldier_1","GUE_Soldier_3"];
	NPC_DOLG_STYLE = ["Ins_Soldier_2","Ins_Soldier_MG"]+DOLG_STYLE;
	NPC_SVOB_STYLE = ["GUE_Soldier_Crew"]+SVOB_STYLE;
	NPC_CIVS_STYLE = ["Profiteer2","Profiteer4","Villager3","RU_Woodlander3","RU_Woodlander4","Woodlander2","Woodlander3","Woodlander4","Worker2","Worker1","Worker3"];

	zzones = [];
	locations = [];
	zombies = [];

	anomali_artefacts = [];
	static_anomalies = [];
	
	dead_bodys = [];
	brok_vehicles = [];
	
	defenses = [];
	patrols = [];
	
	cordon_staticGrp = createGroup civilian;
	dolg_staticGrp = createGroup east;
	svo_staticGrp = createGroup resistance;
	mil_staticGrp = createGroup west;
	
	cordon_guard_count_squads = 70; //minimal % for guard base
	dolg_guard_count_squads = 20; //minimal % for guard base
	svo_guard_count_squads = 20; //minimal % for guard base
	mil_guard_count_squads = 80; //minimal % for guard base

	//loot
	hrn_lootDebug = false;					// Determines whether or not debug information will be on
	hrn_initialLootSpawns = 300;				// Initial amount of loot spawns
	hrn_lootSpawnPeriod = 30;				// Sleep period between loot spawns
	
	sessionkey = format ["sessid_%1", floor random 999999];
	
	#include "storage\OfflineStorageInit.sqf";

	dataStorage = ["DATA"] call AOS_DESERIALIZE;sleep 0.3;
	allhabars = ["HABAR"] call AOS_DESERIALIZE;sleep 0.3;
	toDay = ["TODAY"] call AOS_DESERIALIZE;sleep 0.3;
	
		if (!isNil "allhabars" && !isNil "dataStorage" && !isNil "toDay")then {
			
			_p = [] execvm "storage\save.sqf";
			
			accountsCount = count allhabars;
			oClock call sfx_setCurrentDate;
			[] call sfx_firstPlConnect;

			//onPlayerConnected "[_name, _id, _uid] execVM ""storage\onconnect.sqf""";
			onPlayerDisconnected "[_name, _id, _uid] execVM ""ondisconnect.sqf""";
			
			//publicVariableEventHundlers
			_p = [] execvm "main\pvehs.sqf";
			
			//////////////////////////////
			//init habars
			_p = [] execvm "main\init_habs.sqf";
			
			//check
			[] execVM "main\check.sqf";
			
			//base init
		//	_p = [] execvm "main\init.sqf";
			[["Mi24_D","mil_post1_helich", 250, 0, west, true, true, 5000]] call PRECMPL_CREATEDEFENCE;
			
			//locations
			_p = [] execvm "main\z_locations.sqf";

			//garbage_init
			_p = [] execvm "main\z_garbage.sqf";

			//zways_init
			//_p = [] execvm "main\z_ways.sqf";

			//convoys
			_p = [] execvm "convoy\cycle.sqf";
			
			//citys
			_p = [] execvm "fx\dammagecitys.sqf";
			
			//surge
			_p = [] execvm "main\z_surge.sqf";
			
			//jail init
			_p  = [] execvm "fx\jail\init.sqf";
			
			//loot
			_p  = [] execvm "loot\init.sqf";

			_p = [] execvm "main\ah.sqf";
			
		//*********************************TRIVIALS_OBJECTS&FIXS
			_tr = [] execVM "fx\bars.sqf";
			_tr = [] execVM "skiptime.sqf";
			//_lf = [] execVM "fx\ligthflare.sqf";
		}else{
			hint parseText (["Red", localize "STR_umessage_error_nostorage"] call fx_getformat_string);
		};	
};

//for client
if(local player)then{

	if(isMultiplayer)then{
		[((getPosATL comet) select 0),((getPosATL comet) select 1)] execvm "fx\boom\comet.sqf";
	};

	PRECMPL_ARTEFACT_SPAWN = compile preprocessFileLineNumbers "DAPANOMALIES\ArtefactSpawn.sqf";
	PRECMPL_ANOMALI_WAVE = compile preprocessFileLineNumbers "DAPANOMALIES\Wave.sqf";
	PRECMPL_ANOMALI_MINCERWAVE = compile preprocessFileLineNumbers "DAPANOMALIES\MincerWave.sqf";
	PRECMPL_ANOMALI_TORNADO = compile preprocessFileLineNumbers "DAPANOMALIES\Tornado.sqf";
	PRECMPL_ANOMALI_ACTELECTRO = compile preprocessFileLineNumbers "DAPANOMALIES\ActElectro.sqf";
	
	PRECMPL_EFFECTS = compile preprocessFileLineNumbers "fx\effects.sqf";
	
	money = 5000;
	saleScl = 0.7;
	artefacts = [];
	stuff = [];
	weaponsParts = [];
	smallThings = ["money"]; //This array contains things that can be a large number
	attackSay = true; //Person say or not in fight
	resPlace = 2; // 1 - base, 2 - camp
	hotkeys = true;
	
	//Jail
	jail_timer = 90;	    // Change this to the desired jail punish time in seconds.
	kill_count = 0; 	    // Needed. Don't change this.
	player addRating 100000000; // Needed.

	LASTSTONEPOS = [0,0,0];
/* 
	weaponsParts = [
		["flashlight", 1],
		["radiationDetector", 1],
		["m9Silencer", 1],
		["makarovSilencer", 1],
		["aks74uSilencer", 1],
		["CSKobra", 1],
		["PSO1", 1],
		["GP25", 1],
		["bizonSilencer", 1],
		["SDeotech", 1],
		["Aim", 1],
		["m8GL", 1],
		["m16GL", 1],
		["M4A1CamoSilencer", 1],
		["ACG", 1],
		["MP5Silencer", 1],
		["1PN51", 1]
		
	];
	artefacts = [
		["BLACKDRIP",1],
		["GRAVI", 1],
		["EMPTY", 1],
		["AMEBA", 1],
		["CRYSTALL", 1],
		["STONEBLOOD", 1],
		["MEAT", 1],
		["SOUL", 1],
		["ELECTRA", 1],
		["SPIKES", 1],
		["BATTERY", 1]
	];
	stuff = [
		["milDocuments", 1]
	];
*/
	//default items
	weaponsParts = [
		["flashlight", 1]
	];
	
	//0.37 call fx_showDetector;

	ZONA_playerConnect = [name player, getPlayerUid player];
	publicVariable "ZONA_playerConnect";
	
	_p = [] execvm "fx\lamppostoff.sqf";
	_p = [] execvm "fx\nofuel.sqf";
	
	//description
	_p = [] execvm "fx\markers.sqf";
	_p = [] execvm "briefing.sqf";
	
	player addEventHandler ["killed", {_this execVM "killedEH.sqf"}];
	player addEventHandler ["hit", {_this execVM "dammageEH.sqf"}];
	player addEventHandler ["fired",{
		if(attackSay)then{
			ZONA_serverexec_pAttackSay = [_this select 0];
			publicVariable "ZONA_serverexec_pAttackSay";
		};
		
		if(_this select 2 == "HandGrenade_Stone")then{
			(_this select 6) spawn {
				waitUntil {
					_pos = getPosATL _this;
					if(_pos select 2 > 0)then{LASTSTONEPOS = _pos};
					if(_pos select 2 == 0)exitWith{true};
				false
				};
			};
			player addMagazine "HandGrenade_Stone";
		};
	}];
	
	waitUntil{!isNull (findDisplay 46)};
		keyspressed = compile preprocessFile "keyspressed.sqf";
		_displayID = (findDisplay 46) displaySetEventHandler ["KeyDown","_this call keyspressed"];

	_p = [] execvm "prices.sqf";
	_p = [] execvm "dealers.sqf";
	waitUntil{scriptDone _p}; // !important
	_p = [] execvm "actions.sqf";
	_p = [] execVM "killed.sqf";
	
	_p = [] execvm "fx\boom\script\snow.sqf";
	_p = [] execvm "fx\back\x_init_backback.sqf";
	_p = [] execvm "fx\weapon_modifer\init.sqf";
	
	_dw = [] execVM "DynamicWeatherEffects.sqf";
	[player,200,10,10,3,6,-0.3,0.1,0.3,1,1,1,30,10,15,true,0.4,0.5,0.025,0,0,0,0,24] execFSM "Fog.fsm";
	
	/*
	[cordon_radio, ""] execVM "fx\play_radio.sqf";
	[svobod_radio, ""] execVM "fx\play_radio.sqf";
	[bar_radio, ""] execVM "fx\play_radio.sqf";
	[jail_radio, ""] execVM "fx\play_radio.sqf";
	*/
	
	if(isMultiplayer)then{
		_p = [] spawn fx_informer;
	};
	
//playMusic "st";
};

_p = [player, "minimal"] spawn PRECMPL_PATROLWEAPLOAD;
player selectWeapon (secondaryWeapon player);

#include "zombies\init.sqf";