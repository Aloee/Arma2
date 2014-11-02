#include "definitions.sqf";
disableSerialization;


_control = (_this select 0) select 0;
_display = findDisplay TASKS_DIALOG;
_npc = call compile (player getVariable "DIALOG_OPPONENT");

_works = _npc getVariable "works";
_tasksList = player getVariable "tasksList";

_title = _display displayCtrl TASKS_TITLE_TASK;
_title ctrlSetText (ctrlText _control);

_descCtrl = _display displayCtrl TASKS_DESC;
_descCtrl ctrlSetText "";

_idc_ctrl = _control call fGetIDC;

private["_listCtrl"];

_worksList = [];
switch(_idc_ctrl)do{
	case TASKS_BUTTON_WORK:{
		_listCtrl = TASKS_LIST;
		ctrlShow [_listCtrl, true];
		ctrlShow [TASKS_LISTCURRENT, false];
		
		for "_i" from 0 to (count _works - 1) step 1 do {
			_j = _works select _i;
			
			_taskCurrent = false;
			{if(_j select 0 == _x select 1)exitWith{_taskCurrent=true}}foreach _tasksList;
			
			if(!_taskCurrent)then{
				_worksList set [count _worksList, [_j select 0, (count _worksList)+1]];
			};
		};
	};
	case TASKS_BUTTON_CURRENT:{
		_listCtrl = TASKS_LISTCURRENT;
		ctrlShow [_listCtrl, true];
		ctrlShow [TASKS_LIST, false];
		{
			_worksList set [count _worksList, [_x select 1, (count _worksList)+1]];
		}foreach _tasksList;	
	};
};

_list = _display displayCtrl _listCtrl;
[_list, _worksList, false] call box_put_to_list;
