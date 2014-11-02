_heli = _this select 0;
_pilot = driver _heli;

_heli lock true;
_heli addEventHandler ["GetOut", {(_this select 0) setDammage 1}];
sleep DELAY_HELIWAY;	

group _pilot setspeedmode "FULL";
sleep 10;
_heli setBehaviour "Careless";
_pilot action ["lightOn", _heli];
