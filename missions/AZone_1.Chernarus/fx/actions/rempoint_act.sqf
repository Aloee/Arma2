_vehicle = _this select 0;
_actor = _this select 1;

_serviceDelay = 0;
_break = false;
_progressBar = localize "STR_hint_service";

_vehicle setVariable ["serviceProcess", true, true];
_vehicle engineOn false;
_vehicleBeforePos = getPosATL _vehicle;

while{(getDammage _vehicle != 0 or fuel _vehicle != 1) and !_break}do{
	_progressBar = _progressBar + "|";
	
	_vehicleCurPos = getPosATL _vehicle;
	if(alive _actor && alive _vehicle && floor (_vehicleBeforePos select 0) == floor (_vehicleCurPos select 0) && floor (_vehicleBeforePos select 1) == floor (_vehicleCurPos select 1))then{
		
		_vehicle setDammage (getDammage _vehicle - 0.035);
		_vehicle setFuel (Fuel _vehicle + 0.035);
	
		hintSilent format ["%1", _progressBar];
	}else{
		_break = true;
	};
		
_serviceDelay = _serviceDelay + 1;
sleep 1;
};

if(!_break)then{
	_vehicle setVariable ["repair_kits", 3, true];
	_vehicle setVehicleAmmo 1;
	hint parseText format [["Green", localize "STR_hint_serviceDone"] call fx_getformat_string, _vehicle getVariable "repair_kits"];
}else{
	hint parseText format [["Red", localize "STR_hint_serviceBreak"] call fx_getformat_string, _vehicle getVariable "repair_kits"];
};

_vehicle setVariable ["serviceProcess", nil, true];