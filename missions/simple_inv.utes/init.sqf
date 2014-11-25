if(local player)then{

	inv_hotkeys = true;
	
	waitUntil{!isNull (findDisplay 46)};
	keyspressed = compile preprocessFile "keyspressed.sqf";
	_displayID = (findDisplay 46) displaySetEventHandler ["KeyDown","_this call keyspressed"];
	

	call compile PreprocessFileLineNumbers "dialog\inv_functions.sqf";
	
	//Default Inventory
	player setVariable ["inv_misc", [
		["Moscow_Bombing_File", 3],
		["Kostey_notebook", 1],
		["ItemRadio", 1],
		["ItemWatch", 1],
		["AK_74", 1],
		["Binocular", 1]
	]];
	
};