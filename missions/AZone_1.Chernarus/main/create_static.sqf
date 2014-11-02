if(!isDedicated && !isServer)exitWith{};

{
	_type = _x select 0;
	_pos = _x select 1;
	_dir = _x select 2;
	_height = _x select 3;
	_group = _x select 4;
	_respawner = _x select 5;

		_vehicle = createvehicle [_type,[0,0,0],[], 0, "NONE"];
		if(!isNil "_vehicle")then{
			_vehicle setVariable ["session", sessionkey];
			_vehicle setdir _dir;
			if(typeName _pos == "STRING")then{
				_pos = [abs((getMarkerPos _pos) select 0), abs((getMarkerPos _pos) select 1), _height];
			};
			_vehicle setpos _pos;

			_vehicle addEventHandler ["fired",{(_this select 0) setvehicleammo 1;}];
			_vehicle addEventHandler ["killed", {_this spawn {
				_init = (_this select 0) getVariable "data_init";
				brok_vehicles set [count brok_vehicles, _this select 0];
				sleep DELAY_RESPAWN_DEFENSE;
				[_init] call PRECMPL_CREATESTATIC;
			}}];

			[_group, _vehicle] call sfx_create_crews;
			
			// wrong! set direction for all static in this group (setFormDir)
			// if(_vehicle isKindOf "StaticSEARCHLight")then{
				// [_vehicle, 90] spawn PRECMPL_MOVESEARCH;
				// (gunner _vehicle) action ["lightOn", _vehicle];
			// };
			
		};

		if(_respawner)then{
			_vehicle setVariable ["data_init", _x];
		};

}foreach _this;