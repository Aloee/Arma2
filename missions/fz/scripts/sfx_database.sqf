if(!isServer && !isDedicated) exitWith {};

	call compile preProcessFile "\inidbi\init.sqf";
	#include "definitions.sqf";

	_var = if(isMultiplayer)then{getPlayerUID player}else{"Local"};
	_ret = [FZ_DATABASE, "ACTORS", _var, [1500, []]] call iniDB_write;