#include "definitions.sqf";
disableSerialization;

_itemsControl = (findDisplay MANAGER_DIALOG displayCtrl MANAGER_P_I);
_indexItems = lbCurSel _itemsControl;
_item_data = _itemsControl lbData _indexItems;

	_item_index_ar = [_item_data] call fx_parse_data;
	_item_index = (_item_index_ar select 0);
	_item_count = (_item_index_ar select 1);

_plListControl = (findDisplay MANAGER_DIALOG displayCtrl MANAGER_PLIST);
_indexPlList = lbCurSel _plListControl;
_recip_uid = _plListControl lbData _indexPlList;

if(_indexPlList >= 0 && _recip_uid != "")then{
	_give_count = parseNumber (ctrlText (findDisplay MANAGER_DIALOG displayCtrl MANAGER_GCNT));
	_recip_pl = _recip_uid call fx_findUid_pl_body;
	
	if(_give_count > 0 and !isNull _recip_pl)then{
		if(_item_count >= _give_count)then{
			if(_recip_pl distance player < 15)then{
				if(_item_data != "")then{
					if(_item_index == "money")then{
						["money",["EvMoney", _give_count, getPosATL player], false] call fx_dropPlayerItems;
						[_recip_pl, _recip_pl, "loc", rCALLVAR, ["money", _give_count], "fx_addPlayerItems"] call RE;
					}else{
						_itemType = _item_index call fx_getItemsType;
						if(typeName _itemType != "BOOL")then{
							["inv",["Suitcase", [[_itemType, [[_item_index, _give_count]]]], getPosATL player], false] call fx_dropPlayerItems;
							[_recip_pl, _recip_pl, "loc", rCALLVAR, ["inv", [[_itemType, [[_item_index, _give_count]]]]], "fx_addPlayerItems"] call RE;
						};
					};
					
					closeDialog 1;
					player playmove "AmovPknlMstpSrasWrflDnon_AinvPknlMstpSlayWrflDnon";
					_recip_pl playmove "AmovPknlMstpSrasWrflDnon_AinvPknlMstpSlayWrflDnon";
				};
			}else{
				hint parseText format ["%1", ["Red", localize "STR_umessage_cantgivemoredistance"] call fx_getformat_string];
			};
		}else{
			hint parseText format ["%1", ["Red", localize "STR_umessage_cantgivemore"] call fx_getformat_string];
		};
	};
};
