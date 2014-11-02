#include "definitions.sqf";
disableSerialization;


_control = ((_this select 0) select 0);
_index = ((_this select 0) select 1);

_idc_ctrl = _control call fGetIDC;

	_item_data = _control lbData  _index;
	_item_index_ar = [_item_data] call fx_parse_data;
	_item_index = (_item_index_ar select 0);
	
	_controlDesc = findDisplay TASKS_DIALOG displayCtrl TASKS_DESC;
	_descClass = "Description" call compile preprocessFile format ["tasks\%1.sqf", _item_index];
	_controlDesc ctrlSetText (localize _descClass);
