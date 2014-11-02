#include "definitions.sqf"

class TEST_DIALOG {
	idd = TEST_DIALOG_IDD;
	movingEnable = false;
	enableSimulation = false;
	onLoad = "";

	__EXEC( _xLayer = 0.2;  _yLayer = 0.25 )
	__EXEC( _wLayer = 0.8; _hLayer = 0.35 )

	class controlsBackground {
		class Mainbackgrnd : HW_RscPicture {
			moving = false;
			idc = TEST_DIALOG_BCKGRND;
			x = _xLayer; y = _yLayer;
			w = _wLayer; h = _hLayer;
			colorBackground[] = { 0.8, 0.83, 0.85, 0.5 };
			shadow = 2;
			text = "\ca\ui\data\ui_background_controlers_ca.paa";
		};
		class QuestionField : HW_RscText {
			idc = TEST_DIALOG_QUESTION;
			x = (_xLayer + 0.05); y = (_yLayer + 0.05);
			w = (_wLayer - 0.3); h = (_hLayer - 0.15);
			sizeEx = 0.05;
			style = ST_LEFT;
			/*colorBackground[] = { 0.8, 0.83, 0.85, 1 };*/
			text = $STR_titles_question;
		};
	};

	class controls {
		class CancelButton: HW_RscGUIShortcutButton {
			x = (_xLayer + 0.25); y = (_yLayer + _hLayer - 0.05);
			w = 0.150; h = 0.055;
			text = $STR_gui_cansel;
			onButtonClick = "[] execVM 'GUI\cancel.sqf'";
		};
		class ConfirmButton: CancelButton {
			x = (_xLayer + 0.4);
			text = $STR_gui_confirm;
			onButtonClick = "closeDialog 1";
		};
	};
};