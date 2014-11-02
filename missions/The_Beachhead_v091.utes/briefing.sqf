/*
  *	Unofficial Zeus Briefing Template v0.01
  *
  *
  *	Notes: 
  *		- Use the tsk prefix for any tasks you add. This way you know what the varname is for by just looking at it, and 
  *			aids you in preventing using duplicate varnames.
  *		- To add a newline: 		<br/>
  *		- To add a marker link:	<marker name='mkrObj1'>attack this area!</marker>
  *		- To add an image: 		<img image='somePic.jpg'/>
  *
  *		Required briefing commands:		
  *		- Create Note:			player createDiaryRecord ["Diary", ["*The Note Title*", "*The Note Message*"]]; 
  *		- Create Task:			tskExample = player createSimpleTask ["*The Task Title*"];
  *		- Set Task Description:	tskExample setSimpleTaskDescription ["*Task Message*", "*Task Title*", "*Task HUD Title*"];
  *		
  *		Optional briefing commands:
  * 		- Set Task Destination:	tskExample setSimpleTaskDestination (getMarkerPos "mkrObj1"); // use existing "empty marker" 
  *		- Set the Current Task:	player setCurrentTask tskExample;
  *		
  *		Commands to use in-game:
  *		- Set Task State:		tskExample setTaskState "SUCCEEDED";   // states: "SUCCEEDED"  "FAILED"  "CANCELED" 
  *		- Get Task State:		taskState tskExample;
  *		- Get Task Description:	taskDescription tskExample;   // returns the *task title* as a string
  *		- Show Task Hint:		[tskExample] call mk_fTaskHint; // make sure you've set the taskState before using this function 
  *							
  *
  *	Authors: Jinef & mikey
  */

// since we're working with the player object here, make sure it exists
waitUntil { !isNil {player} };
waitUntil { player == player };

BriefedUnits = BriefedUnits + [player];  
  
switch (side player) do 
{
	
	case WEST: // BLUFOR briefing goes here
	{
		player createDiaryRecord["Diary", ["Important", "<br/>IMPORTANT:<br/><br/>1 - Orca1 is leading this operation and Orca2 is the follower. In singleplayer mode the leader of Orca1 can make the groups join and play as one (use ""radio juliet"" for this). The reason for the team split from the beginning is that in multiplayer it may be good for completing different tasks.<br/><br/>2 - You must be UNDETECTED by the enemy in order to start the beach landing. The radio calls will not be available until you are hidden from the enemy."]];
		player createDiaryRecord["Diary", ["Enemy forces", "<br/>Utes is an enemy stronghold and we can expect to be up against pretty much everything: infantry, armor and air.<br/><br/>Intel says they have spotted two Shilkas/Tunguskas on the island, but since they move around we don't know the exact locations. They might cause some trouble for our air support.<br/><br/>Spetznatz teams have also been seen patrolling the airport.<br/><br/>The camps are full of russian reinforcements and from what we know, not even the civilians are friendly towards U.S forces. Villagers are most likely unarmed, but may call in what they see."]];
		player createDiaryRecord["Diary", ["Friendly forces", "<br/>USS Khe Sanh (callsign: Sea Lion) and three AAVP7A1 with one marine squad in each, one AH-1Z Cobra for air support."]];
		player createDiaryRecord["Diary", ["Photographs", "<br/>Following images show the design of your targets.<br/><br/>AA radar<br/><img image='radar.paa'/><br/><br/>Radio antenna<br/><img image='radio.paa'/>"]];
		player createDiaryRecord["Diary", ["Your Mission", "<br/>Your teams have just left the USS Khe Sanh, and begin in two <marker name='start'>Zodiacs</marker> which contain some useful gear.<br/><br/>Approach the island of Utes and choose your insertion point. Stealth tactic is vital in the first sabotage phase, since you are outnumbered by enemies.<br/><br/>Find the AA radar installation and the radio communications antenna. Intel says they are located in two of these camps: <marker name='m1'>1</marker>, <marker name='m2'>2</marker>, <marker name='m3'>3</marker> or <marker name='m4'>4</marker>.<br/><br/>Destroy these vital systems and your first task will be completed.<br/><br/>Your second task is to assist the landing marines and participate in the assault. First you have to choose the LZ (landing zone) that you think is the most suitable for an armored infantry beach assault.<br/><br/>You can decide between: <marker name='land1'>LZ South</marker>, <marker name='land2'>LZ East</marker> or <marker name='land3'>LZ West</marker>.<br/><br/>You make this decision through the radio menu (alpha, bravo or charlie). Choose wisely, because some beaches might be full of mines.<br/><br/>After making the radio call, you will wait 3 hours for the landing forces to arrive. When the landing begins your task is to participate in the attack. The second task will be completed when the bases and the airport on Utes are seized.<br/><br/>Good luck!"]];
		player createDiaryRecord["Diary", ["Strategic Plan", "<br/>The time for a major attack on Utes has finally come. As part of two Force Recon teams (callsign: Orca1 and Orca2) you will prepare a beach landing by sabotaging the russian AA radar and their radio communications. When this is done you will join the landing marines in their assault, and seize Utes."]];
		player createDiaryRecord["Diary", ["Author's Info", "<br/>Mission designer: Laggy<br/><br/>Mission version: 0.91<br/><br/>This is a pretty straight forward mission that includes both a stealth sabotage objective and a full on beach assault.<br/><br/>Mission uses SIDE respawn, so you can use teamswitch in MP. Hope you enjoy it."]];

		tskObj2 = player createSimpleTask["Assist the landing troops."]; 
		tskObj2 setSimpleTaskDescription["Join the landing marines on the beach and participate in the assault.","Assist the landing troops.","Assist the landing troops."];
		
		tskObj1 = player createSimpleTask["Prepare the beach assault."]; 
		tskObj1 setSimpleTaskDescription["Destroy the russian AA radar installation and their radio communications.","Prepare the beach assault.","Prepare the beach assault."];
	};
	
	
	case EAST: // REDFOR briefing goes here
	{
		
		
	};
	
	
	case RESISTANCE: // RESISTANCE/INDEPENDENT briefing goes here
	{
		
		
	};
	
	
	case CIVILIAN: // CIVILIAN briefing goes here
	{
		
		
	};
};

