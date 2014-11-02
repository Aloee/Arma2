#include "definitions.sqf";
disableSerialization;

_control = ((_this select 0) select 0);
_index = ((_this select 0) select 1);

_idc_ctrl = _control call fGetIDC;

	_item_data = _control lbData  _index;
	_item_index_ar = [_item_data] call fx_parse_data;
	_item_index = (_item_index_ar select 0);

	
	
if(_item_data != "")then{

	_cost_item = [_item_index, "vehicle"] call fx_get_itemPrice;

	if(typeName _cost_item != "BOOL")then{
		if(_cost_item <= money)then{
			
			ZONA_serverCreateVehicle = [_item_index, player];
			publicVariable "ZONA_serverCreateVehicle";

			closeDialog 1;
			money = money - _cost_item;
			
			_pic = parseText format["<t size='5'><img image='%1'/></t>",getText (configFile >> "CfgVehicles" >> _item_index >> "picture")];
			_title = parseText format [["Aqua", localize "STR_event_buy"] call fx_getformat_string, getText (configFile >> "CfgVehicles" >> _item_index >> "displayName"), _cost_item];
			_compose = [_title, lineBreak, _pic];
			hint composeText _compose;
		}else{
			hint parseText format ["%1", ["Red", localize "STR_event_nomoney"] call fx_getformat_string];
		};
	};

};