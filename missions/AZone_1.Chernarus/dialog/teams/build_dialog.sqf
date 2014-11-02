#include "definitions.sqf";
disableSerialization;


//DISPLAY
if(!dialog)then{

	_ok = createDialog "TEAMDIALOG";
	_display = findDisplay TEAM_DIALOG;

	_units = [];
	{
		if(side player == side _x && name _x != name player && _x distance player < 100)then{_units set [count _units, [name _x, if(_x == leader group _x)then{count units group _x}else{1}]]};
	}foreach playableUnits;

	_list = _display displayCtrl TEAM_B_C;
	[_list,_units,false] call box_put_to_list;

}else{
	closeDialog 1;
};