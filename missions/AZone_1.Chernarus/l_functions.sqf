
fx_findUid_pl_body = {
	_player_obj = objNull;
	{
		//waitUntil {isPlayer _x};
		if(_this == getPlayerUID _x)exitwith{ _player_obj = _x };
	}foreach playableUnits;
_player_obj
};

fx_getFormatDateStr = {
	_year = date select 0;
	_month = localize format ["STR_month_%1", date select 1];
	_day = date select 2;
	_h = date select 3;
	_m = date select 4;

format["%3 %2 %1 %4:%5",_year, _month, _day, _h, _m];
};

fx_sayradio = {
	_obj = _this select 0;
	_channel = _this select 1;
	_mess = _this select 2;
	
	Switch(_channel) do {
		case "side":{ _obj sideChat _mess };
		case "global":{ _obj globalChat _mess };
	};
	playSound "pda_news";
};

fx_getLocationEventString = {
	_localizeBase = _this select 0;
	_localizeLoc = _this select 1;
	_side = _this select 2;
	
	_string = switch(_side)do{
		case east : {format [localize _localizeBase, localize _localizeLoc, localize "STRD_briefing_grps_duty"]};
		case resistance : {format [localize _localizeBase, localize _localizeLoc, localize "STRD_briefing_grps_free"]};
		case west : {format [localize _localizeBase, localize _localizeLoc, localize "STRD_briefing_grps_mil"]};
		case default {""};
	};
	
_string
};

fx_infoText = {

	3100 cutrsc ["rscInfoText","plain"];

	//--- Separate lines
	_text = _this;
	_textArrayUnicode = [];
	{_textArrayUnicode = _textArrayUnicode + [toarray _x]} foreach _text;


	//--- Separate letters
	_textArrayLines = [];
	for "_i" from 0 to (count _textArrayUnicode - 1) do {
		_line = _textArrayUnicode select _i;
		_textArrayTemp = [];
		{_textArrayTemp = _textArrayTemp + [tostring [_x]]} foreach _line;
		_textArrayLines set [_i,_textArrayTemp];
	};


	//--- Merge arrays
	_textArray = [];
	_emptyArray = [];
	_nArrayTemp = [];
	_n = 0;
	{
		_line = _x;
		_textArray = _textArray + _line + ["\n"];
		{
			//_emptyArray = _emptyArray + [_line call bis_fnc_selectrandom]; //--- Shuffled text
			//_emptyArray = _emptyArray + [str floor random 2]; //--- Binary Solo
			//_emptyArray = _emptyArray + [""]; //--- Rolling text
			_emptyArray = _emptyArray + [" "]; //--- Space
			_nArrayTemp = _nArrayTemp + [_n];
			_n = _n + 1;
		} foreach _x;
		_n = _n + 1;
		_emptyArray = _emptyArray + ["\n"];
	} foreach _textArrayLines;
	_finalArray = _emptyArray;
	_text = composetext _finalArray;


	//--- Random order
	_nArray = [];
	while {count _nArrayTemp > 0} do {
		_element = _nArrayTemp select (floor random (count _nArrayTemp));
		_nArray = _nArray + [_element];
		_nArrayTemp = _nArrayTemp - [_element];
	};


	//--- Visualization
	disableserialization;
	_display = uinamespace getvariable "BIS_InfoText";
	_textControl = _display displayctrl 3101;

	_text = composetext _finalArray;
	_textControl ctrlsettext str _text;
	_textControl ctrlcommit 0.01;
	sleep 1;

	{
		_finalArray set [_x,_textArray select _x];
		_text = composetext _finalArray;
		_textControl ctrlsettext str _text;
		_textControl ctrlcommit 0.01;
		playsound "counter";
		if (random 1 > 0.9) then {sleep 0.1};
		sleep 0.01;
	} foreach _nArray;

	sleep 2;


	//--- Fade away
	{
		_finalArray set [_x," "];
		_text = composetext _finalArray;
		_textControl ctrlsettext str _text;
		_textControl ctrlcommit 0.01;
		playsound "counter";
		//if (random 1 > 0.9) then {sleep 0.2};
		sleep 0.01;
	} foreach _nArray;


	3100 cuttext ["","plain"];
};

fx_doProgressBar = {
	_percent = if(_this select 0>0)then{_this select 0}else{0};
	_color = _this select 1;
	_localize = _this select 2;
	_trg = _this select 3;
	_idd = 14423;
	
		_np = _percent / 100 * 0.37;
		_lnp = if(_percent<100)then{(_percent - 10) / 100 * 0.37}else{0.37};
		
		disableserialization;
		if(isNil {uinamespace getvariable "BUL_progressBar"})then{
			_idd cutRsc ["BUL_progressBar","PLAIN"];
		};
		if(isNull (uinamespace getvariable "BUL_progressBar"))then{
			_idd cutRsc ["BUL_progressBar","PLAIN"];
		};

		_display = uinamespace getvariable "BUL_progressBar";
		
		_barControl = _display displayctrl 100001;
		_textControl = _display displayctrl 100002;
		
		_position = ctrlPosition _barControl;
		_barControl ctrlSetPosition [_position select 0, _position select 1, _lnp, _position select 3];;
		_barControl ctrlCommit 0;
		
		_npositipon = [_position select 0, _position select 1, _np, _position select 3];
		_barControl ctrlSetPosition _npositipon;
		_barControl ctrlCommit 2;
		
		if(_localize!="")then{_textControl ctrlSetText localize _localize}else{_textControl ctrlSetText ""};
		
		_barControl ctrlSetBackgroundColor _color;
	
	[_trg, _idd] spawn {
		waitUntil{!(vehicle player in list (_this select 0)) or !alive player};
		(_this select 1) cuttext ["","PLAIN",5];
	};
};

