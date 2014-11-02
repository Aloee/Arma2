if(local player)then{

	private ["_victims", "_victim", "_light"];

	_victims = nearestObjects [[(_this select 0),(_this select 1), 0], ["Land"], 5];

	if(count _victims != 0)then{
		_victim = _victims select 0;
		if(_victim iskindof "LandVehicle")then{
			{if(!isPlayer _x or _x == player)then{_x setdammage 1}} foreach crew _victim;	
		}else{
			if(!isPlayer _victim or _victim == player)then{
				_victim setdammage 1;
			};
		};
	};

	_light = "#lightpoint" createVehicleLocal _this;
	_light setLightAmbient[0.5, 0.5, 1];
	_light setLightColor[0.3, 0.3, 1];
	_light setLightBrightness 0.05;
	sleep 0.05;
	deleteVehicle _light;

};