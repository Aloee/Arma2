#include "definitions.sqf"

class FZ_CONFIRM_DIALOG {
	idd = FZ_CONFIRM_LOC;
	movingEnable = false;
	enableSimulation = false;
	onLoad = "";

	__EXEC( _xSpacing = 0.0075;  _ySpacing = 0.01;)
	__EXEC( _xInit = 12 * _xSpacing; _yInit = 18 * _ySpacing;)
	__EXEC( _windowWidth = 101; _windowHeight = 64;)
	__EXEC( _windowBorder = 1;)

	class controlsBackground {
		class Mainbackgrnd : HW_RscPicture {
			moving = false;
			idc = FZ_CONFIRM_BCKGRND;
			x = 0.25; y = 0.25;
			w = 0.8; h = 0.3;
			colorBackground[] = { 0.8, 0.83, 0.85, 0.5 };
			shadow = 2;
			text = "\ca\ui\data\ui_background_controlers_ca.paa";
		};
		class ConfirmQuestion_S : HW_RscText {
			x = 0.3; y =  0.4;
			w = __EVAL(60 * _xSpacing);
			h = __EVAL(3 * _ySpacing);
			colorText[] = Color_Black;
			colorBackground[] = { 0, 0, 0, 0 };
			sizeEx = 0.04;
			text = $STR_gui_question_s;
		};
		class ConfirmQuestion_D : HW_RscText {
		   	idc = FZ_CONFIRM_TITLE_P;
			x = 0.2; y =  0.35;
			w = __EVAL(50 * _xSpacing);
			h = __EVAL(3 * _ySpacing);
			colorText[] = Color_Black;
			colorBackground[] = { 0, 0, 0, 0 };
			sizeEx = 0.04;
			text = "Такая-то локация";
		};
		class ConfirmParams : HW_RscText {
		   	idc = FZ_CONFIRM_TITLE_H;
			text = "";
		};
	};

	class controls {
		class ConfirmButton: HW_RscGUIShortcutButton {
			x = 0.68; y = 0.5;
			w = 0.150; h = 0.055;
			text = $STR_gui_confirm;
			onButtonClick = "[] execVM 'dialog\ConfirmLocation\confirm.sqf'";
		};
	};
};