/*
Important!
If in script submitted argument: "Description" - then return pre-description string
Mission script executed on SERVER SIDE must return array, this array is transferred for CLIENT SIDE:
	Server side execute once, this branch responsible for logic, objects, and the condition of completing the task
	Clent side performed each task assignment player (condition of completing the task - optioanal)
*/
_track = "notrack";

if(typeName _this == "STRING")then{
	_return = "";
	
	switch(_this)do{
		case "Description" : {_return = "STRD_task_penetration_predesc_stealDocs"};
	};
	
_return
}else{

	//CLIENT
	if(local player)then{
		_params = _this select 0;
		
		_ownerName = _params select 0;
		_taskName = _params select 1;
		_taskType = _params select 2;
		_marker = _params select 3;
		_doc = _params select 4;
		_guards = _params select 5;
		_objects = _params select 6;
		
		_posmarker = getMarkerPos _marker;
		_pos = [abs(_posmarker select 0), abs(_posmarker select 1), 0];
		_owner = call compile _ownerName;
		
		_task = [
			_taskName,
			_taskType, 
			_pos,
			localize "STRD_task_penetrationTitle", 
			format [localize "STRD_task_penetrationTitlePers", _owner getVariable "nameDisplay"],
			localize "STRD_task_penetration_desc_stealDocs"
		] call fx_createSimpleTask;
		
		player setCurrentTask _task;
		_doc addaction [["Red",localize "STR_action_get"] call fx_getformat_string, "tasks\penetration_take.sqf",[_task, _taskName, _ownerName, localize "STRD_task_penetrationTitle", _guards, _objects],0,false,false,"","player distance _target < 2"];
	};


	//SERVER
	if(isDedicated || isServer)then{
		
		_ownerName = _this select 0;
		_taskName = _this select 1;
		_taskType = _this select 2;
		/*required default arguments*/
		
		_objects = [];
		
		_camps = ["RU_WarfareBBarracks", "CDF_WarfareBUAVterminal","CDF_WarfareBContructionSite", "BMP2_HQ_CDF_unfolded", "CDF_WarfareBUAVterminal", "CDF_WarfareBBarracks", "CDF_WarfareBFieldhHospital", "GUE_WarfareBAircraftFactory"];
		_armors = ["ZSU_INS", "BRDM2_CDF", "GAZ_Vodnik_HMG", "BTR90", "BMP3"];
				
		_marker = PENETRATION_CAMPS select floor random ((count PENETRATION_CAMPS) - 1);
		_posmarker = getMarkerPos _marker;
		_pos = [abs(_posmarker select 0), abs(_posmarker select 1), 0];

		_camp = "CampEast" createVehicle ([_pos, 50] call fx_getRandomPositionInRadius);
		_posCamp = getPosATL _camp;
		
		_table = "SmallTable" createVehicle [0,0,0];
		_doc = "EvMoscow" createVehicle [0,0,0];
		
		sleep 1;
		
		_table setpos _posCamp;
		_doc setpos [(getPosATL _table) select 0,(getPosATL _table) select 1,((getPosATL _table) select 2)+0.85];
		
		for "_i" from 0 to 15 do {
			_rPos = [_posCamp, 150] call fx_getRandomPositionInRadius;
			_campEmpty = (_camps select (floor random (count _camps - 1))) createVehicle _rPos;
			_objects set [count _objects, _campEmpty];
		};
		
		_group1 = [
			[(_armors select (floor random (count _armors - 1))), [_posCamp, 50] call fx_getRandomPositionInRadius, 0, 0, west, true, true, 300],
			[(_armors select (floor random (count _armors - 1))), [_posCamp, 50] call fx_getRandomPositionInRadius, 0, 0, west, true, true, 300],
			[(_armors select (floor random (count _armors - 1))), [_posCamp, 50] call fx_getRandomPositionInRadius, 0, 0, west, true, true, 300]
		] call PRECMPL_CREATEDEFENCE;
		
		_group2 = [
			[west, ["CDF_Commander", "CDF_Soldier_Militia","CDF_Soldier_MG","CDF_Soldier_Marksman", "CDF_Soldier_Medic","CDF_Soldier", "CDF_Soldier"], _marker,  "military",[_track,"randomdn","nofollow"], 200],
			[west, ["CDF_Commander", "CDF_Soldier_Militia","CDF_Soldier_MG","CDF_Soldier_Marksman", "CDF_Soldier_Medic","CDF_Soldier", "CDF_Soldier"], _marker,  "military",[_track,"randomdn","nofollow"], 200],
			[west, ["CDF_Commander", "CDF_Soldier_Militia","CDF_Soldier_MG","CDF_Soldier_Marksman", "CDF_Soldier_Medic","CDF_Soldier", "CDF_Soldier"], _marker,  "military",[_track,"randomdn","nofollow"], 200]
		] call PRECMPL_CREATEPATROLS;
		
		_objects set [count _objects, _camp];
		_objects set [count _objects, _table];
		
	[_ownerName, _taskName, _taskType, _marker, _doc, (_group1+_group2), _objects]
	};
};