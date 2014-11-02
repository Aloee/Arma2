if(local player)then{

	_commet = _this select 0;
	_pos = getPosATL introcam;

	_camera = "camera" camCreate [(_pos select 0)-0.75, (_pos select 1)-0.75,(_pos select 2) + 20];
	_camera cameraEffect ["internal","back"];
	_camera camSetFOV 1;
	_camera camSetTarget _commet;
	_camera camCommit 5;



	3 cutText ["","BLACK IN",3];
	waitUntil {!alive _commet};
	deleteVehicle _commet;

	/* */
	"dynamicBlur" ppEffectEnable true;
	"colorCorrections" ppEffectEnable true;
	//"colorCorrections" ppEffectAdjust [1, 1, 0, [0.5,0.5,0.5,-0.1], [0.5,0.5,0.5,0], [0,0,0,-5]]; 
	"colorCorrections" ppEffectCommit 17.5;
	"PostEffect" ppEffectAdjust [0.01,0.01,true]; 
	"PostEffect" ppEffectCommit 17.5;
	"dynamicBlur" ppEffectAdjust [5]; 
	"dynamicBlur" ppEffectCommit 17.5;
	
	
	sleep 17.5;

	playSound "DAPSURGESOUND";
	"colorCorrections" ppEffectAdjust [1, 1, 0, [1,0,0,-0.1], [2.5,0,0,0], [1,0,0,-10]]; 
	"colorCorrections" ppEffectCommit 17.5;
	"PostEffect" ppEffectAdjust [0.01,0.01,true]; 
	"PostEffect" ppEffectCommit 17.5;
	"dynamicBlur" ppEffectAdjust [5]; 
	"dynamicBlur" ppEffectCommit 17.5;
	sleep 17.5;


	player cameraEffect ["terminate","back"];
	_camera camCommit 1;
	titleCut ["", "BLACK OUT", 3];
	titleCut ["", "BLACK IN", 1];
	camDestroy _camera;

	call fx_backgroundDynamicBlur;
	//_camera camSetTarget getPosATL ZonaCenter;
};