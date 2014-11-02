#include "definitions.sqf";
disableSerialization;

_control = ((_this select 0) select 0);
_index = ((_this select 0) select 1);

_idc_ctrl = _control call fGetIDC;

	_item_data = _control lbData  _index;
	_item_index_ar = [_item_data] call fx_parse_data;
	_item_index = (_item_index_ar select 0);

	_obj = objNull;
	{
		if(_item_index == name _x)exitWith{_obj = _x};
	}foreach playableUnits;
	
	if(!isNull _obj)then{
		[player] join group _obj;
		hint parseText format [["Aqua",localize "STR_hint_joingroup"] call fx_getformat_string, _item_index];
		closeDialog 1;
	};