#include "definitions.sqf";
disableSerialization;


_control = ((_this select 0) select 0);
_index = ((_this select 0) select 1);

_idc_ctrl = _control call fGetIDC;

	_item_data = _control lbData  _index;
	_item_index_ar = [_item_data] call fx_parse_data;
	_item_index = (_item_index_ar select 0);

	_updated_list = [_control, _index] call box_remove_to_list;

if(_item_data != "")then{

	if(_item_data != "")then{
		private ["_newModel"];
		
		for "_r" from 0 to (count weaponsShirtRemove)-1 do {
			_element = (weaponsShirtRemove select _r) select 0;
		
			if(_element == currentWeapon player)exitWith{
				_removers = (weaponsShirtRemove select _r) select 1;
				for "_i" from 0 to (count _removers)-1 do {
					if(count (_removers select _i) > 0)then{
						_newPart = (_removers select _i) select 0;
						if(_item_index == _newPart)exitwith{
							_newModel = (_removers select _i) select 1;
						};
					};
				};
			};
		};
		
		if(!isNil "_newModel")then{
			weaponsParts = [weaponsParts, _item_index, 1] call fx_addCollectionElement;
			player removeWeapon currentWeapon player;
			player addWeapon _newModel;player selectWeapon _newModel;
			
			closeDialog 1;
			0 = [] execVM "dialog\wmodifer\build_dialog.sqf";
		};
	};

};