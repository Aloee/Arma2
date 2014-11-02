_vehicle = _this select 0;
_actor = _this select 1;

_vehicle setVariable ["repairing", nil, true];
[nil, _actor, rswitchmove, ""] call RE;


