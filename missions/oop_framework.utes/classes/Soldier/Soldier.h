/*
	"true";
	"false";
	"objNull";
	"configFile";
	"grpNull";
	"taskNull";
	"sideLogic";
	"west";
	"east";
	"resistance";
	"civilian";
*/

class Soldier {
	
	private_side = "civilian";
	private_group = "grpNull";
	private_body = "objNull";
	private_dammage = 0;
	
	protected_weapons[] = {};
	protected_magazines[] = {};
	protected_respawn[] = {"marker1", "marker2", "marker3"};
	
	public_display = "Soldier";
	public_rank = 0.3;

	//constructor
	class Soldier {
		script = "classes\Soldier\construct.sqf";
	};
	
	class protected_addWaypoint {
		script = "classes\Soldier\addWaypoint.sqf";
	};
	
	class protected_deleteWaypoint {
		script = "classes\Soldier\deleteWaypoint.sqf";
	};
};