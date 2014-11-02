//Inmission GUI with players names and airstrike target icon
disableSerialization;
_currentCutDisplay = _this select 0;

if (!(local player)) exitWith{};

_maxDist = 500;
_dataInterval = [0,0];
_empty = parseText "";

switch (side player)do{
	
	case east:{_dataInterval = [501,521,"DOLG"]};
	case resistance:{_dataInterval = [521,541,"SVOB"]};
	case civilian:{_dataInterval = [541,561,"FREE"]};
	
};

while {alive player} do {
	_pl_index = 1;
	for "_src_index" from (_dataInterval select 0) to (_dataInterval select 1) do{
		
		_unit = call compile format ["%1%2", (_dataInterval select 2), _pl_index];
		if(!isNil "_unit")then{
		
			_veh=vehicle _unit;
			_dst=round (_veh distance (vehicle player));
			_control=_currentCutDisplay displayCtrl (_src_index);
			
			if( _maxDist > _dst && !visibleMap && (_unit != player) && alive _unit)then{
						
				_unitname = name _unit;
			
				_pos = getPosATL _veh;
			
				_height = if(_veh != _unit)then{4}else{2.5};
				_pos = worldToScreen ([_pos select 0,_pos select 1,(_pos select 2)+_height]);
				
				_text = gettext(configFile >> "CfgVehicles" >> (typeof _veh) >> "displayName");
		
				_mask="<t size='%4' shadow='true' align='center' color='%5'>%1</t><br/><t size='%4' shadow='true' align='center' color='%6'>[%2]</t><br/><t size='%4' shadow='true' align='center' color='%7'>%3m</t>";
				// "#FFFFFF" "#FF0000"
				_ncolor = if (getDammage _unit > 0.5)then{"#FF0000"}else{"#FFFFFF"};
				if(!alive _unit)then{_ncolor = "#000000"};
				_name=parseText format[_mask,_unitname,_text,_dst,1.0,_ncolor,"#DDDDDD","#AAAAFF"];//FFDDAA
	
				
				if(_veh != _unit && driver _veh != _unit)then{_name = _empty};
				
	
				if(count _pos != 0)then{
					_control ctrlShow true;				
					_control ctrlSetStructuredText _name;
					_control ctrlSetPosition [(_pos select 0)-0.125,_pos select 1];
					_control ctrlCommit 0;
					_control ctrlSetFade ( _dst  / _maxDist );
					waitUntil {ctrlCommitted _control};
				};	
			}else{
				_control ctrlShow false;			
			};		
		};
		
	_pl_index = _pl_index + 1;			
	};
		
sleep 0.03;
};