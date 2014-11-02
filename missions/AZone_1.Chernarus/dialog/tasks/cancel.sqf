#include "definitions.sqf";
disableSerialization;

_control = ((_this select 0) select 0);
_index = ((_this select 0) select 1);

_idc_ctrl = _control call fGetIDC;

	_item_data = _control lbData  _index;
	_item_index_ar = [_item_data] call fx_parse_data;
	_item_index = (_item_index_ar select 0);
	
	_npc = player getVariable "DIALOG_OPPONENT";
	
	private ["_taskName"];
	_worksList = player getVariable "tasksList";
	{
		if(_x select 1 == _item_index)then{_taskName = _x select 0};
	}foreach _worksList;

	if(!isNil "_taskName")then{
		ZONA_cancelTask = [player, _npc, _taskName];
		publicVariable "ZONA_cancelTask";
		closeDialog 1;
	};