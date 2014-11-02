if(!isDedicated && !isServer)exitWith{};
	
	private ["_zombie", "_trigger", "_marker"];
	
	_zombie = _this select 0;
	_trigger = _this select 1;
	
	_zombie addEventHandler [
	"Killed",
	{
		private ["_zombie", "_sound"];
		
		_zombie = _this select 0;
		
		_sound=CLY_noises_die select floor random count CLY_noises_die;
		[nil, nil, rCALLVAR, [_zombie, _sound], {(_this select 0) say (_this select 1)}] call RE;
		
		FZ_ZOMBIES = FZ_ZOMBIES - [_zombie];
		FZ_DEAD_BODYS set[count FZ_DEAD_BODYS, _zombie];
		
		//(_this select 1) addRating (-rating(_this select 1)-(rating _zombie));
		(_this select 1) addRating -(rating (_this select 1));
		(_this select 1) addScore  -(score (_this select 1));
	}
	];
	
	//Debug markers
	if(CLY_debug)then{
	
		_marker=createMarker [format ["zmarker%1",random 100000],getPosATL _zombie];
		_marker setMarkerType "Dot";
		_marker setMarkerSize [0.3,0.3];
		
		[_zombie,_marker,_trigger] spawn {
			while{alive (_this select 0)}do{
				(_this select 1) setMarkerPosLocal getPosATL (_this select 0);
				_color = if((_this select 0) in list (_this select 2))then{"ColorBrown"}else{"ColorRed"};
				(_this select 1) setMarkerColor _color;
				sleep 1;
			};
			deleteMarker (_this select 1);
		};
	};
