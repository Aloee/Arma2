//Server
if(!isServer && !isDedicated) exitwith {};
//cityBase03
//cityBase02
//cityBase04
//BunkerMedium01
//BunkerMedium09
//Camp1_INS
//Camp2_INS
//MediumTantCamp_RU
//MediumTantCamp2_RU
//WeaponsStore1_RU
//AirPlaneParking1_RU
//HeliParking1_RU

_object = _this select 0;
_cfgiName = _this select 1;

// Read Config File	
_newComp = [(getPosATL _object), (getdir _object), _cfgiName] call (compile (preprocessFileLineNumbers "ca\modules\dyno\data\scripts\objectMapper.sqf"));