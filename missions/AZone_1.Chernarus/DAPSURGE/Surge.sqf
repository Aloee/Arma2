if(isDedicated || isServer)exitWith{};

if(!alive player)exitWith{call fx_backgroundDynamicBlur};

_epicenter= _this select 0;
_range = _this select 1;
_nearestunits=[];
_delay = 25;
_snowtimer=180;
_count=0;
DAP_SURGE=0;

titleCut [" ","BLACK OUT",0.3];
		"dynamicBlur" ppEffectEnable true;
		"dynamicBlur" ppEffectAdjust [2];
		"dynamicBlur" ppEffectCommit 0.01; 
titleCut [" ","BLACK IN",3];		
//"colorCorrections" ppEffectAdjust [1, 1, 0, [1,0,0,-0.1], [1,0,0,0], [1,0,0,-10]]; 
"colorCorrections" ppEffectCommit 10;
"colorCorrections" ppEffectEnable true;
waitUntil {ppEffectCommitted "colorCorrections"};

"colorCorrections" ppEffectAdjust [1, 1, 0, [0.7,0,0,-0.1], [0.7,0,0,0], [0,0,0,-10]]; 
"colorCorrections" ppEffectCommit _delay;
"PostEffect" ppEffectAdjust [0.01,0.01,true]; 
"PostEffect" ppEffectCommit _delay;
waitUntil {ppEffectCommitted "colorCorrections"};
"dynamicBlur" ppEffectAdjust [1]; 
"dynamicBlur" ppEffectCommit _delay;


sleep 10;
if(!alive player)exitWith{call fx_backgroundDynamicBlur};

playSound "DAPSURGESOUND";
enableEnvironment false;
"colorCorrections" ppEffectAdjust [1, 1, 0, [1,0,0,-0.1], [2.5,0,0,0], [1,0,0,-10]]; 
"colorCorrections" ppEffectCommit 17.5;
"PostEffect" ppEffectAdjust [0.01,0.01,true]; 
"PostEffect" ppEffectCommit 17.5;
"dynamicBlur" ppEffectAdjust [5]; 
"dynamicBlur" ppEffectCommit 17.5;
[player] execVM "DAPSURGE\Quake.sqf";
waitUntil {ppEffectCommitted "colorCorrections"};

enableRadio false;
titleCut [" ","BLACK OUT",0.1];

		"colorCorrections" ppEffectAdjust [1, 1, 0, [0.1, 0.0, 0.0, 0.3], [1.0, 0.5, 0.5, 0.1], [0.199, 0.587, 0.114, 0.0]];
		"colorCorrections" ppEffectCommit 0;
		"dynamicBlur" ppEffectAdjust [4];
		"dynamicBlur" ppEffectCommit 0;
		sleep 1;
DAP_SURGE=0;
_cam = "camera" camCreate [(getPosATL player select 0), (getPosATL player select 1),10000];
_cam cameraEffect ["internal", "BACK"];

sleep 30;
terminate _ppeffects;
"dynamicBlur" ppEffectEnable false;
"colorCorrections" ppEffectEnable false;
enableEnvironment true;
enableRadio true;
player setUnitPos "DOWN";
_cam cameraEffect ["Terminate", "BACK"];
camDestroy _cam;
player switchCamera "Internal"; 
call fx_backgroundDynamicBlur;
titleCut [" ","BLACK IN",30];