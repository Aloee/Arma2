/*
Important!
If in script submitted argument: "Description" - then return pre-description string
Mission script executed on SERVER SIDE must return array (if return not array creating mission be canceled), this array is transferred for CLIENT SIDE:
	Server side execute once, this branch responsible for logic, objects, and the condition of completing the task
	Clent side performed each task assignment player (condition of completing the task - optioanal)
*/
_track = "notrack";

if(typeName _this == "STRING")then{
	_return = "";
	
	switch(_this)do{
		case "Description" : {_return = "STR_tasks_sabotageD"};
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
		_radar = _params select 4;

		_posmarker = getMarkerPos _marker;
		_pos = [abs(_posmarker select 0), abs(_posmarker select 1), 0];
		_owner = call compile _ownerName;

		_task = [
			_taskName,
			_taskType,
			_pos,
			localize "STRD_task_sabotageTitle", 
			format [localize "STRD_task_sabotageTitlePers", _owner getVariable "nameDisplay"],
			localize "STR_tasks_sabotageD"
		] call fx_createSimpleTask;
		
		player setCurrentTask _task;
	};


	//SERVER
	if(isDedicated || isServer)then{
		
		_ownerName = _this select 0;
		_taskName = _this select 1;
		_taskType = _this select 2;
		/*required default arguments*/
		
		_armors = ["ZSU_INS", "BRDM2_CDF", "GAZ_Vodnik_HMG", "BTR90", "BMP3"];
		
		_blockposts = ["City11", "City12", "City21", "City23", "City27", "City33", "City35"];
		_marker = _blockposts select floor random ((count _blockposts) - 1);
		_posmarker = getMarkerPos _marker;
		_pos = [abs(_posmarker select 0), abs(_posmarker select 1), 0];

		_radar = "Land_radar" createVehicle ([_pos, 100] call fx_getRandomPositionInRadius);
		_posRadar = getPos _radar;

		sleep 1;
		
		_group1 = [
			[(_armors select (floor random (count _armors - 1))), [_posRadar, 50] call fx_getRandomPositionInRadius, 0, 0, west, true, true, 200]
		] call PRECMPL_CREATEDEFENCE;
		_group2 = [
			[west, ["CDF_Commander", "CDF_Soldier_Militia","CDF_Soldier_MG","CDF_Soldier_Marksman", "CDF_Soldier_Medic","CDF_Soldier", "CDF_Soldier"], _marker,  "military",[_track,"randomdn","nofollow"], 100],
			[west, ["CDF_Commander", "CDF_Soldier_Militia","CDF_Soldier_MG","CDF_Soldier_Marksman", "CDF_Soldier_Medic","CDF_Soldier", "CDF_Soldier"], _marker,  "military",[_track,"randomdn","nofollow"], 100]
		] call PRECMPL_CREATEPATROLS;
		
		[_radar, _taskName, _taskType, _ownerName, (_group1+_group2)] spawn{
			_radar = _this select 0;
			_taskName = _this select 1;
			_taskType = _this select 2;
			_ownerName = _this select 3;
			_groups = _this select 4;
			
			waitUntil {!alive _radar};
			[_taskName, _ownerName, _taskType, [localize "STRD_task_sabotageTitle", "Succeeded", ""], [_groups, [_radar]]] call sfx_ZONA_removeTask;
		};
		
	[_ownerName, _taskName, _taskType, _marker, _radar]
	};
};
