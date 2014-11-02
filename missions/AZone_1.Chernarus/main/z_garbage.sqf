//FIFO
if(isServer)then{

	sfx_garbage_remover = {
		if(count _this > 0)then{
			deleteVehicle (_this select 0);
		};
	};

	[] spawn {
		while{true}do{
			sleep (DELAY_BODY_REMOVE - ((DELAY_BODY_REMOVE / 100) * count dead_bodys) * 4);
			dead_bodys = dead_bodys - [objNull];
			dead_bodys call sfx_garbage_remover;
		};
	};

	[] spawn {
		while{true}do{
			sleep (DELAY_BROKEN_VEHICLE_REMOVE - ((DELAY_BROKEN_VEHICLE_REMOVE / 100) * count brok_vehicles) * 4);
			brok_vehicles = brok_vehicles - [objNull];
			brok_vehicles call sfx_garbage_remover;
		};
	};

};