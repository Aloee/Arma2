#include "definitions.sqf";
disableSerialization;

_weapons_b = ((_this select 0) select 0);
_partsWeapons_b = ((_this select 0) select 1);
_mags_b = _weapons_b call fx_get_cfglistmags;
_mags_b = _mags_b + dealersItems;


_weapons_p = ((_this select 1) select 0);
_mags_p = ((_this select 1) select 1);

//DISPLAY
_ok = createDialog "WDEALER";

_display = findDisplay WD_DIALOG;

_list = _display displayCtrl WD_B_W;
[_list,_weapons_b,"cfgWeapons"] call box_put_to_list;

_list = _display displayCtrl WD_B_M;
[_list,_mags_b,"cfgMagazines"] call box_put_to_list;

_list = _display displayCtrl WD_B_I;
[_list, _partsWeapons_b, false] call box_put_to_list;

_list = _display displayCtrl WD_P_W;
[_list,_weapons_p,"cfgWeapons"] call box_put_to_list;

_list = _display displayCtrl WD_P_M;
[_list,_mags_p,"cfgMagazines"] call box_put_to_list;

_list = _display displayCtrl WD_P_I;
[_list, weaponsParts, false] call box_put_to_list;