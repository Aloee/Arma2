//FIFO
if(isServer)then{

	sfx_garbage_remover = {
		if(count _this > 0)then{
			deleteVehicle (_this select 0);
		};
	};

	[] spawn {
		while{true}do{
			sleep (FZ_DELAY_BODY_REMOVE - ((FZ_DELAY_BODY_REMOVE / 100) * count FZ_DEAD_BODYS) * 4);
			FZ_DEAD_BODYS = FZ_DEAD_BODYS - [objNull];
			FZ_DEAD_BODYS call sfx_garbage_remover;
		};
	};

	[] spawn {
		while{true}do{
			sleep (FZ_DELAY_BROKEN_VEHICLE_REMOVE - ((FZ_DELAY_BROKEN_VEHICLE_REMOVE / 100) * count FZ_BROK_VEHICLES) * 4);
			FZ_BROK_VEHICLES = FZ_BROK_VEHICLES - [objNull];
			FZ_BROK_VEHICLES call sfx_garbage_remover;
		};
	};

};