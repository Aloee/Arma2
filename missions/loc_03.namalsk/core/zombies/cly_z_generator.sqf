//Zombie generator script by Celery
if(!isDedicated && !isServer)exitWith{};
	
	private ["_trigger", "_monstParams", "_type", "_amount", "_radius", "_triggerpos", "_activatedist", "_deactivatedist", "_posx", "_posy", "_zInitFile", "_group", "_count"];
	
	_trigger=_this select 0;
	_monstParams =  _this select 1;
	_type =_monstParams select 0;
	_amount=_monstParams select 1;
	_radius=((triggerArea _trigger) select 0) min ((triggerArea _trigger) select 1);
	_triggerpos=[(getPosATL _trigger) select 0, (getPosATL _trigger) select 1, 0];
	_activatedist=_radius/cos 45 + CLY_maxspawndist;
	_deactivatedist=_activatedist+100;

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
	
	_zInitFile =  compile preprocessFile "core\zombies\cly_z_init.sqf"; 
	_group = createGroup militaryCenter;

	_count = 0;
	while{_count <= _amount and isNil {_trigger getVariable "abandoned"}}do{
		private ["_class", "_pos", "_zombie"];
		
		_class =  _type call CLY_randomzombie;
		_pos = [_trigger, _radius] call fz_sfx_getRandomPointCheckScreen;
		
		_zombie = _group createUnit [_class, _pos, [], 0, "NONE"];
		FZ_ZOMBIES set [count FZ_ZOMBIES, _zombie];
		
		_zombie setVariable ["zombietype", "classic"];
		[_zombie, _trigger] call _zInitFile; 
		
		_count = _count + 1;
	sleep 1;
	};
	
	{[_x] join grpNull}foreach FZ_ZOMBIES;
	
	_trigger setVariable ["process", nil];
