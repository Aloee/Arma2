if(!isDedicated && !isServer)exitWith{};

private ["_group", "_data", "_type", "_respawn"];

_group = _this;
_data  = _group getVariable "data";
_type = _group getVariable "type";
_respawn = _group getVariable "respawn";

if(!isNil "_data" && !isNil "_type" && !isNil "_respawn")then{
	if(_respawn)then{
		switch (_type) do{
			case "patrol":{
				_group setVariable ["used", nil];
				sleep FZ_DELAY_RESPAWN_PATROLS;
				[_data] call PRECMPL_CREATEPATROLS;
			};
			
			case "defense":{
				private ["_vehicle"];
				
				_vehicle = _group getVariable "grp_vehicle";
				if(!isNil "_vehicle")then{
					if(!alive _vehicle)then{
						sleep FZ_DELAY_RESPAWN_DEFENSE;
						[_data] execVM "main\create_defense.sqf";
					}else{
						_vehicle setVariable ["killed_grp", _group];
						_vehicle addEventHandler ["killed",{
							_grp = (_this select 0) getVariable "killed_grp";
							_di =  _grp getVariable "data";
							[_di] execVM "main\create_defense.sqf";
							_grp setVariable ["used", nil];
						}];
					};
				}; 
			};
			
			case "static":{
			
			};
		};
	};
};