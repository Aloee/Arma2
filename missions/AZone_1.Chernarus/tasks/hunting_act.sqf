_victim = _this select 0;
_killer = _this select 1;

if(isPlayer _killer)then{
	ZONA_killedVictim = [getPlayerUid _killer];
	publicVariable "ZONA_killedVictim";
};