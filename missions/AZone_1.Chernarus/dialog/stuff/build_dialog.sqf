#include "definitions.sqf";
disableSerialization;


player setVariable ["DIALOG_OPPONENT", vehicleVarName _this];

//DISPLAY
_ok = createDialog "STUFFEALER";

_display = findDisplay STUFF_DIALOG;

_list = _display displayCtrl STUFF_B_C;
[_list,stuff,false] call box_put_to_list;
