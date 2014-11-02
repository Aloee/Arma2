_uid = _this select 0;
_player_obj = _uid call fx_findUid_pl_body;

	_fn = format ["%1_%2", _uid, side _player_obj];
	
	_player_obj setVariable ["camp_key", _fn];
	_player_obj setVariable ["propname", vehicleVarName _player_obj, true];
		
	[_player_obj,_uid] spawn {

		_player_obj = _this select 0;
		_uid = _this select 1;
		_fn = _player_obj getVariable "camp_key";

		//if(isNil "_fn")then{_fn = "player"};
		
		waitUntil {!isNil "allhabars"};
		private ["_home_finded"];
		
		//seach in storage
		{
			if(_x select 1 == _fn)exitwith{_home_finded = _x select 0};
		}foreach allhabars;
		
		_homepos  = [0,0,0];
		if(!isNil "_home_finded")then{
			[nil, _player_obj, rtitleText, "", "", "BLACK OUT", 5] call RE;
			
			_homepos = [abs(_home_finded select 0), abs(_home_finded select 1), _home_finded select 2];
			_player_obj setpos [(_homepos select 0)+(random 3),(_homepos select 1)+(random 3), _homepos select 2];

			[nil, _player_obj, "loc", rCALLVAR, ["habar", _homepos], "fx_cl_setvar"] call RE;
			[nil, _player_obj, "loc", rCALLVAR, ["camped", true], "fx_cl_setvar"] call RE;

			[nil, _player_obj, rtitleText, "", "", "BLACK OUT", 2] call RE;
			
		}else{
			_resPos = switch(side _player_obj)do{
				case east : {"respawn_east"};
				case resistance : {"respawn_guerrila"};
				default {"respawn_civilian"};
			};
			_player_obj setpos getMarkerpos _resPos;
		};
		
		[nil, _player_obj, "loc", rCALLVAR, [_homepos], {[[HQMARKERNAME, _this select 0, 0.5, "ColorGreen", localize "STR_map_mycamp", "ICON", "hd_flag"]] call fx_create_local_markers}] call RE;
	};