fx_showDetector = {
	
	if (([weaponsParts, "radiationDetector"] call fx_findCollectionElement) > -1)then{
		_value = _this;
		disableSerialization;
		
		16 cutRsc ["DETECTOR_PIC", "PLAIN", 0];
		((uiNamespace getVariable "DETECTOR_PIC") displayCtrl 764522) ctrlSetText str (floor _value / 100);

		player say "nuclear_geiger";
	};
};

fx_hint = {
	waitUntil{!(isNil "BIS_MPF_InitDone")};
	[nil,nil,rHINT,str _this] call RE;
};

fx_getPlayerSibling = {  

   _ob = _this select 0;  
   _dist = _this select 1;  
	
   _siblings = nearestObjects [_ob, ["Man"], _dist] - [_ob];  
   _ext = objNull; 

    { 
          if (_ob distance _x < _dist) then {_dist = _ob distance _x; _ext = _x}; 
    } forEach _siblings; 

   _ext      
};
fx_getRandomPositionInRadius = {
	
	_pos = _this select 0;
	_radius = _this select 1;
	_correct = false;
	_attempt = 0;
	
	private ["_position"];
	while{!_correct && _attempt < 100}do{
		_position = [((_pos select 0)-_radius)+floor random (_radius*2), ((_pos select 1)-_radius)+ floor random (_radius*2), 0];
		_siblings = nearestObjects [_position, [], 10];if(count _siblings == 0)then{_correct = true};
		
		_attempt = _attempt + 1;
	};

_position
};
fx_noPlayerinArrayToObjNull = {

	if(count _this > 0)then{
		_j = 0;	
		{
			_xx = _x;
			if(typeName _xx == "STRING")then{
				if({getPlayerUid _x == _xx} count playableUnits == 0)then{ //isNil {call compile _x} or !isPlayer (call compile _x)
					_this set [_j, ""];
				};
			};
		_j = _j + 1;			
		}foreach _this;
	};

};
//**********************************BOX ENGINE ))))))))))))))))))))))))))))))))))))))))))))))))))))
//IN [1,1,1,2] OUT [[1,3],[2,1]]
fx_get_items_and_cnt = {
	_item_array = _this select 0;
	_result_arr = [];

	{	
		_xx = _x;
		_cnt_mag = {_xx == (_x select 0)} count _result_arr;
		if( _cnt_mag == 0 )then{
			_result_arr set [count _result_arr, [_x, 1]];	
		}else{
			_fi = 0;
			{if( (_x select 0) == _xx )then{ _result_arr set [_fi, [(_x select 0),((_x select 1)+1)] ]; };_fi = _fi+1;} foreach _result_arr;	
		};	
	}foreach _item_array;

_result_arr	
};
box_put_to_list = {
    _list = _this select 0;
    _items = _this select 1;
    _cfg = _this select 2; //cfg..

	private ["_displname"];
	
    lbClear _list;
    //add
    if(!isNil "_list" && !isNil "_items")then{
    	if(count _items != 0)then{
			_string = "";
			//hint str _items;
			{
				_x_cnt = _x select 1;
				_xx = _x select 0;
				
				if(_x_cnt > 0)then{
				
					if(typeName _cfg != "BOOL")then{
						_displname = getText (configFile >> _cfg >>_xx>>"displayName");
					}else{
						_displname = _xx call fx_get_localizeString;	
					};
					
					_string = format["%2 %1",_displname,_x_cnt];
					_index = _list lbAdd _string;
						
						if(typeName _cfg != "BOOL")then{ _list lbSetPicture [_index, getText (configFile >> _cfg >> _xx >> "picture")]; };
						
					_list lbSetData [_index, format ["%1|%2",_xx,_x_cnt]];
					
				};				
			} foreach _items;
		};		
    };
};
box_remove_to_list = {
	_control = _this select 0;
	_index = _this select 1;
	_item_count = if(!isNil {_this select 2})then{_this select 2}else{1};

	
	_remove_data_item = _control lbData _index;
	_far = [_remove_data_item] call fx_parse_data;
	_remove_item = _far select 0;
	
	_items = [_control] call box_find_items;

	_forIndex = 0;
	{
		_listItem = _x select 0;
		_listItemCnt = _x select 1;
		
		if(_listItem == _remove_item)exitWith{
			if(_listItemCnt > 1)then{
				_items set [_forIndex, [_listItem, _listItemCnt - _item_count]];
			}else{
				_items set [_forIndex, objNull];
				_items = _items - [objNull];
			};
		};
		
		_forIndex = _forIndex + 1;
	}foreach _items;

	
_items
};
box_add_to_list = {
	_control = _this select 0;
	_item_index = _this select 1;
	_item_count = if(!isNil {_this select 2})then{_this select 2}else{1};

	private ["_finded"];
		
	_items = [_control] call box_find_items;
 
	_forIndex = 0;
	{
		_listItem = _x select 0;
		_listItemCnt = _x select 1;
		
		if(_listItem == _item_index)then{
			_items set [_forIndex, [_listItem, _listItemCnt + _item_count]];			
			_finded = true;
		};
		_forIndex = _forIndex + 1;
	}foreach _items;
	
	if(isNil "_finded")then{
		_items set [count _items, [_item_index, _item_count]];
	};

_items
};
box_find_items = {
	_control = _this select 0;
	
	_items = [];
	
   	private ["_finded"];
	_index = 0;
   	while{isNil "_finded"}do{
		_f = _control lbData _index;

		_far = [_f] call fx_parse_data;

		_f_type = _far select 0;
		_f_cnt = _far select 1;   	

   	 	if( _f_type != "" )then{
		    //for "_iinar" from 1 to (_f_cnt) do { _items set [count _items, _f_type] }; 
			_items set [count _items, [_f_type, _f_cnt]];
		}else{ _finded = true };
   	 	
		_index = _index + 1;

  	};
		
_items	
};
fx_check_inv = {

	_control_item_n = _this select 0;
	_item = _this select 1;
	
	_control_item = (findDisplay 20001) displayCtrl _control_item_n;
	_ilist = [_control_item] call box_find_items; //ZDESSSSSSSS
	_check = true;
	
	private ["_itemType", "_cfg", "_group", "_control_group"];

	switch (_control_item_n) do {
		//weapons
		case 200041:{
			_cfg = "cfgWeapons";
			_itemType =  getNumber (configFile >> "cfgWeapons" >> _item >> "Type");
			
			_ts = [2];//SecondaryWeapon
			_ta = [1,5]; //PrimaryWeapon,MG,,
			_tal = [4,5]; //Launcher
			_ia = [131072]; //map,radio,watch..
			_iaw = [4096]; //binocular, nvgoogle..
			
			if(_itemType in _ta)then{_control_group = _ta; _group = "mainWeap"};
			if(_itemType in _ts)then{_control_group = _ts; _group = "secWeap"};
			if(_itemType in _ia)then{_control_group = _ia; _group = "mainItem"};
			if(_itemType in _iaw)then{_control_group = _iaw; _group = "mainItemW"};
			if(_itemType in _tal)then{_control_group = _tal; _group = "mainWeapBig"};
				
		};
		//magazines
		case 200051:{
		
			_cfg = "cfgMagazines";
			_itemType =  getNumber (configFile >> "cfgMagazines" >> _item >> "Type");
			
			
			_ml = [512,768]; //launch, MG mag
			_ma = [256]; //PrimMagz..
			_ms = [32, 16]; //PistolMagz.

			if(_itemType in _ml)then{_control_group = _ml; _group = "launMag"};
			if(_itemType in _ma)then{_control_group = _ma; _group = "mainMag"};
			if(_itemType in _ms)then{_control_group = _ms; _group = "seconMag"};

		};
	};

	_type_count_item = {_itemType == getNumber (configFile >> _cfg >> _x select 0 >> "Type")} count _ilist;
	_group_count = 0;
	{if(getNumber (configFile >> _cfg >> _x select 0 >> "Type") in _control_group)then{_group_count = _group_count + (_x select 1)}} foreach _ilist;
	
	switch(_group)do{
		case "secWeap":{
			if(_type_count_item > 0 || _group_count > 1)then{_check = false}	
		};
		case "mainWeap":{
			if(_type_count_item > 0 || _group_count > 0)then{_check = false}
		};
		case "mainWeapBig":{
			if(_type_count_item > 0 || _group_count > 0)then{_check = false}
		};
		case "mainItemW":{
			if(_type_count_item > 2)then{_check = false}	
		};
		case "mainItem":{
			if(_type_count_item > 12)then{_check = false}
		};
		/////////////////////////////
		case "launMag":{
			if(_group_count == 3)then{_check = false}	
		};		
		case "mainMag":{
			if(_group_count == 12)then{_check = false}
		};
		case "seconMag":{
			if(_group_count == 8)then{_check = false}	
		};
	};

	
_check
};

