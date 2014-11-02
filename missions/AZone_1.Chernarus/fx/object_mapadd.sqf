//Server
if(!isServer && !isDedicated) exitwith {};	


//"Land_Sign_BES"
//"Land_sign_TEC"
//"Land_Sign_Bar_RU"
//"Land_sign_altar"
//"Land_sign_ulgano"
//"Land_SignB_Hotel_CZ"
//"Land_SignB_Hotel_CZ2"
//"Land_SignB_Hotel_CZ3"
//"Land_SignB_Pharmacy"
//"Land_SignB_PostOffice"
//"Land_SignB_Pub_CZ1"
//"Land_SignB_Pub_CZ2"
//"Land_SignB_Pub_CZ3"
//"Land_SignB_Pub_RU1"
//"Land_SignB_Pub_RU2"
//"Land_SignB_Pub_RU3"

_logic = _this select 0;
_type = _this select 1;
_height = _this select 2;

_pos = getPosATL _logic;
_obj = createVehicle [_type, _pos, [], 0, "NONE"];
_obj setPos [_pos select 0, _pos select 1, (_pos select 2) + _height];
_obj setDir  getDir _logic;
