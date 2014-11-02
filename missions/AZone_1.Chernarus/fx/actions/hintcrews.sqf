[nil, nil, "per", rCALLVAR, [_this], {
	if(!isNil {_this select 0})then{
		(_this select 0) addaction [localize "STR_action_crews", "fx\actions\hintcrews_act.sqf",[],0,false,false,"","_target == vehicle player"];
	};
}] call RE;