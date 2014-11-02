if(!isServer && !isDedicated)exitwith{};
	
	[] call sfx_deleteOverdueCamps;
	[] call sfx_deleteEmptyCamps;

	{
		_pos = _x select 0;
		_key = _x select 1;
		_dir = _x select 2;
		
		_habar = [_key, _pos, _dir, false] call sfx_create_habar;
		
		if(!isNil "_habar")then{
			_box_cnt = [_key, _habar] call sfx_load_habar;
			[nil, nil, "per", rCALLVAR, ["habars", _pos], "fx_cl_setarr"] call RE;
		};
		
		//_markerParams = [format["Camp_%1", _key], [_pos select 0, _pos select 1], 0.5, "colorBlack", _key, "ICON", "DOT"];
		//_markerParams call sfx_create_public_marker;
	
	}foreach allhabars;
	//[nil, nil, rHINT,str allhabars] call RE;
	