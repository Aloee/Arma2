if(!isDedicated && !isServer)exitWith{};

private ["_data", "_groups"];

_data = _this;
_groups = [];

{
	private ["_side", "_units", "_pos", "_ammo", "_radius", "_respawn", "_group", "_leader"];
	
	_side = _x select 0;
	_units = _x select 1;
	_pos = _x select 2;
	_ammo = _x select 3;
	_radius = _x select 4;
	_respawn = _x select 5;

	_group = createGroup _side;

	if(!isNil "_group")then{
		{
			_x createUnit [_pos, _group, "this addEventHandler [""fired"",{_ds = [_this select 0, ""attack""] spawn PRECMPL_DSAYER}];this addEventHandler [""killed"",{ _ds = [_this select 0, ""dead""] spawn PRECMPL_DSAYER; FZ_DEAD_BODYS set [count FZ_DEAD_BODYS, _this select 0]; (_this select 0) spawn fz_sfx_checkGroup}]; [this, _ammo] call PRECMPL_PATROLWEAPLOAD;", 1, "MAJOR"];	
			sleep 0.3;
		}foreach _units;
		
		// hint str side leader _group;
		_leader = leader _group;
		[_group, getPos _leader, _radius] spawn PRECMPL_BIS_DEFEND;
		
		_group setVariable ["data", _x];
		_group setVariable ["respawn", _respawn];
		_group setVariable ["type", "patrol"];
	
		_groups set [count _groups, _group];
	};

}foreach _data;


_groups