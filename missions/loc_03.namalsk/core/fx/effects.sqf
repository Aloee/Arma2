if(local player)then{
	private ["_effekt", "_object", "_helligkeit", "_farbe"];

	_effekt = _this select 0;
	_object = _this select 1;
	_helligkeit = _this select 2;
	_farbe = _this select 3;

	switch(_effekt)do{
		case "light":{
			private ["_light"];
			
			_light = "#lightpoint" createVehicleLocal getPosATL _object;
			_light lightAttachObject [_object, [0,0,0]]; 
			_light setLightBrightness _helligkeit;
			_light setLightAmbient	_farbe;
			_light setLightColor  _farbe;
		};
	};
};