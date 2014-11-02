#include "definitions.sqf";
disableSerialization;

_control = ((_this select 0) select 0);
_index = ((_this select 0) select 1);

_idc_ctrl = _control call fGetIDC;

	_item_data = _control lbData  _index;
	_item_index_ar = [_item_data] call fx_parse_data;
	_item_index = (_item_index_ar select 0);
			
	_npc = player getVariable "DIALOG_OPPONENT";
	_npcObj = call compile _npc;
	
	_works = _npcObj getVariable "works";
	_tasksList = player getVariable "tasksList";
	
	if(!isNil "_npc")then{
		_taskLimit = false;
		for "_i" from 0 to (count _works)-1 step 1 do{
			_j = _works select _i;
			{if(_j select 0 == _x select 1)exitWith{_taskLimit=true}} foreach _tasksList;
		};
		
		if(!_taskLimit)then{
			ZONA_createNewTask = [getPlayerUID player, _npc, _item_index];
			publicVariable "ZONA_createNewTask";
			closeDialog 1;
		}else{
			_npcObj globalChat localize "STRD_tasks_limitWork"; 
		};
	};