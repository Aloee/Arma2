if(!isServer && !isDedicated) exitWith {};

	#include "definitions.sqf";
	#include "lib\dialog\ConfirmLocation\definitions.sqf";

	fz_sfx_reloadLocDialog = {
		_trg = _this select 0;
		_from = _this select 1;
		_to = _this select 2;
			_ok = createDialog "FZ_CONFIRM_DIALOG";
			ctrlSetText [FZ_CONFIRM_TITLE_H1, str _from];
			ctrlSetText [FZ_CONFIRM_TITLE_H2, _to];
			ctrlSetText [FZ_CONFIRM_TITLE_P, localize (triggerText _trg)];

		[] spawn {
			waitUntil{sleep 0.3; !dialog};
			player setDir ((getDir player) + 180);
		};
	};

	fz_sfx_reloadLocConf = {
		_trg = createTrigger["EmptyDetector",getPos player];
		_trg setTriggerArea[0,0,0,false];
		_trg setTriggerStatements["true","", ""];
		_trg setTriggerType (ctrlText FZ_CONFIRM_TITLE_H2);

		SavedFrom = ctrlText FZ_CONFIRM_TITLE_H1; saveVar "SavedFrom";
		SavedDate = date; saveVar "SavedDate";
		
		closeDialog 1;
		titlecut [" ","BLACK Out", 0.3];
	};

	fz_sfx_protectNpc = {
		_this setBehaviour "CARELESS";
		_this setCaptive true;
		_this setVariable ["spectating", true];
		_this addEventHandler ["HandleDamage", {(_this select 3) setDammage (getDammage (_this select 3) + (_this select 2));false}];
	};