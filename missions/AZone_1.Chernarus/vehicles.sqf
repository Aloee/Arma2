//only for cars created in editor
//Server side
if(!isServer && !isDedicated) exitWith {};
waitUntil{!isNil "sessionkey"};

_vehicle = _this select 0;
_respawner = _this select 1;
_repairkits = _this select 2;

_vehicle setvariable ["avtopark_pos", [getdir _vehicle, getPosATL _vehicle]];
_vehicle setvariable ["respawner", _respawner];
_vehicle setvariable ["repairkits", _repairkits];
_vehicle setvariable ["session", sessionkey];

_vehicle execVM "fx\actions\hintcrews.sqf";
_vehicle execVM "fx\actions\rempoints.sqf";
if(_repairkits)then{
	_vehicle execVM "fx\actions\repairkits.sqf";
};

if(_respawner)then{
	[_vehicle, getPosATL _vehicle, getdir _vehicle, _repairkits] spawn {
		_v = _this select 0;
		_pos = _this select 1;
		_dir = _this select 2;
		_repairkits = _this select 3;
		
		while{alive _v}do{
			 waitUntil {count crew _v == 0};
			 _current_pos = getPosATL _v;
			 
			 sleep 1200;
			 _new_pos = getPosATL _v;
			 
			 if ((count crew _v == 0) and ((_current_pos select 0 == _new_pos select 0) and (_current_pos select 1 == _new_pos select 1)) )then{
				if((_current_pos select 0 != _pos select 0) and (_current_pos select 1 != _pos select 1))then{
						_v setpos _pos;
						_v setDir _dir;
						_v engineOn false;
				};
			 };
		};

		brok_vehicles set [count brok_vehicles, _v];
		_spawnv = (typeof _v) createVehicle _pos;
		_spawnv setDir _dir;
		[_spawnv, true, _repairkits] execvm "vehicles.sqf";
	};
};

//in
_vehicle addEventHandler ["GetIn", {
	_v = (_this select 0);
	
	if(count crew _v == 1)then{
		_v setVariable ["attach_grp", group (_this select 2)];
	};
	
	if(isPlayer (_this select 2))then{
		[(_this select 2), (_this select 2), "loc", rCALLVAR, [], {player setVariable ["flashlight_on", nil]}] call RE;
	};
}];

//out
_vehicle addEventHandler ["GetOut", {
	_v = (_this select 0);
	if(count crew _v == 0)then{
		_v setVariable ["attach_grp", nil];
	};
}];

//killde
/*
_vehicle addEventHandler ["Killed", {
	_v = (_this select 0);	
	_respawner = _v getVariable "respawner";
	_repairkits = _v getVariable "repairkits";
	_pos = (_v getVariable "avtopark_pos") select 1;
	_dir = (_v getVariable "avtopark_pos") select 0;
	
	brok_vehicles set [count brok_vehicles, _v];
	
	if(_respawner)then{
		_spawnv = (typeof _v) createVehicle _pos;
		[_spawnv, _respawner, _repairkits] execvm "vehicles.sqf";
		_spawnv setDir _dir;
	};
}];
*/
//dammaged
_vehicle addEventHandler ["Dammaged", {
	_v = _this select 0;
	
	_v spawn {
		if(!canmove _this)then{
			waitUntil {speed _this < 1};

			{
				_x action ["eject", _this];
			}foreach crew _this;
			
			sleep 300;
			if(!canmove _this)exitwith{
				_this setDammage 1;
			};
		};
	};
}];

//fuel
_vehicle addEventHandler ["Fuel", {
	if( 0 == {_x in playableUnits} count crew (_this select 0) )then{
		(_this select 0) setfuel 1;
	};
}];

//Fired
_vehicle addEventHandler ["Fired", {
	if( 0 == {_x in playableUnits} count crew (_this select 0) )then{
		(_this select 0) setvehicleammo 1;
	};
}];

