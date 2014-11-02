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
		case "Description" : {_return = "STR_tasks_cleanseD"};
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

		_owner = call compile _ownerName;
		
		_task = [
			_taskName,
			_taskType,
			_pos,
			localize "STRD_task_cleanseTitle", 
			format [localize "STRD_task_cleanseTitlePers", _owner getVariable "nameDisplay"],
			localize "STR_tasks_cleanseD"
		] call fx_createSimpleTask;
		
		player setCurrentTask _task;
	};


	//SERVER
	if(isDedicated || isServer)then{
		
		_ownerName = _this select 0;
		_taskName = _this select 1;
		_taskType = _this select 2;
		/*required default arguments*/
		
		_noCapturingLocations = [];
		{
			if(!(triggerText _x in capturingLocations))then{_noCapturingLocations set [count _noCapturingLocations, triggerText _x]};
		}foreach locations;

		_location = [(side (call compile _ownerName)), _noCapturingLocations]  call sfx_selectForCaptureLocation;
		_prop = _location getVariable "locationProp";
		
		_marker = _prop select 1;
		_posmarker = getMarkerPos _marker;
		_pos = [abs(_posmarker select 0), abs(_posmarker select 1), 0];

		[_location, _taskName, _taskType, _ownerName] spawn {
			_location = _this select 0;
			_taskName = _this select 1;
			_taskType = _this select 2;
			_ownerName = _this select 3;
			
			_owner = call compile _ownerName;
			waitUntil{
				_prop = _location getVariable "locationProp";
				if(_prop select 0 == side _owner and _prop select 2)exitWith{true};
			false
			};
			
			_rewardDist = 500;
			_inProcessWorks = _owner getVariable "inProcessWorks";
			if(count _inProcessWorks > 0)then{
				for "_i" from 0 to (count _inProcessWorks - 1) do {
					if(((_inProcessWorks select _i) select 0) == _taskName)then{
						_recipiensCount = {(_x call fx_findUid_pl_body) distance _location < _rewardDist} count ((_inProcessWorks select _i) select 2);
						{
							_obj = _x call fx_findUid_pl_body;
							if(_obj distance _location < _rewardDist) then {
								[nil, _obj, "loc", rCALLVAR, [_taskType, _ownerName, _recipiensCount], {
									_taskType = _this select 0;
									_ownerName = _this select 1;
									_recipiensCount = _this select 2;
									_owner = call compile _ownerName;
									
									[_owner, "side", localize "STRD_tasks_taskDoneReward"] call fx_sayradio;
									[_taskType, _ownerName, _recipiensCount, 1] call fx_rewardTask;
									
								}] call RE;
							};
						}foreach ((_inProcessWorks select _i) select 2);
					};
				};
			};
			
			
			//remove
			[_taskName, _ownerName, _taskType, [localize "STRD_task_cleanseTitle", "Succeeded", ""], [[], []]] call sfx_ZONA_removeTask;
		};

	[_ownerName, _taskName, _taskType, _pos]
	};
};
