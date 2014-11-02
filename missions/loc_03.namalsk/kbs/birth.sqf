if(!isServer && !isDedicated) exitWith {};

	waitUntil{!isNil "BIS_MPF_InitDone"};
	waitUntil{!isNil "fz_sfx_protectNpc"};
	waitUntil{!isNil "fz_fx_setIdentityNpc"};
	
	private ["_varName"];
	
	_varName = vehicleVarName _this;
	[nil, nil, "per", rCALLVAR, _this, "fz_fx_setIdentityNpc"] call RE;
	_this call fz_fx_setIdentityNpc;
	
		 /*
		 work array:
			[title, shortcuts[], menu, command, show, enable]
				title = заголовок пункта меню 
				shortcuts[] = горячая клавиша, см. DIK KeyCodes 
				menu = ссылка на подменю, например "#GET_IN" 
				command = тип команды, см. Commanding-menu-cmd.hpp, здесь -- выполнить sqf код (-5) 
				exec пара имя/значение дополнительного параметра, здесь задается expression
				show = условие показа пункта меню -- всегда показывать 
				enable = условие доступности пункта меню -- всегда доступно 
				
				
				task Identificator - идентификатор задания
				string - "info" or ""
		*/

	switch(_varName)do{
		case "sidorch" : {
			_this call fz_sfx_protectNpc;
			//[nil, nil, "per", rCALLVAR, [_varName, []], "fx_buildComDialogClient"] call RE;
		};
		case "sidBaba" : {
			
		};
	};
