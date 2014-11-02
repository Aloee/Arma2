#include "definitions.sqf"
class WMODIFER {
	idd = WM_DIALOG;
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
			idc = WM_BCKGRND;
			x = 0.5; y = 0.101;
			w = 0.6; h = 1;
			colorBackground[] = { 0.8, 0.83, 0.85, 0.5 };
			shadow = 2;
			text = "\ca\ui\data\ui_background_controlers_ca.paa";
		};
		class RecruitUnitsTitle_B : HW_RscText {
		   	idc = WM_TITLE_S;
			x = 0.53; y =  0.15;
			w = __EVAL(50 * _xSpacing);
			h = __EVAL(3 * _ySpacing);
			colorText[] = Color_Black;
			colorBackground[] = { 0, 0, 0, 0 };
			sizeEx = 0.04;
			text = $STR_gui_titlewd;
		};
		class RecruitUnitsTitle_ADD : HW_RscText {
		   	idc = WM_TITLE_ADD;
			x = 0.49; y = 0.32;
			w = 0.3; h = 0.3;
			colorText[] = Color_Black;
			colorBackground[] = { 0, 0, 0, 0 };
			sizeEx = 0.04;
			text = $STR_gui_titlewma;
		};
		class RecruitUnitsTitle_REM : HW_RscText {
		   	idc = WM_TITLE_REM;
			x = 0.5; y = 0.57;
			w = 0.3; h = 0.3;
			colorText[] = Color_Black;
			colorBackground[] = { 0, 0, 0, 0 };
			sizeEx = 0.04;
			text = $STR_gui_titlewmd;
		};
	};

	class controls {
		class Unitlist_weaponPic : HW_RscGUIListBox {
			idc = WM_PIC; 
			default = 1;
			x = 0.55; y = 0.2;
			w = 0.3; h = 0.3;
			//lineSpacing = 0;
			colorSelect[] = {0, 0, 0, 0.9};
			colorSelect2[] = {0, 0, 0, 0.9};
			colorSelectBackground[] = { 0.8, 0.83, 0.85, 0};
			colorSelectBackground2[] = { 0.8, 0.83, 0.85, 0};
			onLBSelChanged = "";
			onLBDblClick = "";
			rowHeight = 0.2;
			soundSelect[] = {"\ca\ui\data\sound\mouse2", 0.09, 1};
			maxHistoryDelay = 10;
			canDrag = 0;
			xcolumn1 = "0.1f";
			xcolumn2 = "0.25f";
			xcolumn3 = "0.85f";
			colorScrollbar = "{0,0,0,1}";	
		};
		class Unitlist_weapon_add : HW_RscGUIListBox {
			idc = WM_ADD;
			default = 1;
			x = 0.55; y = 0.5;
			w = 0.35; h = 0.15;
			//lineSpacing = 0;
			colorSelect[] = {0, 0, 0, 0.9};
			colorSelect2[] = {0, 0, 0, 0.9};
			colorSelectBackground[] = {1, 1, 1, 0.3};
			colorSelectBackground2[] = {1, 1, 1, 0.9};
			onLBSelChanged = "";
			onLBDblClick = "[_this] execVM 'dialog\wmodifer\mount.sqf'";
			rowHeight = 0.025;
			soundSelect[] = {"\ca\ui\data\sound\mouse2", 0.09, 1};
			maxHistoryDelay = 10;
			canDrag = 0;
			xcolumn1 = "0.1f";
			xcolumn2 = "0.25f";
			xcolumn3 = "0.85f";
			colorScrollbar = "{0,0,0,1}";	
		};
		class Unitlist_weapon_remove: HW_RscGUIListBox {
			idc = WM_REM;
			default = 1;
			x = 0.55; y = 0.75;
			w = 0.35; h = 0.15;
			//lineSpacing = 0;
			colorSelect[] = {0, 0, 0, 0.9};
			colorSelect2[] = {0, 0, 0, 0.9};
			colorSelectBackground[] = {1, 1, 1, 0.3};
			colorSelectBackground2[] = {1, 1, 1, 0.9};
			onLBSelChanged = "";
			onLBDblClick = "[_this] execVM 'dialog\wmodifer\dismantle.sqf'";
			rowHeight = 0.025;
			soundSelect[] = {"\ca\ui\data\sound\mouse2", 0.09, 1};
			maxHistoryDelay = 10;
			canDrag = 0;
			xcolumn1 = "0.1f";
			xcolumn2 = "0.25f";
			xcolumn3 = "0.85f";		
		};
		class CloseButton: HW_RscGUIShortcutButton {
			x = 0.75; y = 1;
			w = 0.150; h = 0.05;
			text = $STR_gui_cansel;
			onButtonClick = "CloseDialog 0;";
		};
	};
};