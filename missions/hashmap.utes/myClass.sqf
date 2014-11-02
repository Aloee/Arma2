#include "oop.h"

CLASS_EXTENDS("MYCLASS", "OO_HASHMAP")
		PRIVATE VARIABLE("array", "arr");
		PUBLIC VARIABLE("string", "var1");

		PUBLIC FUNCTION("array","constructor") {
			private ["_array"];
			_array = [];
			MEMBER("index", _array);
			MEMBER("map", _array);
			MEMBER("var1", "text1");
		};
		
		PROTECTED FUNCTION("array", "privateCheck") {
			hint str "privateCheck";
		};
		
		PUBLIC FUNCTION("array", "check") {
			MEMBER("privateCheck", []);
		};
ENDCLASS;

CLASS_EXTENDS("MYCLASSCHILD1", "MYCLASS")
		PUBLIC VARIABLE("string", "var");
		
		PUBLIC FUNCTION("array","constructor") {
			MEMBER("var", "text");
		};
		PUBLIC FUNCTION("array", "check") {
			MEMBER("var", nil)
			//hint "ok";
		};
ENDCLASS;

CLASS_EXTENDS("MYCLASSCHILD2", "MYCLASSCHILD1")

		PUBLIC FUNCTION("array", "check") {
			//MEMBER("var", nil)
			MEMBER("var1", nil)
			//hint "ok";
		};
ENDCLASS;