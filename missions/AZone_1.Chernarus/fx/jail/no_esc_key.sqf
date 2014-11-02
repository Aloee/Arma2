
_killer = _this select 0;

if (!alive _killer) exitWith {};

waitUntil {inJail};

noesckey = (findDisplay 46) displayAddEventHandler ["KeyDown", "if ((_this select 1) == 1) then { true }"];

while {inJail} do {

	if ((!alive _killer) OR (!isPlayer _killer)) exitWith {(findDisplay 46) displayRemoveEventHandler ["KeyDown", noesckey];};
	if (!injail) exitWith {(findDisplay 46) displayRemoveEventHandler ["KeyDown", noesckey];};

	sleep 1;
};

if (!alive _killer) then {
	(findDisplay 46) displayRemoveEventHandler ["KeyDown", noesckey];
};

if (!injail) exitWith {
	(findDisplay 46) displayRemoveEventHandler ["KeyDown", noesckey];
};
