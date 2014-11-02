if(!isDedicated && !isServer)exitWith{};

_dead_group = _this select 0;

_resp_info  = _dead_group getVariable "data_init";
_grp_type   = _dead_group getVariable "grp_info";

_commit_delete = true;


if(!isNil "_resp_info" && !isNil "_grp_type")then{
	
	switch (_grp_type) do{
		case "patrol":{sleep DELAY_RESPAWN_PATROLS; [_resp_info] call PRECMPL_CREATEPATROLS;};
		
		case "defense":{
			_group_vehicle = _dead_group getVariable "grp_vehicle";
			if(!isNil "_group_vehicle")then{
				if(!alive _group_vehicle)then{
					sleep DELAY_RESPAWN_DEFENSE;
					[_resp_info] call PRECMPL_CREATEDEFENCE;
				}else{
					_commit_delete = false;
					_group_vehicle setVariable ["killed_grp", _dead_group];
					_group_vehicle addEventHandler ["killed",{_grp = (_this select 0) getVariable "killed_grp";_di =  _grp getVariable "data_init";[_di] execVM "main\create_defense.sqf";deleteGroup _grp}];
				};
			}; 
		};
		
		case "static":{
		
		};
	};

};
if(_commit_delete)then{
	sleep 1;
	deleteGroup _dead_group;
};