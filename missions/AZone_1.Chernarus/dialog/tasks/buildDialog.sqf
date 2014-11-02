#include "definitions.sqf";
disableSerialization;

_npc = (_this select 3) select 0;
_works = _npc getVariable "works";

player setVariable ["DIALOG_OPPONENT", vehicleVarName _npc];

_reward = _npc getVariable "rewardFund";
if(_reward>0)then{
	money = money + _reward;
	_string = format ["%1p.", _reward];
	hint parseText format [["Aqua",localize "STR_hint_pickupitems"] call fx_getformat_string, _string];
	_npc setVariable ["rewardFund", 0];
};

if(!isNil "_works")then{
	_ok = createDialog "TASKS";
	_display = findDisplay TASKS_DIALOG;
	
	[[_display displayCtrl TASKS_BUTTON_WORK]] execVM "dialog\tasks\changeLayer.sqf";
};