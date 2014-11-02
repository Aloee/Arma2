_vehicle = _this select 0;
_actor = _this select 1;

_vehicle lock true;
_vehicle setVariable ["repairing", true, true];

_repairDelay = 0;
while {!canmove _vehicle and _repairDelay < 20 and !isNil {_vehicle getVariable "repairing"}} do {

	//[nil, _actor, rplaymove, "AinvPknlMstpSlayWrflDnon_medic"] call RE;
	_actor playmove "AinvPknlMstpSlayWrflDnon_medic";

	if(!alive _vehicle or !alive _actor)then{
		_vehicle setVariable ["repairing", nil, true];
	};

_repairDelay = _repairDelay + 1;

sleep 3;
};

if(!isNil {_vehicle getVariable "repairing"})then{
	_vehicle setDammage (getDammage _vehicle - 0.3);
	_nowkits = (_vehicle getVariable "repair_kits") - 1;
	_vehicle setVariable ["repair_kits", _nowkits, true];
	hint parseText format [["Green", localize "STR_hint_repairDone"] call fx_getformat_string, _nowkits];
}else{
	hint parseText format ["%1", ["Red", localize "STR_hint_repairBreak"] call fx_getformat_string];
};

_vehicle lock false;
_vehicle setVariable ["repairing", nil, true];
