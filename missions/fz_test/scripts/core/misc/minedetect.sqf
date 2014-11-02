_unit = _this select 0;

_bomb1 = "B_30mm_HE"  createVehicle [(getPosASL _unit select 0),( getPosASL _unit  select 1),-3];
_bomb2 = "GrenadeBase" createVehicle [(getPosASL _unit select 0),( getPosASL _unit  select 1),-40];
_unit setdamage 0.89;