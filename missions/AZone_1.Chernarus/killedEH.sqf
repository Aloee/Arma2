_killed = _this select 0;
_killer = _this select 1;

/*
	ZONA_killedPlayerEH = [_killed, _killer];
	publicVariable "ZONA_killedPlayerEH";
*/


waitUntil{!isPlayer _killed};
deleteVehicle _killed;