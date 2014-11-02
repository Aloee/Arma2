#include "definitions.sqf";
disableSerialization;

_control = ((_this select 0) select 0);
_index = ((_this select 0) select 1);

_idc_ctrl = _control call fGetIDC;



	_item_data = _control lbData  _index;
	_item_index_ar = [_item_data] call fx_parse_data;
		_item_index = (_item_index_ar select 0);
		_item_cnt = (_item_index_ar select 1);

if(_item_data != "")then{
	(findDisplay MANAGER_DIALOG displayCtrl MANAGER_GCNT) ctrlSetText format ["%1", _item_cnt];
};