_dealer_weapons = _this select 3;

_pl_weapons = [weapons player] call fx_get_items_and_cnt;
_pl_mags = [magazines player] call fx_get_items_and_cnt;

[_dealer_weapons,[_pl_weapons,_pl_mags]] execVM "dialog\wdealer\build_dialog.sqf"; 