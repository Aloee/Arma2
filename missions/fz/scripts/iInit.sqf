waitUntil{!isNull (findDisplay 46)};
	keyspressed = compile preprocessFile "keyspressed.sqf";
	_displayID = (findDisplay 46) displaySetEventHandler ["KeyDown","_this call keyspressed"];
		
	execVM "fx.sqf";
	player execFSM "lib\effects\flashlight.fsm";

if(!isServer && !isDedicated) exitWith {};
	execVM "iLocations.sqf";