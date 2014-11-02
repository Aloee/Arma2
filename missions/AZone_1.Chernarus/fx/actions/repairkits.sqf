_this setVariable ["repair_kits", 3, true];
[nil, nil, "per", rCALLVAR, [_this], {
	if(!isNil {_this select 0})then{
		(_this select 0) addaction [localize "STR_action_fieldrepair", "fx\actions\repairkits_act.sqf",[],0,false,false,"","alive _target && alive player && !canmove _target && count crew _target == 0 && (!isNil {_target getVariable ""repair_kits""} and _target getVariable ""repair_kits"" > 0) && (isNil {_target getVariable ""repairing""})"];
		(_this select 0) addaction [localize "STR_action_fieldrepairbreak", "fx\actions\repairkits_actbreak.sqf",[],0,false,false,"","alive _target && alive player && count crew _target == 0 && (!isNil {_target getVariable ""repairing""})"];
	};
}] call RE;