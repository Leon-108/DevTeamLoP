/*
	@Version: 1.0
	@Author: Sebi, lostofparadise.de
	@Edited: 15.09.2014
	@Info: Bevor Ihr es klaut, fragt bitte bei uns nach. Vielen Dank.
*/
private["_schranke"];
_schranke = nearestObjects[getPos player,["Land_BarGate_F"],8] select 0;
if(isNil "_schranke") exitWith {};

if(([true,"schranke",1] call life_fnc_handleInv)) then
{
	//t/itleText["Du hast die Schranke abgebaut.","PLAIN"];
	["Du hast die Schranke abgebaut.","GREEN",5] spawn life_fnc_notification_system;
	//player removeAction life_action_schrankePickup;
	life_action_schrankePickup = nil;
	deleteVehicle _schranke;
};