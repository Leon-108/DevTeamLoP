/*
	@Version: 1.0
	@Author: Sebi, lostofparadise.de
	@Edited: 15.09.2014
	@Info: Bevor Ihr es klaut, fragt bitte bei uns nach. Vielen Dank.
*/
private["_zelt"];
_zelt = nearestObjects[getPos player,["Land_PartyTent_01_F"],8] select 0;
if(isNil "_zelt") exitWith {};

if(([true,"zelt",1] call life_fnc_handleInv)) then
{
	//t/itleText["Du hast ein Pavillon abgebaut.","PLAIN"];
	["Du hast ein Pavillon abgebaut.","GREEN",5] spawn life_fnc_notification_system;
	//player removeAction life_action_generatorPickup;
	life_action_zeltPickup = nil;
	deleteVehicle _zelt;
};