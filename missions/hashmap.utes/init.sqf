		call compile preprocessFileLineNumbers "myClass.sqf";
		_map = ["new", []] call MYCLASSCHILD2;
			["check", []] call _map;

		/*
			
			
		
		
		//call compile preprocessFileLineNumbers "myClass.sqf";
		//_map = ["new", []] call MYCLASSCHILD2;
		//_return = ["check", ["var"]] call _map;
		//_return = ["Get", ["var"]] call _map;
		//_return = ["check", ["var"]] call _map;
		//hint str _return;
/*
		_return = "IsEmpty" call _map;
		diag_log format["isempty %1", _return];

		["Put", ["toto", [3,7]]] call _map;
		["Put", ["tata", "turlututu"]] call _map;
		["Put", ["jp", "test du hashmap"]] call _map;

		_return = ["containsKey", ["toto"]] call _map;
		diag_log format["contains key toto %1", _return];

		_return = ["containsValue", ["bullshit"]] call _map;
		diag_log format["contains value toto %1", _return];

		_return = ["containsValue", [[3,7]]] call _map;
		diag_log format["contains value [3,7] %1", _return];

		_return = "entrySet" call _map;
		diag_log format["entryset %1", _return];

		_return = ["Get", ["toto"]] call _map;
		diag_log format["get toto %1", _return];

		_return = "IsEmpty" call _map;
		diag_log format["isempty %1", _return];

		_return = "keySet" call _map;
		diag_log format["keySet %1", _return];

		_return = "Size" call _map;
		diag_log format["Size %1", _return];

		["Set", ["toto", [8,8]]] call _map;

		_return = ["Get", ["toto"]] call _map;
		diag_log format["after toto seting, get toto %1", _return];

		["Remove", ["tata"]] call _map;

		_return = "keySet" call _map;
		diag_log format["after tata remove, keySet %1", _return];

		_return = "entrySet" call _map;
		diag_log format["after tata remove, entryset %1", _return];

		"clear" call _map;

		_return = "Size" call _map;
		diag_log format["Size %1 after clear", _return];

		_return = "IsEmpty" call _map;
		diag_log format["isempty %1", _return];

		