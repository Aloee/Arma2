#include "definitions.sqf"
class WDEALER {
	idd = WD_DIALOG;
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
			idc = WD_BCKGRND;
			x = 0.05; y = 0.101;
			w = 1.1; h = 1;
			colorBackground[] = { 0.8, 0.83, 0.85, 0.5 };
			shadow = 2;
			text = "\ca\ui\data\ui_background_controlers_ca.paa";
		};
		class RecruitUnitsTitle_B : HW_RscText {
		   	idc = WD_TITLE_W;
			x = 0; y =  0.15;
			w = __EVAL(50 * _xSpacing);
			h = __EVAL(3 * _ySpacing);
			colorText[] = Color_Black;
			colorBackground[] = { 0, 0, 0, 0 };
			sizeEx = 0.04;
			text = $STR_gui_titlewd;
		};
		class RecruitUnitsTitle_I : HW_RscText {
		   	idc = WD_TITLE_P;
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
		class Unitlist_box_i: HW_RscGUIListBox {
			idc = WD_B_I;
			default = 1;
			x = 0.101; y = 0.21;
			w = 0.3; h = 0.17;
			//lineSpacing = 0;
			colorSelect[] = {0, 0, 0, 0.9};
			colorSelect2[] = {0, 0, 0, 0.9};
			colorSelectBackground[] = {1, 1, 1, 0.3};
			colorSelectBackground2[] = {1, 1, 1, 0.9};
			onLBSelChanged = "[_this] call fx_updWDialogPriceInfo";
			onLBDblClick = "[_this] execVM 'dialog\wdealer\buy_item.sqf'";
			rowHeight = 0.025;
			soundSelect[] = {"\ca\ui\data\sound\mouse2", 0.09, 1};
			maxHistoryDelay = 10;
			canDrag = 0;
			xcolumn1 = "0.1f";
			xcolumn2 = "0.25f";
			xcolumn3 = "0.85f";
			colorScrollbar = "{0,0,0,1}";
		};
		class Unitlist_box_w: HW_RscGUIListBox {
			idc = WD_B_W;
			default = 1;
			x = 0.101; y = 0.41;
			w = 0.3; h = 0.3;
			//lineSpacing = 0;
			colorSelect[] = {0, 0, 0, 0.9};
			colorSelect2[] = {0, 0, 0, 0.9};
			colorSelectBackground[] = {1, 1, 1, 0.3};
			colorSelectBackground2[] = {1, 1, 1, 0.9};
			onLBSelChanged = "[_this] call fx_updWDialogPriceInfo";
			onLBDblClick = "[_this] execVM 'dialog\wdealer\buy_item.sqf'";
			rowHeight = 0.025;
			soundSelect[] = {"\ca\ui\data\sound\mouse2", 0.09, 1};
			maxHistoryDelay = 10;
			canDrag = 0;
			xcolumn1 = "0.1f";
			xcolumn2 = "0.25f";
			xcolumn3 = "0.85f";
			colorScrollbar = "{0,0,0,1}";	
		};
		class Unitlist_box_m: HW_RscGUIListBox {
			idc = WD_B_M;
			default = 1;
			x = 0.101; y = 0.73;
			w = 0.3; h = 0.2;
			//lineSpacing = 0;
			colorSelect[] = {0, 0, 0, 0.9};
			colorSelect2[] = {0, 0, 0, 0.9};
			colorSelectBackground[] = {1, 1, 1, 0.3};
			colorSelectBackground2[] = {1, 1, 1, 0.9};
			onLBSelChanged = "[_this] call fx_updWDialogPriceInfo";
			onLBDblClick =  "[_this] execVM 'dialog\wdealer\buy_item.sqf'";
			
			rowHeight = 0.025;
			soundSelect[] = {"\ca\ui\data\sound\mouse2", 0.09, 1};
			maxHistoryDelay = 10;
			canDrag = 0;
			xcolumn1 = "0.1f";
			xcolumn2 = "0.25f";
			xcolumn3 = "0.85f";		
		};
		class Unitlist_pl_i: HW_RscGUIListBox {
			idc = WD_P_I;
			default = 1;
			x = 0.501; y = 0.21;
			w = 0.3; h = 0.17;
			//lineSpacing = 0;
			colorSelect[] = {0, 0, 0, 0.9};
			colorSelect2[] = {0, 0, 0, 0.9};
			colorSelectBackground[] = {1, 1, 1, 0.3};
			colorSelectBackground2[] = {1, 1, 1, 0.9};
			onLBSelChanged = "[_this] call fx_updWDialogPriceInfo";
			onLBDblClick = "[_this] execVM 'dialog\wdealer\sell_item.sqf'";
			rowHeight = 0.025;
			soundSelect[] = {"\ca\ui\data\sound\mouse2", 0.09, 1};
			maxHistoryDelay = 10;
			canDrag = 0;
			xcolumn1 = "0.1f";
			xcolumn2 = "0.25f";
			xcolumn3 = "0.85f";		
		};
		class Unitlist_pl_w: HW_RscGUIListBox {
			idc = WD_P_W;
			default = 1;
			x = 0.501; y = 0.41;
			w = 0.3; h = 0.3;
			//lineSpacing = 0;
			colorSelect[] = {0, 0, 0, 0.9};
			colorSelect2[] = {0, 0, 0, 0.9};
			colorSelectBackground[] = {1, 1, 1, 0.3};
			colorSelectBackground2[] = {1, 1, 1, 0.9};
			onLBSelChanged = "[_this] call fx_updWDialogPriceInfo";
			onLBDblClick = "[_this] execVM 'dialog\wdealer\sell_item.sqf'";
			rowHeight = 0.025;
			soundSelect[] = {"\ca\ui\data\sound\mouse2", 0.09, 1};
			maxHistoryDelay = 10;
			canDrag = 0;
			xcolumn1 = "0.1f";
			xcolumn2 = "0.25f";
			xcolumn3 = "0.85f";		
		};
		class Unitlist_pl_m: HW_RscGUIListBox {
			idc = WD_P_M;
			default = 1;
			x = 0.501; y = 0.73;
			w = 0.3; h = 0.2;
			//lineSpacing = 0;
			colorSelect[] = {0, 0, 0, 0.9};
			colorSelect2[] = {0, 0, 0, 0.9};
			colorSelectBackground[] = {1, 1, 1, 0.3};
			colorSelectBackground2[] = {1, 1, 1, 0.9};
			onLBSelChanged = "[_this] call fx_updWDialogPriceInfo";
			onLBDblClick  = "[_this] execVM 'dialog\wdealer\sell_item.sqf'";
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
		class ItemInfo: HW_RscText {
			idc = WD_I_I;
			x = 0.1; y = 1;
			w = 0.450; h = 0.04;
			colorText[] = Color_Black;
			colorBackground[] = { 0, 0, 0, 0 };
			sizeEx = 0.03;
			text = "";
		};
	};
};