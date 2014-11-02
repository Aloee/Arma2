waitUntil{!isNull (findDisplay 46)};
keyspressed = compile preprocessFile "keyspressed.sqf";
_displayID = (findDisplay 46) displaySetEventHandler ["KeyDown","_this call keyspressed"];

player execfsm "flashlight.fsm";

while{true}do{
	_hundle = [1, "flashlight.fsm"] call BIS_fnc_fps;
	waitUntil{scriptDone _hundle};
sleep 5;
};