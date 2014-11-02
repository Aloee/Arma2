

fz_sfx_hintVars = {
	private ["_formatStr"];_formatStr = "";
	for "_u" from 0 to ((count _this)-1)do{_formatStr = _formatStr + format ["var_%1 = %2 \n", _u+1, _this select _u]}foreach _this;
	hint _formatStr;
};


call (compile (preprocessFileLineNumbers "oop_framework\init.sqf"));

_playerObject = ["Player", []] call SF_OO_newObject;
_className = "Player";
_str = "";
for "_index" from 0 to ((count (SF_OO_CfgRoot >> _className)) - 1) do {
	_element = (SF_OO_CfgRoot >> _className) select _index;
	_str = _str + format ["%1: %2 \n", _index, configName _element];
};
hint _str;
/*
[
	typeName SF_OO_FzLocation_var_1,
	typeName SF_OO_FzLocation_var_2,
	typeName SF_OO_FzLocation_var_3,
	typeName SF_OO_FzLocation_var_4,
	typeName SF_OO_FzLocation_var_5,
	typeName SF_OO_FzLocation_var_6,
	typeName SF_OO_FzLocation_var_7,
	typeName SF_OO_FzLocation_var_8,
	typeName SF_OO_FzLocation_var_9,
	typeName SF_OO_FzLocation_var_10,
	typeName SF_OO_FzLocation_var_11,
	typeName SF_OO_FzLocation_var_12,
	typeName SF_OO_FzLocation_var_13,
	SF_OO_FzLocation_var_14,
	_myClassObject getVariable "pVAR1",
	_myClassObject getVariable "pVAR2",
	_myClassObject getVariable "pVAR3",
	_myClassObject getVariable "SF_OO_prvtVrbls"
	
] call fz_sfx_hintVars;
*/


//[1, 2, 3] call SF_OO_FzLocation_myMethod2;
//[_myClassObject, "myMethod1", [1, "text", objNull]] call SF_OO_classMethod;
//_return = [player, 1, "Hello"] call SF_OO_FzLocation_myMethod2;
//hint str _var;


while{true}do{
	player globalChat format ["FPS: %1", diag_fpsmin];
sleep 5;
};