if(!isServer && !isDedicated) exitWith {};
call compile preProcessFile "\inidbi\init.sqf";

FZ_DATABASE = "FZ_DBi";

/*FUNCTIONS LIST*/
fz_sfx_database_get_locations = {
	private ["_locations"];
	
	_locations = [];
	{_locations set [count _locations, [_x, [FZ_DATABASE, "LOCATIONS", _x, "ARRAY"] call iniDB_read]]}foreach _this;
_locations
};

fz_sfx_database_set_locations = {
	{[FZ_DATABASE, "LOCATIONS", _x select 0, _x select 1] call iniDB_write}foreach _this;
};

fz_sfx_database_locations_init = {
	
	if (FZ_DATABASE call iniDB_exists)then{
		private ["_locMarks"]; _locMarks = [];
		{_locMarks set [count _locMarks, _x select 0]}foreach _this;
		FZ_LOCATIONS = _locMarks call fz_sfx_database_get_locations;
	}else{_this call fz_sfx_database_set_locations};
	
	private ["_trgs", "_trg", "_markerPlace", "_params", "_radius"];
	
	_trgs = [];
	
	{
		_markerPlace = _x select 0;
		_params = _x select 1;
			_radius = _params select 0;
		
		_trg=createTrigger["EmptyDetector", getMarkerPos _markerPlace];
		_trg setTriggerArea[_radius select 0, _radius select 1, 0, false];
		_trg setTriggerActivation["ANY","PRESENT",true];
		_trg setTriggerStatements["{isPlayer _x} count thisList > 0", "if(isNil {thisTrigger getVariable ""activated""})then{thisTrigger execVM ""core\location\openLocation.sqf""}", "thisTrigger call fz_sfx_closeLocation"];
		
		_trg setVariable ["locationProps", _x];
		_trg setVariable ["triggerProps", [call compile (_params select 1), 100, false, true]];
		_trgs set [count _trgs, _trg];
		
	}foreach FZ_LOCATIONS;

_trgs;
};

// _section = if(isMultiplayer)then{getPlayerUID player}else{"Local"};
// _ret = [FZ_DATABASE, "ACTORS", _section, [1500, []]] call iniDB_write;