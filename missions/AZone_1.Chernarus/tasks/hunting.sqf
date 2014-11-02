/*
Important!
If in script submitted argument: "Description" - then return pre-description string
Mission script executed on SERVER SIDE must return array, this array is transferred for CLIENT SIDE:
	Server side execute once, this branch responsible for logic, objects, and the condition of completing the task
	Clent side performed each task assignment player (condition of completing the task - optioanal)
*/

if(typeName _this == "STRING")then{
	_return = "";
	
	switch(_this)do{
		case "Description" : {_return = "STR_tasks_huntingD"};
	};
	
_return
}else{
	
	//CLIENT
	if(local player)then{
		_params = _this select 0;
		
		_ownerName = _params select 0;
		_taskName = _params select 1;
		_taskType = _params select 2;
		_victim = _params select 3;

		_owner = call compile _ownerName;
		
		_task = [
			_taskName,
			_taskType,
			false,
			localize "STRD_task_huntingTitle", 
			format [localize "STRD_task_huntingTitlePers", _owner getVariable "nameDisplay"],
			localize "STR_tasks_huntingD"
		] call fx_createSimpleTask;
		
		player setCurrentTask _task;
		
		_markerName = format ["victim_%1", floor random 9999];
		_markerParams = [_markerName, [0,0], 0.5, "colorRed", format["V: ", name _victim], "ICON", "DOT"];
		[_markerParams] call fx_create_local_markers;
		
		while{!isNull (_taskName call fx_getTaskObject)}do{
			_markerName setMarkerPosLocal getPos _victim;
		sleep 120;
		};
		
		deleteMarkerLocal _markerName;
	};


	//SERVER
	if(isDedicated || isServer)then{
		
		_ownerName = _this select 0;
		_taskName = _this select 1;
		_taskType = _this select 2;
		/*required default arguments*/
		_return = "STRD_task_huntingNone";
		
		_owner = call compile _ownerName;
		_victims = [];
		switch(side _owner)do{
			case east : {
				{if(alive _x && side _x == resistance)then{_victims set [count _victims, _x]}}foreach playableUnits;
			};
			case resistance : {
				{if(alive _x && side _x == east)then{_victims set [count _victims, _x]}}foreach playableUnits;
			};
			default {};
		};
		
		if(count _victims > 0)then{
			_victim = _victims select floor random count _victims;
			
			_eh = _victim addEventHandler ["killed", {_this execVM "tasks\hunting_act.sqf"}];
			
			_return = [_ownerName, _taskName, _taskType, _victim];
			
			[_victim, _taskName, _ownerName, _taskType, _eh] spawn {
				_victim = _this select 0;
				_taskName = _this select 1;
				_ownerName = _this select 2;
				_taskType = _this select 3;
				_eh = _this select 4;
				
				_timer = time;
				_timeDelay = 30;
				waitUntil{
					if(_timer + _timeDelay < time)exitWith{true};
				false
				};
				
				_victim removeEventHandler ["killed", _eh];
				[_taskName, _ownerName, _taskType, [localize "STRD_task_huntingTitle", "Canceled", ""], [[], []]] call sfx_ZONA_removeTask;
			};
		};
		
	_return
	};
};