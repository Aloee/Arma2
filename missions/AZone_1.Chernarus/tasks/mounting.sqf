/*
Important!
If in script submitted argument: "Description" - then return pre-description string
Mission script executed on SERVER SIDE must return array (if return not array creating mission be canceled), this array is transferred for CLIENT SIDE:
	Server side execute once, this branch responsible for logic, objects, and the condition of completing the task
	Clent side performed each task assignment player (condition of completing the task - optioanal)
*/

if(typeName _this == "STRING")then{
	_return = "";
	
	switch(_this)do{
		case "Description" : {_return = "STR_tasks_mountingD"};
	};
	
_return
}else{

	//CLIENT
	if(local player)then{
		_params = _this select 0;
		
		_ownerName = _params select 0;
		_taskName = _params select 1;
		_taskType = _params select 2;
		_pos = _params select 3;
		_device = _params select 4;

		_owner = call compile _ownerName;
		
		_task = [
			_taskName,
			_taskType,
			_pos,
			localize "STRD_task_mountingTitle", 
			format [localize "STRD_task_mountingTitlePers", _owner getVariable "nameDisplay"],
			localize "STR_tasks_mountingD"
		] call fx_createSimpleTask;
		
		player setCurrentTask _task;
		player addaction [localize "STRD_task_mountingAction", "tasks\mounting_act.sqf",[_taskName, _ownerName, _taskType, _pos, _device], 0, false, false, "", format["player distance %1 < 3", _pos]];
		
		[_taskName, _ownerName, _taskType, _device] spawn{
			_taskName = _this select 0;
			_ownerName = _this select 1;
			_taskType = _this select 2;
			_device = _this select 3;
			
			waitUntil {!alive player};
			
			_task = _taskName call fx_getTaskObject;
			if(!isNull _task)then{
				[_taskName, "Canceled", localize "STRD_task_mountingTitle"] call fx_removeSimpleTask;
				ZONA_removeTask = [_taskName, _ownerName, _taskType, [localize "STRD_task_mountingTitle", "Canceled", ""], [[], [_device]]];
				publicVariable "ZONA_removeTask";
			};
		};
	};


	//SERVER
	if(isDedicated || isServer)then{
		
		_ownerName = _this select 0;
		_taskName = _this select 1;
		_taskType = _this select 2;
		/*required default arguments*/
		
		_positions = [
			[5719.74,3280.39,20], //north chernogorsk
			[6563.96,3404.85,29], //north chernogorsk (visota)
			[10410.6,2597.57,40.2], //electrovodsk
			[8111.89,9298.12,14.5], //altar
			[6200.2,8010.51,14.5], //stary sobor
			[6445.05,6545.71,14.5] //pop ivan
		];
		
		_position = _positions select floor random count _positions;
		/* */
		_device = "Misc_Videoprojektor" createVehicle [0, 0, 0];
		_device setPosATL [_position select 0, _position select 1, -1];
		
		_return = [_ownerName, _taskName, _taskType, _position, _device];
			
		[_position, _taskName, _ownerName, _taskType, _device] spawn {
			_position = _this select 0;
			_taskName = _this select 1;
			_ownerName = _this select 2;
			_taskType = _this select 3;
			_device = _this select 4;
			
			waitUntil{(getPosATL _device) select 2 > 5};
			
			//reward
			_owner = call compile _ownerName;
			_inProcessWorks = _owner getVariable "inProcessWorks";
			if(count _inProcessWorks > 0)then{
				for "_i" from 0 to (count _inProcessWorks - 1) do {
					if(((_inProcessWorks select _i) select 0) == _taskName)then{
						_factor = (floor (_owner distance _position) / 3000);
						{
							_obj = _x call fx_findUid_pl_body;
							[nil, _obj, "loc", rCALLVAR, [_taskType, _ownerName, _factor], {
								_taskType = _this select 0;
								_ownerName = _this select 1;
								_factor = _this select 2;
								[_taskType, _ownerName, 1, _factor] call fx_rewardTask;	
							}] call RE;
						}foreach ((_inProcessWorks select _i) select 2);
					};
				};
			};
			
			//remove
			[_taskName, _ownerName, _taskType, [localize "STRD_task_mountingTitle", "Succeeded", ""], [[], [_device]]] call sfx_ZONA_removeTask;
		};
		
	_return
	};
};