fx_infoammo_hint = {
	_control = ((_this select 0) select 0);
	_index = ((_this select 0) select 1);
	
	_control_idc = _control call fGetIDC;

	_ctrlgrp1 = [200041,20004];
	_cfg = if(_control_idc in _ctrlgrp1)then{"cfgWeapons"}else{"cfgMagazines"};

	_weaponData = _control lbData _index;
	_weaponName = [_weaponData] call fx_parse_data;
	_weaponName = _weaponName select 0;
		
	    _conf = (configFile >> _cfg >>_weaponName);
	    _name = getText(_conf >> "displayName");
 	   _desc = getText(_conf >> "Library" >> "libTextDesc");
 	   _image = getText(_conf >> "picture");

 	   hintSilent parseText format[
    	    '<t size="1.3" align="center" shadow="true" shadowColor="#000000">%1</t><br /><img image="%2" size="6" align="center" /><br />%3<br />%4',
   	     _name, _image, _desc
   	   ];
 	  
};
fx_parse_data = {

	_f = _this select 0;

	_far = toArray (_f);
    	_far_type = [];
    	_cnt_type = [];    
	_stop = false;    	  		
	for "_icn" from  0 to (count _far) do {
    		if(!_stop)then{
			if( (_far select _icn) == 124 )then{
				_icn = _icn + 1;
				for "_sicn" from _icn to (count _far) do {
					_cnt_type set [count _cnt_type, (_far select _sicn)];
					_stop = true;
				};
			}else{
			
				_far_type set [count _far_type, (_far select _icn)]; 
			};    
		};
	};
	//sleep 0.5;
	//hint format ["%1, %2",toString (_far_type), parseNumber toString (_cnt_type)];
		
[toString (_far_type), parseNumber toString (_cnt_type)]
};
//return list magazines for list weapons
fx_get_cfglistmags = {
	_listMagazines = [];
	
	{
		_cfgW = _x select 0;
		_countW = _x select 1;
		
		_magTypes = getArray(configFile >> "cfgWeapons" >> _cfgW >> "magazines");
			_muzzle = getArray(configFile >> "cfgWeapons" >> _cfgW >> "muzzles");
			if(count _muzzle > 1)then{
				_magTypes = _magTypes + getArray(configFile >> "cfgWeapons" >> _cfgW >> _muzzle select 1 >> "magazines");
			};
		{
			_issetinlist = false;
			_xx = _x;
			{
				_mag = _x select 0;
				if(_mag==_xx)then{
					_issetinlist = true;
				};
			}foreach _listMagazines;
			
			if(!_issetinlist)then{
				_listMagazines set [count _listMagazines, [_x, _countW*10]];
			};
		}foreach _magTypes;
		
	}foreach _this;

_listMagazines
};
//return price or boolean false
fx_get_itemPrice = {
	_cfgName = _this select 0;
	_cfgType = _this select 1;
	_price = 0;
	
	private ["_table"];
	
	switch(_cfgType)do{
		case "weapon":{_table = weapons_price;};
		case "magazine":{_table = magazines_price;};
		case "vehicle":{_table = vehicles_price;};
		case "artefacts":{_table = artefacts_price};
		case "stuff":{_table = stuff_price};
		case "partsWeapon":{_table = weaponsParts_price};
		case "work":{_table = work_price};
	};
	
	if(!isNil "_table")then{
		{
			if(_x select 0 == _cfgName)then{
				_price = _x select 1;
			}
		}foreach _table;
	};

_price
};
fx_updWDialogPriceInfo = {

	_control = ((_this select 0) select 0);
	_index = ((_this select 0) select 1);
	
	_control_idc = _control call fGetIDC;
	_grpBuy = [20004,20005,200042];
	_grpSell = [200041,200051,200052];
	_grpWs = [20004,200041];
	_grpMs = [20005,200051];
	_grpIs = [200052,200042];
	
	_itemData = _control lbData _index;
	_itemName = [_itemData] call fx_parse_data;
	_itemName = _itemName select 0;
	
	_price = false;
	if(_control_idc in _grpWs)then{
		_price = [_itemName, "weapon"] call fx_get_itemPrice;
	};
	if(_control_idc in _grpMs)then{
		_price = [_itemName, "magazine"] call fx_get_itemPrice;
	};
	if(_control_idc in _grpIs)then{
		_price = [_itemName, "partsWeapon"] call fx_get_itemPrice;
	};
	
	if(_control_idc in _grpBuy and typeName _price != "BOOL")then{
		ctrlSetText [20006, format [localize "STR_gui_buyprice_andMoney", _price, money]];
	};
	if(_control_idc in _grpSell and typeName _price != "BOOL")then{
		_price = _price call fx_calc_salePrice;
		ctrlSetText [20006, format [localize "STR_gui_saleprice_andMoney", _price, money]];
	};
	if(typeName _price == "BOOL")then{
		ctrlSetText [20006, ""];
	};
	
};

