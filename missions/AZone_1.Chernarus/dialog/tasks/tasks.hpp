#include "definitions.sqf"
class TASKS {
	idd = TASKS_DIALOG;
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
			idc = TASKS_BCKGRND;
			x = 0.05; y = 0.101;
			w = 1.1; h = 1;
			colorBackground[] = { 0.8, 0.83, 0.85, 0.5 };
			shadow = 2;
			text = "\ca\ui\data\ui_background_controlers_ca.paa";
		};
		class RecruitUnitsTitle_B : HW_RscText {
		   	idc = TASKS_TITLE_TASK;
			x = 0; y =  0.15;
			w = __EVAL(50 * _xSpacing);
			h = __EVAL(3 * _ySpacing);
			colorText[] = Color_Black;
			colorBackground[] = { 0, 0, 0, 0 };
			sizeEx = 0.04;
			text = $STR_action_task;
		};
		class RecruitUnitsTitle_I : HW_RscText {
		   	idc = TASKS_TITLE_TASKD;
			x = 0.43; y =  0.15;
			w = __EVAL(50 * _xSpacing);
			h = __EVAL(3 * _ySpacing);
			colorText[] = Color_Black;
			colorBackground[] = { 0, 0, 0, 0 };
			sizeEx = 0.04;
			text = $STR_gui_taskD;
		};

	};

	class controls {
		class Unitlist_tasks_list: HW_RscGUIListBox {
			idc = TASKS_LIST;
			default = 1;
			x = 0.101; y = 0.21;
			w = 0.3; h = 0.6;
			//lineSpacing = 0;
			colorSelect[] = {0, 0, 0, 0.9};
			colorSelect2[] = {0, 0, 0, 0.9};
			colorSelectBackground[] = {1, 1, 1, 0.3};
			colorSelectBackground2[] = {1, 1, 1, 0.9};
			onLBSelChanged = "[_this] execVM 'dialog\tasks\select.sqf'";
			onLBDblClick = "[_this] execVM 'dialog\tasks\change.sqf'";
			rowHeight = 0.025;
			soundSelect[] = {"\ca\ui\data\sound\mouse2", 0.09, 1};
			maxHistoryDelay = 10;
			canDrag = 0;
			xcolumn1 = "0.1f";
			xcolumn2 = "0.25f";
			xcolumn3 = "0.85f";
			colorScrollbar = "{0,0,0,1}";	
		};
		class Unitlist_tasks_list1: HW_RscGUIListBox {
			idc = TASKS_LISTCURRENT;
			default = 1;
			x = 0.101; y = 0.21;
			w = 0.3; h = 0.6;
			//lineSpacing = 0;
			colorSelect[] = {0, 0, 0, 0.9};
			colorSelect2[] = {0, 0, 0, 0.9};
			colorSelectBackground[] = {1, 1, 1, 0.3};
			colorSelectBackground2[] = {1, 1, 1, 0.9};
			onLBSelChanged = "[_this] execVM 'dialog\tasks\select.sqf'";
			onLBDblClick = "[_this] execVM 'dialog\tasks\cancel.sqf'";
			rowHeight = 0.025;
			soundSelect[] = {"\ca\ui\data\sound\mouse2", 0.09, 1};
			maxHistoryDelay = 10;
			canDrag = 0;
			xcolumn1 = "0.1f";
			xcolumn2 = "0.25f";
			xcolumn3 = "0.85f";
			colorScrollbar = "{0,0,0,1}";	
		};
		class Unitlist_tasks_text : HW_RscStructuredText {
		   	idc = TASKS_DESC;
			x = 0.501; y = 0.21;
			w = 0.3; h = 0.6;
			colorBackground[] = { 0, 0, 0, 0 };
			class Attributes {
				color = "#111111";
				font = FontM;
				align = "left";
				valign = "middle";
				shadow = true;
				shadowColor = "#000000";
				size = "2.25";
			};
			size = 0.015;
			text = "";
		};
		class EmployerInsetButton: HW_RscGUIShortcutButton {
			idc = TASKS_BUTTON_WORK;
			x = 0.101; y = 1;
			w = 0.150; h = 0.05;
			text = $STR_gui_workLayer;
			onButtonClick = "[_this] execVM 'dialog\tasks\changeLayer.sqf'";
		};
		class ActualInsetButton: HW_RscGUIShortcutButton {
			idc = TASKS_BUTTON_CURRENT;
			x = 0.251; y = 1;
			w = 0.150; h = 0.05;
			text = $STR_gui_curworkLayer;
			onButtonClick = "[_this] execVM 'dialog\tasks\changeLayer.sqf'";
		};
		class CloseButton: HW_RscGUIShortcutButton {
			x = 0.68; y = 1;
			w = 0.150; h = 0.05;
			text = $STR_gui_cansel;
			onButtonClick = "CloseDialog 0;";
		};
	};
};