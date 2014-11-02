#define DEFAULTFONT		"Bitstream"

#define GUITEXT			0
#define GUIBUTTON		1
#define GUIEDITABLETEXT		2
#define GUISLIDER		3
#define GUICOMBO		4
#define GUILIST			5
#define GUICHECKBOX		7
#define GUICLICKABLETEXT	11
#define GUIMENU			14
#define GUIMAP			101



class GUIText
{
	type = GUITEXT;
	idc = IDCUNDEFINED;
	style = GUILEFT;
	colorText[]={0.66,1.0,0.66,1};
	colorBackground[] = {0,0,0,0};
	font = Zeppelin32;
	sizeEx = 0.025;
	w = 0.275;
	h = 0.04;
	text = "";
};

class GUIMidText:GUIText
{
	sizeEx = 0.020;
	w = 0.5;
	h = 0.018;
};

class RscTitles
{
	class HUD
	{
		duration = 15000;
		name = "HudDisplay";
		idd = 500;
		onLoad = " FFA_GUI=_this execVM ""GUI\update_hud.sqf"" ";
		movingEnable = true;
		controlsBackground[]={Player01,Player02,Player03,Player04,Player05,Player06,Player07,Player08,Player09,Player10,Player11,Player12,Player13,Player14,Player15,Player16,Player17,Player18,Player19,Player20,Player21,Player22,Player23,Player24,Player25,Player26,Player27,Player28,Player29,Player30,AirStrike};
		controls[]={};
		objects[]={};
		class PlayerNameDisp:RscStructuredText
		{
			x = 0.5;
			y = 0.5;
			w = 0.25;
			h = 0.2;
			colorText[]={1,1,1,0.5};
			colorBackground[]={0,0,0,0};
		};
		class Player01:PlayerNameDisp {idc=501;};
		class Player02:PlayerNameDisp {idc=502;};
		class Player03:PlayerNameDisp {idc=503;};
		class Player04:PlayerNameDisp {idc=504;};
		class Player05:PlayerNameDisp {idc=505;};
		class Player06:PlayerNameDisp {idc=506;};
		class Player07:PlayerNameDisp {idc=507;};
		class Player08:PlayerNameDisp {idc=508;};
		class Player09:PlayerNameDisp {idc=509;};
		class Player10:PlayerNameDisp {idc=510;};
		class Player11:PlayerNameDisp {idc=511;};
		class Player12:PlayerNameDisp {idc=512;};
		class Player13:PlayerNameDisp {idc=513;};
		class Player14:PlayerNameDisp {idc=514;};
		class Player15:PlayerNameDisp {idc=515;};
		class Player16:PlayerNameDisp {idc=516;};
		class Player17:PlayerNameDisp {idc=517;};
		class Player18:PlayerNameDisp {idc=518;};
		class Player19:PlayerNameDisp {idc=519;};
		class Player20:PlayerNameDisp {idc=520;};
		class Player21:PlayerNameDisp {idc=521;};
		class Player22:PlayerNameDisp {idc=522;};
		class Player23:PlayerNameDisp {idc=523;};
		class Player24:PlayerNameDisp {idc=524;};
		class Player25:PlayerNameDisp {idc=525;};
		class Player26:PlayerNameDisp {idc=526;};
		class Player27:PlayerNameDisp {idc=527;};
		class Player28:PlayerNameDisp {idc=528;};
		class Player29:PlayerNameDisp {idc=529;};
		class Player30:PlayerNameDisp {idc=530;};
		class AirStrike:PlayerNameDisp {idc=531;};
	};
	class BackBlack
	{
		idd=-1;
		movingEnable=0;
		duration=32;
		onLoad="";
		//onLoad="[] spawn compile 'sleep 20.0; titleCut['' '',''black in'',4.0]'";
		name="overlay";
		fadein=0;
		fadeout=0;
		controls[]={"background","Contents"};
		class background
		{
			idc=-1;
			type=0;
			style=ST_PICTURE;
			colorBackground[]={0,0,0,1};
			colorText[]={1,1,1,1};
			font="Zeppelin32";
			sizeEx=0;
			lineSpacing=0;
			access=ReadAndWrite;
			text="#(argb,8,8,3)color(0,0,0,1)";
			x=-1;
			y=-1;
			w=3;
			h=3;
		};
		class Contents:RscText
		{
			idc=1661;
			duration=8;
			font="Zeppelin32";
			style=ST_RIGHT;
			colorText[]={1,1,1,1};
			sizeex=0.04;
			x=SafeZoneW+safeZoneX-0.15;//0.025
			y=SafeZoneH+SafeZoneY-0.05;//0.094
			w=0.95;
			h=0.04;
			text=$STR_DLG_Loading;
		};
	};
};