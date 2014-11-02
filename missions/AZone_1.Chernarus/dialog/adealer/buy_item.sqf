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

	_cost_item = [_item_index, "artefacts"] call fx_get_itemPrice;
	
/*	*/
	if(typeName _cost_item != "BOOL")then{
		if(_cost_item <= money)then{
			
			switch (_idc_ctrl) do{

				case AD_B_W:{

					_list = [(findDisplay AD_DIALOG displayCtrl AD_P_W), _item_index] call box_add_to_list;
						[(findDisplay AD_DIALOG displayCtrl AD_P_W), _list, false] call box_put_to_list;
						[(findDisplay AD_DIALOG displayCtrl AD_B_W), _updated_list, false] call box_put_to_list;
					
					artefacts = [artefacts, _item_index, 1] call fx_addCollectionElement;
					money = money - _cost_item;

				};
				
			};
		}else{
			hint parseText format ["%1", ["Red", localize "STR_event_nomoney"] call fx_getformat_string];
		};
	};

};