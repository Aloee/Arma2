private ["_unit"];

_unit = _this select 0;
if (_unit isKindOf "MAN") then {_unit PlayMove "DeadState";} Else {{_x PlayMove "DeadState";}ForEach crew _unit;};

if ((_unit == player) or (_unit == vehicle player)) then {cutText ["","BLACK FADED",6000]; 0 fadeSound 0;};
sleep 1;
if (_unit isKindOf "MAN") then {_unit setDammage 1;} Else {{_x setDammage 1;}ForEach crew _unit;};