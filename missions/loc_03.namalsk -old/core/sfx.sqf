fz_sfx_zone_add = {
	waitUntil{!isNil "FZ_ZONES"};
	FZ_ZONES set [count FZ_ZONES, _this];
};

fz_sfx_closeLocation = {
	_groups = _this getVariable "spawnedGroups";
	{{deleteVehicle _x} foreach units _x} foreach _groups;
	_this setVariable ["activated", nil];
	_this setVariable ["spawnedGroups", nil];
};

fz_sfx_getLocUnits = {
	private ["_units"];
	_units = [];
	if(count (list _this) > 0)then{
		{
			if((_x isKindOf "CAManBase" or _x isKindOf "LandVehicle") and isNil{_x getVariable "npc"})then{
				if(vehicle _x == _x)then{_units set [count _units, _x]}else{{_units set [count _units, _x]}foreach crew (vehicle _x)};
			};
		}foreach (list _this);
	};
_units
};

fz_sfx_checkGroup = {
	private ["_group"];
	
	_group = group _this;
	_group setVariable ["used", true];

	if({alive _x} count (units _group) == 0)then{
		_group call PRECMPL_DEADGROUPS;
	};
};

fz_sfx_protectNpc = {
	_this setBehaviour "CARELESS";
	_this setCaptive true;
	_this setVariable ["spectating", true];
	_this addEventHandler ["HandleDamage", {(_this select 3) setDammage (getDammage (_this select 3) + (_this select 2));false}];
};

/*
fz_sfx_checkPosScreen = {
	_visitor = _this select 0;
	_objectPos = _this select 1;
	_viewDistance = 50;
	_visible = false;

	_posVp = [((getPosATL _visitor) select 0)+_viewDistance * sin(getDir _visitor),((getPosATL _visitor) select 1)+_viewDistance * cos(getDir _visitor), 0];
	if(_posVp distance _objectPos < _viewDistance)then{_visible = true};
		
_visible
};
*/

fz_sfx_check_spawnDistance = {
	private ["_result"];
	
	_result = true;
	{
		if( (_this distance getMarkerPos _x) < FZ_MIN_RESPAWNS_DISTANCE_ANOMALIES )then{ _result = false;};
	}foreach FZ_NO_ANOMALIES_LOCATIONS;
_result
};

fz_sfx_get_random_positions = {
	private ["_pos", "_x", "_y", "_count", "_positions", "_i"];
	
	_pos = _this select 0;
	_x = _this select 1;
	_y = _this select 2;
	_count = _this select 3;

	_positions = [];

	for [{_i=0}, {_i< _count}, {_i=_i+1}] do {
		
		_position = [((_pos select 0)-_x)+floor random (_x*2), ((_pos select 1)-_y)+ floor random (_y*2), 0];
		
		if(_position call fz_sfx_check_spawnDistance and !surfaceIsWater _position)then{
			_positions set [count _positions, _position];
		};
	};

_positions
};
	
	
fz_sfx_getRandomPointCheckScreen = {
	private ["_trigger", "_radius", "_visable", "_randPos"];
	
	_trigger = _this select 0;
	_radius = _this select 1;
	_visable = true;
	
	while{_visable}do{
		_randPos = [((getPos _trigger) select 0)-_radius+random _radius*2,((getPos _trigger) select 1)-_radius+random _radius*2, 0];
		if(count (worldToScreen _randPos) == 0)then{_visable = false};
	};
		
_randPos
};

fz_sfx_create_public_marker = {
	private ["_name", "_pos", "_size", "_color", "_anomaliname", "_shape", "_type"];
	
	_name = _this select 0;
	_pos = _this select 1;
	_size = _this select 2;
	_color = _this select 3;
	_anomaliname = _this select 4;
	_shape = _this select 5;
	_type = _this select 6;

	markerstr = createMarker[_name,_pos];
	markerstr setMarkerShape _shape;
	_name setMarkerType _type;
	_name setMarkerSize [_size, _size];
	_name setMarkerColor _color;
	_name setMarkerText  format ["%1", _anomaliname];
	publicVariable "markerstr";
	
};

fz_sfx_createArtefacts = {
	{
		private ["_pos", "_name", "_artefactRandName", "_artefactArt", "_artefacts", "_type", "_artefact"];
		
		_pos = _x select 0;
		_name = _x select 1;
		_artefactRandName = _x select 2;
		_artefactArt = _x select 3;

		switch(_name) do {
			case "Gravi":{_artefacts = ["DAP_BLACKDRIP","DAP_GRAVI","DAP_EMPTY"]};
			case "Burn":{_artefacts = ["DAP_AMEBA","DAP_CRYSTALL", "DAP_FIRE"]};
			case "Mincer":{_artefacts = ["DAP_MEAT"]};
			case "Electro":{_artefacts = ["DAP_ELECTRA","DAP_SPIKES","DAP_BATTERY"]};
			case "Tornado":{_artefacts = ["DAP_STONEBLOOD"]};
			case "Souls":{_artefacts = ["DAP_TEARS", "DAP_SOUL"]};
			default {_artefacts = []};
		};
		
		if(count _artefacts > 0)then{
			_type = _artefacts select (floor random count _artefacts);
			_artefact = createVehicle [_type, [_pos select 0, _pos select 1, 0.5], [], 0, "NONE"];
			_artefact setVehicleInit format["[this, %1] call fz_fx_setEffectArtefact_cli", _artefactArt];
			processInitCommands;
		};
	}foreach _this;
};

fz_sfx_isStalker = {
	private ["_isStalker"];
	
	_isStalker = false;
	{if(typeOf _this in _x)then{_isStalker = true}}foreach FZ_NORMAL_UNITS+FZ_FREEDOM_UNITS+FZ_DUTY_UNITS;
_isStalker
};

fz_sfx_getUnitShapes = {
	private ["_count", "_sideCenter", "_protected", "_shapes", "_array"];
	
	_count = _this select 0;
	_sideCenter = _this select 1;
	_protected = _this select 2;
	_shapes = [];
	
	_array = switch(_sideCenter)do{
		case "stalkerCenter" : {if(!_protected)then{FZ_NORMAL_UNITS select 0}else{FZ_NORMAL_UNITS select 1}};
		case "dutyCenter" : {if(!_protected)then{FZ_DUTY_UNITS select 0}else{FZ_DUTY_UNITS select 1}};
		case "freedomCenter" : {if(!_protected)then{FZ_FREEDOM_UNITS select 0}else{FZ_FREEDOM_UNITS select 1}};
		case "militaryCenter" : {FZ_MILITARY_UNITS select 0};
		case default {[]};
	};
	
	if(count _array > 0)then{for "_i" from 1 to _count do {_shapes set [count _shapes, _array select floor random count _array]}};
_shapes
};

fz_sfx_getCenterOnSideAsStr = {
	private ["_centerStr"];
	_centerStr = switch(_this)do{case west : {"dutyCenter"};case east : {"militaryCenter"};case resistance : {"freedomCenter"};case civilian : {"civilianCenter"};};
_centerStr
};