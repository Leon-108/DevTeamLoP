/*
	@Version: 1.0
	@Author: Sebi, lostofparadise.de
	@Edited: 15.09.2014
	@Info: Bevor Ihr es klaut, fragt bitte bei uns nach. Vielen Dank.
*/
private["_geld"];
_geld = nearestObjects[getPos player,["Land_Money_F"],8] select 0;
if(isNil "_geld") exitWith {};

if(([true,"geld",1] call life_fnc_handleInv)) then
{
	//t/itleText["Du hast das Falschgeld aufgehoben.","PLAIN"];
	["Du hast das Falschgeld aufgehoben.","GREEN",5] spawn life_fnc_notification_system;
	//player removeAction life_action_geldPickup;
	life_action_geldPickup = nil;
	deleteVehicle _geld;
};