if(local player)then{

	_key = _this select 1;
	_shift = _this select 2;
	_ctrl = _this select 3;
	
	 // hintsilent str _key;
	
	0=switch(_key)do{
		//( L )
		case 38:{
			if(vehicle player == player)then{
				if(isNil {player getVariable "flashlight_on"})then{
					player setVariable ["flashlight_on", true, true];
				}else{
					player setVariable ["flashlight_on", nil, true];
				};
			};
		};
		/*
		//( ` )
		case 41:{
			0 = [] execVM "dialog\inv\build_dialog.sqf";
		};
		//( T )
		case 20:{
			0 = [] execVM "dialog\teams\build_dialog.sqf";
		};
		//( E )
		case  18:{
			if(_shift && vehicle player == player && isNil {player getVariable "handAttack"})then{
				0 = cursorTarget execVM "fx\handAttack.sqf";
			};
		};
		//( Y )
		case 21:{ 
			0 = [] execVM "fx\tacticalSigns\keypressed.sqf";
		};
		
		//( U ) 46
		case 22:{
			0 = [] execVM "dialog\wmodifer\build_dialog.sqf";
		};

		*/
		default {};
	};
};