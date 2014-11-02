if(local player)then{

	_key = _this select 1;
	_shift = _this select 2;
	_ctrl = _this select 3;

	//( TAB )
	if(_key == 15)then{
		if(!hotkeys)then{
			77 cutText [localize "STR_event_hotkeysOn","PLAIN DOWN", 2];
			hotkeys = true;
		}else{
			77 cutText [localize "STR_event_hotkeysOff","PLAIN DOWN", 2];
			hotkeys = false;
		};
	};

	if(hotkeys)then{
		0=switch (_key)do{
			// ( 1 )
			case 2: {
				0 = [] execVM "dialog\inv\build_dialog.sqf";
			};
			//( 2 )
			case 3:{
				0 = [] execVM "dialog\manager\build_dialog.sqf";
			};
			//( 3 )
			case 4:{
				0 = [] execVM "dialog\wmodifer\build_dialog.sqf";
			};
			//( T )
			case 20:{
				0 = [] execVM "dialog\teams\build_dialog.sqf";
			};
			//( Y )
			case 21:{
				0 = [] execVM "fx\tacticalSigns\keypressed.sqf";
			};
			//( E )
			case  18:{
				if(_shift && vehicle player == player && isNil {player getVariable "handAttack"})then{
					0 = cursorTarget execVM "fx\actions\handAttack.sqf";
				};
			};
			//( L )
			case 38:{
				if(([weaponsParts, "flashlight"] call fx_findCollectionElement) > -1)then{
					if(vehicle player == player)then{
						if(isNil {player getVariable "flashlight_on"})then{
							player setVariable ["flashlight_on", true];
							hint parseText format ["<t color='#F1F5FA'>%1</t>", localize "STRD_gui_flashlightOn"];
						}else{
							player setVariable ["flashlight_on", nil];
							hint parseText format ["<t color='#F1F5FA'>%1</t>", localize "STRD_gui_flashlightOff"];
						};
					};
				}else{
					player setVariable ["flashlight_on", nil];
				};	
			};
		};
	};
};