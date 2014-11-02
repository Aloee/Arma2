#include "definitions.sqf";
disableSerialization;

_control = ((_this select 0) select 0);
_index = ((_this select 0) select 1);

_idc_ctrl = _control call fGetIDC;

	_item_data = _control lbData  _index;
	_item_index_ar = [_item_data] call fx_parse_data;
	_item_index = _item_index_ar select 0;
	_item_count = _item_index_ar select 1;

if(_item_data != "")then{

_count = if(_item_index in smallThings)then{round (_item_count / 2)}else{1};

switch (_idc_ctrl) do{
	case BOX_P_I:{
		_updated_list = [_control, _index, _count] call box_remove_to_list;
		_list = [(findDisplay BOX_DIALOG displayCtrl BOX_B_I), _item_index, _item_count] call box_add_to_list;
			[(findDisplay BOX_DIALOG displayCtrl BOX_B_I), _list, false] call box_put_to_list;
			[(findDisplay BOX_DIALOG displayCtrl BOX_P_I), _updated_list, false] call box_put_to_list;	
	};
	case BOX_B_I:{
		_updated_list = [_control, _index, _count] call box_remove_to_list;
		_list = [(findDisplay BOX_DIALOG displayCtrl BOX_P_I), _item_index, _item_count] call box_add_to_list;
			[(findDisplay BOX_DIALOG displayCtrl BOX_P_I), _list, false] call box_put_to_list;
			[(findDisplay BOX_DIALOG displayCtrl BOX_B_I), _updated_list, false] call box_put_to_list;	
	};
	case BOX_P_W:{
		_updated_list = [_control, _index] call box_remove_to_list;
		_list = [(findDisplay BOX_DIALOG displayCtrl BOX_B_W), _item_index] call box_add_to_list;
			[(findDisplay BOX_DIALOG displayCtrl BOX_B_W), _list, "cfgWeapons"] call box_put_to_list;
			[(findDisplay BOX_DIALOG displayCtrl BOX_P_W), _updated_list,"cfgWeapons"] call box_put_to_list;
	};
	case BOX_B_W:{
		_updated_list = [_control, _index] call box_remove_to_list;
		//check inventory
		_check = [BOX_P_W, _item_index] call fx_check_inv;

		if(_check)then{
			_list = [(findDisplay BOX_DIALOG displayCtrl BOX_P_W), _item_index] call box_add_to_list;
				[(findDisplay BOX_DIALOG displayCtrl BOX_P_W), _list, "cfgWeapons"] call box_put_to_list;
				[(findDisplay BOX_DIALOG displayCtrl BOX_B_W), _updated_list,"cfgWeapons"] call box_put_to_list;
		}else{
			hint parseText format ["%1", ["Red", localize "STR_umessage_cantgetmore"] call fx_getformat_string];
		};
	};
	case BOX_P_M:{
		_updated_list = [_control, _index] call box_remove_to_list;
		_list = [(findDisplay BOX_DIALOG displayCtrl BOX_B_M), _item_index] call box_add_to_list;
			[(findDisplay BOX_DIALOG displayCtrl BOX_B_M), _list, "cfgMagazines"] call box_put_to_list;
			[(findDisplay BOX_DIALOG displayCtrl BOX_P_M), _updated_list,"cfgMagazines"] call box_put_to_list;	
			
	};
	case BOX_B_M:{
		_updated_list = [_control, _index] call box_remove_to_list;
		//check inventory
		_check = [BOX_P_M, _item_index] call fx_check_inv;
		
		if(_check)then{
		_list = [(findDisplay BOX_DIALOG displayCtrl BOX_P_M), _item_index] call box_add_to_list;
			[(findDisplay BOX_DIALOG displayCtrl BOX_P_M), _list, "cfgMagazines"] call box_put_to_list;
			[(findDisplay BOX_DIALOG displayCtrl BOX_B_M), _updated_list,"cfgMagazines"] call box_put_to_list;
		}else{
			hint parseText format ["%1", ["Red", localize "STR_umessage_cantgetmore"] call fx_getformat_string];
		};	
			
	};
};

};