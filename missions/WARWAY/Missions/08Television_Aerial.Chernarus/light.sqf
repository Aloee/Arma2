while {go} do {

_light = "#lightpoint" createVehicle getpos s1;  
_light setLightColor [1, 1, 1];
_light setLightBrightness 0.1;
_light setLightAmbient [1,1,1];
_light lightAttachObject [s1, [0, 0, 0.1]];

sleep 5;
deletevehicle _light;
 };