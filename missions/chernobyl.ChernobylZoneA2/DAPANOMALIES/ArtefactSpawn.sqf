if(local player)then{

_atrefactName = _this select 0;
_epicenter = _this select 1;
_artefactArt = _this select 2;
_range = _this select 3;
_chance = _this select 4;

_n = _count-1;

	if (_chance >= (random 1)) then {

		private ["_lightColor", "_art"];

		//_lightColor = [random 1, random 1, random 1];
		//_art = [[random 1,random 1,random 1,random 1],[random 1,random 1,random 1,random 1],[random 1,random 1,random 1,random 1]];
		_lightColor = _artefactArt select 0;
		_art = _artefactArt select 1;
		
		_light = "#lightpoint" createVehicleLocal [_epicenter select 0, _epicenter select 1, 0.1];
		_light setLightAmbient _lightColor;
		_light setLightColor _lightColor;
		_light setLightBrightness 0.015;
		
		_PSm = "#particlesource" createVehicleLocal _epicenter;
		_PSm setParticleCircle [0, [0, 0, 0]];
		_PSm setParticleRandom [0, [0, 0, 0], [0, 0, 0], 0, 0.5, [0, 0, 0, 0], 0, 0];
		_PSm setParticleParams [["\Ca\Data\ParticleEffects\Pstone\Pstone.p3d", 8, 1, 1], "", "SpaceObject", 1, 1, [0, 0, 0.5], [0, 0, 0], 1.2, 1.3, 1, 0, [0.3], _art, [0, 0], 1, 0, "", "", _light];
		_PSm setDropInterval 1;
		
		_PSl = "#particlesource" createVehicleLocal _epicenter;
		_PSl setParticleCircle [0, [0, 0, 0]];
		_PSl setParticleRandom [0, [0, 0, 0], [0, 0, 0], 0, 0.5, [0, 0, 0, 0], 0, 0];
		_PSl setParticleParams ["ca\Data\kouleSvetlo", "", "billboard", 1, 1, [0, 0, 0.5], [0, 0, 0], 1.2, 1.3, 1, 0, [0.3], _art, [0, 1], 1, 0, "", "", _light];
		_PSl setDropInterval 1;
		
		//_objAction = "SkeetDisk" createVehicleLocal getPosATL _light;
		
		_condition = format ["alive _target && _target distance %1 < 1 && ({(typeof _x == ""#lightpoint"" or typeof _x == ""#particlesource"")} count nearestObjects[%1, [], 1]) > 0", getPosATL _light];
		player addAction [["colorRed", localize "STR_action_pickup"] call fx_getformat_string, "DAPANOMALIES\artefactPickup.sqf", [getPosATL _light, _atrefactName, [_lightColor, _art]], 1, true, true, "", _condition];
		
		
		_passedParamsStr = format ["[%1, ""%2"", [%3,%4]]", getPosATL _light, _atrefactName, _lightColor, _art];
		_conditionStr = format ["alive _target && _target distance %1 < 1 && ({(typeof _x == """"#lightpoint"""" or typeof _x == """"#particlesource"""")} count nearestObjects[%1, [], 1]) > 0", getPosATL _light];
		actionsAgain set [count actionsAgain, "player addAction [[""colorRed"", localize ""STR_action_pickup""] call fx_getformat_string, ""DAPANOMALIES\artefactPickup.sqf"", "+_passedParamsStr+", 1, true, true, """", """+_conditionStr+"""];"];
	};


};