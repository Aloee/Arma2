if(!isServer && !isDedicated)exitwith{};

_group = _this select 0;
_brokv = _this select 1;

_grp_vehs_drvs = _group getVariable "grp_vehs_drvs";
_reservers = _group getVariable "CargoSquad";
		
	private ["_brokd"];
	{
		if( (_x select 0) == _brokv)exitwith{_brokd = (_x select 1)}
	}foreach _grp_vehs_drvs;
	if(!isNil "_brokd")then{
		if(alive _brokd)then{
			_reservers set [count _reservers, _brokd];
			_group setVariable ["CargoSquad", _reservers];
		};
	};

	//Stop
	while{count (waypoints _group) != 0 && !isNil "_group"}do{
		deleteWaypoint ((waypoints _group) select 0);
	};

	_wp = _group addWaypoint [getPosATL _brokv, 0];
	_wp setWaypointPosition [getPosATL _brokv, 30];
	_wp setWaypointType "GUARD";
	
	//Repair
	while {alive _brokv && getDammage _brokv != 0 && !isNil "_group"} do {
		_brokv setDammage (getDammage _brokv - 0.001);
	sleep 5;
	};
	
	//Add driver
	_reservers = _group getVariable "CargoSquad";

	if(count _reservers != 0)then{		
		_new_driver = _reservers select (count _reservers - 1);

		_new_driver assignAsDriver _brokv;
		[_new_driver] ordergetin true;
		[_new_driver] allowGetIn true;
		
		_ind = 0;
		{
			if((_x select 0) == _brokv)exitwith{};
			_ind = _ind + 1;
		}foreach _grp_vehs_drvs;
		
		_grp_vehs_drvs set [_ind, [((_grp_vehs_drvs select _ind) select 0), _new_driver]];
						
		_reservers = _reservers - [_new_driver];
		_group setVariable ["CargoSquad", _reservers];
		_new_driver addEventHandler ["killed", {_xu = _this execVM "cnv\act\way_drrplc.sqf"}];		
	};
	//Go
	while{count (waypoints _group) != 0 && !isNil "_group"}do{
		deleteWaypoint ((waypoints _group) select 0);
	};
	[_group] execVM "cnv\way.sqf";