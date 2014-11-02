if(!isServer && !isDedicated) exitWith {};

private ["_unit", "_mode", "_sayed"];

_unit = _this select 0;
_mode = _this select 1;

DYS_attack_phrases_military=["attack_phrase_17","attack_phrase_16"];
DYS_attack_phrases=["attack_phrase_2","attack_phrase_3","attack_phrase_4","attack_phrase_5","attack_phrase_6","attack_phrase_7","attack_phrase_8","attack_phrase_9","attack_phrase_10","attack_phrase_11","attack_phrase_12","attack_phrase_13","attack_phrase_14","attack_phrase_15","attack_phrase_18","attack_phrase_19","attack_phrase_20","attack_phrase_21","attack_phrase_22","attack_phrase_23"];
DYS_dead_phrases=["hero_down_1","hero_down_2","hero_down_3","hero_down_4","hero_down_5","hero_down_6"];


_sayed = _unit getVariable "sayed";


if((isNil "_sayed" and side _unit != civilian) or !alive _unit)then{
	
	_unit setVariable ["sayed", true];
	
	private ["_sound", "_sayer"];

	switch(_mode)do{
		case "attack":{
			switch(side _unit)do{
				case east :{_sound = DYS_attack_phrases_military select floor random count DYS_attack_phrases_military;};
				case west : {_sound = DYS_attack_phrases select floor random count DYS_attack_phrases;};
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
	
	if(!isNil "_sayer")then{
		[nil, nil, rCALLVAR, [_sayer, _sound], {(_this select 0) say (_this select 1)}] call RE;
	
		[_unit, _sayer] spawn {
			sleep 5;
			(_this select 0) setVariable ["sayed", nil];
			if(_this select 0 != _this select 1) then {
				deleteVehicle (_this select 1);
			};
		};
	};
};