private ["_vfxstate","_dmg","_pdmg","_dstate","_epicenter","_chance"];
_epicenter = _this select 0;
_range = _this select 1;
_chance = _this select 2; 
_vfxstate=0;
_dstate=0;

_artefacts = ["DAP_BLACKDRIP","DAP_GRAVI","DAP_EMPTY"];

if (isNil("_chance")) then {_chance=0.15;};

while {true} do {
_objects=list _epicenter;

{if ((!(alive _x)) or (_x isKindOf "DAP_ARTEFACT")) then {_objects=_objects-[_x];};}ForEach _objects;

if (count _objects>0) then {
	{
	if (alive _x) then {
	_epicenter say "dap_gravi_blast";
	if (!(_x isKindOf "AIR")) then {[(getPosATL _x select 0), (getPosATL _x select 1), (getPosATL _x select 2), 5] execvm "DAPANOMALIES\Scripts\Wave.sqf";};
	_x setVelocity [((random 25)-(random 25)),((random 25)-(random 25)),25];
	_x setDammage 1;
	if (!(_x isKindOf "DAP_BOLT")) then {[_epicenter,_range,_artefacts,_chance] execVM "DAPANOMALIES\Scripts\ArtefactSpawn.sqf";};
	};
	}ForEach _objects;
};
_pos = (_epicenter modelToWorld [0,0,0]);
_manpos = (player modelToWorld [0,0,0]);
_dist=(player distance [_pos select 0, _pos select 1, _manpos select 2]);

if (_dist<=(_range+25) and (player hasWeapon "DAP_DETECTOR") and (_dstate==0)) then 
	{
	_epicenter setVariable ["DAP_DETECTOR_STATE",1]; 
	[_epicenter,_range,0] execVM "DAPANOMALIES\Scripts\Detector.sqf";
	_dstate=1;
	};
	
if (_dist>(_range+25) and (player hasWeapon "DAP_DETECTOR") and (_dstate==1)) then 
	{
	_epicenter setVariable ["DAP_DETECTOR_STATE",0];
	_dstate=0;
	};
	
if ((_dist<=(_range+25)) and (player isKindOf "bloodsucker")) then 
	{
		if (_vfxstate==0) then {"dynamicBlur" ppEffectEnable true;"filmGrain" ppEffectEnable true;"filmGrain" ppEffectCommit 0.5; _vfxstate=1;};
		_fxb=((((_range+25)-_dist)/10)*3);
		"dynamicBlur" ppEffectAdjust [_fxb]; 
		"dynamicBlur" ppEffectCommit 0.1;
		"filmGrain" ppEffectAdjust [0.1, -1, 0.1, 0.05, 2, false];
		
	};
if ((_dist>(_range+25)) and (player isKindOf "bloodsucker") and (_vfxstate==1)) then 
	{
		"dynamicBlur" ppEffectEnable false;
		"filmGrain" ppEffectEnable false;
		_vfxstate=0;
	};
sleep 1;
};
