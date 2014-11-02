		fz_sfx_hintVars = {
			private ["_formatStr"];_formatStr = "";
			for "_u" from 0 to ((count _this)-1)do{_formatStr = _formatStr + format ["var_%1 = %2 \n", _u+1, _this select _u]}foreach _this;
			hint _formatStr;
		};
		
		call compile preprocessFileLineNumbers "oo_grid.sqf";
		call compile preprocessFileLineNumbers "oo_node.sqf";

		_grid = ["new", [floor((getPos player) select 0),floor((getPos player) select 1), 500, 500]] call OO_GRID;
		
		//copyToClipBoard str [floor((getPos player) select 0),floor((getPos player) select 1)];
		//_result = ["parseAllSectors", "isBuilding"] call _grid;
		"Print" spawn _grid;
		