fx_updCDialogPriceInfo = {
	_control = ((_this select 0) select 0);
	_index = ((_this select 0) select 1);
	
	_control_idc = _control call fGetIDC;
	_itemData = _control lbData _index;
	_itemName = [_itemData] call fx_parse_data;
	_itemName = _itemName select 0;
	
	_price = [_itemName, "vehicle"] call fx_get_itemPrice;
	ctrlSetText [30005, format [localize "STR_gui_buyprice2_andMoney", _price, money]];
};

fx_updADialogPriceInfo = {
	_control = ((_this select 0) select 0);
	_index = ((_this select 0) select 1);
	
	_control_idc = _control call fGetIDC;
	_grpBuy = 50004;
	_grpSell = 500041;
	
	_itemData = _control lbData _index;
	_itemName = [_itemData] call fx_parse_data;
	_itemName = _itemName select 0;
	
	_price = [_itemName, "artefacts"] call fx_get_itemPrice;

	if(_control_idc == _grpBuy and typeName _price != "BOOL")then{
		ctrlSetText [50006, format [localize "STR_gui_buyprice_andMoney", _price, money]];
	};
	if(_control_idc  == _grpSell and typeName _price != "BOOL")then{
		
		_dealer_name = player getVariable "DIALOG_OPPONENT";
		if(_dealer_name != "saharov")then{
			_price = _price call fx_calc_salePrice;
		};
		ctrlSetText [50006, format [localize "STR_gui_saleprice_andMoney", _price, money]];
	};
	if(typeName _price == "BOOL")then{
		ctrlSetText [50006, ""];
	};
};

fx_updStuffDialogPriceInfo = {
	_control = ((_this select 0) select 0);
	_index = ((_this select 0) select 1);
	
	_control_idc = _control call fGetIDC;
	_itemData = _control lbData _index;
	_itemName = [_itemData] call fx_parse_data;
	_itemName = _itemName select 0;
	
	_from = player getVariable "DIALOG_OPPONENT";
	if(!isNil "_from")then{
		_price = [_itemName, "stuff"] call fx_get_itemPrice;
		_price = [_itemName, _from, _price] call fx_getItemPriceFrom;
		
		ctrlSetText [70005, format [localize "STR_gui_price", _price]];
	};
};

