if(!isServer && !isDedicated)exitwith{};

while {true} do {
	
	// _str = "";
	// {
		// _str = _str + format ["%1 : %2 - %3 \n", _x, count units _x, _x getVariable "used"];
	// }foreach allGroups;
	
	_statistic = [];
	{
		_trigger = _x select 0;
		_monstParams =  _x select 1;
		_amount  = _monstParams select 1;
		_p_distances = [];
		_zombies = [];
		_persent_zombies = floor ( (_amount * 30) / 100);
		_abandoned = true;

			//detected
			if(count (list _trigger) > 0)then{
				{
					if(!isNil {_x getVariable "zombietype"})then{_zombies set [count _zombies, _x]};
					if({alive _x} count (list _trigger) > 0)then{_abandoned = false};
					//if(isPlayer _x)then{_abandoned = false};
				}foreach (list _trigger);
			};
			
			//update list
			if(!_abandoned)then{
			//open zone
				_trigger setVariable ["abandoned", nil];
				if(count _zombies == 0 and isNil{_trigger getVariable "process"} and (count FZ_ZOMBIES < FZ_MAX_ZOMBIE_COUNT))then{
					_trigger setVariable ["process", true];
					[_trigger, _monstParams] execVM "zombies\cly_z_generator.sqf";
				};
			}else{
			//clear zone
				_trigger setVariable ["abandoned", true];
				if(count _zombies > 0)then{
					{if(player distance _trigger > FZ_ABONDED_DIST + ((triggerArea _trigger) select 0))then{
						FZ_ZOMBIES = FZ_ZOMBIES - [_x];
						deletevehicle _x;
					}}foreach _zombies;
				};
			};
			
		_statistic set [count _statistic,  [if(_abandoned)then{0}else{1}, count _zombies]];
		
		sleep 0.3;
	}foreach FZ_ZONES;
	
	if(CLY_debug)then{ [debug, nil, rglobalChat,  format ["FPS %2 FZ_ZONES %1", _statistic, diag_fpsmin]] call RE };
	sleep 5;
};