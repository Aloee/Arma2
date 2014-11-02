// place this code into the logics init line.
// null=[this,30,120] execvm "mines.sqf" and save thsi script as createmines.sqf
// this = minefield center // _spread/30 is the diameter of the mine field // _mines/120 is the number of mines planted
// Adjust the values as you wish.

_pos    = _this select 0;
_spread = _this select 1;
_mines  = _this select 2;

_height = -0.08;// sink mine depth // zero is on the surface.

for [{_p = 0},{_p < _mines},{_p = _p + 1}] do {
	_mine = "mineE" createVehicle [(getpos _pos select 0)+(random _spread)-_spread/2, (getpos _pos select 1)+(random _spread)-_spread/2,_height];
	_mine = createTrigger["emptyDetector",getPos _mine];
	_mine setTriggerArea [1,1,0,false]; 
	_mine setTriggerActivation ["any","present",false]; 
	_mine setTriggerStatements["this","[thislist select 0] execVM ""fx\minedetect.sqf""",""];
};