fx_getItemPriceFrom = {
	_item = _this select 0;
	_from = _this select 1;
	_cost = _this select 2;
	
	switch(_item)do{
		case "milDocuments": {
			switch(_from)do{
				case "sidorch":{
					_cost = _cost - _cost * 0.25;
				};
				case "voronin":{
					_cost = _cost + _cost * 0.25;
				};
				case "luka":{};
				default {
					_cost = _cost - _cost * 0.85;
				};
			};
		};
	};
	
_cost
};

fx_calc_salePrice = {
	_price = floor (_this * saleScl);
_price
};
//**********************************))))))))))))))))))))))))))))))))))))))))))))))))))))     
fGetIDC = {
	_aCtrl = toArray str _this;
	_cnt = count _aCtrl - 9;

	for "_i" from 0 to (_cnt-1) do
	{
		_aCtrl set [_i, _aCtrl select (_i + 9)];
	};

_aCtrl resize _cnt;
parseNumber toString _aCtrl
};
fx_getformat_string = {
	_color = _this select 0;
	_text = _this select 1;
	
	private ["_color","_text"];
	
	if("ARRAY" != typeName _color)then{
		switch (_color) do {
	
			case "Red":{_color = "#DC474C"};
			case "Green":{_color = "#6ECF4A"};
			case "Blue":{_color = "#4F62E8"};
			case "Aqua":{_color = "#80C6C5"};
			case "Orange":{_color = "#ECC055"};
			case "lBlack":{_color = "#333333"};
			case "Black":{_color = "#000000"};
			
			default {_color = "#FFFFFF"};
		};
	}else{
		_r = (_color select 0)*10;
		_g = (_color select 1)*10;
		_b = (_color select 2)*10;
		_color = format ["#%1%4%2%5%3%6", floor _r, floor _g, floor _b, floor ((random 4)+5), floor ((random 4)+5), floor ((random 4)+5)];
	};
format ["<t color='%1'>%2</t>", _color, _text]
};

fx_get_localizeString = {
	private ["_localize"];
	
	switch(_this) do {
	
		case "BLACKDRIP" : {_localize = localize "STR_artefact_Blackdrip"};
		case "GRAVI" : {_localize = localize "STR_artefact_Gravi"};
		case "EMPTY" : {_localize = localize "STR_artefact_Empty"};
		case "AMEBA" : {_localize = localize "STR_artefact_Ameba"};
		case "CRYSTALL" : {_localize = localize "STR_artefact_Crystal"};
		case "STONEBLOOD" : {_localize = localize "STR_artefact_StoneBlood"};
		case "MEAT" : {_localize = localize "STR_artefact_Meat"};
		case "SOUL" : {_localize = localize "STR_artefact_Soul"};
		case "ELECTRA" : {_localize = localize "STR_artefact_Electra"};
		case "SPIKES" : {_localize = localize "STR_artefact_Spikes"};
		case "BATTERY" : {_localize = localize "STR_artefact_Battery"};
		
		case "milDocuments" : {_localize = localize "STR_stuff_milDocs"};
		case "scientsDevice" : {_localize = localize "STR_stuff_scientsDevice"};
		
		
		case "money" : {_localize = localize "STR_gui_inv_money"};
		
		case "m9Silencer" : {_localize = localize "STR_stuff_m9Silencer"};
		case "makarovSilencer" : {_localize = localize "STR_stuff_makarovSilencer"};
		case "aks74uSilencer" : {_localize = localize "STR_stuff_aks74uSilencer"};
		case "bizonSilencer" : {_localize = localize "STR_stuff_bizonSilencer"};
		case "CSKobra" : {_localize = localize "STR_stuff_ak74Calimator"};
		case "PSO1" : {_localize = localize "STR_stuff_ak74PSO"};
		case "GP25" : {_localize = localize "STR_stuff_ak74GLauncher"};
		case "SDeotech" : {_localize = localize "STR_stuff_g36Collimator"};
		case "Aim" : {_localize = localize "STR_stuff_m4Collimator"};
		case "m8GL" : {_localize = localize "STR_stuff_m8GLauncher"};
		case "m16GL" : {_localize = localize "STR_stuff_m16GLauncher"};
		case "M4A1CamoSilencer" : {_localize = localize "STR_stuff_M4A1CamoSilencer"};
		case "ACG" : {_localize = localize "STR_stuff_m16A4ACG"};
		case "MP5Silencer" : {_localize = localize "STR_stuff_MP5Silencer"};
		case "1PN51" : {_localize = localize "STR_stuff_1PN51"};
		case "radiationDetector" : {_localize = localize "STR_stuff_radiationDetector"};
		case "flashlight" : {_localize = localize "STR_stuff_flashlight"};
		
		case "capture" : {_localize = localize "STR_tasks_captureT"};
		case "sabotage" : {_localize = localize "STR_tasks_sabotageT"};
		case "cleanse" : {_localize = localize "STR_tasks_cleanseT"};
		case "mounting" : {_localize = localize "STR_tasks_mountingT"};
		case "hunting" : {_localize = localize "STR_tasks_huntingT"};
		
		default {_localize = _this};
	};
	
_localize
};
fx_kbTellOneSayResponse = {

	_who = _this select 0;_whom = _this select 1;
	_that = _this select 3;_what = _this select 4;
	_topic = _this select 2;
	_maxAge = _this select 5;
	
	//[str (_whom kbWasSaid [_who, _topic, _what, 5]), str (({_who kbWasSaid [_whom, _topic, _x, _maxAge]} count _that == 0) && !((_who getVariable "fix_kbWasSaid") in _that)) ] call fx_hint;
	
	_fix_kbWasSaid = _who getVariable "fix_kbWasSaid";
	if(isNil "_fix_kbWasSaid")then{ _who setVariable ["fix_kbWasSaid", ""]; };

	if(_whom kbWasSaid [_who, _topic, _what, 5] && (({_who kbWasSaid [_whom, _topic, _x, _maxAge]} count _that == 0) && !((_who getVariable "fix_kbWasSaid") in _that)) )then{
		_replic = _that select floor random (count _that - 0.5);
		
		[nil, _who, rkbTell, _whom, _topic, _replic] call RE;

		_who setVariable ["fix_kbWasSaid", _replic];
		_who spawn {
			sleep 3;
			_this setVariable ["fix_kbWasSaid", ""];
		};
	};
	
};
fx_setIdentityNpc = {
	_varName = vehicleVarName _this;
	_this setIdentity _varName;

	switch(_varName)do{
		case "sidorch" :{
			_this setVariable ["nameDisplay", localize "STRD_sidorch_name"];
			group _this setGroupId [localize "STRD_sidorch_grpID", "GroupColor0"];
		};
		case "saharov" :{
			_this setVariable ["nameDisplay", localize "STRD_saharov_name"];
			group _this setGroupId [localize "STRD_saharov_grpID", "GroupColor1"];
		};
		case "voronin" :{
			_this setVariable ["nameDisplay", localize "STRD_voronin_name"];
			group _this setGroupId [localize "STRD_voronin_grpID", "GroupColor1"];
		};
		case "luka" :{
			_this setVariable ["nameDisplay", localize "STRD_luka_name"];
			group _this setGroupId [localize "STRD_luka_grpID", "GroupColor2"];
		};
		
		default { _this setVariable ["nameDisplay", ""]; };
	};
};
//**********************************

