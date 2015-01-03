waitUntil {!isNil "bis_fnc_init"};

getRelativePos = {
	/*
	Description:
	Return position at _distance and _position of the incoming _azimuth.
	If argument _direction is specified, the position will be relative to the _direction
	Syntax:
	[position, azimut, distance, (direction)] call getRelativePos
		position: array
		azimut: number
		distance: number
		direction: number (optional)
	Return: array
	*/
	private ["_position", "_azimut", "_distance"];
	
	_position = _this select 0;
	_azimut = _this select 1;
	_distance = _this select 2;
	
	if(!isNil {_this select 3})then{_azimut = _azimut + (_this select 3)};

	[(_position select 0)+_distance * sin(_azimut),(_position select 1)+_distance * cos(_azimut), _position select 2]
};

//_pos = [getPos a1, getDir a1, a1 distance player, -90] call getRelativePos;
_pos = ([a1, a1 distance player, getDir a1] call BIS_fnc_relPos) findEmptyPosition [0, a1 distance player];
hint str _pos;
"rel" setMarkerPos _pos;