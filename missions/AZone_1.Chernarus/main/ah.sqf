if(!isServer && !isDedicated)exitwith{};
waitUntil {!isNil "sessionkey"};

{
	if(_x isKindof "LandVehicle" or _x isKindOf "Air")then{
		_x setvariable ["session", sessionkey];
		sleep 0.3;
	};
}foreach vehicles;

while{true}do{
	{
		sleep 0.3;
		if(_x isKindof "LandVehicle" or _x isKindOf "Air")then{
			if(isNil {_x getVariable "session"})then{
				[debug, nil, rglobalChat, format ["no valid %1 deleted", typeof _x]] call RE;
				deleteVehicle _x;
			};
		};
	}foreach vehicles;
};