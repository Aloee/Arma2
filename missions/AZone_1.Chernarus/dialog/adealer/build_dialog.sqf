#include "definitions.sqf";
disableSerialization;

_dealer_artefacts = _this select 0;
_dealer_name = vehicleVarName (_this select 1);

player setVariable ["DIALOG_OPPONENT", _dealer_name];

//DISPLAY
_ok = createDialog "ADEALER";

_display = findDisplay AD_DIALOG;

if(_dealer_name != "saharov")then{
	_list = _display displayCtrl AD_B_W;
	[_list, _dealer_artefacts, false] call box_put_to_list;
};

_list = _display displayCtrl AD_P_W;
[_list,artefacts, false] call box_put_to_list;
