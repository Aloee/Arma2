if(!isServer) exitWith{};
_sl = _this select 0;
_dist = _this select 1;
waitUntil {!isNil "bis_fnc_init"};
[group _sl, position _sl, _dist] call BIS_fnc_taskPatrol;