#include "definitions.sqf";
disableSerialization;

_control = ((_this select 0) select 0);
_index = ((_this select 0) select 1);

_idc_ctrl = _control call fGetIDC;

	_item_data = _control lbData  _index;
	_item_index_ar = [_item_data] call fx_parse_data;
	_item_index = (_item_index_ar select 0);

	_updated_list = [_control, _index] call box_remove_to_list;
	
	if(_item_data != "")then{
		
		_from = player getVariable "DIALOG_OPPONENT";
		if(!isNil "_from")then{
			_cost_item = [_item_index, "stuff"] call fx_get_itemPrice;
			_cost_item = [_item_index, _from, _cost_item] call fx_getItemPriceFrom;
			
			if(typeName _cost_item != "BOOL")then{
				
				[(findDisplay STUFF_DIALOG displayCtrl STUFF_B_C), _updated_list, false] call box_put_to_list;

				stuff = [stuff, _item_index, 1] call fx_removeCollectionElement;
				money = money + _cost_item;
				
				_hintMoneyString = format ["%1p.", _cost_item];
				hint parseText format [["Aqua",localize "STR_hint_pickupitems"] call fx_getformat_string, _hintMoneyString];
				
				if(count stuff == 0)then{closeDialog 0};
			};
		};
	};