if(local player)then{

#include "definitions.sqf";
disableSerialization;

_dlg = findDisplay BOX_DIALOG;

_pl_weapons = [_dlg displayCtrl BOX_P_W] call box_find_items;
_pl_mags = [_dlg displayCtrl BOX_P_M] call box_find_items;
_pl_items = [_dlg displayCtrl BOX_P_I] call box_find_items;

_box_weapons = [_dlg displayCtrl BOX_B_W] call box_find_items;
_box_mags = [_dlg displayCtrl BOX_B_M] call box_find_items;
_box_items = [_dlg displayCtrl BOX_B_I] call box_find_items;

_searh_box = nearestObjects [getposATL player, [HABAR_STYLE], 3];

	if(count _searh_box != 0)then{
		removeallweapons player;
		money = 0;
		
		{ for "_cnt" from 1 to (_x select 1) do { player addweapon (_x select 0) }}foreach _pl_weapons;
		{ for "_cnt" from 1 to (_x select 1) do { player addmagazine (_x select 0) }}foreach _pl_mags;
		{
			_item = _x select 0;
			_cnt = _x select 1;
			
			switch(_item)do{
				case "money":{ money = _cnt };
			};
		}foreach _pl_items;
		
		_habar = _searh_box select 0;

		//Attach list
		_habar setVariable ["box_weapons",_box_weapons,true];
		_habar setVariable ["box_mags",_box_mags,true];
		_habar setVariable ["box_items",_box_items,true];

		//save
		ZONA_serverexec_campaction = [player, "save"];
		publicVariable "ZONA_serverexec_campaction";
		
	closeDialog 1;
	};

};