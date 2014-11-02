if(!isDedicated && !isServer)exitWith{};


//while{true}do{
	//sleep 120;
	//_sleep = 180;//600;
	//[nil, nil, rCALLVAR, [], {[CORDON, "side", localize "STRD_title_surgeDanger"] call fx_sayradio}] call RE;
	//sleep random _sleep;
	
	//_surgeAct = [nil, nil, rexecVM, "DAPSURGE\Surge.sqf", surge, 5000] call RE;	
	//sleep SURGE_TIMEOUT+60;

	[nil, nil, "per", rCALLVAR, ["break_anomalies", false], "fx_cl_setvar"] call RE;

	_initAnomalies = [] execvm "main\z_anomalies.sqf";
	waitUntil{scriptDone _initAnomalies};

	
	//sleep 30;
	//[nil, nil, rCALLVAR, [], "{skipTime 6}"] call RE;
	/*
	_area = triggerArea anomalies_trg;
	_r = [getPosATL anomalies_trg, _area select 1, _area select 0, 50] call sfx_get_random_positions;
	{
		_covers = (getpos _x) nearObjects ["HouseBase", 30];
		if(count _covers == 0)then{
			_x setPos (_r select floor random count _r);_x setUnitPos "DOWN";
		};
	}foreach playableUnits;
	*/
	if(MARKED_ANOMALIES && MARKED_ANOMALIES_AFTERHIDE != 0 && count anomali_marks > 0)then{
		sleep MARKED_ANOMALIES_AFTERHIDE;
		{deleteMarker (_x select 0)} foreach anomali_marks;
		anomali_marks = []; 
	};

	//sleep (SURGE_PERIOD - MARKED_ANOMALIES_AFTERHIDE);
	//[nil, nil, "per", rCALLVAR, ["break_anomalies", true], "fx_cl_setvar"] call RE;
/*
};

if(MARKED_ANOMALIES && count anomali_marks > 0)then{
	{deleteMarker (_x select 0)} foreach anomali_marks;
};
*/