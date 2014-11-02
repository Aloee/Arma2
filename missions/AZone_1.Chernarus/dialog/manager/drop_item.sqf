#include "definitions.sqf";
disableSerialization;

_itemsControl = (findDisplay MANAGER_DIALOG displayCtrl MANAGER_P_I);
_index = lbCurSel _itemsControl;

_idc_ctrl = _itemsControl call fGetIDC;

	_item_data = _itemsControl lbData  _index;
	_item_index_ar = [_item_data] call fx_parse_data;
	_item_index = (_item_index_ar select 0);
	_item_count = (_item_index_ar select 1);
	
	
if(_item_data != "")then{
	if(_item_index == "money")then{
		["money",["EvMoney", money, getPosATL player], true] call fx_dropPlayerItems;
	}else{
		_itemType = _item_index call fx_getItemsType;
		if(typeName _itemType != "BOOL")then{
			["inv",["Suitcase", [[_itemType, [[_item_index, 1]]]], getPosATL player], true] call fx_dropPlayerItems;
		};
	};
	
	closeDialog 1;
};