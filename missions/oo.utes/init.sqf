//Precompiles all methods into global variables
//Naming convention: BIS_OO_<Class>_<method>
//Here: BIS_OO_MyClass_MyClass and BIS_OO_MyClass_myMethod
_bool = "MyClass" call (compile (preprocessFileLineNumbers "oo\scripts\addClass.sqf"));

//Creates a Logic with all attributes initialized
//Invokes the constructor
private ["_myClassObject"];
_myClassObject = ["MyClass"] call BIS_OO_createObject;

//Invoking a method and getting an attribute
private ["_return", "_value"];
_return = [player, 1, "Hello"] call BIS_OO_MyClass_myMethod;
_value = _myClassObject getVariable "myAttribute";
hint str _return;