fx_create_local_markers = {
	{
		_name = _x select 0;
		_pos = _x select 1;
		_size = _x select 2;
		_color = _x select 3;
		_anomaliname = _x select 4;
		_shape = _x select 5;
		_type = _x select 6;
		
		markerstr = createMarkerLocal[_name,_pos];
		markerstr setMarkerShapeLocal _shape;
		_name setMarkerTypeLocal _type;
		_name setMarkerSizeLocal [_size, _size];
		_name setMarkerColorLocal _color;
		_name setMarkerTextLocal  format ["%1", _anomaliname];
		
	}foreach _this;
};

//activate anomailes
fx_init_anomali_cli = {
	{
		_pos = _x select 0;
		_name = _x select 1;
		
		
		switch(_name) do {
			case "Burn":{
				[_pos, 100] execFSM "DAPANOMALIES\Burn.fsm";  
			};
			case "Gravi":{
				[_pos, 50] execFSM "DAPANOMALIES\Gravi.fsm";
			};
			case "Mincer":{
				[_pos, 50] execFSM "DAPANOMALIES\Mincer.fsm";  
			};
			case "Electro":{
				[_pos, 150, 4] execFSM "DAPANOMALIES\Electro.fsm";  
			};
			case "Radiation":{
				[_pos, 300] execFSM "DAPANOMALIES\Radiation.fsm";  
			};
			case "Psy":{
				[_pos, 200] execFSM "DAPANOMALIES\Psy.fsm";  
			};
			case "Unknown":{
				[_pos, 150] execFSM format["DAPANOMALIES\%1.fsm", anomalies_name select floor random count anomalies_name];
			};
		};
	}foreach _this;
};
fx_init_artefacts_cli = {
	{
		_pos = _x select 0;
		_name = _x select 1;
		_atrefactName = _x select 2;
		_artefactArt = _x select 3;

		actionsAgain = [];
		switch(_name) do {
			case "Gravi":{
				_artefacts = ["BLACKDRIP","GRAVI","EMPTY"];
				_a = _artefacts select (floor random count _artefacts);
				[_a, _pos, _artefactArt, 30, 1] spawn PRECMPL_ARTEFACT_SPAWN;
			};
			case "Burn":{
				_artefacts = ["AMEBA","CRYSTALL"];
				_a = _artefacts select (floor random count _artefacts);
				[_a, _pos, _artefactArt, 100, 1] spawn PRECMPL_ARTEFACT_SPAWN;
			};
			case "Mincer":{
				_artefacts = ["STONEBLOOD","MEAT","SOUL"];
				_a = _artefacts select (floor random count _artefacts);
				[_a, _pos, _artefactArt, 25, 1] spawn PRECMPL_ARTEFACT_SPAWN;
			};
			case "Electro":{
				_artefacts = ["ELECTRA","SPIKES","BATTERY"];
				_a = _artefacts select (floor random count _artefacts);
				[_a, _pos, _artefactArt, 50, 1] spawn PRECMPL_ARTEFACT_SPAWN;
			};
		};
		
	}foreach _this;
};
fx_destroyArtefactCli = {
	
	_effects = nearestObjects[_this, [], 1];
	if(count _effects > 0)then{
		{if(typeof _x == "#lightpoint" or typeof _x == "#particlesource" )then{ deleteVehicle _x; }} foreach _effects;
	};
	
};

fx_addCollectionElement = {
	_collection = _this select 0;
	_item = _this select 1;
	_addCnt = _this select 2;
	
	private ["_findedIndex"];
	for "_i" from 0 to (count _collection) - 1 do {
		_element = (_collection select _i) select 0;
		if(_element == _item)exitwith{_findedIndex = _i};
	};
	
	if(!isNil "_findedIndex")then{
		_collection set [_findedIndex, [_item, _addCnt + ((_collection select _findedIndex) select 1)]];
	}else{
		_collection set [count _collection, [_item, _addCnt]];
	};
	
_collection
};

