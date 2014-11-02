if(!isServer) exitWith {};

_name = _this select 0;
_id = _this select 1;
_uid = _this select 2;

[_uid, [sidorch, voronin, luka, saharov],[]] call sfx_clearUserTasks;