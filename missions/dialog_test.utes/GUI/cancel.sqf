if(local player)then{
	#include "definitions.sqf";
	disableSerialization;

	_display = findDisplay TEST_DIALOG_IDD;
	ctrlSetText [TEST_DIALOG_QUESTION, localize "STR_titles_response"];
};
