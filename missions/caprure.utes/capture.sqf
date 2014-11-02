hint format ["Скрипт %1", floor random 999];

while{true}do{
	
	_sclr = 0.75;
	_units = list _this;
	_marker = _this getVariable "assignedMarker";
	_properties = _this getVariable "properties";
		_impactSide = _properties select 0;
		_captureDelay = _properties select 1;
		_capturing = _properties select 2;
		_captured = _properties select 3;
	
	private ["_impactPerc"];
	
	if(!isNil "_units")then{
		_sides = [east, west, resistance, civilian];
		_impactPerc = 0;
		{
			_side = _x;
			_listCnt = {_x isKindOf "CAManBase"} count _units;
			_sideCnt = {_side == side _x and _x isKindOf "CAManBase"} count _units;
			_perc = if(_listCnt > 0 and _sideCnt > 0)then{_sideCnt / _listCnt}else{0};
			
			if(_impactPerc < _perc)then{_impactPerc = _perc; _impactSide = _side};
		}foreach _sides;
	};
	
	//hint str [_impactPerc, _impactSide, _captureDelay, _capturing, _captured];
	
	if(_impactPerc >= _sclr)then{
		if(_captureDelay == 100 and !_captured)then{
			_captured = true;
			_capturing = false;
			_color = switch(_impactSide)do{case west : {"colorBlue"};case east : {"colorRed"};case resistance : {"colorBlack"};default {"colorWhite"}};
			
			_marker setMarkerColor _color;
			hint format ["Точка под контролем %1", str _impactSide];
		}else{
			if(_captureDelay < 100)then{
				_capturing = true;
				_captureDelay = _captureDelay + 10;
			};
		};
	}else{
		if(count _units > 0)then{
			_captured = false;
			_captureDelay = 0;
		};
	};
	
	_this setVariable ["properties", [_impactSide, _captureDelay, _capturing, _captured]];
	
sleep 5;
};