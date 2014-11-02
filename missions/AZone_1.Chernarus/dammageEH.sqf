_victim = _this select 0;
_attacker = _this select 1;
_dammage = _this select 2;

[debug, nil, rglobalChat,  format ["caused: %1", str _this]] call RE;

if (vehicleVarName _victim != vehicleVarName _attacker) then {
	_killFriend = (vehicleVarName _victim in s_players && vehicleVarName _attacker in s_players)or(vehicleVarName _victim in d_players && vehicleVarName _attacker in d_players);	

	if({_victim in list _x}count NO_TK_ZONES > 0 && _killFriend)then{
		[nil, _attacker, "loc", rEXECVM, "fx\jail\start_punish.sqf", [_attacker, "STRD_title_jailedCauseTK"]] call RE;
		_victim setDammage 0;
	}else{
		if({_victim in list _x}count NEUTRAL_ZONES > 0)then{
			[nil, _attacker, "loc", rEXECVM, "fx\jail\start_punish.sqf", [_attacker, "STRD_title_jailedCauseNZ"]] call RE;
			_victim setDammage 0;
		};
	};
};