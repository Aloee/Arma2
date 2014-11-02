#include "definitions.sqf";
disableSerialization;

if(!dialog)then{
	//DISPLAY
	_ok = createDialog "MANAGER";

	_display = findDisplay MANAGER_DIALOG;

	_list = _display displayCtrl MANAGER_P_I;
	[_list,([["money", money]]+artefacts+weaponsParts+stuff), false] call box_put_to_list;
	
	_listPlayers = _display displayCtrl MANAGER_PLIST;
	lbClear _listPlayers;
	{
		if(getPlayerUid _x != getPlayerUid player)then{
			_index = _listPlayers lbAdd name _x;
			_listPlayers lbSetData [_index, format ["%1", getPlayerUid _x]];
		};
	}foreach playableUnits;
	
}else{
	closeDialog 1;
};