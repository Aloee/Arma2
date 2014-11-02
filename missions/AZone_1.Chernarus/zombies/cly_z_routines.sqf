_zombietype = _this getVariable "zombietype";
_homeZone = _this getVariable "homeZone";
_wait=time+random 35;
_noisewait=5+random 40;
_victimchangecooldown=time;

_radius=CLY_minaggroradius+random (CLY_maxaggroradius-CLY_minaggroradius);
if (_zombietype in ["crawler","sneaker"]) then {_radius=CLY_maxaggroradius};
_victimradius=CLY_randomvictimradius;
if (_victimradius>0 and _victimradius<=1) then {_victimradius=_radius*_victimradius};

while {alive _this && time > _cycleScl} do {
	
	_victim = _this getVariable "victim";
	if(isNull _victim)then{
		//Initiate idling
		if (_zombietype in ["normal","surprise","crawler","sneaker","armored","slow armored"]) then {_this lookAt objNull};
		if (_zombietype in ["crawler","passive crawler","sneaker","ambusher"]) then {_this setUnitPos "DOWN"};
		if(typeof _this == "Fin" or typeof _this == "Pastor")then{_this setSpeedMode "FULL"}else{_this setSpeedMode "LIMITED"};
				
		//Noise
		if (_zombietype=="normal" and time>_noisewait) then {
			_sound=CLY_noises_idle select floor random count CLY_noises_idle;
			[_this, _sound] call CLY_z_noisepv;
			_noisewait=time+5+random 40;
		};
				
		//Go home
		if(!isNull _homeZone and time>_wait)then{
			if not (_this in list _homeZone) then {
				_this doMove (_this getVariable "homePos");
			}else{
				_radius=((triggerArea _homeZone) select 0) min ((triggerArea _homeZone) select 1);	
				_pos=[(getPosATL _homeZone select 0)-_radius+random _radius*2,(getPosATL _homeZone select 1)-_radius+random _radius*2,0];
				_this doMove _pos;
			};
			_wait = time + 10 + random 60;
		};

		//Search nearest victim
		_dist=if(typeof _this == "Fin" or typeof _this == "Pastor")then{500}else{200};
				
		_victims=[];
		{
			if (_this distance vehicle _x < _dist and _this knowsAbout vehicle _x > 0) then {
				if(!((vehicle _x) isKindof "StaticWeapon") && !((vehicle _x) isKindof "Wheeled_APC") &&  !((vehicle _x) isKindof "Tank"))then{
					_victims set [count _victims, _x];
				};
			};
		} forEach CLY_zombievictims;
				
		//Determine victim
		if (count _victims > 0) then {
			if (count _victims > 1) then {_victim = _victims select floor random count _victims} else {_victim = _victims select 0};
				_this setVariable ["victim", _victim];
				if (_zombietype=="ambusher") then {_this setUnitPos "UP"};
		}else{
			_this setVariable ["victim", objNull];
		};
	}else{
	
	};
	
_cycleScl=time+1;
};