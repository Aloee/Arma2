if(!isDedicated && !isServer)exitWith{};

fx_outdoor = {
	_t = _this select 0;
	_cmd = _this select 1;
	_t animate ["door_2_1",_cmd];_t animate ["door_2_2",_cmd];
};
fx_indoor = {
	_t = _this select 0;
	_cmd = _this select 1;
	_t animate ["door_1_1",_cmd];_t animate ["door_1_2",_cmd];
};
while{alive _this}do{
	_cmd = _this getVariable "cmd";
	_process = _this getVariable "process";
	if(isNil "_process")then{
		if(!isNil "_cmd" and ((isMultiplayer && ({_x distance _this < 8} count playableUnits > 0)) or (player distance _this < 8)))then{
			switch(_cmd)do{
				case "in":{
					_this setVariable ["process", true];
					[_this, 0] call fx_outdoor;
					sleep 3;
					[_this, 1] call fx_outdoor;
					sleep 5;
					[_this, 0] call fx_indoor;
					sleep 5;
					[_this, 1] call fx_indoor;
					sleep 5;
					_this setVariable ["cmd", nil];
					_this setVariable ["process", nil];
				};
				case "out":{
					_this setVariable ["process", true];
					[_this, 0] call fx_indoor;
					sleep 3;
					[_this, 1] call fx_indoor;
					sleep 5;
					[_this, 0] call fx_outdoor;
					sleep 5;
					[_this, 1] call fx_outdoor;
					sleep 5;
					_this setVariable ["cmd", nil];
					_this setVariable ["process", nil];
				};
			};
		}else{
			_this animate ["door_1_1",1];_this animate ["door_1_2",1];_this animate ["door_2_1",1];_this animate ["door_2_2",1];
		};
	};

sleep 0.1;
};