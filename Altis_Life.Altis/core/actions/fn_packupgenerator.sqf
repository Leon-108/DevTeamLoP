/*
	@Version: 1.0
	@Author: Sebi, lostofparadise.de
	@Edited: 15.09.2014
	@Info: Bevor Ihr es klaut, fragt bitte bei uns nach. Vielen Dank.
*/
private["_generator"];
_generator = nearestObjects[getPos player,["Land_Portable_generator_F"],8] select 0;
if(isNil "_generator") exitWith {};

if(([true,"generator",1] call life_fnc_handleInv)) then
{
	//t/itleText["Du hast einen Generator abgebaut.","PLAIN"];
	["Du hast einen Generator abgebaut.","GREEN",5] spawn life_fnc_notification_system;
	//player removeAction life_action_generatorPickup;
	life_action_generatorPickup = nil;
	deleteVehicle _generator;
};