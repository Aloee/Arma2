//Server
if(!isServer && !isDedicated) exitWith {};

_unit = _this select 0;
_mode = _this select 1;

	
_sayed = _unit getVariable "sayed";
	
if(isNil "_sayed" and side _unit != civilian)then{
	_unit setVariable ["sayed", true];
	
	private ["_sound", "_sayer"];

	switch(_mode)do{
		case "attack":{
			switch(side _unit)do{
				case west :{_sound = DYS_attack_phrases_military select floor random count DYS_attack_phrases_military;}; //military
				case east : {_sound = DYS_attack_phrases select floor random count DYS_attack_phrases;};
				case resistance : {_sound = DYS_attack_phrases select floor random count DYS_attack_phrases;};
			};
			_sayer = _unit;
		};
		case "dead":{
			_sound = DYS_dead_phrases select floor random count DYS_dead_phrases;
			_sayer = "HeliHEmpty" createVehicleLocal [0,0,0];
			_sayer attachTo [_unit,[0,0,1.5]];			
		};
	};

	_sayer say _sound;
	
	[_unit, _sayer] spawn {
		sleep 60;
		(_this select 0) setVariable ["sayed", nil];
		if(_this select 0 != _this select 1) then {
			deleteVehicle (_this select 1);
		};
	};
	
	[_unit,_sound] call CLY_z_attackpv;
	
};