scriptName "validateParameters";
/*
	File: validateParameters.sqf
	Author: Joris-Jan van 't Land

	Description:
	Validating the parameters of a certain method in a class

	Parameter(s):
	_this select 0: String (class name)
	_this select 1: String (method name)
	_this select 2: Any (to-be-validated parameters)
	
	Returns:
	validation flag: Boolean
*/

//Parameter validation
if (isNil "_this") exitWith {diag_log "Log: [validateParameters] no parameters defined!"; false};
if ((typeName _this) != (typeName [])) exitWith {diag_log "Log: [validateParameters] list of parameters must be an Array!"; false};
if ((count _this) != 3) exitWith {diag_log ("Log: [validateParameters] " + (count _this) + " parameters provided, 3 expected!"); false};

private ["_className"];
_className = _this select 0;
if ((typeName _className) != (typeName "")) exitWith {diag_log "Log: [validateParameters] class name (0) must be a String!"; false};

private ["_class"];
_class = missionConfigFile >> "CfgOO" >> _className;
if ((configName _class) == "") exitWith {diag_log ("Log: [validateParameters] class " + _className + " does not exist in CfgOO!"); false};

private ["_methodName"];
_methodName = _this select 1;
if ((typeName _methodName) != (typeName "")) exitWith {diag_log "Log: [validateParameters] method name (1) must be a String!"; false};

private ["_method"];
_method = _class >> "Methods" >> _methodName;
if ((configName _method) == "") exitWith {diag_log ("Log: [validateParameters] method " + _methodName + " does not exist in CfgOO!"); false};

private ["_debugPrefix", "_params", "_paramsString", "_paramTypes", "_return"];
_debugPrefix = (_className + "." + _methodName);
_params = _this select 2;
_paramsString = str _params;
_paramTypes = getArray (_method >> "parameterTypes");
_return = true;

if ((count _paramTypes) > 0) then 
{
	if ((isNil "_params") && ((count _paramTypes) > 0)) exitWith {diag_log ("Log: [" + _debugPrefix + "] no parameters provided, " + (str (count _paramTypes)) + " expected!"); _return = false};

	if (((count _paramTypes) > 1) && ((_paramTypes select 0) != "ARRAY")) then 
	{
		if (((count _paramTypes) > 1) && ((typeName _params) != "ARRAY")) exitWith {diag_log ("Log: [" + _debugPrefix + "] 1 parameter provided, " + (str (count _paramTypes)) + " expected!"); _return = false};
		if ((count _params) < (count _paramTypes)) exitWith {diag_log ("Log: [" + _debugPrefix + "] " + (str (count _params)) + " parameters provided, " + (str (count _paramTypes)) + " expected!"); _return = false};
		
		for "_i" from 0 to ((count _paramTypes) - 1) do 
		{
			if ((_paramTypes select _i) != (typeName (_params select _i))) exitWith {diag_log ("Log: [" + _debugPrefix + "] parameter (" + (str _i) + ") is supposed to be of type: " + (_paramTypes select _i)); _return = false};
		};
	} 
	else 
	{
		if ((typeName _params) != (_paramTypes select 0)) exitWith {diag_log ("Log: [" + _debugPrefix + "] parameter is supposed to be of type: " + (_paramTypes select 0)); _return = false};
	};
} 
else 
{
	_paramsString = "";
};

diag_log ("Log: " + _className + "." + _methodName + "(" + _paramsString + ")");

_return