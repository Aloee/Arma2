scriptName "fn_playVideo.sqf";
/*
	Author: Karel Moricky

	Description:
	Plays in-game video.

	Parameter(s):
	_this select 0: STRING - Video path
	_this select 1 (Optional): ARRAY - Size
	_this select 2 (Optional): ARRAY - Color

	Returns:
	True
*/

#define VIDEO_DISPLAY	(uinamespace getvariable "BIS_RscMissionScreen_video")
#define VIDEO_CONTENT	(VIDEO_DISPLAY displayctrl 1100)

_content = _this select 0;
_size = if (count _this > 1) then {_this select 1} else {[]};
_color = if (count _this > 2) then {_this select 2} else {[]};

//--- Create display
25 cutrsc ["RscMissionScreen","plain"];
waituntil {!isnull (uinamespace getvariable "BIS_RscMissionScreen")};
uinamespace setvariable ["BIS_RscMissionScreen_video",uinamespace getvariable "BIS_RscMissionScreen"];

//--- Default size (full screen)
if (count _size == 0) then {
	_ratio = 16/9;
	_x = safezoneX;
	_w = safezoneW;
	_h = (safezoneW / _ratio) * (4/3);
	_y = safezoneY + (safezoneH - _h)/2;
	_size = [
		_x,
		_y,
		_w,
		_h
	];
};
player hintC (str _size);
//--- Default color
if (count _color == 0) then {_color = [1,1,1,1];};
bis_fnc_playvideo_videoStopped = false;

VIDEO_CONTENT ctrladdeventhandler ["videoStopped","bis_fnc_playvideo_videoStopped = true;"];
VIDEO_CONTENT ctrlsettextcolor _color;
VIDEO_CONTENT ctrlsetposition _size;
VIDEO_CONTENT ctrlsettext _content;
VIDEO_CONTENT ctrlcommit 0;

waituntil {bis_fnc_playvideo_videoStopped};
bis_fnc_playvideo_videoStopped = nil;
25 cuttext ["","plain"];