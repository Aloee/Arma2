{
	
	_pole = createVehicle ["Land_PowLines_ConcL", [0,0,0], [], 0, "CAN_COLLIDE"];
	_pole attachTo [_x,[+1,0,-0.6]];
	_pole setVehicleInit "this addEventHandler [""HandleDamage"", {false}];";
	_pole setVectorUp [-(vectorUp _pole select 0), -(vectorUp _pole select 1), -(vectorUp _pole select 2)];
	_pole switchLight "off";
	_pole setpos position _x;
	
}foreach [box2,box3,box4,box12,box13,box14,box15,box16,box17,box18,box19,box20,box21,box22,box23,box24,box25,box26,box27,box28,box29,box30,box31,box32,box33,box34,box35,box36,box37,box38,box39,box40,box41,box42,box43,box44];
