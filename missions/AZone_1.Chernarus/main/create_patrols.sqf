if(!isDedicated && !isServer)exitWith{};

_data = _this;
_groups = [];

{

	_side = _x select 0;
	_units = _x select 1;
	_marker = _x select 2;
	_ammo = _x select 3;
	_doparams = _x select 4;
	_radius = _x select 5;

	_group = createGroup _side;

	[nil, nil, "per", rCALLVAR, [], {_marker setMarkerAlpha 0}] call RE;

	if(!isNil "_group")then{
		{
			_x createUnit [[abs((getMarkerPos _marker) select 0), abs((getMarkerPos _marker) select 1), 0], _group, "this addEventHandler [""fired"",{vehicle (_this select 0) setvehicleammo 1;_ds = [_this select 0, ""attack""] call PRECMPL_ATTACKSAY}];this addEventHandler [""killed"",{ _ds = [_this select 0, ""dead""] call PRECMPL_ATTACKSAY; dead_bodys set [count dead_bodys, _this select 0]; }]; [this, _ammo] spawn PRECMPL_PATROLWEAPLOAD;", 1, "MAJOR"];
		}foreach _units;

		_leader = leader _group;
		//marker partol area for group
		_nameMarker = format["mark_%1_%2_patrolGroup", side _leader, floor random 666666];	
		_grpMarker = createMarkerLocal[_nameMarker, getMarkerpos _marker];
		if(!isNil "_grpMarker")then{
			_grpMarker setMarkerShapeLocal "ELLIPSE";
			_nameMarker setMarkerTypeLocal "Faction_CDF";
			_nameMarker setMarkerColorLocal "ColorOrange";
			_nameMarker setMarkerSize [_radius, _radius];
			
			([_leader,_nameMarker]+_doparams) spawn PRECMPL_UPS;

			_group setVariable ["areaMarker", _nameMarker];
			_group setVariable ["data_init", _x];
			_group setVariable ["grp_info", "patrol"];
			_group setVariable ["start_pos", _marker];

			patrols set [count patrols, _group];
			_groups set [count _groups, _group];
		};
	};

}foreach _data;


_groups