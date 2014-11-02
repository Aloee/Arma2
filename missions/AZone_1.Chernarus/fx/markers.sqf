_marker_list = [];

//mainMarkers
_marker_list = 
[
	[artDealer1, "ICON", "DOT", localize "STR_map_artefactDealer", "ColorYellow", 0.5],
	[remPointCiv, "ICON", "DOT", localize "STR_map_remPoint", "ColorRed", 0.5],
	[sidorch,"ICON", "DOT", localize "STRD_sidorch_name","ColorOrange", 0.5]
];

_hide_list = [
	"band_area_1",
	"band_area_2",
	"band_area_3",
	"band_area_0",
	"City33_area",
	"City35_area",
	"City12_area"
];

switch (side player) do {
	case east :{
		_marker_list = _marker_list +
		[
			[carDealerDolg, "ICON", "DOT", localize "STR_map_carDealer", "ColorYellow", 0.5],
			[weaponDealerDolg, "ICON", "DOT",localize "STR_map_weaponDealer","ColorYellow", 0.5],
			[remPointDolg, "ICON", "DOT", localize "STR_map_remPoint","ColorRed", 0.5],
			[medPointDolg, "ICON", "DOT", localize "STR_map_medPoint","ColorRed", 0.5],
			[saharov, "ICON", "DOT", localize "STRD_saharov_name","ColorOrange", 0.5],
			[voronin, "ICON", "DOT", localize "STRD_voronin_name","ColorGreen", 0.5]
		];
	};
	case resistance :{
		_marker_list = _marker_list +
		[
			[carDealerSvo, "ICON", "DOT", localize "STR_map_carDealer","ColorYellow", 0.5],
			[weaponDealerSvo, "ICON", "DOT", localize "STR_map_weaponDealer","ColorYellow", 0.5],
			[remPointSvo, "ICON", "DOT", localize "STR_map_remPoint","ColorRed", 0.5],
			[medPointSvo, "ICON", "DOT", localize "STR_map_medPoint","ColorRed", 0.5],
			[luka, "ICON", "DOT", localize "STRD_luka_name","ColorGreen", 0.5]
		];
	};
};

{
	if(!isNil {_x select 0})then{
		_obj = _x select 0;_shape = _x select 1;_type = _x select 2;_text = _x select 3;_color = _x select 4;_size = _x select 5;
		
			_markerName = format["marker_%1", vehicleVarName _obj];
			_pos = getPosATL _obj;
			createMarkerLocal[_markerName,[_pos select 0, _pos select 1]];
			_markerName setMarkerShapeLocal _shape;
			_markerName setMarkerTypeLocal _type;
			_markerName setMarkerColorLocal _color;
			_markerName setMarkerTextLocal _text;
			_markerName setMarkerSizeLocal [_size, _size];
	}
}foreach _marker_list;

{
	_x setMarkerAlphaLocal 0;
}foreach _hide_list;