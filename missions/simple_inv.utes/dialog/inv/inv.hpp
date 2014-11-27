/*
	Author: aloe itfruit@mail.ru
	Copyright (C) 2014 Aloe
	Title: Misc Simple Inventory
	Version: 0.3
	Script: inv.hpp
	
	
	This program is free software: you can redistribute it and/or modify
	it under the terms of the GNU General Public License as published by
	the Free Software Foundation, either version 3 of the License, or
	(at your option) any later version.
	
	This program is distributed in the hope that it will be useful,
	but WITHOUT ANY WARRANTY; without even the implied warranty of
	MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
	GNU General Public License for more details.
	
	You should have received a copy of the GNU General Public License
	along with this program.  If not, see <http://www.gnu.org/licenses/>. 
*/

#include "definitions.sqf"

class INVENTORY {
	idd = INV_DIALOG;
	movingEnable = true;
	enableSimulation = true;
	onLoad = "";

	__EXEC( _xSpacing = 0.0075;  _ySpacing = 0.01;)

	class controlsBackground {
		class Mainbackgrnd_A {
			idc = INV_BCKGRND_A;
			moving = true;
			type = CT_STATIC; 
			style = ST_LEFT;
			colorText[] = { 0, 0, 0, 1 };
			font = FontM;
			sizeEx = 0.023;
			x = 0.05; y = 0.101;
			w = 0.5; h = 1;
			colorBackground[] = { 0, 0, 0, 0.6 };
			text = "";
		};
		class Mainbackgrnd_B : Mainbackgrnd_A {
			idc = INV_BCKGRND_B;
			x = 0.55; y = 0.101;
			w = 0.6; h = 1;
		};
		class MainbackgrndTitle_A {
		   	idc = INV_TITLE_A;
			type = CT_STATIC;
			style = ST_CENTER;
			font = FontM;
			x = 0; y =  0.15;
			w = __EVAL(60 * _xSpacing);
			h = __EVAL(3 * _ySpacing);
			colorText[] = Color_White;
			colorBackground[] = { 0, 0, 0, 0 };
			sizeEx = 0.04;
			text = $STR_gui_inv_titleinv;
		};
		class MainbackgrndTitle_B : MainbackgrndTitle_A {
		   	idc = INV_TITLE_B;
			x = 0.58; y =  0.15;
			w = __EVAL(60 * _xSpacing);
			h = __EVAL(3 * _ySpacing);
			colorText[] = Color_White;
			colorBackground[] = { 0, 0, 0, 0.8 };
			text = "";
		};
	};

	class controls {
		class InventoryList {		
			idc = INV_LIST_A;
			default = 1;
			x = 0.101; y = 0.21;
			w = 0.44; h = 0.7;
			type = 5;
			style = 0 + 0x10;
			font = "Zeppelin32";
			sizeEx = 0.03921;
			period = 1;
			colorBackground[] = {0, 0, 0, 1};
			autoScrollSpeed = -1;
			autoScrollDelay = 5;
			autoScrollRewind = 0;
			color[] = {1, 1, 1, 1};
			colorText[] = {0.5, 0.5, 0.5, 0.75};
			colorSelect[] = {1, 1, 1, 0.9};
			colorSelect2[] = {0.8, 0.8, 0.8, 0.9};
			colorSelectBackground[] = {0.8, 0.8, 0.8, 0};
			colorSelectBackground2[] = {1, 1, 1, 0};
			onLBSelChanged = "_this call inv_fx_changeItem";
			onLBDblClick = "_this call inv_fx_useItem";
			rowHeight = 0.005;
			soundSelect[] = {"\ca\ui\data\sound\mouse2", 0.09, 1};
			maxHistoryDelay = 10;
			canDrag = 0;
			xcolumn1 = "0.1f";
			xcolumn2 = "0.25f";
			xcolumn3 = "0.85f";
			colorScrollbar[] = {0.95, 0.95, 0.95, 1};
			class ScrollBar {
				color[] = {0.3, 0.3, 0.3, 1};
				colorActive[] = {0, 0, 0, 1};
				colorDisabled[] = {0, 0, 0, 1};
				thumb = "\ca\ui\data\igui_scrollbar_thumb_ca.paa";
				arrowFull = "\ca\ui\data\igui_arrow_top_active_ca.paa";
				arrowEmpty = "\ca\ui\data\igui_arrow_top_ca.paa";
				border = "\ca\ui\data\igui_border_scroll_ca.paa";
			};			
		};
		class InventoryDesc {
			idc = INV_LIST_DESC;
			type = CT_STRUCTURED_TEXT;
			style = ST_LEFT;
			x = 0.58; y = 0.21;
			w = 0.5; h = 0.8;
			text = "";
			size = 0.018;
			sizeEx = 0.023;
			colorBackground[] = { 0, 0, 0, 0 };
			class Attributes {
				font = FontI;
				color = "#CCCCCC";
				size = "1.9";
				align = "left";
				valign = "middle";
				shadow = true;
				shadowColor = "#000000";
			};
		};
		class InventoryDescButtonDrop {
			idc = INV_LIST_DESCB2;
			colorText[] = { 0, 0, 0, 1 };
			colorFocused[] = { 0.2, 0.3,  0.3, 1 }; // border color for focused state
			colorDisabled[] = { 1, 0, 0, 0.7 }; // text color for disabled state
			colorBackground[] = { 0.8, 0.8, 0.8, 0.8 };
			colorBackgroundDisabled[] = { 1, 1, 1, 0.5 }; // background color for disabled state
			colorBackgroundActive[] = { 0.9, 0.9, 0.9, 1 }; // background color for active state
			offsetX = 0.003;
			offsetY = 0.003;
			offsetPressedX = 0.002;
			offsetPressedY = 0.002;
			colorShadow[] = { 0, 0, 0, 0.5 };
			colorBorder[] = { 0, 0, 0, 1 };
			borderSize = 0;
			soundEnter[] = { "", 0, 1 }; // no sound
			soundPush[] = { "", 0.1, 1 };
			soundClick[] = { "", 0, 1 }; // no sound
			soundEscape[] = { "", 0, 1 }; // no sound		
			type = CT_BUTTON;
			style = ST_CENTER;
			default = false;
			font = FontM;
			x = 0.7; y = 1;
			w = 0.1; h = 0.03;
			sizeEx = 0.020;
			text = "$STR_gui_inv_buttonDrop";
			onButtonClick = "false call inv_fx_dropItem";
			action = "";
		};
		class STR_gui_buttonDropAll: InventoryDescButtonDrop {
			idc = INV_LIST_DESCB3;
			x = 0.81;
			sizeEx = 0.020;
			text = "$STR_gui_inv_buttonDropAll";
			onButtonClick = "true call inv_fx_dropItem";
		};
	};
};