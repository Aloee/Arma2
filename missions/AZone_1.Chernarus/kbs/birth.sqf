//Server
if(!isServer && !isDedicated) exitWith {};
waitUntil{!isNil "BIS_MPF_InitDone"};
waitUntil{!isNil "sfx_protectNpc"};
waitUntil{!isNil "fx_setIdentityNpc"};

sleep 1;

_varName = vehicleVarName _this;
[nil, nil, "per", rCALLVAR, _this, "fx_setIdentityNpc"] call RE;
_this call 	fx_setIdentityNpc;
_this call sfx_protectNpc;

_works = [];

/*works array
	[type (str), uid (str), owner name(str), pos (array), group (bool), obj, enemy]
		type - тип задания
		owner name - vehicleVarName npc
		collective - коллективное задание
		queue - автоматическое получение нового задания этого же типа по завершении
*/

switch(_varName)do{
	case "sidorch" : {
		_works = [];
	};
	case "voronin":{
		_this setpos [(getPosATL _this) select 0,(getPosATL _this) select 1,((getPosATL _this) select 2)+9];
		
		_works = [
			["capture", _varName, true, true]
			//["cleanse", _varName, true, true]
			//["hunting", _varName, true, true]
		];
	};
	
	
	case "luka":{
		_this setpos [(getPosATL _this) select 0,(getPosATL _this) select 1,((getPosATL _this) select 2)+6];
		
		_works = [
			["capture", _varName, true, true]
			//["hunting", _varName, true, true]
		];
	};
	
	case "saharov":{
		_works = [
			["mounting", _varName, false, false]
		];
	};
	
	case "barmen":{
		_this setpos [(getPosATL _this) select 0,(getPosATL _this) select 1, 1];
		
		_works = [];
	};
};


_this setVariable ["works", _works, true];
_this setVariable ["rewardFund", 0, true];