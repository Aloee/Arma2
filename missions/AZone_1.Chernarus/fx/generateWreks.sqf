_count = 30;
_wreks = [
	"datsun01Wreck",
	"datsun02Wreck",
	"hiluxWreck",
	"HMMWVWreck",
	"LADAWreck",
	"SKODAWreck",
	"UAZWreck",
	"UralWreck",
	"Fort_Barricade",
	"Hedgehog",
	"Fort_RazorWire"
];

{
	_marker = _x select 0;
	_radius = (_x select 1) / 2;
	_center = getMarkerPos _marker;
	
	for "_i" from 0 to _count do{
		//_pos = [((_center select 0)-_radius)+floor random (_radius*2), ((_center select 1)-_radius)+ floor random (_radius*2), 0];
		_w = createVehicle [_wreks select floor random count _wreks, _center, [], _radius, "NONE"];
		_w setDir random 180;
	};
}foreach citys;