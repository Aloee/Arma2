if(local player)then{

	_obj = _this select 0;
	_sound = _this select 1;

	_playlist = [
		["cordon_theme2", 240],
		["svoboda_theme", 115],
		["bandits_theme", 115],
		["cordon_theme", 70]
	];
	
	while {alive _obj} do {
		private ["_find"];
		{
			if(_x select 0 == _sound)exitWith{ _find = _x };
		}foreach _playlist;
		if(isNil "_find")then{ _find = _playlist select floor random count _playlist };
	
		_obj say3D (_find select 0); sleep (_find select 1);
	};
};