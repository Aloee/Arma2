if(local player)then{
	
	_actionIndex = _this select 2;	
	_itemParams = _this select 3;

	_pos = _itemParams select 0;
	_artefactName = _itemParams select 1;
	_artefactArt = _itemParams select 2;
	
	[nil, nil, "per", rCALLVAR, _pos, "fx_destroyArtefactCli"] call RE;
	player playmove "AmovPknlMstpSrasWrflDnon_AinvPknlMstpSlayWrflDnon";
	player removeAction _actionIndex;
	
	artefacts = [artefacts, _artefactName, 1] call fx_addCollectionElement;	
};
