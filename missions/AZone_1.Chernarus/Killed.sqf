actionsAgain = [];

while {true} do {
waitUntil {alive player};
	
	cutRsc ["Hud","PLAIN"];
	_p = player execfsm "fx\flashlight.fsm";	
	
	if(count actionsAgain != 0)then{
		{call compile _x}foreach actionsAgain;
	};
	
	_p = [] execvm "fx\infohint.sqf";
	
waitUntil {!alive player};
	
	player setVariable ["DAP_XRAY_DAMAGE", nil];
	player setVariable ["DAP_PSY_DAMAGE", nil];
	
	////////////drop items
	/* */
	//ZONA_serverDeadUserSpawnItems = ["money",["EvMoney", money, getPosATL player]];
	//publicVariable "ZONA_serverDeadUserSpawnItems";
	
	["money",["EvMoney", money, getPosATL player], true] call fx_dropPlayerItems;
	
	_items = [["artefacts", artefacts],["stuff", stuff], ["weaponsParts", weaponsParts]];
	if({count (_x select 1) > 0} count _items > 0)then{
		//ZONA_serverDeadUserSpawnItems = ["inv",["Suitcase", _items, getPosATL player]];
		//publicVariable "ZONA_serverDeadUserSpawnItems";
		["inv",["Suitcase", _items, getPosATL player], true] call fx_dropPlayerItems;
	};
	
	/*
	_holder = "WeaponHolder" createVehicle getPosATL player;
	{_holder addMagazineCargo [_x,1]; } foreach magazines player;
	{_holder addWeaponCargo [_x,1]; } foreach weapons player;
	*/
	
	_lastMags = magazines player;
	_lastWeaps = weapons player;
	_deadPos = getPos player;
	
	//money = 0;
	//artefacts = [];
	//stuff = [];
	//weaponsParts = [];
	//////////////////////

	titleCut["", "BLACK out", 20];
	waitUntil {alive player};
	
	removeAllWeapons player;
	{player removeMagazine _x} foreach magazines player;
	{player addWeapon _x} foreach _lastWeaps;
	{player addMagazine _x} foreach _lastMags;
	player addMagazine "HandGrenade_Stone";
	
	if(_deadPos distance (getMarkerPos "arenaCenter") < 85)then{
		_barSpawn = getMarkerPos "respawn_bar";
		player setPosATL [abs (_barSpawn select 0), abs (_barSpawn select 1), 1];;
	}else{
		if(habar select 0 != 0 && resPlace == 2)then{
			player setpos [(habar select 0)+(random 3),(habar select 1)+(random 3), habar select 2];
		};
	};

	titleCut["", "BLACK in", 1];
	call fx_backgroundDynamicBlur;
};