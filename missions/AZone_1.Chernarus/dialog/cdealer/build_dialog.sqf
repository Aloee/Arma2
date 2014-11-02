#include "definitions.sqf";
disableSerialization;

_dealerCars = ((_this select 0) select 0);

//DISPLAY
_ok = createDialog "CDEALER";

_display = findDisplay CD_DIALOG;

_list = _display displayCtrl CD_B_C;
[_list,_dealerCars,"cfgVehicles"] call box_put_to_list;
