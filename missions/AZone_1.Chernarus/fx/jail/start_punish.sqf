if(local player)then{
	_killer = (_this select 0) select 0;
	_causeStr = (_this select 0) select 1;

	if (!alive _killer) exitWith {};

	isKiller = true;
	kill_count = kill_count + 1;

	if(alive _killer)then{
		jail = [_killer, _causeStr] execVM "fx\jail\killer.sqf";
		check = [_killer] execVM "fx\jail\jail_check.sqf";
		escapee = [_killer] execVM "fx\jail\escapee.sqf";
		null = [_killer] execVM "fx\jail\no_esc_key.sqf";
		
	};
};
