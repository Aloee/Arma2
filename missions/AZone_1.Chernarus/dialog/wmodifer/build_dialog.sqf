#include "definitions.sqf";
disableSerialization;

//DISPLAY
if(currentWeapon player != "")then{
	if(!dialog)then{
		_ok = createDialog "WMODIFER";
		_display = findDisplay WM_DIALOG;

		ctrlSetText [WM_TITLE_S, getText (configFile >> "CfgWeapons" >> currentWeapon player >> "displayName")];
		_list = _display displayCtrl WM_PIC;
		_index = _list lbAdd "";
		_list lbSetPicture [_index, getText (configFile >> "CfgWeapons" >> currentWeapon player >> "picture")];
		
		if(count weaponsParts > 0)then{
			_mount = [];
			
			for "_m" from 0 to (count weaponsShirtAdd)-1 do {
				_element = (weaponsShirtAdd select _m) select 0;
			
				if(_element == currentWeapon player)exitWith{
					_assemblys = (weaponsShirtAdd select _m) select 1;
					for "_i" from 0 to (count _assemblys)-1 do {
						if(count (_assemblys select _i) > 0)then{
							_neddedPart = (_assemblys select _i) select 0;
							
							for "_p" from 0  to (count weaponsParts)-1 do {
								_part = (weaponsParts select _p) select 0;
								_count = (weaponsParts select _p) select 1;
								
								if(_part == _neddedPart)exitwith{
									_mount set [count _mount, [_part, _count]];
								};
							};
						};
					};
				};
			};
			
			_list = _display displayCtrl WM_ADD;
			[_list,_mount, false] call box_put_to_list;
			
		};
		
		_dismantles = [];
		for "_r" from 0 to (count weaponsShirtRemove)-1 do {
			_element = (weaponsShirtRemove select _r) select 0;
		
			if(_element == currentWeapon player)exitWith{
				_removingParts = (weaponsShirtRemove select _r) select 1;
				
				for "_i" from 0 to (count _removingParts)-1 do {
					_newPart = (_removingParts select _i) select 0;
					_dismantles set [count _dismantles, [_newPart, 1]];
				};
			};
		};

		_list = _display displayCtrl WM_REM;
		[_list,_dismantles, false] call box_put_to_list;

	}else{
		closeDialog 1;
	}
};