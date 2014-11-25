#include "definitions.sqf";
disableSerialization;

if(!dialog)then{
	
	_ok = createDialog "INVENTORY";
	_display = findDisplay INV_DIALOG;
	
	false call inv_displayItemDesc;
	
	_title = _display displayCtrl INV_TITLE_A;
	_title ctrlSetText format [localize "STR_gui_inv_titleinv", name player];

	call inv_displayItemList;

}else{
	closeDialog 1;
};