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

	_itemType = switch(_idc_ctrl)do{case WD_P_W:{"weapon"};case WD_P_M:{"magazine"};case WD_P_I:{"partsWeapon"}};
	_cost_item = [_item_index, _itemType] call fx_get_itemPrice;
	if(typeName _cost_item != "BOOL")then{
		
		_cost_item = _cost_item call fx_calc_salePrice;
		
		switch (_idc_ctrl) do{
			case WD_P_I:{
				_list = [(findDisplay WD_DIALOG displayCtrl WD_B_I), _item_index] call box_add_to_list;
					[(findDisplay WD_DIALOG displayCtrl WD_B_I), _list, false] call box_put_to_list;
					[(findDisplay WD_DIALOG displayCtrl WD_P_I), _updated_list, false] call box_put_to_list;

				weaponsParts = [weaponsParts, _item_index, 1] call fx_removeCollectionElement;
			};
			case WD_P_W:{
				_list = [(findDisplay WD_DIALOG displayCtrl WD_B_W), _item_index] call box_add_to_list;
					[(findDisplay WD_DIALOG displayCtrl WD_B_W), _list, "cfgWeapons"] call box_put_to_list;
					[(findDisplay WD_DIALOG displayCtrl WD_P_W), _updated_list,"cfgWeapons"] call box_put_to_list;	
				
				player removeWeapon _item_index;
			};
			case WD_P_M:{
				_list = [(findDisplay WD_DIALOG displayCtrl WD_B_M), _item_index] call box_add_to_list;
					[(findDisplay WD_DIALOG displayCtrl WD_B_M), _list, "cfgMagazines"] call box_put_to_list;
					[(findDisplay WD_DIALOG displayCtrl WD_P_M), _updated_list,"cfgMagazines"] call box_put_to_list;

				player removeMagazine _item_index;
			};
		};
		
		money = money + _cost_item;
	};

};