/*
	Author: aloe itfruit@mail.ru
	Copyright (C) 2014 Aloe
	Title: Misc Simple Inventory
	Version: 0.3
	
	This program is free software: you can redistribute it and/or modify
	it under the terms of the GNU General Public License as published by
	the Free Software Foundation, either version 3 of the License, or
	(at your option) any later version.
	
	This program is distributed in the hope that it will be useful,
	but WITHOUT ANY WARRANTY; without even the implied warranty of
	MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
	GNU General Public License for more details.
	
	You should have received a copy of the GNU General Public License
	along with this program.  If not, see <http://www.gnu.org/licenses/>. 
*/

if(local player)then{

	#include "inv\definitions.sqf"

	//BASIC
	inv_fGetIDC = {
		private ["_aCtrl", "_cnt"];
		
		_aCtrl = toArray str _this;
		_cnt = count _aCtrl - 9;
		for "_i" from 0 to (_cnt-1) do {
			_aCtrl set [_i, _aCtrl select (_i + 9)];
		};

	_aCtrl resize _cnt;
	parseNumber toString _aCtrl
	};
	
	//PUBLIC
	/*GO TO 
	inv_fx_setItem = {
	
	};
	inv_fx_getItem = {
	
	};
	*/
	inv_fx_useItem = {
		hint "Use: inv_fuctions.sqf line 72";
	};

	inv_fx_dropItem = {
		private ["_display", "_listControl", "_listIndex", "_idc", "_data", "_itemName", "_inv", "_entry", "_all"];
		
		_all = _this;
		_display = findDisplay INV_DIALOG;
		_listControl = _display displayCtrl INV_LIST_A;
		_listIndex = lbCurSel _listControl;
		
		_idc = _listControl call inv_fGetIDC;
		_data = lbData [_idc, _listIndex];
		_itemName = (call compile _data) select 0;
		
		_inv = player getVariable "inv_misc";
		for "_i" from 0 to (count _inv)-1 do {
			_entry = _inv select _i;
			if((_entry select 0) == _itemName)exitWith{
				if(!_all)then{
					if(_entry select 1 > 0)then{
						_inv set [_i, [_entry select 0, (_entry select 1)-1]];
					}else{_inv set [_i, objNull]};
				}else{_inv set [_i, objNull]};
				_inv = _inv - [objNull];
				
				player setVariable ["inv_misc", _inv];
				call inv_displayItemList;
				[_listControl, _listIndex] call inv_fx_changeItem;
			};
		};
	};

	inv_fx_changeItem = {
		private ["_conrtolA", "_index", "_idc", "_data", "_itemName", "_conf", "_name", "_image", "_desc"];
		
		_conrtolA = _this select 0;
		_index = _this select 1;
		
		_idc = _conrtolA call inv_fGetIDC;
		_data = lbData [_idc, _index];
		_itemName = (call compile _data) select 0;
		
		if(_itemName != "")then{
			_conf = (configFile >> "cfgWeapons" >> _itemName);
			_name = getText(_conf >> "displayName");
			_desc = getText(_conf >> "Library" >> "libTextDesc");
			_image = getText(_conf >> "picture");
		
			_display = findDisplay INV_DIALOG;
			
			_controlTitle = _display displayCtrl INV_TITLE_B;
			_controlTitle ctrlSetText _name;
			
			_controlDesc = _display displayCtrl INV_LIST_DESC;
			_controlDesc ctrlSetStructuredText (parseText format[
				'<img image="%1" size="20" align="center" /><br/><t size="1.5" font="Zeppelin33" color="#555555">%2</t>',
			_image, _desc]);
			
			true call inv_displayItemDesc;
		}else{
			false call inv_displayItemDesc;
		};
	};

	inv_displayItemList = {
		private ["_display", "_list", "_value", "_name", "_cnt", "_displname", "_string", "_index"];
		
		_display = findDisplay INV_DIALOG;	
		_list = _display displayCtrl INV_LIST_A;
	
		if(!isNil "_list")then{
			lbClear _list;
			_value =  player getVariable "inv_misc";
			
			if(typeName _value == "ARRAY")then{
				_list lbAdd "";
				{
					_name = _x select 0;
					_cnt = _x select 1;
					
					if(_cnt > 0)then{
						_displname = getText (configFile >> "cfgWeapons" >> _name >> "displayName");
						_index = _list lbAdd format["%2 %1", _displname, _cnt];
						_list lbSetPicture [_index, getText (configFile >> "cfgWeapons" >> _name >> "picture")];
						_list lbSetData [_index, format ["['%1',%2]", _name, _cnt]];
					};
				} foreach _value;
				_list lbAdd "";
			};
		};
	};

	inv_displayItemDesc = {
		_DescEntity = [INV_BCKGRND_B, INV_TITLE_B, INV_LIST_DESC, INV_LIST_DESCB1, INV_LIST_DESCB2, INV_LIST_DESCB3];
		if(_this)then{{ctrlShow [_x, true]}foreach _DescEntity}else{{ctrlShow [_x, false]}foreach _DescEntity};
	};
};
