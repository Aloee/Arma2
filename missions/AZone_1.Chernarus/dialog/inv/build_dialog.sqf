#include "definitions.sqf";
disableSerialization;

//DISPLAY
if(!dialog)then{
	
	_ok = createDialog "INVENTORY";
 
	_display = findDisplay INV_DIALOG;

	_list = _display displayCtrl INV_B_C;
	_items = [
		[localize "STR_gui_inv_side", 
			switch(side player)do{
				case resistance :{localize "STR_gui_inv_sideSvo"};
				case east :{localize "STR_gui_inv_sideDolg"};
				default {"-"};
			}
		],
		[localize "STR_gui_inv_name", name player],
		[localize "STR_gui_inv_heal", format ["%1 %", (100 - floor (getDammage player)* 100)]],
		[localize "STR_gui_inv_money", money],
		[localize "STR_gui_inv_weaponParts",weaponsParts],
		[localize "STR_gui_inv_artefacts",artefacts],
		[localize "STR_gui_inv_stuff",stuff]
		
	];

	lbClear _list;


	if(!isNil "_list" && !isNil "_items")then{
		if(count _items != 0)then{

			{
				_title = _x select 0;
				_value = _x select 1;

				if(typeName _value != "ARRAY")then{
					_list lbAdd format ["%1: %2", _title, _value];
				}else{
					if(count _value != 0)then{
						_list lbAdd "";
						_list lbAdd format ["%1:", _title];
						{
							_list lbAdd format ["%1 x%2", (_x select 0) call fx_get_localizeString, _x select 1];
						}foreach _value;
					};
				};
			
			} foreach _items;
			
		};		
	};

}else{
	closeDialog 1;
};
