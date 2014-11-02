if(local player)then{

private ["_vfxstate","_dmg","_pdmg"];

_epicenter = _this select 0;
_range = _this select 1;
_vfxstate=0;

while {!FZ_BREAK_ANOMALIES} do {
	
	_dist=(player distance [_epicenter select 0, _epicenter select 1, 0]);
	
	if(_dist < FZ_MIN_DIST_ACTIVATE_ANOMALIE)then{ //for optimization
	
		_objects = nearestObjects [[(_epicenter select 0),(_epicenter select 1), 0], ["Land"], _range];
			
		if ({alive _x} count _objects>0) then {

			{
				if ((_x distance _epicenter)<_range) then
				{
					_dmg = _x getVariable "DAP_PSY_DAMAGE";
					if (isNil("_dmg")) then {_dmg=0;_x setVariable ["DAP_PSY_DAMAGE",0];};
					_dmg = _dmg+0.015;
					if (player in crew _x) then {player setVariable ["DAP_PSY_DAMAGE",_dmg];};
					_x setVariable ["DAP_PSY_DAMAGE",_dmg];
					
					//if (_dmg>1) then {[_x] execVM "core\anomalies\Scripts\PsyZombeing.sqf";};
				};
			}ForEach _objects;
		};


		if (_dist<=_range) then {

			if (_vfxstate==0) then {"dynamicBlur" ppEffectEnable true;"filmGrain" ppEffectEnable true;"colorCorrections"ppEffectEnable true; "dynamicBlur" ppEffectCommit 0.1;"filmGrain" ppEffectCommit 0.5; _vfxstate=1;};
			_pdmg = player getVariable "DAP_PSY_DAMAGE";
			if (!(isNil("_pdmg"))) then{
					_fxb=(_pdmg*5);
					_fxc = 1 - _pdmg ;
					"dynamicBlur" ppEffectCommit 0.1;
					"dynamicBlur" ppEffectAdjust [_fxb];
					"colorCorrections" ppEffectAdjust [1, 1, 0, [0,0,0,-0.1], [1,1,0,_fxc], [0,1,1,_fxc]]; 
					"colorCorrections" ppEffectCommit 0.1;
			};
			"filmGrain" ppEffectAdjust [0.1, -1, 0.1, 0.05, 2, false];
			_pfx = player getVariable "DAP_PSYEFFECT";
			if (isNil("_pfx")) then {[] execVM "core\anomalies\PsyFX.sqf";};
		};
		if ((_dist>_range) and (_vfxstate==1)) then {
			call fz_fx_backgroundDynamicBlur;
			_pfx = player getVariable "DAP_PSYEFFECT";
			if (!(isNil("_pfx"))) then {player setVariable ["DAP_PSYEFFECT",0];};
			_vfxstate=0;
			
			titleCut [" ","BLACK IN",0.5];
		};
	};	
/*
if ((player HasWeapon "DAP_PSYONIC_SHIELD") and (_vfxstate==1)) then {
		"dynamicBlur" ppEffectEnable false;
		"filmGrain" ppEffectEnable false;
		"colorCorrections" ppEffectEnable false;
		_pfx = player getVariable "DAP_PSYEFFECT";
		if (!(isNil("_pfx"))) then {player setVariable ["DAP_PSYEFFECT",0];};
		_vfxstate=0;
};
*/
sleep random 5;
};

call fz_fx_backgroundDynamicBlur;

};