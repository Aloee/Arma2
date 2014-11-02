//Zombie generator script by Celery
if (!isServer) exitWith {};

_trigger=_this select 0;
_amount=_this select 1;
if(_amount==0)exitwith{};

_radius=((triggerArea _trigger) select 0) min ((triggerArea _trigger) select 1);
_triggerpos=[(getPosATL _trigger) select 0, (getPosATL _trigger) select 1, 0];

//Continue if logic is inside area of operations (or there is no such area)
_posx= (getPosATL _trigger) select 0;
_posy= (getPosATL _trigger) select 1;
if (!isNil "generatorminxy" and !isNil "generatormaxxy") then {
	if (_posx<getPosATL generatorminxy select 0 or _posx>getPosATL generatormaxxy select 0 or _posy<getPosATL generatorminxy select 1 or _posy>getPosATL generatormaxxy select 1) exitWith {deleteVehicle _trigger};
};

//Zombie amount if set to default
if (_amount<0) then {
	_amount=round (CLY_defaultdensity*abs _amount);
};

_group=createGroup civilian;
_count = 0;

while{_count <= _amount and isNil {_trigger getVariable "abandoned"}}do{
	_zombietype="armored";
	_r=random 100;
	_total=0;
	{if (_r>_total and _r<=_total+(_x select 1)) then {_zombietype=_x select 0};_total=_total+(_x select 1)} forEach CLY_zombietypes;

	
	_class= if !(_zombietype in ["armored","slow armored"]) then { call CLY_randomzombie } else { call CLY_randomarmoredzombie };
	_zombie= _group createUnit [_class, getPosATL zombiespawner, [], 50, "NONE"];
	zombies set [count zombies, _zombie];
	
	_pos=[((_triggerpos select 0)-(_radius/2))+random _radius,((_triggerpos select 1)-(_radius/2))+random _radius,0];
	[_zombie, _pos, _zombietype, _trigger] call PRECMPL_CLYZOMBIEINIT; 
	_count = _count + 1;

sleep 0.5;
};

_trigger setVariable ["process", nil];