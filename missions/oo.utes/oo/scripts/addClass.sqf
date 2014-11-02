scriptName "addClass";
/*
	File: addClass.sqf
	Author: Joris-Jan van 't Land

	Description:
	Registering a class for the OO scripting shell

	Parameter(s):
	_this: String (class in CfgOO)
	
	Returns:
	-
*/

//Parameter validation
if (isNil "_this") exitWith {diag_log "Log: [addClass] no parameters defined!"; false};
if ((typeName _this) != (typeName "")) exitWith {diag_log "Log: [addClass] class must be a String!"; false};

private ["_className", "_class", "_return"];
_className = _this;
_class = missionConfigFile >> "CfgOO" >> _className;
_return = true;

if ((configName _class) == "") exitWith {diag_log "Log: [addClass] class " + _this + " does not exist in CfgOO!"; false};

//TODO: Check the class was not already loaded!

private ["_methods"];
_methods = _class >> "Methods";

if ((configName _methods) != "") then 
{
	//Precompile all methods
	for "_i" from 0 to ((count _methods) - 1) do 
	{
		private ["_method", "_methodName", "_methodVar", "_methodScript"];
		_method = _methods select _i;
		
		_methodName = configName _method;
		if ((typeName _methodName) != (typeName "")) exitWith {diag_log "Log: [addClass] method name should be a String!"; _return = false};
		if (_methodName == "") exitWith {diag_log "Log: [addClass] method name cannot be empty!"; _return = false};
		
		_methodVar = "BIS_OO_" + _className + "_" + _methodName;
		
		_methodScript = getText (_method >> "script");
		if ((typeName _methodScript) != (typeName "")) exitWith {diag_log "Log: [addClass] method script should be a String!"; _return = false};
		if (_methodScript == "") exitWith {diag_log "Log: [addClass] method script cannot be empty!"; _return = false};

		//Find the correct default return value
		//Cannot use str here, because it doesn't always generate the desired result
		private ["_returnValue"];
		switch (getText (_method >> "returnType")) do 
		{
			case "SCALAR": {_returnValue = "-1"};
			case "STRING": {_returnValue = """"""};
			case "BOOL": {_returnValue = "false"};
			case "ARRAY": {_returnValue = "[]"};
			case "OBJECT": {_returnValue = "objNull"};
			case "CONFIG": {_returnValue = "configFile"};
			case "GROUP": {_returnValue = "grpNull"};
			case "TASK": {_returnValue = "taskNull"};
			case "SIDE": {_returnValue = "sideLogic"};
			default {_returnValue = "false"}; //Default in case no return type (void) is defined / safer than nil for now
		};
		
		//Automatically call parameter validation whenever a method is called
		private ["_compileString"];
		_compileString = _methodVar + " = compile ('";
		_compileString = _compileString + "if (!([""" + _className + """, """ + _methodName + """, _this] call BIS_OO_validateParameters)) exitWith {" + _returnValue + "}; ";
		_compileString = _compileString + (preprocessFileLineNumbers _methodScript);
		_compileString = _compileString + "')";
		
		call (compile _compileString);
	};
};

//Precompile the parameter validation function
if (isNil "BIS_OO_validateParameters") then 
{
	BIS_OO_createObject = compile (preprocessFileLineNumbers "oo\scripts\createObject.sqf");
	BIS_OO_validateParameters = compile (preprocessFileLineNumbers "oo\scripts\validateParameters.sqf");
};

diag_log ("Log: [addClass] loaded class: " + _className);
_return