_vehicle = _this select 0;
_actor = _this select 1;
_actionIndex = _this select 2;
_params = _this select 3;

_taskName = _params select 0;
_ownerName = _params select 1;
_taskType = _params select 2;
_position = _params select 3;
_device = _params select 4;

player removeAction _actionIndex;

_delay = 0;
while{alive player && _delay < 100}do{
	player playmove "AinvPknlMstpSlayWrflDnon_medic";
	_delay = _delay + 5;
sleep 3;
};

if(alive player)then{
	_device setPosATL [(getPos player) select 0, (getPos player) select 1, _position select 2];
};
