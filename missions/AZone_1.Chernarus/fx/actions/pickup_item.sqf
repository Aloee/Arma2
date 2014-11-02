if(local player)then{

	_object = _this select 0;
	_actor = _this select 1;
	_actionIndex = _this select 2;
	
	_objectParams = _this select 3;
	[_objectParams select 0, (_objectParams select 1) select 1] call fx_addPlayerItems;

	player playmove "AmovPknlMstpSrasWrflDnon_AinvPknlMstpSlayWrflDnon";
	player removeAction _actionIndex;
	deleteVehicle _object;
};
