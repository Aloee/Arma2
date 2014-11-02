if(!isDedicated && !isServer)exitWith{};

while{true}do{
sleep 30;
	{
		private ["_inway", "_changed_squad"];
		
		_patrols = _x select 0;
		_guard_count_squads = _x select 1;
		
		_count_onbase = 0;
		{
			if(isNil {_x getVariable "in_way"})then{ _count_onbase = _count_onbase + 1 };
		} foreach _patrols;	

		_percent_to_cnt = ( (_count_onbase * _guard_count_squads) / 100);
		
		/*hint str _count_onbase;
		sleep 1;
		hint str _percent_to_cnt;*/
		
		if( (_count_onbase - 1) > _percent_to_cnt )then{
		
			while{isNil "_changed_squad"}do{
				_wayer_squad = _patrols select floor (random (count _patrols));
				if(isNil {_wayer_squad getVariable "in_way"} && !isNil {_wayer_squad getVariable "areaMarker"})then{ 
					_changed_squad = _wayer_squad;
				};
			};
			
			//hint str _changed_squad;

				_areaMarker = _changed_squad getVariable "areaMarker";
				_changed_squad setVariable ["in_way", true];

				_rand = active_patrolwp select  floor (random (count active_patrolwp - 1));
				_posPoint = getPosATL (call compile _rand);
				if(Z_TRACERWAY)then{
					_trackername = format["zway_%1_%2_%3",_index, str side _changed_squad, floor random 4]; 
					_markerobj = createMarker[_trackername,[0,0]];
					_markerobj setMarkerShape "ICON";
					_markertype = if (isClass(configFile >> "cfgMarkers" >> "WTF_Dot")) then {"WTF_DOT"} else {"DOT"};
					_trackername setMarkerType _markertype;
					_trackername setMarkerColor "ColorGreen";
					_trackername setMarkerText _trackername;
					_trackername setmarkerpos [_posPoint select 0, _posPoint select 1, 0];
				
				};
				sleep 1;

				if(count units group player == 1 && side player == side _changed_squad)then{
					//[player] join _changed_squad;
				};

				_vehicles = nearestObjects [leader _changed_squad, ["Car"], 200];
				_vh = 0;
				while { (count _vehicles) > _vh } do {
					_cveh = _vehicles select _vh;
					if(alive _cveh && canmove _cveh)then{
						_using = _cveh getVariable "attach_grp";
						_set_owner = _cveh getVariable "owner";
						if(isNil "_using" and isNil "_set_owner")exitWith{ _changed_squad addVehicle _cveh; };	
					};
				_vh = _vh+1;
				};
				
		_areaMarker setMarkerPos _posPoint;
		_changed_squad setSpeedMode "FULL";

		};
		sleep 3;
		
	}foreach [
		[dolg_patrols, dolg_guard_count_squads],
		[svo_patrols, svo_guard_count_squads]
	];		
};