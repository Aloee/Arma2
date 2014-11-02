class CfgPatches 
{
	class DAPANOMALIES 
	{
		units[] = { };
		weapons[] = { };
		requiredVersion = 1.000000;
		requiredAddons[] = {
				"CAData", "DAPARTEFACTS"
		};
	};
};
class CfgWeapons 
{
	class ItemCore ;
	class DAP_DETECTOR : ItemCore
	{
		scope = 2;
		descriptionshort = "$STR_DAPANOM_DETECTOR_SHORTNAME";
		displayname = "$STR_DAPANOM_DETECTOR";
		picture = "\DAPANOMALIES\Icons\DETECTOR.paa";
	};
	class DAP_PSYONIC_SHIELD : ItemCore
	{
		scope = 2;
		descriptionshort = "$STR_DAPANOM_PSYSHIELD_SHORTNAME";
		displayname = "$STR_DAPANOM_PSYSHIELD";
		picture = "\DAPANOMALIES\Icons\SHIELD.paa";
	};
};
class CfgSounds 
{
	class dap_beep_detector 
	{
		name = "Detector Beep";
		sound[] = {
				"\DAPANOMALIES\Sounds\beep_detector.ogg", 1.000000, 1.000000
		};
		titles[] = { };
	};
	class dap_beep_geiger 
	{
		name = "Geiger Beep";
		sound[] = {
				"\DAPANOMALIES\Sounds\beep_geiger.ogg", 1.000000, 1.000000
		};
		titles[] = { };
	};
	class dap_gravi_blast 
	{
		name = "Gravi Blast";
		sound[] = {
				"\DAPANOMALIES\Sounds\gravi_blast.ogg", 1.2500000, 1.000000
		};
		titles[] = { };
	};
	class dap_mincer_wind 
	{
		name = "Mincer Wind";
		sound[] = {
				"\DAPANOMALIES\Sounds\mincer_wind.ogg", 1.000000, 1.000000
		};
		titles[] = { };
	};
	class dap_electro_strike 
	{
		name = "Electro Strike";
		sound[] = {
				"\DAPANOMALIES\Sounds\electro_strike.ogg", 1.000000, 1.000000
		};
		titles[] = { };
	};
	class dap_galantine 
	{
		name = "Galantine Fizz";
		sound[] = {
				"\DAPANOMALIES\Sounds\galantine.ogg", 0.0750000, 1.000000
		};
		titles[] = { };
	};
	class dap_psy_a 
	{
		name = "Psy Voice A";
		sound[] = {
				"\DAPANOMALIES\Sounds\psy_a.ogg", 1.00000, 1.000000
		};
		titles[] = { };
	};
	class dap_psy_b 
	{
		name = "Psy Voice B";
		sound[] = {
				"\DAPANOMALIES\Sounds\psy_b.ogg", 1.00000, 1.000000
		};
		titles[] = { };
	};
	class dap_psy_c 
	{
		name = "Psy Voice C";
		sound[] = {
				"\DAPANOMALIES\Sounds\psy_c.ogg", 1.00000, 1.000000
		};
		titles[] = { };
	};
	class dap_silence 
	{
		name = "DAP Silence";
		sound[] = {
				"\DAPANOMALIES\Sounds\Silence.ogg", 1.00000, 1.000000
		};
		titles[] = { };
	};
};
