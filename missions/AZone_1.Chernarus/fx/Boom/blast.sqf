// (c) Arigato, 2010. v 0.6
if(!local player)exitwith{};

	private ["_object", "_xpos", "_ypos"];

	_object = _this select 0;
	_xpos = getPosATL _object select 0;
	_ypos = getPosATL _object select 1;

	call compile preprocessfile "fx\boom\config.sqf";

	[_object] execvm "fx\boom\script\destroy.sqf";

	[_xpos, _ypos] execvm "fx\boom\script\escape.sqf";
	//[_xpos, _ypos] execvm "fx\boom\script\damage.sqf";


	[_xpos, _ypos] execvm "fx\boom\script\glare.sqf";
	[_xpos, _ypos] execvm "fx\boom\script\light.sqf";

	[_xpos, _ypos] exec "fx\boom\script\hat.sqs";

	[_xpos, _ypos] execvm "fx\boom\script\ears.sqf";
	[_xpos, _ypos] execvm "fx\boom\script\aperture.sqf";

	sleep 0.5;
	[_xpos, _ypos] exec "fx\boom\script\hatnod.sqs";

	[_xpos, _ypos] exec "fx\boom\script\blast1.sqs";
	[_xpos, _ypos] exec "fx\boom\script\blast2.sqs";
	sleep 0.4;
	[_xpos, _ypos] exec "fx\boom\script\blast3.sqs";

	//execvm "fx\boom\script\weather.sqf";

	sleep 5;
	//[_xpos, _ypos] execvm "fx\boom\script\heartbeat.sqf";

	sleep 15;
	[_xpos, _ypos] execvm "fx\boom\script\dust.sqf";

	sleep 60;
	[_xpos, _ypos] exec "fx\boom\script\ring1.sqs";
	sleep 6;
	[_xpos, _ypos] exec "fx\boom\script\ring2.sqs";
