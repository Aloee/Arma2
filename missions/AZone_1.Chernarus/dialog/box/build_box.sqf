#include "definitions.sqf";
disableSerialization;

_weapons_b = ((_this select 0) select 0);
_mags_b = ((_this select 0) select 1);
_items_b = ((_this select 0) select 2);

_weapons_p = ((_this select 1) select 0);
_mags_p = ((_this select 1) select 1);
_items_p = ((_this select 1) select 2);

/*
if(!isDedicated)then{
_weapons_b = [["AK_74_GL",1],["AKS_74_PSO",1],["AK_47_S",1],["SVD",2],["MakarovSD",1],["RPG7V",1],["Strela",1],["M1014",1],["M240",1],["MP5SD",1],["G36A",1],["G36K",1],["G36C",1],["m8_Compact",1],["M4SPR",1]];
_mags_b = [["8Rnd_9x18_Makarov",10],["30Rnd_556x45_G36SD", 11],["30Rnd_556x45_G36",12],["30Rnd_556x45_Stanag",3],["15Rnd_9x19_M9",10],["30Rnd_545x39_AKSD",10],["30Rnd_545x39_AK",20],["PG7V",2],["PG7VL",3],["PG7VR",1]];
};
 */
//_weapons_b = [["ItemCompass",1],["ItemMap",1],["ItemRadio",1],["ItemWatch",1],["Binocular",1],["EvMoney",5]];
//_items_b = [["ItemCompass",1],["ItemMap",1],["ItemRadio",1],["ItemWatch",1],["Binocular",1], ["NVGoggles",1],["Moscow_Bombing_File",1],["Kostey_notebook",1],["Kostey_map_case",1],["Kostey_photos",1],["ItemGPS",1],["ItemCore",1],["EvPhoto",1],["EvMoscow",1],["EvMoney",1],["EvMap",1],["Evkobalt",1],["EvDogTags",1],["Cobalt_File",1],["CDF_dogtags",1]];
//_weapons_b = _weapons_b; 
//{hint format ["%1 : %2",_x ,getNumber (configFile >> "cfgMagazines" >> _x >> "Type")];sleep 1;}foreach _mags_b;//weapons player;
//DISPLAY
_ok = createDialog "Box";

_display = findDisplay BOX_DIALOG;

_list = _display displayCtrl BOX_B_W;
[_list,_weapons_b,"cfgWeapons"] call box_put_to_list;

_list = _display displayCtrl BOX_B_M;
[_list,_mags_b,"cfgMagazines"] call box_put_to_list;

_list = _display displayCtrl BOX_B_I;
[_list, _items_b, false] call box_put_to_list;

_list = _display displayCtrl BOX_P_W;
[_list,_weapons_p,"cfgWeapons"] call box_put_to_list;

_list = _display displayCtrl BOX_P_M;
[_list,_mags_p,"cfgMagazines"] call box_put_to_list;

_list = _display displayCtrl BOX_P_I;
[_list, _items_p, false] call box_put_to_list;
