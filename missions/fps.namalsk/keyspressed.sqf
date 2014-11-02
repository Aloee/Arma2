if(local player)then{

	_key = _this select 1;
	_shift = _this select 2;
	_ctrl = _this select 3;

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
		default {};
	};
};