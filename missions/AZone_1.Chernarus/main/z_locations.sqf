if(!isServer && !isDedicated)exitwith{};

// НЕ РЕДАКТИРУЙ ЭТО!!!!

while {true} do {

	for "_i" from 0 to count locations - 1 step 1 do {
	
		_x = locations select _i;
		_prop = _x getVariable "locationProp";
		
		_trg = _x;
		_imp = _prop select 0;
		_marker = _prop select 1;
		_captured = _prop select 2;
		_captureDelay = _prop select 3;
		_localize = _prop select 4;
		_lastImp = _prop select 5;
		_amount  = _prop select 6;
		_abandoned = _prop select 7;
		_capturing = _prop select 8;
		_wave = _prop select 9;
		_waveTotal = _prop select 10;
		
		_nimp = _trg call sfx_zoneImpact;
		_perc = _nimp select 0;
		_side = _nimp select 1;

		//[debug, nil, rglobalChat,  format ["%1, %2, %3, %4", _perc, _captureDelay, _side, _captured]] call RE;
		
		private ["_color"];
		switch (_lastImp) do {
			case East : {_color = "ColorRed"};
			case Resistance : {_color = "ColorGreen"};
			case West : {_color = "ColorBlue"};
			case default {_color = "ColorBlack"};
		};
		
		_marker setMarkerColor _color;
			
		///////Zombies
		_zombies = [];
		if(count (list _trg) > 0)then{
			{
				if(!isNil {_x getVariable "zombietype"})then{_zombies set [count _zombies, _x]};
			}foreach (list _trg);
			_abandoned = if({isPlayer _x} count list _trg > 0)then{false}else{true};
		};

		if(!_abandoned)then{
			if(count _zombies < 2 and isNil{_trg getVariable "process"} and (count zombies < MAX_ZOMBIE_COUNT) and (_lastImp == civilian or _lastImp == sideEnemy))then{
				if({isPlayer _x && speed _x < 30} count list _trg > 0)then{
					if(!_capturing)then{
						[_trg, _amount] execVM "zombies\cly_z_generator.sqf";
						_trg setVariable ["process", true];
					}else{
						if(_wave > 0)then{
							[_trg, _amount] execVM "zombies\cly_z_generator.sqf";
							_trg setVariable ["process", true];
							_wave = _wave - 1;
						};
					};
				};
			};
			
		}else{
			if(count _zombies > 0)then{
				{if(isNull (_x getVariable "victim"))then{zombies = zombies - [_x]; deletevehicle _x}} foreach _zombies;
			};
			_capturing = false;
			_wave = _waveTotal;
		};
						
		//////Capture
		_sclr = 0.75;
		if(_perc >= _sclr)then{
			if(_captureDelay == 100)then{
				private ["_owner"];
				switch(_side)do{
					case East : {_owner = voronin};
					case Resistance : {_owner = luka};
				};
				if(!isNil "_owner" && !_captured)then{
					[nil, nil, rCALLVAR, [_owner, _localize], {[_this select 0, "global", ["STRD_task_captureTitleLocation", _this select 1, side (_this select 0)] call fx_getLocationEventString] call fx_sayradio}] call RE; 
				};
				_captured = true;
			}else{
				if(_captureDelay < 100)then{
					_capturing = true;
					_captureDelay = _captureDelay + 10;
				};
			};
		}else{
			_captured = false;
			_captureDelay = 0;
		};
		if(_side!=civilian && _captured)then{_lastImp=_side};
		
		
		///////ProgressBar
		{
			if(isPlayer _x)then{
				private["_color", "_localize"];
				
				switch (_side) do {
					case east : {_color=[0.7, 0, 0, 1];_localize="STRD_briefing_grps_duty"};
					case resistance : {_color=[0, 0.7, 0, 1];_localize="STRD_briefing_grps_free"};
					case west : {_color=[0, 0, 0.7, 1];_localize="STRD_briefing_grps_mil"};
					case civilian : {_color=[0.7, 0.7, 0.7, 1];_localize="STRD_briefing_grps_nothing"};
					case sideEnemy : {_color=[0, 0, 0, 1];_localize="STRD_briefing_grps_zombies"};
					default {_color=[0, 0, 0, 1];_localize=""};
				};
				
				if(_captured)then{_captureDelay=100};
				
				[_x, _x, rCALLVAR, [_captureDelay, _color, _localize, _trg], "fx_doProgressBar"] call RE;
			};
		}foreach list _trg;

		//Commit
		_x setVariable ["locationProp", [_side, _marker, _captured, _captureDelay, _localize, _lastImp, _amount, _abandoned, _capturing, _wave, _waveTotal]];
		locations set [_i, _x];
		
		/* 
		if(triggerText _x == "location_city2")then{
			[_side, _lastImp, _captured, _captureDelay, _perc, _capturing, _wave] call fx_hint;
		};
		*/
	};

	sleep 10;
};