[nil, nil, "per", rCALLVAR, [_this], {
	if(!isNil {_this select 0})then{
		(_this select 0) addaction [localize "STR_action_servicePoint", "fx\actions\rempoint_act.sqf",[],3,false,false,"","side player == resistance && driver _target == player && _target distance remPointSvo < 25 && isNil {_target getVariable ""serviceProcess""}"];
		(_this select 0) addaction [localize "STR_action_servicePoint", "fx\actions\rempoint_act.sqf",[],3,false,false,"","side player == east && driver _target == player && _target distance remPointDolg < 25  && isNil {_target getVariable ""serviceProcess""}"];
		(_this select 0) addaction [localize "STR_action_servicePoint", "fx\actions\rempoint_act.sqf",[],3,false,false,"","driver _target == player && _target distance remPointCiv < 25 && isNil {_target getVariable ""serviceProcess""}"];
	};
}] call RE;