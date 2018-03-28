#include "..\..\script_macros.hpp"
/*
	File: fn_catchTurtle.sqf
	Author: Bryan "Tonic" Boardwine
	
	Description:
	Catches a dead turtle?
*/
private _obj = ((nearestObjects[player,["Turtle_F"],3]) select 0);
if(isNull _obj) exitWith {}; //Not valid
if(alive _obj) exitWith {}; //It's alive, don't take it charlie!

if(([true,"turtle_s",1] call life_fnc_handleInv)) then
{
	deleteVehicle _obj;
	//t/itleText[localize "STR_NOTF_CaughtTurtle","PLAIN"];
	[localize "STR_NOTF_CaughtTurtle","BLUE",5] spawn life_fnc_notification_system;
};