fx_findCollectionElement = {
	_collection = _this select 0;
	_element = _this select 1;
	_index = -1;
	
	for "_i" from 0 to (count _collection) - 1 do {
		_item = (_collection select _i) select 0;
		if(_element == _item)exitwith{_index = _i};
	};

_index
};

fx_removeCollectionElement = {
	_collection = _this select 0;
	_item = _this select 1;
	_removeCnt = _this select 2;

	for "_i" from 0 to (count _collection) - 1 do {
		_element = (_collection select _i) select 0;
		_count  = (_collection select _i) select 1;
		
		if(_element == _item)exitwith{
			if(_count <= _removeCnt)then{
				_collection set [_i, objNull];
				_collection = _collection - [objNull];
			}else{
				_collection set [_i, [_element, (_count - _removeCnt)]];
			};
		};
	};
_collection
};

fx_createSimpleTask = {
	_taskName = _this select 0;
	_taskType = _this select 1;
	_pos = _this select 2;
	_title = _this select 3;
	_titleP = _this select 4;
	_desc = _this select 5;

	_task = player createSimpleTask [_title]; 
	_task setSimpleTaskDescription[_desc, _titleP, _title];
	if(typeName _pos == "ARRAY")then{ _task setSimpleTaskDestination _pos };
	
	_tasksList = player getVariable "tasksList";if(isNil "_tasksList")then{_tasksList = []};
	_tasksList set [count _tasksList, [_taskName, _taskType, _task]];
	player setVariable ["tasksList", _tasksList];
	
	taskhint [format ["%1:\n%2", localize "STRD_tasks_newTask",  _title], [1, 1, 1, 1], "taskNew"];

_task
};

fx_removeSimpleTask = {
	_taskHref = _this select 0;
	_type = _this select 1;
	_title2 = _this select 2;

	private ["_title1", "_src", "_color"];
	
	_task = _taskHref call fx_getTaskObject;
	
	if(!isNil "_task")then{
		_taskHref call fx_removeTaskFromList;
				
		switch(_type)do{
			case "Succeeded":{_title1 = localize "STRD_tasks_taskDoneS"; _src = "taskdone"; _color = [0.5, 0.8, 0.5, 1]};
			case "Canceled":{_title1 = localize "STRD_tasks_taskDoneC"; _src = "taskFailed"; _color = [0.8, 0.5, 0.5, 1]};
		};
		
		_task setTaskState _type;
		
		taskhint [format ["%1:\n%2", _title1,  _title2], _color, _src];
	};
};
fx_rewardTask = {

	_taskType = _this select 0;
	_ownerName = _this select 1;
	_delimetr = _this select 2;
	_factor = _this select 3;
	_owner = call compile _ownerName;

	_price = [_taskType, "work"] call fx_get_itemPrice;
	if(_delimetr > 0)then{
		_price = _price / _delimetr;
	};
	if(_factor > 0)then{
		_price = _price * _factor;
	};
	
	_rewardFund = _owner getVariable "rewardFund";
	if(_price > 0)then{
		_owner setVariable ["rewardFund", _rewardFund + _price];
	};
	
};
fx_nextTasks = {
	_uid = _this select 0;
	_ownerName = _this select 1;
	_taskType = _this select 2;
	
	sleep ((random 30) + 20);
	ZONA_createNewTask = [_uid, _ownerName, _taskType];
	publicVariable "ZONA_createNewTask";
};
fx_getTaskObject = {
	_tasksList = player getVariable "tasksList";
	_task = objNull;
	
	if(!isNil "_tasksList")then{
		{
			if(_x select 0 == _this)exitWith{_task = _x select 2};
		}foreach _tasksList;
	};

_task
};
fx_removeTaskFromList = {
	_tasksList = player getVariable "tasksList";
	if(!isNil "_tasksList")then{
		for "_i" from 0 to (count _tasksList)-1 do{
			if(((_tasksList select _i) select 0) == _this)then{ _tasksList set [_i, objNull];};
		};
		_tasksList = _tasksList - [objNull];
	
	player setVariable ["tasksList", _tasksList];
	};
};
fx_informer = {
	while{true}do{
		debug globalChat localize "STRD_title_aboutMissionbanner";
		sleep (60 * 60);
	};
};
//dynamic blur
fx_backgroundDynamicBlur = {
	if(DYNAMIC_BLUR_BACKGROUND)then{
		"dynamicBlur" ppEffectEnable true;"filmGrain" ppEffectEnable true;"filmGrain" ppEffectCommit 0.5;
		"dynamicBlur" ppEffectAdjust [0.3]; 
		"dynamicBlur" ppEffectCommit 0.1;
		"filmGrain" ppEffectAdjust [0.1, 0.3, 0.1, 0.05, 2, false];
		"colorCorrections" ppEffectEnable false;
	}else{
		"dynamicBlur" ppEffectEnable false;
		"filmGrain" ppEffectEnable false;
		"colorCorrections" ppEffectEnable false;
	};
	
	cutRsc ["Hud","PLAIN"];
};
fx_weaponJammed = {

	_w = currentWeapon player;
	_m = currentMagazine player;
	_currentMagCnt = player ammo _w;
	_allMagCnt = {_x == _m} count magazines player;
	_currentMagCntPercent = _currentMagCnt / getNumber  (configFile >> "CfgMagazines" >> _m >> "count");

	_diffMags = [];
	{
		if(_x != _m)then{_diffMags set [count _diffMags, _x]};
		player removeMagazine _x;
	}foreach magazines player;

	player addMagazine _m;
	player setVehicleAmmo _currentMagCntPercent;

	{player addMagazine _x} foreach _diffMags;
	for "_i" from 2 to _allMagCnt do {player addMagazine _m};
	
};

