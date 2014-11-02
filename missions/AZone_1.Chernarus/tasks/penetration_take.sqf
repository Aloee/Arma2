_vehicle = _this select 0;
_actor = _this select 1;
_actionIndex = _this select 2;
_params = _this select 3;

_task = _params select 0;
_taskLocalize = _params select 3;
_taskName = _params select 1;
_ownerName = _params select 2;
_guards = _params select 4;
_objects = _params select 5;

player playmove "AmovPknlMstpSrasWrflDnon_AinvPknlMstpSlayWrflDnon";
sleep 1.5;
if(alive player)then{
	deleteVehicle _vehicle;
	
	//for all
	ZONA_removeTask = [_taskName, _ownerName, [_taskLocalize, "Canceled", getPlayerUid player], [_guards, _objects]];
	publicVariable "ZONA_removeTask";
	
	//for winner
	stuff set [count stuff, ["milDocuments", 1]];
	[_taskName, "Succeeded", _taskLocalize] call fx_removeSimpleTask;
	
	player removeAction _actionIndex;
};

