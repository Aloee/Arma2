#include "\oop_framework\oop.h"

CLASS("MYCLASS")
	PRIVATE VARIABLE("array", "arr");
	PROTECTED VARIABLE("string", "var1");

	PUBLIC FUNCTION("array","constructor") {
		MEMBER("var1", "text1");
	};
	
	PROTECTED FUNCTION("array", "privatecheck") {
		hint str (MEMBER("var1", nil));
	};
	
	PUBLIC FUNCTION("array", "check") {
		MEMBER("privatecheck", []);
	};
	
ENDCLASS;

CLASS_EXTENDS("MYCLASSCHILD1", "MYCLASS")
	PUBLIC VARIABLE("string", "var");
	PRIVATE STATIC_VARIABLE("string", "sVar");
	
	PUBLIC FUNCTION("array","constructor") {
		MEMBER("var", "text");
		MEMBER("sVar", "static text");
	};
	PUBLIC FUNCTION("array", "check") {
		MEMBER("sVar", nil)
	};
ENDCLASS;

CLASS_EXTENDS("MYCLASSCHILD2", "MYCLASSCHILD1")
	PUBLIC VARIABLE("string", "var");
	
	PUBLIC FUNCTION("array","constructor") {
		MEMBER("var", "text 2");
		MEMBER("var1", "text 3");
	};
	
	PUBLIC FUNCTION("array", "check") {
		MEMBER("privatecheck", []);
		//hint (MEMBER("var1", nil));
	};
ENDCLASS;