fx_getItemsType = {
	_itemType = false;
	{
		if(_this == _x select 0)exitWith{_itemType="artefacts"};
	}foreach artefacts;
	{
		if(_this == _x select 0)exitWith{_itemType="stuff"};
	}foreach stuff;
	{
		if(_this == _x select 0)exitWith{_itemType="weaponsParts"};
	}foreach weaponsParts;

_itemType
};

fx_addPlayerItems = {
	_itemType = _this select 0;
	_itemParams = _this select 1;
	
	switch (_itemType)do{
		/* */
		case "money":{
		
			_count = _itemParams;	
			money = money + _count;
			
			_hintList = format ["%1p.", _count];
			hint parseText format [["Aqua",localize "STR_hint_pickupitems"] call fx_getformat_string, _hintList];
		};
		
		case "inv":{
			
			_invs = _itemParams;
			_hintList = "";
			
			if(count _invs > 0)then{
				{
					_tag = _x select 0;
					_items = _x select 1;
					
					{_hintList = _hintList + format["%1 x%2<br />", (_x select 0) call fx_get_localizeString, _x select 1]} foreach _items;
					
					switch(_tag)do{
						case "artefacts":{
							{
								artefacts = [artefacts, _x select 0, _x select 1] call fx_addCollectionElement;
							}foreach _items;
						};
						case "stuff":{
							{
								stuff = [stuff, _x select 0, _x select 1] call fx_addCollectionElement;
							}foreach _items;
						};
						case "weaponsParts":{
							{
								weaponsParts = [weaponsParts, _x select 0, _x select 1] call fx_addCollectionElement;
							}foreach _items;
						};
					};
				}foreach _invs;
			};

			hint parseText format [["Aqua",localize "STR_hint_pickupitems"] call fx_getformat_string, _hintList];
		};
	};
};

fx_dropPlayerItems = {
	_iType = _this select 0;
	_iParams = _this select 1;
	_dropToLand = _this select 2;
	_radius = 5;
	
	switch(_iType)do{
		/* */
		case "money":{
	
			_type = _iParams select 0;
			_count = _iParams select 1;
			_pos = _iParams select 2;
			
			if(_count != 0)then{
				if(_dropToLand)then{
					_object = _type createVehicle [((_pos select 0)-_radius)+floor random (_radius*2), ((_pos select 1)-_radius)+ floor random (_radius*2), 0];
					[nil, _object, "per", raddaction, format [localize "STR_action_pickupmoney", _count], "fx\actions\pickup_item.sqf",[_iType,_iParams],0,true,true,"","player distance _target < 5"] call RE;
				};
			};
			
			money = money - _count;
		};
		
		case "inv":{
			
			_type = _iParams select 0;
			_invs = _iParams select 1;
			_pos = _iParams select 2;
			
			if(count _invs != 0)then{
				if(_dropToLand)then{
					_object = _type createVehicle [((_pos select 0)-_radius)+floor random (_radius*2), ((_pos select 1)-_radius)+ floor random (_radius*2), 0];
					[nil, _object, "per", raddaction, localize "STR_action_pickupinv", "fx\actions\pickup_item.sqf",[_iType,_iParams],0,true,true,"","player distance _target < 5"] call RE;
				};
				{
					_itemsClass = _x select 0;
					_items = _x select 1;
					
					_itemsArray = switch (_itemsClass)do{
						case "artefacts": {artefacts};
						case "stuff": {stuff};
						case "weaponsParts": {weaponsParts};
					};
					
					if(!isNil "_itemsArray")then{
						{
							_itemsArray = [_itemsArray, _x select 0, _x select 1] call fx_removeCollectionElement;
						}foreach _items;
					};
					
					artefacts = artefacts - [objNull];
					stuff = stuff - [objNull];
					weaponsParts = weaponsParts - [objNull];
				}foreach _invs;
			};
		};
	};
};

//cli execution
fx_cl_setvar = {

	_arg = _this select 0;
	_val = _this select 1;
	
	call compile format ["%1 = %2", _arg, _val];
};
fx_cl_sleepsetvar = {
	_arg = _this select 0;
	_val = _this select 1;
	_time = _this select 2;
	

	[_time, _arg, _val] spawn {
		sleep (_this select 0);
		call compile format ["%1 = %2", (_this select 1), (_this select 2)];
	};
};
fx_cl_setarr = {
	_arr = _this select 0;
	_arg = _this select 1;
	
	call compile format ["%1 set [count %1, %2]",_arr,_arg];

};
fx_cl_setlist = {
	
	_object_pos = _this select 0;
	_argument = _this select 1;
	_element = _this select 2;

	private ["_object"];
	_searh_box = nearestObjects [_object_pos, [HABAR_STYLE], 1];
	if(count _searh_box != 0)then{
		_object = (_searh_box select 0);
		_object setVariable [_argument, _element];	
	};
};
fx_cl_removehb = {
	_arr = _this select 0;
	_arg = _this select 1;

	_i = 0;
	{
		if(_x distance _arg < 0.01)exitwith{};
		_i = _i + 1;
	} foreach (call compile _arr);

	call compile format ["%1 set [%3,objNull];%1 = %1 - [objNull]",_arr,_arg,_i];
}; 