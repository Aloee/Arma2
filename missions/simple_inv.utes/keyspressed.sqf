if(local player)then{

	_key = _this select 1;
	_shift = _this select 2;
	_ctrl = _this select 3;
	
	//hint str _key;
	//( TAB )
	if(_key == 15)then{
		if(!inv_hotkeys)then{
			77 cutText [localize "STR_event_hotkeysOn","PLAIN DOWN", 2];
			inv_hotkeys = true;
		}else{
			77 cutText [localize "STR_event_hotkeysOff","PLAIN DOWN", 2];
			inv_hotkeys = false;
		};
	};

	if(inv_hotkeys)then{
		0=switch (_key)do{
			// ( i )
			case 23: {
				0 = [] execVM "dialog\inv\build.sqf";
			};
		};
	};
};