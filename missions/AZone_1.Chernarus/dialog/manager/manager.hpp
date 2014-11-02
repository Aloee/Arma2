#include "definitions.sqf"
class MANAGER {
	idd = MANAGER_DIALOG;
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
			idc = MANAGER_BCKGRND;
			x = 0.05; y = 0.101;
			w = 1.1; h = 1;
			colorBackground[] = { 0.8, 0.83, 0.85, 0.5 };
			shadow = 2;
			text = "\ca\ui\data\ui_background_controlers_ca.paa";
		};
		class RecruitUnitsTitle_I : HW_RscText {
		   	idc = MANAGER_TITLE_P;
			x = 0.43; y =  0.15;
			w = __EVAL(50 * _xSpacing);
			h = __EVAL(3 * _ySpacing);
			colorText[] = Color_Black;
			colorBackground[] = { 0, 0, 0, 0 };
			sizeEx = 0.04;
			text = $STR_gui_titleinv;
		};

	};

	class controls {
		class UseButton: HW_RscGUIShortcutButton {
			x = 0.101; y = 0.23;
			w = 0.210; h = 0.06;
			text = $STR_gui_use;
			onButtonClick = "[_this] execVM 'dialog\manager\use_item.sqf'";
		};
		class DropButton: HW_RscGUIShortcutButton {
			x = 0.101; y = 0.29;
			w = 0.210; h = 0.06;
			text = $STR_gui_drop;
			onButtonClick = "[_this] execVM 'dialog\manager\drop_item.sqf'";
		};
		class GiveButton: HW_RscGUIShortcutButton {
			x = 0.101; y = 0.45;
			w = 0.210; h = 0.06;
			text = $STR_gui_give;
			onButtonClick = "[_this] execVM 'dialog\manager\give_item.sqf'";
		};
		class GiveCount: InputField {
			idc = MANAGER_GCNT;
			x = 0.101; y = 0.52;
			w = 0.210; h = 0.04;
			text = "";
		};
		class UsersList: HW_RscComboBox{
			idc = MANAGER_PLIST;
			x = 0.101; y = 0.57;
			w = 0.210; h = 0.04;
		};
		
		class Unitlist_pl_w: HW_RscGUIListBox {
			idc = MANAGER_P_I;
			default = 1;
			x = 0.501; y = 0.23;
			w = 0.3; h = 0.65;
			//lineSpacing = 0;
			colorSelect[] = {0, 0, 0, 0.9};
			colorSelect2[] = {0, 0, 0, 0.9};
			colorSelectBackground[] = {1, 1, 1, 0.3};
			colorSelectBackground2[] = {1, 1, 1, 0.9};
			onLBSelChanged = "[_this] execVM 'dialog\manager\select_item.sqf'";
			onLBDblClick = "";
			rowHeight = 0.025;
			soundSelect[] = {"\ca\ui\data\sound\mouse2", 0.09, 1};
			maxHistoryDelay = 10;
			canDrag = 0;
			xcolumn1 = "0.1f";
			xcolumn2 = "0.25f";
			xcolumn3 = "0.85f";		
		};
		class CloseButton: HW_RscGUIShortcutButton {
			x = 0.68; y = 1;
			w = 0.150; h = 0.05;
			text = $STR_gui_cansel;
			onButtonClick = "CloseDialog 0;";
		};
	};
};