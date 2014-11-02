if(!isServer && !isDedicated) exitWith {};

	_p = execVM "sfx_database.sqf";
	_p = execVM "sfx.sqf";

	if(!isNil "SavedFrom")then{
		_point = call compile SavedFrom;
		player setPosATL getMarkerPos _point; player setDir (markerDir _point) + 180;

		_dw = [] execVM "lib\effects\DynamicWeatherEffects.sqf";
		//[player,200,10,10,3,6,-0.3,0.1,0.3,1,1,1,30,10,15,true,0.4,0.5,0.025,0,0,0,0,24] execFSM "lib\effects\Fog.fsm";

		onMapSingleClick "player setpos _pos";
	};
	if(!isNil "SavedDate")then{
		setDate SavedDate;
	};
