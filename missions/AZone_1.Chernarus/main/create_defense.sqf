if(!isDedicated && !isServer)exitWith{};

_data_array = _this;
_groups = [];

{
	_type = _x select 0;
	_pos = _x select 1;
	_dir = _x select 2;
	_height = _x select 3;
	_side = _x select 4;
	_respawner = _x select 5;
	_move = _x select 6;
	_radius = _x select 7;
	
	_group = createGroup _side;
	if(!isNil "_group")then{
		_vehicle = createvehicle [_type, [0,0,0],[], 0, "NONE"];
		_vehicle setVariable ["session", sessionkey];
		
		_vehicle setdir _dir;
			if(typeName _pos == "STRING")then{
				[nil, nil, "per", rCALLVAR, [], {_pos setMarkerAlpha 0}] call RE;
				_pos = [abs((getMarkerPos _pos) select 0), abs((getMarkerPos _pos) select 1), _height];
			};
			_vehicle setpos _pos;

		_vehicle addEventHandler ["fired",{(_this select 0) setvehicleammo 1;}];
		_vehicle addEventHandler ["killed", {brok_vehicles set [count brok_vehicles, _this select 0]}];
		if(_move)then{
			_vehicle addEventHandler ["fuel",{(_this select 0) setfuel 1;}];
		}else{
			_vehicle setfuel 0;	
		};

		if(!isNil "_vehicle")then{
			[_group, _vehicle] call sfx_create_crews;

			if(_vehicle isKindOf "Mi24_Base")then{
				_nul=[_vehicle] execVM "fx\heliway.sqf";
				_pos = getMarkerPos "heliwp";
			};
		};
		 
		
			_group setFormDir _dir;
			
			if(_move)then{

				_leader = leader _group;

				_nameMarker = format["mark_%1_%2_defenseGroup", side _leader, floor random 666666];	
				
				_grpMarker = createMarkerLocal[_nameMarker, [_pos select 0,_pos select 1]];
				if(!isNil "_grpMarker")then{
					_grpMarker setMarkerShapeLocal "ELLIPSE";
					_nameMarker setMarkerTypeLocal "Faction_CDF";
					_nameMarker setMarkerColorLocal "ColorOrange";
					 _nameMarker setMarkerAlpha 0;
					_nameMarker setMarkerSize [_radius, _radius];
		
					[_leader,_nameMarker] spawn PRECMPL_UPS;

					_group setVariable ["areaMarker", _nameMarker];
				};
			};
			
			if(_respawner)then{
				_group setVariable ["data_init", _x];
				_group setVariable ["grp_info", "defense"];
				_group setVariable ["grp_vehicle", _vehicle];
			};
		
		
		defenses set [count defenses, _group];
		_groups set [count _groups, _group];
	};
}foreach _data_array;

_groups