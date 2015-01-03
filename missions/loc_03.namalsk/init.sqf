_coreInit = execVM "iInit.sqf";
waitUntil{sleep 0.1; scriptDone _coreInit};
if(CLY_debug)then{ [debug, nil, rglobalChat,  "Core Initialized"] call RE };

if(local player)then{

};

if(isServer or isDedicated)then{
	
	//Anomalies
	FZ_ISSETANOMALIES = true;
	FZ_ANOMALIES_NAME = ["Burn", "Gravi", "Electro", "Mincer", "Psy", "Tornado", "Souls"];
	FZ_ANOMALIES_COUNT = 30;
	FZ_MIN_RESPAWNS_DISTANCE_ANOMALIES = 300;
	FZ_NO_ANOMALIES_LOCATIONS = ["FZ_loc_Cordon", "FZ_loc_harborBuild"];
	FZ_MARKED_ANOMALIES = true;
	
	//Locations
	FZ_LOCATIONS = [
		["FZ_loc_Cordon", [getMarkerSize "FZ_loc_Cordon", "freedomCenter", [
			[4, false, "FZ_loc_Cordon_resp1", "ammo_easy", 50, false],
			[4, false, "FZ_loc_Cordon_resp2", "ammo_easy", 50, false]
		]]],
		["FZ_loc_harborBuild", [getMarkerSize "FZ_loc_harborBuild", "dutyCenter", [
			[4, false, "FZ_loc_harborBuild_resp1", "ammo_easy", 50, false],
			[4, false, "FZ_loc_harborBuild_resp2", "ammo_easy", 50, false]
		]]]
	];
	
	FZ_LOCATIONS_TRGS = FZ_LOCATIONS call fz_sfx_database_locations_init;
		
	//KORDON_BAR**********************************************************************
	//build_bar
	myb_1 setpos [(getPos myb_1) select 0, (getPos myb_1) select 1, ((getPos myb_1) select 2)+0.3];
	sleep 0.5;
	//bar npcs
	sidorch setpos [(getPos sidorch) select 0, (getPos sidorch) select 1, ((getPos sidorch) select 2)+1];

	//garbagecollector
	dbb1 setpos [(getPos dbb1) select 0, (getPos dbb1) select 1, ((getPos dbb1) select 2)+1.3];
	//bar stone
	{_x setpos [(getPos _x) select 0, (getPos _x) select 1, ((getPos _x) select 2)+0.5]}foreach [dbt1_1, sidorch_gen];
	//radio
	cordon_radio setpos [(getPos dbt1_1) select 0, (getPos dbt1_1) select 1, ((getPos dbt1_1) select 2)+1.5];
	_satPhone = createVehicle ["SatPhone", [0,0,0], [], 0, "NONE"];
	_satPhone setpos [(getPos dbt1_2) select 0, (getPos dbt1_2) select 1, ((getPos dbt1_2) select 2)+1.9];
	_satPhone setdir 180;
	_tele = createVehicle ["SmallTV", [0,0,0], [], 0, "NONE"];
	_tele setpos [(getPos dbt1_3) select 0, (getPos dbt1_3) select 1, ((getPos dbt1_3) select 2)+1.9];
	_tele setdir 190;
	
	/*
	_stalkers = ["normal", 4, false] call fz_sfx_getStalkerShapes;
	_groups = [[civilianCenter, _stalkers, getMarkerPos "FZ_loc_Cordon_resp1",  "ammo_easy", 50, false]] call PRECMPL_CREATEPATROLS;
	_stalkers = ["normal", 4, false] call fz_sfx_getStalkerShapes;
	_groups = [[civilianCenter, _stalkers, getMarkerPos "FZ_loc_Cordon_resp2",  "ammo_easy", 50, false]] call PRECMPL_CREATEPATROLS;
	*/
};

execVM "core\z_anomalies.sqf";