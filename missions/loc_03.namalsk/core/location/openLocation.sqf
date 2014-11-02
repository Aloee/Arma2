_this setVariable ["activated", true];

while{!isNil {_this getVariable "activated"}}do{

	_props = _this getVariable "locationProps";
		_markerPlace = _props select 0;
		_params = _props select 1;
	
	_propTrg = _this getVariable "triggerProps";
		_impactSide = _propTrg select 0;
		_captureDelay = _propTrg select 1;
		_capturing = _propTrg select 2;
		_captured = _propTrg select 3;
	
	_units = _this call fz_sfx_getLocUnits;
	_impactPerc = 0;
	_sclr = 0.75;
	
	if(!isNil "_units")then{
		{
			_side = _x;
			_listCnt = {_x isKindOf "CAManBase" and isNil{_x getVariable "npc"}} count _units;
			_sideCnt = {_side == side _x and _x isKindOf "CAManBase" and isNil{_x getVariable "npc"}} count _units;
			_perc = if(_listCnt > 0 and _sideCnt > 0)then{_sideCnt / _listCnt}else{0};
			
			if(_impactPerc < _perc)then{_impactPerc = _perc; _impactSide = _side};
		}foreach [east, west, resistance];

		if(_impactPerc >= _sclr)then{
			if(_captureDelay == 100)then{
				_captured = true;_capturing = false;
				
				_this setVariable ["locationProps", [_markerPlace, [_params select 0, _impactSide call fz_sfx_getCenterOnSideAsStr, _params select 2]]];
				_color = switch (_impactSide) do {case East : {"ColorBlue"};case Resistance : {"ColorGreen"};case West : {"ColorRed"};case default {"ColorYellow"}};
				_markerPlace setMarkerColor _color;
			}else{
				if(_captureDelay < 100)then{_capturing = true;_captureDelay = _captureDelay + 25};
			};
		}else{
			if(count _units > 0)then{_captured = false;_captureDelay = 0};
		};
		
		_sGrps = [];
		_countAliveSpawnedUnits = -1;
		if(!isNil {_this getVariable "spawnedGroups"})then{_countAliveSpawnedUnits = 0;{_countAliveSpawnedUnits = _countAliveSpawnedUnits + ({alive _x}count units _x)}foreach (_this getVariable "spawnedGroups")};
		if(isNil {_this getVariable "spawnedGroups"} or _countAliveSpawnedUnits == 0)then{
			_center = call compile (_params select 1);
			_prls_params = _params select 2;
			{
				private ["_shapes", "_groups"];
				_shapes = [_x select 0, (_params select 1), _x select 1] call fz_sfx_getUnitShapes;
				_groups = [[_center, _shapes, getMarkerPos (_x select 2),  _x select 3, _x select 4, _x select 5]] call PRECMPL_CREATEPATROLS;
				_sGrps =  _sGrps + _groups;
			}foreach _prls_params;
			
			_this setVariable ["spawnedGroups", _sGrps];
		};
		
		_this setVariable ["triggerProps", [_impactSide, _captureDelay, _capturing, _captured]];
	};
	
	if(CLY_debug)then{ [debug, nil, rglobalChat,  format ["FPS %2 FZ_LOCATIONS %1", [count _units], diag_fpsmin]] call RE};
	
sleep 25;
};