_vehicle = _this select 0;
_actor = _this select 1;

_owner_key = _vehicle getVariable "owner";

if(!isNil "_owner_key")then{
	if(getPlayerUID _actor == _owner_key)then{
		_vehicle lock true;
	};
};