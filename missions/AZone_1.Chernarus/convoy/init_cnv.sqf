if(!isServer && !isDedicated)exitwith{};

_randway = _this;

//construct
_cnvs = [
[west,
	 getMarkerPos (_randway select 0),
	 [
	 [["BTR90", 0],[["CDF_Soldier_Crew","CDF_Soldier_Crew","CDF_Soldier_Crew"],[]]],
	 [["UralReammo_INS", 1],[["CDF_Soldier_Light",nil,nil],[]]],
	 [["UralReammo_INS", 1],[["CDF_Soldier_Light",nil,nil],[]]],	 
	 [["Ural_CDF", 0],[["CDF_Soldier_Light",nil,nil],["CDF_Soldier_Medic","CDF_Soldier_MG","CDF_Soldier_Engineer","CDF_Soldier_Engineer","CDF_Soldier_Engineer","CDF_Soldier_Strela","CDF_Soldier_Officer"]]]
	 ],
	 _randway
],
[west,
	getMarkerPos (_randway select 0),
	 [
	 [["T90", 0],[["CDF_Soldier_Crew","CDF_Soldier_Crew","CDF_Soldier_Crew"],[]]],
	 [["UralRepair_INS", 1],[["CDF_Soldier_Light",nil,nil],[]]],
	 [["KamazRepair", 1],[["CDF_Soldier_Light",nil,nil],[]]],	 
	 [["Ural_CDF", 0],[["CDF_Soldier_Light",nil,nil],["CDF_Soldier_Medic","CDF_Soldier_MG","CDF_Soldier_Engineer","CDF_Soldier_Engineer","CDF_Soldier_Engineer","CDF_Soldier_Strela","CDF_Soldier_Officer"]]]
	 ],
	 _randway
],
[west,
	getMarkerPos (_randway select 0),
	 [
	 [["BRDM2_GUE", 0],[["CDF_Soldier_Crew","CDF_Soldier_Crew",nil],[]]],
	 [["UralRefuel_INS", 1],[["CDF_Soldier_Light",nil,nil],[]]],
	 [["KamazRepair", 1],[["CDF_Soldier_Light",nil,nil],[]]],	 
	 [["Ural_CDF", 0],[["CDF_Soldier_Light",nil,nil],["CDF_Soldier_Medic","CDF_Soldier_MG","CDF_Soldier_Engineer","CDF_Soldier_Engineer","CDF_Soldier_Engineer","CDF_Soldier_Strela","CDF_Soldier_Officer"]]]
	 ],
	 _randway
]
];

//execute
_null = (_cnvs select floor(random count _cnvs)) execvm "convoy\create_cnv.sqf";