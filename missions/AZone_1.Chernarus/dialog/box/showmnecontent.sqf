_pl = _this select 0;

_event_pos = getposATL _pl;
_searh_box = nearestObjects [_event_pos, [HABAR_STYLE], 3];
if(count _searh_box != 0)then{
	_box = _searh_box select 0;
	_enjoyers = nearestObjects [getposATL _box, ["Man"], 3]-[_pl];
	if({isPlayer _x and alive _x} count _enjoyers == 0)then{
	
		_box_weapons = _box getVariable "box_weapons";
		_box_mags = _box getVariable "box_mags";
		_box_items = _box getVariable "box_items";
		
		_pl_weapons = [weapons _pl] call fx_get_items_and_cnt;
		_pl_mags = [magazines _pl] call fx_get_items_and_cnt;
		_pl_items = [["money", money]];
		
				
		[[_box_weapons,_box_mags,_box_items],[_pl_weapons,_pl_mags,_pl_items]] execVM "dialog\box\build_box.sqf"; 
	
	}else{
		hint parseText (format [["RED", localize "STR_hint_usedCamp"] call fx_getformat_string, name(_enjoyers select 0)]);
	};
};