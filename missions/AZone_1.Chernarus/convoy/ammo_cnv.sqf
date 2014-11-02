_vehicle = _this select 0;

if(!isNil "_vehicle")then{
	switch (typeof _vehicle)do{
		case "UralReammo_INS":{
			[nil,nil,"per",rclearMagazineCargo, _vehicle] call RE;
			[nil,nil,"per",rclearWeaponCargo, _vehicle] call RE;
			
			_x = [_vehicle] execvm "fx\s_cargoboxer.sqf";
		};
	};
};