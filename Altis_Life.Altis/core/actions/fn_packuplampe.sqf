/*
	@Version: 1.0
	@Author: Sebi, lostofparadise.de
	@Edited: 15.09.2014
	@Info: Bevor Ihr es klaut, fragt bitte bei uns nach. Vielen Dank.
*/
private["_lampe"];
_lampe = nearestObjects[getPos player,["Land_PortableLight_double_F"],8] select 0;
if(isNil "_lampe") exitWith {};

if(([true,"lampe",1] call life_fnc_handleInv)) then
{
	//t/itleText["Du hast den Strahler abgebaut.","PLAIN"];
	["Du hast den Strahler abgebaut.","GREEN",5] spawn life_fnc_notification_system;
	//player removeAction life_action_lampePickup;
	life_action_lampePickup = nil;
	deleteVehicle _lampe;
};