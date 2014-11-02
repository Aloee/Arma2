#include "definitions.sqf"
class INVENTORY {
	idd = INV_DIALOG;
	movingEnable = true;
	enableSimulation = true;
	onLoad = "";

	__EXEC( _xSpacing = 0.0075;  _ySpacing = 0.01;)
	__EXEC( _xInit = 12 * _xSpacing; _yInit = 18 * _ySpacing;)
	__EXEC( _windowWidth = 101; _windowHeight = 64;)
	__EXEC( _windowBorder = 1;)

	class controlsBackground {
		class Mainbackgrnd : HW_RscPicture {
			moving = true;
			idc = INV_BCKGRND;
			x = 0.05; y = 0.101;
			w = 0.5; h = 1;
			colorBackground[] = { 0.8, 0.8, 0.8, 0.8};
			shadow = 2;
			text = "\ca\ui\data\ui_background_controlers_ca.paa";
		};
		class RecruitUnitsTitle_B : HW_RscText {
		   	idc = INV_TITLE_W;
			x = 0; y =  0.15;
			w = __EVAL(50 * _xSpacing);
			h = __EVAL(3 * _ySpacing);
			colorText[] = Color_Black;
			colorBackground[] = { 0, 0, 0, 0 };
			sizeEx = 0.04;
			text = $STR_gui_titleinv;
		};

	};

	class controls {
		class Unitlist_box_w: HW_RscGUIListBox {
			idc = INV_B_C;
			default = 1;
			x = 0.101; y = 0.21;
			w = 0.3; h = 0.7;
			//lineSpacing = 0;
			colorSelect[] = {0, 0, 0, 0.9};
			colorSelect2[] = {0, 0, 0, 0.9};
			colorSelectBackground[] = {0.8, 0.8, 0.8, 0};
			colorSelectBackground2[] = {1, 1, 1, 0};
			onLBSelChanged = "";
			onLBDblClick = "";
			rowHeight = 0.005;
			soundSelect[] = {"\ca\ui\data\sound\mouse2", 0.09, 1};
			maxHistoryDelay = 10;
			canDrag = 0;
			xcolumn1 = "0.1f";
			xcolumn2 = "0.25f";
			xcolumn3 = "0.85f";
			colorScrollbar = "{0,0,0,1}";	
		};
		class CloseButton: HW_RscGUIShortcutButton {
			x = 0.25; y = 1;
			w = 0.150; h = 0.05;
			text = $STR_gui_cansel;
			onButtonClick = "closeDialog 1";
		};
	};
};