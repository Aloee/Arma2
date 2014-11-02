_killer = _this select 0;

if (!alive _killer) exitWith {isKiller=false;};

waitUntil {inJail};

sleep 2;

waitUntil {_killer distance jail_center_H > 12};

sleep 2;

if ((inJail) && (alive _killer) && (_killer distance jail_center_H > 12)) then {

	cutText [localize "STRD_title_escapingjaildead1","PLAIN DOWN",1];
	[debug, nil, rglobalChat,  format[localize "STRD_title_escapingjaildead2",name _killer]] call RE;
	sleep 1;
	_killer setDammage 1;

	sleep 3;
	cutText ["","PLAIN DOWN",1];
};

inJail=false;
isKiller=false;