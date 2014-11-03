/*  
Easy AI Infinity Respawn

*/
if(isServer || isDedicated)then{
	
	infinityAiRespawnWithWaypoints = {
		
		_unit = _this select 0; 
		_unit setVariable ["delay", if (count _this > 1) then {_this select 1} else {30}];
		_unit setVariable ["respawns", if (count _this > 2) then {_this select 2} else {-1}];
		_unit setVariable ["respInfo", [getDir _unit, getPosASL _unit, typeOf _unit]];
		
		//hint str getNumber (configFile >> "cfgVehicles" >> typeOf car >> "hasGunner");
		
		if(_unit == vehicle _unit)then{
			_unit setVariable ["crew", typeOf ((crew _unit) select 0)];
		};
		
		_unit addEventHandler ["killed", {_this spawn {
			
			private ["_unit", "_delay", "_respawns", "_respInfo", "_dir", "_position", "_type", "_group", "_side", "_newGroup", "_crew", "_spawnUnit"];
			
			_unit = _this select 0;
			_delay = _unit getVariable "delay";
			_respawns = _unit getVariable "respawns";
			
			_respInfo =  _unit getVariable "respInfo";
			_dir = _respInfo select 0;
			_position = _respInfo select 1;
			_type = _respInfo select 2;
			
			_group = group _unit; _side = side _group;
			
			if(_respawns != 0)then{
				_respawns = if(_respawns > 0)then{_respawns - 1}else{_respawns};
				_newGroup = createGroup _side;
				_newGroup copyWaypoints _group;
				sleep _delay;
				_crew = _unit getVariable "crew";
				deleteVehicle _unit;
				
				if(!isNil {_unit getVariable "crew"})then{
				
					_spawnUnit = _type createVehicle [0,0,0];
					_spawnUnit setPosASL _position; _spawnUnit setDir _dir;
					
					[_spawnUnit, _newGroup, false, "", _crew] call bis_fnc_spawnCrew;
					
				}else{
					
				};
				
				[_spawnUnit, _delay, _respawns] call infinityAiRespawnWithWaypoints;
			};
		}}];
	};
	
	_this call infinityAiRespawnWithWaypoints;
};
